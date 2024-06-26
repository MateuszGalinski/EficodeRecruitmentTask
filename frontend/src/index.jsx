import React from 'react';
import ReactDOM from 'react-dom';

const baseURL = process.env.ENDPOINT || "http://localhost:9000/api";

const getWeatherFromApi = async () => {
  try {
    const response = await fetch(`${baseURL}/weather`);
    // const response = await fetch(`backend:9000/api/weather`);
    console.log(response);
    return response.json();
    
  } catch (error) {
    console.error(error);
  }

  return {};
};

class Weather extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      icon: "",
    };
  }

  async componentDidMount() {
    console.log("Mounted component");
    console.log(baseURL);
    const weather = await getWeatherFromApi();
    this.setState({icon: weather.icon.slice(0, -1)});
  }

  render() {
    const { icon } = this.state;

    return (
      <div className="icon">
        { icon && <img src={`/img/${icon}.svg`} /> }
      </div>
    );
  }
}

ReactDOM.render(
  <Weather />,
  document.getElementById('app')
);
