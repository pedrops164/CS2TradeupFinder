import React, { useState } from 'react';
import './../styles/App.css';
import Slide3 from '../components/slide3';
import Slide2 from '../components/slide2';
import Slide1 from '../components/slide1';

function HomeOld() {
  const [slide, setSlider] = useState(1);
  const [fade, setFade] = useState(false);

  const renderContent = () => {
    if (slide === 1) {
      return <Slide1 />;
    } else if (slide === 2) {
      return <Slide2 />;
    } else if (slide === 3) {
      return <Slide3 />;
    }
  };

  const mudaSlider = (numero) => {
    setFade(true); // Start the fade-out effect
    setTimeout(() => {
      setSlider(numero);
      setFade(false); // Start the fade-in effect
    }, 300); // Duration of the fade-out effect
  };

  return (
    <div className="App">
      <div className={`conteudoMeio ${fade ? 'fade' : ''}`}>
        {renderContent()}
      </div>
      <div className="sliderButtons">
        <button className="sliderBall" onClick={() => mudaSlider(1)}></button>
        <button className="sliderBall" onClick={() => mudaSlider(2)}></button>
        <button className="sliderBall" onClick={() => mudaSlider(3)}></button>
      </div>
    </div>
  );
}

export default HomeOld;
