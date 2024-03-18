import React from "react";
import image3 from "./images/image3.jpg"; // Ensure this is the correct path to your image
import plusIcon from "./icons/plus icon.png"; // Replace with your actual icon path

const TeaDescription = () => {
  return (
    <div className="flex items-center justify-center min-h-screen px-4 lg:px-20 bg-white">
      <div className="flex flex-col lg:flex-row items-center justify-between w-full max-w-6xl mx-auto">
        <div className="flex-1 mb-10 lg:mb-0 lg:mr-10">
          <h2 className="text-6xl text-green-600 font-extrabold mb-6">
            Plant Disease Identification
          </h2>
          <p className="text-xl text-gray-600 mb-8">
            Unsure about the health of your plant? Snap a photo and our app will
            analyze it to detect any diseases or pests. Get instant feedback and
            tips on how to treat your plant to keep it healthy and thriving.
          </p>
          <button className="bg-green-600 text-white text-xl font-bold uppercase px-8 py-4 rounded-full shadow hover:bg-green-700 transition-colors">
            Scan Your Plant
          </button>
        </div>
        <div className="flex-1 lg:ml-10 relative">
          <div className="w-full lg:h-85 rounded-3xl overflow-hidden shadow-lg">
            <img
              src={image3}
              alt="Relaxing with plants"
              className="object-cover object-center w-full h-full"
            />
            <button className="absolute top-3 left-2 mt-4 ml-4 bg-white rounded-full p-2 shadow-md flex items-center justify-center hover:bg-gray-100">
              <img
                src={plusIcon}
                alt="Change plant location"
                className="h-8 w-8"
              />
              <span className="text-l text-green-600 font-semibold ml-2">
                Change plant location
              </span>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default TeaDescription;
