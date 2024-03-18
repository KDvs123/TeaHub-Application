import React from "react";
import image1 from "./images/image1.jpg"; // Make sure this is the correct path to your image

const DiseaseSection = () => {
  return (
    <div className="flex items-center justify-center min-h-screen px-4 lg:px-20">
      <div className="flex flex-col lg:flex-row items-center justify-between w-full max-w-7xl mx-auto">
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
        <div className="flex-1 lg:ml-10">
          <div className="w-full aspect-square rounded-full overflow-hidden shadow-lg">
            <img
              src={image1}
              alt="Plant disease identification"
              className="object-cover object-center w-full h-full"
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default DiseaseSection;
