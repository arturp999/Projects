@extends('layouts.app')


<header>
    <title>PressWatch</title>
</header>

<body>
    @section('content')
    <br>
    <h1 class="titulos">Welcome to Press Watch!</h1>


    @if ($showUp)
    <div class="alert alert-success center" role="alert" style="width: 25%">
        <h5 style="text-align: center">{{session('Message')}}</h5>
    </div>
    @endif

    <h5 class="subTitulos">If you like the movie support the creators!</h5>
    <br>

    {{--  search bar--}}
    <form method="GET" action="movie/search">
        <input class="form-control searchBar" name="query" type="text" placeholder="Search" aria-label="Search">
    </form>

    <div class="buttonsBOX">
        <div class="action_btn ">
            {{--  Most Rating--}}
            <a href="/?rating">
                <button type="submit" value="submit" class="btn btn-primary">Best Rating</button>
            </a>
            {{--  Most recent--}}
            <a href="/?recent">
                <button type="submit" value="submit" class="btn btn-primary">Most Recent</button>
            </a>

            <a href="{{'genders'}}">
                <button type="submit" value="submit" class="btn btn-primary">Search by Genders</button>
            </a>
        </div>
    </div>



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

    <div class="buttonsBOX">
        <div class="action_btn ">
            {{--  back btn --}}
            <a href="/">
                <p>{{$movies->links()}}</p>
            </a>
        </div>
    </div>
    



    @endsection
</body>