import React from 'react';

class Clock extends React.Component {
  constructor () {
    super();
    this.state = {
      time: new Date()
    };

    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.handle = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.handle);
    this.handle = 0;
  }

  render () {
    const { time } = this.state;
    let seconds = time.getSeconds();
    if (seconds < 10) {
      seconds = '0' + seconds;
    }
    return (
      <div className="clock-div">
        <h1 className="title">Clock</h1>
        <div className="div-flex">
          <div>
            <h2 className="time-label">Time:</h2>
            <h2 className="time-label">Date:</h2>
          </div>
          <div>
            <h2 className="time-label">{time.getHours()}:{time.getMinutes()}:{seconds}</h2>
            <h2 className="time-label">{time.toDateString()}</h2>
          </div>
        </div>
      </div>
    );
  }

  tick () {
    this.setState({ time: new Date() });
  }
}

export default Clock;
