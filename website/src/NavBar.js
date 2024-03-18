import React from "react";

const NavBar = () => {
  return (
    <nav className="bg-white-100 py-4 px-8 mb-[50px] w-full">
      <div className="flex items-center justify-between ">
        
          <a
            href="/"
            className="text-xl font-semibold text-green-800 hover:text-green-600"
          >
            Support
          </a>
        
        <div className="flex-grow text-center">
          <a href="/" className="text-3xl font-bold text-green-800">
            TeaHub
          </a>
        </div>
        <div className="flex justify-end">
          <button className="text-green-800 hover:text-green-600 border border-green-800 hover:border-green-600 rounded-full py-2 px-6">
            Get the app
          </button>
        </div>
      </div>
    </nav>
  );
};

export default NavBar;
