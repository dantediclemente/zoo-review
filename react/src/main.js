import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import VoteApp from './components/VoteApp';

$(function() {
  ReactDOM.render(
    <App />,
    document.getElementById('zoo-index')
  );
});
