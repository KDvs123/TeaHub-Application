import './App.css';
import React from 'react';
import DiseaseSection from './DiseaseSection';
import Chatbot from './Chatbot';
import TeaDescription from './TeaDescription';
import MainHero from './MainHero';
import NavBar from './NavBar';

function App(){
  return(
 <div className="App">
    <div>
      <NavBar/>
      <MainHero/>
      <DiseaseSection/>
      <Chatbot/>
      <TeaDescription/>
    </div>

 </div>
 );
}
export default App;

