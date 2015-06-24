angular.module('flapperNews')
  .controller('MainCtrl', ['$scope', 'posts', 'Auth', function($scope, posts, Auth) {
    $scope.signedIn = Auth.isAuthenticated;
    Auth.currentUser().then(function(user) {
      $scope.user = user;
    });
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
    $scope.decrementUpvotes = function(post) {
      posts.downvote(post);
    };
    $scope.destroyPost = function(post) {
      posts.destroy(post);
    };
  }])
