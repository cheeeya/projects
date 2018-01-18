const FollowToggle = require("./follow_toggle");


$(() => {
  const $followToggle = $('.follow-toggle');
  $followToggle.each((i, button) => (new FollowToggle(button)));
});
