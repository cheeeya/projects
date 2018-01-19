const APIUtil = {
  followUser: id=> {
    $.ajax ({
      url: `/users/${id}/follow`,
      dataType: "json",
      type: 'POST',
      success: () => {

      },
      error: function(errMsg) {
        console.log(errMsg);
      }
    });
  },

  unfollowUser: id => {
    $.ajax ({
      url: `/users/${id}/follow`,
      dataType: "json",
      type: 'DELETE',
      success: () => {

      },
      error: function(errMsg) {
        console.log(errMsg);
      }
    });
  }
};

module.exports = APIUtil;
