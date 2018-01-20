import React from 'react';

class Weather extends React.Component {
  constructor () {
    super();
    this.state = {
      lat: 0,
      long: 0,
      temp: "",
      name: ""
    };
  }

  render () {
    return (
      <div>
        {this.state.temp}
        {this.state.name}
      </div>
    );
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition( (position) => {
      console.log("mounted");
      this.setState({lat: position.coords.latitude, long: position.coords.longitude});
      this.request();
    });
  }

  request() {
    const xhr = new XMLHttpRequest();
    const { lat, long } = this.state;
    xhr.open('GET', `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=`);
    xhr.responseType = 'json';
    xhr.onload = () => {
      console.log(xhr.status);
      console.log(xhr.response);
      console.log(xhr.responseType);
      this.setState({ temp: ((xhr.response.main.temp - 273.15) * 9/5 + 32).toString().slice(0,5), name: xhr.response.name });
    };
    xhr.send();
  }
}


export default Weather;
