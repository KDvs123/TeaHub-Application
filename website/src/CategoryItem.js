import React from "react";
import Image6 from "./images/image6.jpg";
import Image7 from "./images/image7.jpg";
import Image8 from "./images/image8.jpg";
import Image9 from "./images/image9.jpg";
import Image10 from "./images/image10.jpg";
import Image11 from "./images/image11.jpg";

const CategoryItem = ({ title, imgSrc }) => {
  return (
    <div
      className="relative overflow-hidden rounded-full w-[400px] h-[400px] bg-cover bg-center"
      style={{ backgroundImage: `url(${imgSrc})` }}
    >
      <div className="absolute inset-0 flex items-center justify-center">
        <h3 className="text-white text-[40px] ">{title}</h3>
      </div>
    </div>
  );
};

const PlantCategories = () => {
  return (
    <div className="bg-white-300 p-8">
      <h2 className="text-4xl text-black font-bold mb-[50px] text-center">
        Whatever diseases we got you covered!
      </h2>
      <div
        className="mx-auto grid grid-cols-3 gap-8"
        style={{ maxWidth: "1200px" }}
      >
        <CategoryItem title="Brown Blight" imgSrc={Image6} />
        <CategoryItem title="Algar Leaf Spot" imgSrc={Image7} />
        <CategoryItem title="Helopeltis" imgSrc={Image8} />
        <CategoryItem title="Grey Blight" imgSrc={Image9} />
        <CategoryItem title="Red Leaf Spot" imgSrc={Image10} />
        <CategoryItem title="Diseases" imgSrc={Image11} />
      </div>
    </div>
  );
};

export default PlantCategories;
