import React from "react";
import phoneImage from "./images/phone.png";
import addIcon from "./icons/plus icon.png" // Ensure this is the correct path to your image

const PlantaLogo = () => {
  return (
    <div className="w-[160px] h-[160px] bg-green-600 rounded-[50px] flex items-center justify-center text-[40px] font-bold text-white">
      TeaHub
    </div>
  );
};

const AddPlantButton = () => {
  return (
    <button className="flex w-[206px] h-[78px] items-center bg-yellow-300 text-green-800 py-[20px] px-[30px] rounded-[50px] shadow-md">
      <img
        src={addIcon}
        alt="Add"
        className="w-10 h-10 bg-green-600 rounded-[50px] mr-2"
      />
      Add a plant
    </button>
  );
};


const MainHero = () => {
  return (
    <div className="flex items-center justify-center min-h-screen px-4 lg:px-20 bg-white">
      <div className="flex flex-col lg:flex-row items-center justify-between w-full max-w-6xl mx-auto">
        <div className="flex-1 mb-10 lg:mb-0 lg:mr-10">
          <h1 className="text-8xl font-bold text-green-600 mb-6">
            Keep your plants alive
          </h1>
          <p className="text-2xl text-gray-600 mb-8">
            Individual care schedule and reminders for your plants,
            recommendations, step by step guides, identification, light meter
            and more. Keep your plants alive with Planta!
          </p>
        </div>
        <div className="lg:w-1/2 max-w-2xl relative">
          <img
            src={phoneImage}
            alt="Mobile phone showcasing app"
            className="mx-auto w-full h-auto"
          />
          <div
            style={{
              position: "absolute",
              top: "30%",
              left: "5%",
              transform: "translate(-50%, -50%)",
            }}
          >
            <PlantaLogo />
          </div>
          <div
            style={{
              position: "absolute",
              top: "40%",
              right: "10%",
              transform: "translate(50%, 50%)",
            }}
          >
            <AddPlantButton />
          </div>
        </div>
      </div>
    </div>
  );
};

export default MainHero;
