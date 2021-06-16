@extends('layouts.app')


<header>
    <title>PressWatch</title>
</header>

<body>
    @section('content')
    <br>
    <h3 class="titulos">Sorry, but you dont have <strong style="color:red"> permissions </strong> to view that page</h3>
    <br>

    <div class="d-flex justify-content-center"> 
        <a href="{{ url('/') }}">
            <button type="submit" value="submit" name="submit" class="btn btn-warning">Go back</button>
        </a>
    </div>

    <div class="testeLul"> 
    </div>

    @endsection
</body>