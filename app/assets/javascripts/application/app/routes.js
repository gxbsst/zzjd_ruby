(function () {
    'use strict';

    angular
        .module('app.routes', ['ui.router'])
        .config(configure)
        .run(routeConfig);

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider) {

        $urlRouterProvider.otherwise('/');

        $stateProvider
            .state('base', {
                abstract: true,
                url: '/',
                template: '<div ui-view></div>',
                controller: 'BaseController as base'
            })
            .state('base.index', {
                url: '',
                views: {
                    '': {
                        templateUrl: 'index/index.html',
                        controller: 'IndexController as vm'
                    },
                    'header@': {
                        templateUrl: 'index/header.html'
                    },
                    'footer@': {
                        templateUrl: 'layout/footer.html'
                    }
                }
            })
            .state('base.demos', {
                url: '^/demos',
                views: {
                    '': {
                        templateUrl: 'demos/index.html',
                        controller: 'DemosController as vm'
                    },
                    'toolbar@': {
                        templateUrl: 'home/toolbar/index.html',
                        controller: 'HomeToolbarController as vm'
                    }
                }
            });

        getCurrentUser.$inject = ['$rootScope', '$q', 'User'];

        function getCurrentUser($rootScope, $q, User){
            var defer = $q.defer();
            if($rootScope.currentUser){
                defer.resolve($rootScope.currentUser);
            }else{
                User.get({
                    include: 'schools'
                },function (result) {
                    $rootScope.currentUser = result.data;
                    defer.resolve($rootScope.currentUser);
                }, function () {
                    defer.resolve();
                });
            }
            return defer.promise;
        }

    }

    routeConfig.$inject = ['$rootScope', '$state', '$stateParams'];

    function routeConfig($rootScope, $state, $stateParams) {

        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;

    }

})();