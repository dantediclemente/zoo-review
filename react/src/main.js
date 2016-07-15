import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

$(function() {
  if(document.getElementById('zoo-index'))
  {
    ReactDOM.render(
      <App />,
      document.getElementById('zoo-index')
    );
  }
});

$(document).ready(function() {
  $('.upvote').on('click', function(e) {
     e.preventDefault();

     var $this = $(this);
     var reviewId = $this.data('reviewid');

     var request = $.ajax({
        method: "POST",
        url: '/reviews/' + reviewId + '/votes',
        data: { value: 1 }
      });

      request.done(function(data) {
        $('.total-votes-' + data.review_id ).html(data.vote_total);
      })
   })

  $('.downvote').on('click', function(e) {
     e.preventDefault();

     var $this = $(this);
     var reviewId = $this.data('reviewid');

     var request = $.ajax({
        method: "POST",
        url: '/reviews/' + reviewId + '/votes',
        data: { value: -1 }
      });

      request.done(function(data) {
        $('.total-votes-' + data.review_id ).html(data.vote_total);
      })
  });
})
