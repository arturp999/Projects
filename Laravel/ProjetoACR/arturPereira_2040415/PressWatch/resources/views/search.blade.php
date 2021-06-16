@extends('layouts.app')


<header>
    <title>PressWatch</title>
</header>

<body>
    @section('content')
    <br>

    <h2 class="subTitulos" style="margin-bottom: 15px">Is this what your we're looking for?</h2>
    <h5 class="subTitulos">If you like the movie support the creators!</h5>
    <br>

    {{--  search bar--}}
    <form method="GET" class="" action="/movie/search">
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
    
    <div class="container">
        <div class="row">
            @foreach ($movie_search as $movie)
            <div class="col-sm movieContainers no-gutters">
                <a href="{{ route('movie.show', $movie->id ) }}">
                    <img class="movieImgConfig" src="{{$movie->movie_img}}" alt="img/filme">
                </a>
            </div>
            @endforeach
        </div>
    </div>


</body>

@endsection