@extends('layouts.app')
@section('content')

<h1 class="titulos">Insert a new movie</h1>
<br>

@if ($errors->any())
<div class="alert alert-danger">
  <ul>
    @foreach ($errors->all() as $error)
    <li>{{ $error }}</li>
    @endforeach
  </ul>
</div>
@endif

<form method="POST" action="/movie" enctype="multipart/form-data">
  @csrf
  <div class="form-row">
    <div class="col">
      <input type="text" class="form-control" name="name" placeholder="Movie Name">
    </div>
    <div class="col">
      <input type="integer" name="rating" class="form-control" placeholder="Rating">
    </div>
  </div>
  <br>
  <div class="form-row">
    <div class="col">
      <input type="integer" name="release_year" class="form-control" placeholder="Release Year">
    </div>
    <div class="col">
      <input type="file" name="movie_img" class="form-control" placeholder="Movie IMG">
    </div>
  </div>
  <br>
  <div class="form-row">
    <div class="col">
      <input type="text" name="movie_trailer" class="form-control" placeholder="Movie Trailer Link">
    </div>
    <div class="col">
      <input type="text" name="description" class="form-control" placeholder="Description">
    </div>
  </div>
  <br>
  <div class="form-row">
    <div class="col">

      <select name="gender">
        <option >Select Gender</option>
        @foreach($genders as $gender)
        <option value="{{$gender->id}}">{{$gender->name}}</option>
        @endforeach
      </select>

      {{-- @foreach($genders as $gender)
      <input type="checkbox" name="gender[]" value={{$gender->id}}>
      <label style="color: white">{{$gender->name}}</label>
      @endforeach --}}

    </div>
  </div>
  <br>
  <button type="submit" value="submit" name="submit" class="btn btn-primary">Submit</button>
</form>
@endsection