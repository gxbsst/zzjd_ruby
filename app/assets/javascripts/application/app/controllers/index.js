(function () {
    'use strict';

    angular
        .module('app.pbl')
        .controller('IndexController', IndexController);

    IndexController.$inject = ['$scope','Projects','ProjectProducts','Resources','RESOURCE_TYPES','TeacherSaying','Links','Learning'];

    function IndexController($scope,Projects,ProjectProducts,Resources,RESOURCE_TYPES, TeacherSaying, Links, Learning) {
    }

})();