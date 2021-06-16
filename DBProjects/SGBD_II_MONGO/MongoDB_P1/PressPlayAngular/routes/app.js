var routerApp = angular.module("routerApp", ["ui.router", "ngCookies"]);

routerApp
  .config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/home");

    $stateProvider
      .state("register", {
        url: "/register",
        controller: "userController",
        templateUrl: "views/registerUser.html",
      })
      .state("login", {
        url: "/login",
        controller: "userController",
        templateUrl: "views/login.html",
      })
      .state("home", {
        url: "/home",
        controller: "gamesController",
        templateUrl: "views/index.html",
      })
      .state("dashboard", {
        url: "/dashboard",
        controller: "userController",
        templateUrl: "views/dashboard.html",
        resolve: {
          Auth: function ($rootScope, $state) {
            if (!$rootScope.loggedIn) {
              $state.go("home");
              $state.defaultErrorHandler(function(error) {
              });
            }
          },
        },
      })
      .state("gameInfo", {
        url: "/info/:id",
        controller: "gamesController",
        templateUrl: "/views/details.html",
      })
      .state("createGames", {
        url: "/createGames",
        controller: "createGameController",
        templateUrl: "views/createGames.html",
        resolve: {
          Auth: function ($rootScope, $state) {
            if (!$rootScope.isAdmin) {
              $state.go("home");
              $state.defaultErrorHandler(function(error) {
              });
            }
          },
        },
      })
      .state("editGame", {
        url: "/edit/:id",
        controller: "createGameController",
        templateUrl: "views/editGames.html",
        resolve: {
          Auth: function ($rootScope, $state) {
            if (!$rootScope.isAdmin) {
              $state.go("home");
              $state.defaultErrorHandler(function(error) {
              });
            }
          },
        },
      })
      .state("logout", {
        url: "/home",
        controller: function logout($state) {
          document.cookie =
            "loginCookie=; expires=Thu, 18 Dec 2013 12:00:00 UTC; path=/";
          location.reload();
        },
      });
  })
  .constant("globalConfig", {
    apiAddress: "http://localhost:3000",
  });

routerApp.run([
  "$rootScope",
  "$location",
  "$cookies",
  function ($rootScope, $location, $cookies) {
    $rootScope.cookie = $cookies.getObject("loginCookie");
    if ($cookies.getObject("loginCookie") == null) {
      $rootScope.loggedIn = false;
    } else {
      $rootScope.loggedIn = true;
      if ($cookies.getObject("loginCookie").user == "admin") {
        $rootScope.isAdmin = true;
      }
    }
  },
]);
