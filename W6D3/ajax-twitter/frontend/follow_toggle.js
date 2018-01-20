class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.$el.on("click", event => {
      this.handleClick(event);
    });
  }

  render () {
    if (this.followState === false) {
      this.$el.text("Follow");
    } else {
      this.$el.text("Unfollow");
    }
  }

  handleClick(e) {
    e.preventDefault();
    // let method = "POST";
    // if (this.followState === true) {
    //   method = "DELETE";
    // }
    // $.ajax ({
    //   url: `/users/${this.userId}/follow`,
    //   dataType: "json",
    //   type: method,
    //   success: () => {
    //     this.followState = !this.followState;
    //     this.render();
    //   },
    //   error: function(errMsg) {
    //     console.log(errMsg);
    //   }
    // });

  }
}

module.exports = FollowToggle;
