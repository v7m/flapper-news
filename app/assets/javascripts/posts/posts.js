angular.module('flapperNews')
  .factory('posts', ['$http', function($http) {
    var o = {
      posts: []
    };
    o.getAll = function() {
      return $http.get('/posts.json').success(function(data) {
        angular.copy(data, o.posts);
      });
    };
    o.create = function (post) {
      return $http.post('/posts.json', post).success(function(data) {
        o.posts.push(data);
      });
    };
    o.upvote = function(post) {
      return $http.put('/posts/' + post.id + '/upvote.json').success(function(data) {
        post.upvotes += 1;
      });
    };
    o.downvote = function(post) {
      return $http.put('/posts/' + post.id + '/downvote.json').success(function(data) {
        post.upvotes -= 1;
      });
    };
    o.destroy = function(post) {
      return $http.delete('/posts/' + post.id + '.json').success(function(data) {
        o.posts.splice( o.posts.indexOf(post), 1 );
      });
    };
    o.get = function(id) {
      return $http.get('/posts/' + id + '.json').then(function(res) {
        return res.data;
      });
    };

    o.addComment = function(id, comment) {
      return $http.post('/posts/' + id + '/comments.json', comment);
    };
    o.upvoteComment = function(post, comment) {
      return $http.put('/posts/' + post.id + '/comments/' + comment.id + '/upvote.json')
        .success(function(data) {
          comment.upvotes += 1;
        });
    };
    o.downvoteComment = function(post, comment) {
      return $http.put('/posts/' + post.id + '/comments/' + comment.id + '/downvote.json')
        .success(function(data) {
          comment.upvotes -= 1;
        });
    };
    o.destroyComment = function(post, comment) {
      return $http.delete('/posts/' + post.id + '/comments/' + comment.id + '.json').success(function(data) {
        post.comments.splice( post.comments.indexOf(comment), 1 );
      });
    };
    return o;
  }])