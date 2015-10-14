(function () {
    'use strict';

    angular
        .module('app.pbl')
        .controller('BaseController', BaseController);

    BaseController.$inject = [
        '$scope', '$rootScope', '$document', '$q', '$timeout', '$interval', 'modals',
        'NOTIFIES_TYPES', 'RESOURCE_TYPES', 'PATHS', 'QINIU', 'DURATION_UNITS', 'ROLES', 'DISCIPLINES', 'INTERESTS', 'GROUP_TAGS', 'GRADES',
        'Resources', 'Follows', 'Friends', 'Groups', 'Invitations', 'User', 'Users',
        'TYPE_DEFIN', 'WORK_TYPES'
    ];

    function BaseController($scope, $rootScope, $document, $q, $timeout, $interval, modals,
                            NOTIFIES_TYPES, RESOURCE_TYPES, PATHS, QINIU, DURATION_UNITS, ROLES, DISCIPLINES, INTERESTS, GROUP_TAGS, GRADES,
                            Resources, Follows, Friends, Groups, Invitations, User, Users,
                            TYPE_DEFIN, WORK_TYPES) {


    }

})();