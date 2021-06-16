@extends('layouts.app')


<header>
    <title>PressWatch</title>
</header>

<body>
    @section('content')
    <br>
    <h1 class="titulos">Welcome to Genders!</h1>
    <h5 class="titulos">Select a gender</h5>
    <br>

        @if ($showUp)
        <div class="alert alert-info center" role="alert" style="width: 35%">
            <h5 style="text-align: center">{{session('erroGen')}}</h5>
        </div>
        @endif


    {{--  search bar--}}
    <form method="GET" action="movie/search">
        <input class="form-control searchBar" name="query" type="text" placeholder="Search" aria-label="Search">
    </form>

    <div class="buttonsBOX">
        <div class="action_btn ">
            {{--  back btn --}}
            <a href="/">
                <button type="submit" value="submit" class="btn btn-warning">Go Back</button>
            </a>
        </div>
    </div>

    <form method="GET" action="genders">
        @csrf
        <select name="gender">
            <option>Select Gender</option>
            @foreach($genders as $gender)
            <option value="{{$gender->id}}">{{$gender->name}}</option>
            @endforeach
        </select>
        <button type="submit" value="submit" name="submit" class="btn btn-success">Submit</button>
    </form>

    <div class="container">
        <div class="row">
            @foreach ($movies as $movie)
            <div class="col-sm movieContainers no-gutters">
                <a href="{{ route('movie.show', $movie->id ) }}">
                    <img class="movieImgConfig" src="{{$movie->movie_img}}" alt="img/filme">
                </a>
            </div>
            @endforeach
        </div>
    </div>

    @endsection
</body>