import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

const tabInfoArray =
  [
    { title: "tab1", content: "tab1 content"},
    { title: "tab2", content: "tab2 content"},
    { title: "tab3", content: "tab3 content"}
  ];


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Clock />, document.getElementById('clock'));
  ReactDOM.render(<Tabs tabInfo={tabInfoArray}/>, document.getElementById('tabs'));
  ReactDOM.render(<Weather />, document.getElementById('weather'));
});
