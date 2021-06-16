routerApp.controller(
  "userController",
  function (
    $scope,
    $http,
    $state,
    $stateParams,
    globalConfig,
    $cookies,
    $rootScope
  ) {
    $scope.saveData = function (user) {
      if ($state.current.name === "register") {
        $http({
          method: "POST",
          url: globalConfig.apiAddress + "/users",
          data: user,
        }).then(
          function mySuccess(response) {
            $state.go("home");
          },
          function myError(response) {
            console.log("something went wrong");
          }
        );
      } 
    };

    // $scope.tryLogin = function (user) {
    //   console.log(user);
    //   if ($state.current.name === "login") {
    //     $http({
    //       method: "POST",
    //       url: globalConfig.apiAddress + "/users/login",
    //       data: user,
    //     }).then(function mySuccess(response) {
    //       var expireDate = new Date(); //cria um obj de tempo nv
    //       expireDate.setDate(expireDate.getDate() + 1); //data de hj +1 dia
    //       $cookies.putObject("loginCookie", response.data, {
    //         expires: expireDate,
    //       }); //guarda a cookie com os dados
    //       $rootScope.cookie = $cookies.getObject("loginCookie"); //vai buscar o obj guardado na cookie
    //       $rootScope.loggedIn = true;
    //       $state.go("dashboard"); //redirectiona para dash
    //     },
    //     function myError(response) {
    //       console.log("something wsadsad")
    //     });
    //   }
    // };

    $scope.tryLogin = function (user) {
      if ($state.current.name === "login") {
        $http({
          method: "GET",
          url: globalConfig.apiAddress + "/users",
        }).then(function mySuccess(response) {
          for (i = 0; i < response.data.length; i++) {
            if ((response.data[i].user == user.user) && (response.data[i].password) == user.password) {
              $state.go("dashboard"); //redirectiona para dash
              var expireDate = new Date(); //cria um obj de tempo nv
              expireDate.setDate(expireDate.getDate() + 1); //data de hj +1 dia
              $rootScope.loggedIn = true;
              $cookies.putObject('loginCookie', user,{'expires': expireDate}); //guarda a cookie com os dados
              $rootScope.cookie = $cookies.getObject("loginCookie"); //vai buscar o obj guardado na cookie
              if ($cookies.getObject("loginCookie").user == "admin") {
                $rootScope.isAdmin = true;
            }
            } else {
              $scope.errorMessage = "Wrong email or password";
            }
          }
        });
      }
    };

    
    $scope.logout = function() {
      document.cookie =
        "loginCookie=; expires=Thu, 18 Dec 2013 12:00:00 UTC; path=/";
        location.reload();
    }
  }
);
