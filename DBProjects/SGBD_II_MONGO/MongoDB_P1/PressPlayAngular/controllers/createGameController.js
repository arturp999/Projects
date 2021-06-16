routerApp.controller(
  "createGameController",
  function ($scope, $http, $state, $stateParams, globalConfig, $rootScope) {
    $scope.saveData = function (game) {
      if ($state.current.name === "createGames") {
        game.game_type_id = $scope.arr; //recebe array game type
        game.developer_id = $scope.arrDeveloper_id; //recebe array developer id
        // console.log(game);
        $http({
          method: "POST",
          url: globalConfig.apiAddress + "/games",
          data: game,
        }).then($state.go("home"));
      }
    };

    $scope.arr = [];
    $scope.push = function () {
      var inputVal = $scope.arrInput;
      $scope.arr.push(inputVal);
    };

    $scope.arrDeveloper_id = [];
    $scope.pushDev = function () {
      var inputVal = $scope.arrInput2;
      $scope.arrDeveloper_id.push(inputVal);
    };

    $http({
      method: "GET",
      url: globalConfig.apiAddress + "/game_types",
    }).then(
      function mySuccess(response) {
        $scope.game_types = response.data;
        // console.log(response);
      },
      function myError(response) {
        console.log("erro");
      }
    );

    $http({
      method: "GET",
      url: globalConfig.apiAddress + "/game_developers",
    }).then(
      function mySuccess(response) {
        $scope.game_developers = response.data;
        // console.log(response);
      },
      function myError(response) {
        console.log("erro");
      }
    );

    $http({
      method: "GET",
      url: globalConfig.apiAddress + "/game_publishers",
    }).then(
      function mySuccess(response) {
        $scope.game_publishers = response.data;
        //   console.log(response);
      },
      function myError(response) {
        console.log("erro");
      }
    );
    ///////////////////////////////////////////////////////////// EDIT /////////////////////////////////////////////////////////////////////////////
    // array dos devs
    $http({
      method: "GET",
      url: globalConfig.apiAddress + "/games/devs/" + $stateParams.id,
    }).then(function mySuccess(response) {
      var devDB = response.data;
      Object.keys(devDB).forEach((element) => {
        devDB[0].Developers.forEach((element) => {
          $scope.devArray.push(element._id);
        });
      });
      //  console.log($scope.devArray); //array com os dados da DB
    });
    // array dos tipos
    $http({
      method: "GET",
      url: globalConfig.apiAddress + "/games/type/" + $stateParams.id,
    }).then(function mySuccess(response) {
      var devType = response.data;
      Object.keys(devType).forEach((element) => {
        devType[0].Type_of_Game.forEach((element) => {
          $scope.typeArray.push(element._id);
        });
      });
      // console.log($scope.typeArray); //array com os dados da DB
    });


    $scope.typeArray = [];
    $scope.pushDevType = function (editedGame) {
      var inputVal = $scope.editedGame.game_type_id;
      $scope.typeArray.push(inputVal);
    };

    $scope.devArray = [];
    $scope.pushDevNew = function (editedGame) {
      var inputVal = $scope.editedGame.developer_id;
      $scope.devArray.push(inputVal);
    };

    $scope.saveEditedGame = function (editedGame) {
      if ($state.current.name === "editGame") {

        if (editedGame != undefined) {
          editedGame.developer_id = $scope.devArray;//recebe array developer id com os dados da BD mais os adicionados
          editedGame.game_type_id = $scope.typeArray;//recebe array game type«
        }

        if (editedGame.release_date == undefined) {
          editedGame.release_date = $scope.release_date;
        }

        
        $http({
          method: "PUT",
          url: globalConfig.apiAddress + "/games/" + $stateParams.id,
          data: editedGame,
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

    if ($state.current.name === "editGame") {
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
    }
  }
);
