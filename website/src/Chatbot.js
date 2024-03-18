import React from "react";
import image2 from "./images/image2.jpg"; // Make sure this is the correct path to your image

const Chatbot = () => {
  return (
    <div className="flex items-center justify-center min-h-screen bg-white px-4 lg:px-20">
      <div className="flex flex-col lg:flex-row-reverse items-center justify-between w-full max-w-7xl mx-auto">
        <div className="flex-1 mb-10 lg:mb-0 lg:ml-10 order-2 lg:order-1">
          <h2 className="text-6xl text-green-600 font-extrabold mb-6">
            Light meter
          </h2>
          <p className="text-xl text-gray-600 mb-8">
            Would you like to put a plant in a bathroom without windows? Some
            plants prefer shade and some are sun-lovers. Get to know which
            plants are suitable in your home based on the different light
            conditions of your rooms.
          </p>
          <button className="bg-green-600 text-white text-xl font-bold uppercase px-8 py-4 rounded-full shadow hover:bg-green-700 transition-colors">
            Download now
          </button>
        </div>
        <div className="flex-1 order-1 lg:order-2 lg:mr-10">
          <div className="w-full aspect-square rounded-full overflow-hidden shadow-lg">
            <img
              src={image2}
              alt="Plant in sunlight"
              className="object-cover object-center w-full h-full"
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default Chatbot;
