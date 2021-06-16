<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use App\Models\Gender;
use App\Models\GenderMovie;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GenderController extends Controller
{
    public function genderMenu(Request $request)
    {
        $genders = Gender::with('movies')->get();   // vai buscar os generos
        $generoEscolhido = $request->gender; //recebe o filme que o user está a procurar

        $movies = DB::table('gender_movies') //inner join do pivo com as outras duas
        ->join('movies', 'gender_movies.movie_id', '=', 'movies.id')
        ->join('genders', 'gender_movies.gender_id', '=', 'genders.id')
        ->select('movies.*') // vai buscar todos os campos do movies como no sql
        ->where('genders.id','=', "$generoEscolhido")
        ->get();

        $showUp=false;
        if ($request->submit && count($movies) == 0) {
            session()->flash('erroGen','That gender is empty');
            $showUp=true;
            return view('genderSearch',['genders' => $genders,'movies' => $movies,'showUp' => $showUp]);
        }
        return view('genderSearch',['genders' => $genders,'movies' => $movies,'showUp' => $showUp]);
    }
}