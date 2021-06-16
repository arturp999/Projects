@extends('layouts.app')
@section('content')

<body>

    <h2 class="subTitulos" style="margin-bottom: 15px">Your selected movie</h2>
    <form method="GET" class="" action="/movie/search">
        <input class="form-control searchBar" name="query" type="text" placeholder="Search" aria-label="Search">
    </form>


    @if (Auth::user()->roles[0]['name'] === "Admin")
    <div class="buttonsBOX">
        <div class="action_btn">
            {{-- EDIT BUTTON --}}
            <a href="{{ route('movie.edit', $movie->id ) }}">
                <button type="submit" value="submit" name="submit" class="btn btn-info action_btn">Edit Movie</button>
            </a>

            {{-- DELETE BUTTON --}}
            <form method="POST" class="deleteBtn action_btn" action="/movie/{{$movie->id}}">
                @csrf
                @method('DELETE')
                <button type="submit" value="submit" name="submit" class="btn btn-danger action_btn">Delete
                    Movie</button>
            </form>
        </div>
    </div>
    @endif

    <div class="buttonsBOX">
        <div class="action_btn ">
            {{--  back btn --}}
            <a href="/">
                <button type="submit" value="submit" class="btn btn-warning">Go Back</button>
            </a>
        </div>
    </div>


    <div class="card mb-3 text-white bg-dark mt-5">
        <div class="row">
            <div class="col-6 col-md-3 mr-4 ml-5">
                <img class="movieImgConfigDetails" src="{{$movie->movie_img}}">
            </div>
            <div class="col-12 col-md-8">
                <div class="card-body">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-header">
                            <h5 class="subTitulos">{{$movie->name}}</h5>
                        </div>
                    </div>

                    <h5>Description:</h5>
                    <p class="font-italic font-weight-light">
                        @for ($i = 0; $i < count($movieGenders); $i++) 
                        {{$movieGenders[$i]}} @endfor - ({{$movie->release_year}})</p> 
                            
                            
                            <p class="card-text">{{$movie->description}}</p>
                    <p class="card-text">
                        <h5>Rating:</h5>
                        @for ($i = 0; $i < ($movie->rating); $i++)
                            <i class="fa fa-star fa-1x" aria-hidden="false"></i>
                            @endfor
                    </p>
                    {{-- <i id="showVideoPlayer" class="fab fa-youtube fa-3x"></i> --}}
                    <h5>Wanna watch the trailer? </h5>
                    <button type="button" id="showVideoPlayer" class="btn btn-danger btn-sm"><i
                            class="fab fa-youtube-square fa-3x"></i></button>
                </div>
            </div>
        </div>

        <div class="mt-3" id="videoPlayer" style="display:none;">
            <iframe class="teste col-md-12" width="500px" height="400px" src="{{$movie->movie_trailer}}" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
            </iframe>
        </div>


    </div>
</body>

<script>
    $(document).ready(function(){
     $("#showVideoPlayer").click(function(){
        $("#videoPlayer").toggle();
    });
});
</script>
@endsection