@extends('layouts.app')


<body>
    @section('content')
    <br>

    <h1 class="text-center titulos">CONTACT US</h1>
    <h5 class="subtitulos mt-2">Wanna be able to upload? Send us a message!</h5>
    <hr />
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

    <div class="container contactDetailsContainer">
        <div class="d-flex bd-highlight">
            <div class="p-2 w-100 bd-highlight">
                <div class="container">

                    <<form method="POST" action="/movie/contact " style="color: white">
                        @csrf 
                        <br>
                        <div class="form-group">
                            <i class="fas fa-address-card mr-2"></i>
                            <label for="exampleFormControlInput1">Your Name</label>
                            <input name="name" type="name" class="form-control" id="exampleFormControlInput1"
                                placeholder="Name">
                        </div>

                        <div class="form-group">
                            <i class="fas fa-envelope mr-2"></i>
                            <label for="exampleFormControlInput1">Your Email</label>
                            <input name="email" type="email" class="form-control" id="exampleFormControlInput1"
                                placeholder="Email@example.com">
                        </div>

                        <div class="form-group">
                            <i class="fas fa-keyboard mr-2"></i>
                            <label for="exampleFormControlTextarea1">Why do you want to contact us?</label>
                            <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="5"
                                placeholder="Enter your message"></textarea>
                        </div>

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input">
                            <label class="form-check-label" for="exampleCheck1">Are you sure?</label>
                        </div>
                        <br>
                        <button type="submit" value="submit" name="submit" class="btn btn-primary btn-lg">Submit</button>
                    </form>


                </div>
            </div>

            <div class="p-2 w-50 flex-shrink-1 bd-highlight" id="MOBILE">
                <div class="container contDetails">
                    <h5 class="text-center titulos">CONTACT DETAILS</h5>
                    <hr />
                    <div class="container">
                        <div class="d-flex flex-nowrap bd-highlight justify-content-center">
                            <div class="order-1 p-1 bd-highlight"><i class="fas fa-mobile-alt"></i></div>
                            <div class="order-2 p-0 bd-highlight ml-2">
                                <p style="font-size: 14px"> +351 965 400 55</p>
                            </div>
                        </div>

                        <div class="d-flex flex-nowrap bd-highlight justify-content-center">
                            <div class="order-1 bd-highlight"> <i class="fas fa-globe mr-3"></i></div>
                            <div class="order-2 bd-highlight ">
                                <p style="font-size: 14px"> siterandom.com</p>
                            </div>
                        </div>

                        <div class="d-flex flex-nowrap bd-highlight justify-content-center">
                            <div class="order-1 bd-highlight"><i class="fab fa-skype mr-3"></i></div>
                            <div class="order-2 bd-highlight ">
                                <p style="font-size: 14px"> Artur__pereira</p>
                            </div>
                        </div>

                    </div>
                    <h5 class="text-center titulos">SOCIAL</h5>
                    <hr />
                    <a id="socialLinks" href=""><i class="fab fa-facebook mr-3 fa-2x"></i></a>
                    <a id="socialLinks" href=""><i class="fab fa-twitter mr-3 fa-2x"></i></a>
                    <a id="socialLinks" href=""><i class="fab fa-instagram mr-3 fa-2x"></i></a>
                    <a id="socialLinks" href=""><i class="fab fa-linkedin mr-3 fa-2x"></i></a>

                    <br>
                    <br>

                    <h5>Our CEO</h5>
                    <img class="CEO"
                        src="https://blog.yellowoctopus.com.au/wp-content/uploads/2018/03/yellow-octopus-funny-memes-72.jpg"
                        alt="CEO" class="rounded-circle">
                    <h5 class="subTitulos mt-3">
                        Alfredo Esdrubal
                    </h5>

                </div>
            </div>
        </div>
    </div>
</body>

<style scoped>
    @media screen and (max-width: 600px) {
        #MOBILE {
            display: none;
        }
    }
</style>

@endsection