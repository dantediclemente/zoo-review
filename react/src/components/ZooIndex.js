import React from 'react';
import Zoo from './Zoo';

const ZooIndex = props => {
  let zoos = props.zoos.map(zoo => {
    const { id, name } = zoo;

    return (
      <Zoo
        key={id}
        id={id}
        name={name}
      />
    );
  });

  return (
    <div>
      <ul>
        {zoos}
      </ul>
    </div>
    );
  };
export default ZooIndex;
