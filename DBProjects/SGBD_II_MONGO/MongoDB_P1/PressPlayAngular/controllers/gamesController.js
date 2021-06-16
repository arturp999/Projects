routerApp.controller(
  "gamesController",
  function ($scope, $http, $state, $stateParams, globalConfig,$cookies) {
    if ($state.current.name === "home") {
      $http({
        method: "GET",
        url: globalConfig.apiAddress + "/games",
      }).then(
        function mySuccess(response) {
          $scope.games = response.data;
        },
        function myError(response) {}
      );
    }

    if ($state.current.name === "gameInfo") {
      $http({
        method: "GET",
        url: globalConfig.apiAddress + "/games/info/" + $stateParams.id,
      }).then(
        function mySuccess(response) {
          $scope.games = response.data;
        },
        function myError(response) {}
      );
      $http({
        method: "GET",
        url: globalConfig.apiAddress + "/games/infoSeller/" + $stateParams.id,
      }).then(
        function mySuccess(response) {
          $scope.sellers = response.data;
        },
        function myError(response) {}
      );
      ///////////////////////////////////////////////////////////// DELETE GAME//////////////////////////////////////////////////////////////////////
      $scope.deleteGame = function () {
        if ($cookies.getObject("loginCookie").user == "admin") {
          $http({
            method: "DELETE",
            url: globalConfig.apiAddress + "/games/del/" + $stateParams.id,
          }).then(
            function mySuccess(response) {
              $state.go("home");
            },
            function myError(response) {}
          );
        }
        else{
          $state.go("home");
        }
      };
    }
  }
);

