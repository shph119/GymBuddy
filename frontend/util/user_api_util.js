var AppDispatcher = require('../dispatcher/dispatcher');

var UserApiUtil = {
  signup: function(user, success, error){
    $.ajax({
      url: 'api/user',
      type: 'POST',
      data: {user: user},
      success: success,
      error: error
    });
  },
  login: function(user, success, error){
    $.ajax({
      url: 'api/session/',
      type: 'POST',
      data: {user: user},
      success: success,
      error: error
    });
  },
	logout: function(success, error){
		$.ajax({
			url: '/api/session',
			method: 'delete',
			success: success,
			error: error
		});
	},
	fetchCurrentUser: function(success, error){
		$.ajax({
			url: '/api/session',
			method: 'GET',
			success: success,
			error: error
		});
	},
	fetchUser: function(id, success, error){
		$.ajax({
			url: '/api/user/' + id + "/preview",
			method: 'GET',
			success: success,
			error: error
		});
	}
};

module.exports = UserApiUtil;
