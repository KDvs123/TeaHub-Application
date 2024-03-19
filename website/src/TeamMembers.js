import React from "react";

// Import member images
import Member1 from "./members/member1.jpg";
import Member2 from "./members/member2.jpg";
import Member3 from "./members/member3.jpg";
import Member4 from "./members/member4.jpg";
import Member5 from "./members/member5.jpg";

const Member = ({ imgSrc, name }) => (
  <div className="flex flex-col items-center">
    <img
      src={imgSrc}
      alt={name}
      className="w-[390px] h-[390px] rounded-full  mb-2 object-cover"
    />
    <div className="text-center">
      <p className="text-lg font-semibold">{name}</p>
      <p className="text-sm text-gray-600">Position</p>
    </div>
  </div>
);

const TeamMembers = () => {
  return (
    <div className="flex flex-col items-center mt-10 mb-20">
      {/* Central member */}
      <Member imgSrc={Member1} name="Member 1" />

      {/* Grid for other members */}
      <div className="mt-10 grid grid-cols-2 gap-x-20 gap-y-30">
        <Member imgSrc={Member2} name="Member 2" />
        <Member imgSrc={Member3} name="Member 3" />
        <Member imgSrc={Member4} name="Member 4" />
        <Member imgSrc={Member5} name="Member 5" />
      </div>
    </div>
  );
};

export default TeamMembers;