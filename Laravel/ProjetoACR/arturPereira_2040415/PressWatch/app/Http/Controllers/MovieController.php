<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

use App\Models\Movie;
use App\Models\Gender;
use App\Models\GenderMovie;
use Illuminate\Http\Request;
use App\Http\Middleware\CheckAdmin;
use Illuminate\Support\Facades\Storage;


use Auth;

class MovieController extends Controller
{
    public function __construct()
    {
       $this->middleware(CheckAdmin::class, ['except' => ['index','show','noPermissions','search']]);
       $this->middleware('auth', ['except' => ['index','orderbyRating']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {             
        if (request()->has('rating')) {       
            //order by rating
            $movies = DB::table('movies')->orderBy('rating', 'desc')->simplePaginate(10);
        }elseif (request()->has('recent')) {
            //show most recent
            $movies = DB::table('movies')->orderBy('release_year', 'desc')->simplePaginate(10);
        } else {
           // showAllMovies
           $movies = DB::table('movies')->simplePaginate(10);
        }        
        
        $data = session('Message');
        $showUp=false;
        if (strlen($data) > 1) {
            $showUp = true;
        }

        return view('mainPage',['movies' => $movies, 'showUp' => $showUp]);
    }


    public function noPermissions()
    {             
        return view('noPermission');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $genders = Gender::all();
        return view('createMovie',['genders' => $genders]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function validationRules(Request $request)
    {
            $validated = $request->validate([
            'name' => 'required|max:255',
            'rating' =>'required|integer|min:0|max:10',
            'release_year' =>'required|integer|min:1900|max:2080',
            'movie_img' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'description' => 'required',
            'movie_trailer' => 'required|max:255',
            'gender' => 'exists:genders,id'
        ]);
    }
 

    public function store(Request $request)
    {

        $validation = new MovieController;
        $validation->validationRules($request);

        $movie_img = "";
        if ($request->has('movie_img')) {
            $image = $request->file('movie_img');
            $iname='prod'.'_'.time();
            $folder ='movies/';
            $fileName =$iname. '.' . $image->getClientOriginalExtension();
            $filePath= $folder . $fileName;
            
            $image->storeAs($folder,$fileName,'public');
            $movie_img = "/storage/".$filePath;
         }

        $newMovie = new Movie(); //instancia do modelo para saber onde grava as informações
        $newMovie->name = $request->name;
        $newMovie->rating = $request->rating;
        $newMovie->release_year = $request->release_year;
        $newMovie->movie_trailer = $request->movie_trailer;
        $newMovie->description = $request->description;
        $newMovie->movie_img = $movie_img;   
        $newMovie->save();

        $newGender = new GenderMovie();
        $newGender->gender_id = $request->gender;
        $newGender->movie_id = $newMovie['id']; //vai buscar o ID do novo e insire na tabela de muitos para muitos
        $newGender->save();

        return redirect('/movie')->with('Message','Movie has been added to the DB');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $movie =  Movie::findOrFail($id);
        $movieGenders =  Movie::findOrFail($id)->genders->pluck('name');
        return view('movieDetails',['movie' => $movie,'movieGenders' => $movieGenders]);
    }

    public function search()
    {
        $search_name = $_GET['query'];
        $movie_search = Movie::where('name','LIKE','%'.$search_name.'%')->get();
        // dd($movie_search);
        return view('search',['movie_search' => $movie_search]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $genders = Gender::all();
        $movie =  Movie::findOrFail($id);
        return view('editMovie',['movie' => $movie,'genders' => $genders]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $movieEdit = Movie::findOrFail($id);
        if ($request->movie_img == NULL) {
            $movieEdit->movie_img =  $movieEdit->movie_img;
        }  else {
            
            $validated = $request->validate([
            'image|mimes:jpeg,png,jpg,gif|max:2048']);
            $movie_img = "";

            if ($request->has('movie_img')) {
                $image = $request->file('movie_img');
                $iname='prod'.'_'.time();
                $folder ='movies/';
                $fileName =$iname. '.' . $image->getClientOriginalExtension();
                $filePath= $folder . $fileName;
                $image->storeAs($folder,$fileName,'public');
                $movie_img = "/storage/".$filePath;
                 }

            $movieEdit->movie_img = $movie_img;
        }

        if ($request->name == NULL) {
            $movieEdit->name =  $movieEdit->name;
        }  else {
            $validated = $request->validate([
            'name' => 'max:255']);
            $movieEdit->name = $request->name;
        }

        if ($request->rating == NULL) {
            $movieEdit->rating =  $movieEdit->rating;
        }  else {
            $movieEdit->rating = $request->rating;
            $validated = $request->validate([
            'rating' =>'required|integer|min:0|max:10']);
        }

        if ($request->release_year == NULL) {
            $movieEdit->release_year =  $movieEdit->release_year;
        }  else {
            $movieEdit->release_year = $request->release_year;
            $validated = $request->validate([
            'release_year' =>'integer|min:1900|max:2080']);
        }

        if ($request->movie_trailer == NULL) {
            $movieEdit->movie_trailer =  $movieEdit->movie_trailer;
        }  else {
            $movieEdit->movie_trailer = $request->movie_trailer;
        }

        if ($request->description == NULL) {
            $movieEdit->description =  $movieEdit->description;
        }  else {
            $validated = $request->validate([
            'movie_trailer' => 'required|max:255']);
            $movieEdit->description = $request->description;
        }
        $movieEdit->save();
        //cria um novo genero para o filme (isto é se o filme tiver muitos generos)
        $newGender = new GenderMovie(); //instancia o genero 
        if ($request->gender == "Select Gender") {
            return redirect('/')->with('Message','Movie has been updated in the DB');
        }  else {
            $validated = $request->validate(['gender' => 'exists:genders,id']);
            $newGender->gender_id = $request->gender;
            $newGender->movie_id = $movieEdit['id'];
        }
        $newGender->save();
        return redirect('/')->with('Message','Movie has been updated in the DB');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $movieRemove = Movie::findOrFail($id);

        $fileFullName = $movieRemove['movie_img'];        
        $filename= str_replace('/storage/movies/','',$fileFullName); //nome do ficheiro apenas

        Storage::delete('/public/movies/'.$filename);
        $movieRemove->delete();
        return redirect('/');
    }
}