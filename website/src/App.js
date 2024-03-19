import './App.css';
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import DiseaseSection from './DiseaseSection';
import Chatbot from './Chatbot';
import TeaDescription from './TeaDescription';
import MainHero from './MainHero';
import NavBar from './NavBar';
import PlantCategories from './CategoryItem';
import Footer from './Footer';
import TeamMembers from "./TeamMembers";

function App(){
  return(
    <Router>
        <div className="App">
           <NavBar/>
            <Routes>
              <Route
                    path="/"
                    element={
                      <>
                        <MainHero />
                        <DiseaseSection />
                        <Chatbot />
                        <TeaDescription />
                        <PlantCategories />
                      </>
                    }
                  />

            
                <Route path="/team" element={<TeamMembers />} />
            </Routes>
            <Footer/>
          </div>
    </Router>
 
 );
}
export default App;

