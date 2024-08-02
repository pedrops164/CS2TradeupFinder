import React, { useState, useEffect } from 'react';
import './App.css';

function Home() {
  const [currentTime, setCurrentTime] = useState(0);

  useEffect(() => {
    fetch('/time')
      .then(res => res.json())
      .then(data => {
        setCurrentTime(data.timee);
      });
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <p>The current time is {currentTime}.</p>
      </header>
    </div>
  );
}

export default Home;
