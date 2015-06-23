angular.module('flapperNews')
  .controller('MainCtrl', ['$scope', 'posts', function($scope, posts) {
    $scope.posts = posts.posts;
    $scope.addPost = function() {
      emptyFields = (!$scope.title || $scope.title === '') && (!$scope.body || $scope.body === '')
      if(emptyFields) { return; }
      posts.create({
        title: $scope.title,
        body: $scope.body
      });
      $scope.title = '';
      $scope.body = '';
    };
    $scope.incrementUpvotes = function(post) {
      posts.upvote(post);
    };
  }])
