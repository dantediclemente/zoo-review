import React, { Component } from 'react';
import ZooIndex from './ZooIndex';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      zoos: []
    };
  }

  componentDidMount() {
    $.ajax({
      url: '/api/zoos',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ zoos: data.zoos });
    });
  }

  render() {
    return(
      <div>
        <ZooIndex
          zoos={this.state.zoos}
        />
      </div>
    );
  }
}

export default App;
