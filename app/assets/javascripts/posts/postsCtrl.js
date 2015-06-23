angular.module('flapperNews')
	.controller('PostsCtrl', ['$scope', 'posts', 'post', 'Auth',
	  function($scope, posts, post, Auth) {
	  	$scope.signedIn = Auth.isAuthenticated;
	    $scope.post = post;
	    $scope.addComment = function(){
  			if($scope.body === '') { return; }
  			posts.addComment(post.id, {
    			body: $scope.body,
    			author: 'user',
  			}).success(function(comment) {
    			$scope.post.comments.push(comment);
  			});
  			$scope.body = '';
		};
	    $scope.incrementUpvotes = function(comment) {
	    	posts.upvoteComment(post, comment);
	  	};
	  	$scope.incrementPostUpvotes = function(post) {
      		posts.upvote(post);
    	};
	}])