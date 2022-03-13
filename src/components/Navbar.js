import React, { useState } from "react";
import { Link } from "react-router-dom";
import { AiFillHome, AiFillGift } from "react-icons/ai";
import { MdOutlineSportsTennis } from "react-icons/md";
import { BsFillCalendarEventFill } from "react-icons/bs";
import { FiLogOut } from "react-icons/fi";
import { MdFaceRetouchingNatural } from "react-icons/md";

function Navbar() {

  const [icon, setIcon] = useState("profile")
  const handleClick = (menuIcon) => {
    setIcon(menuIcon)
  }
  return (
    <div className="fixed h-full w-[10vh] border-2 z-10">
      <div className="w-full h-[10%] flex justify-center items-center">
        <Link to={"/"} onClick={()=>{handleClick("profile")}}>
          <MdFaceRetouchingNatural size={55} className="text-blue-700" />
        </Link>
      </div>
      <div className="w-full h-[80%] flex flex-col justify-start items-center pt-10 space-y-5">
        <div className="relative h-16">
          <Link to={"/"} onClick={()=>{handleClick("home")}}>
            <AiFillHome size={30} className={`peer text-${icon==="home"?"blue-600":"gray-400"}`} />
            <div className="absolute -top-1 left-[150%] scale-0 peer-hover:scale-100 transition-transform duration-150 origin-left bg-white rounded-xl p-2 font-semibold text-gray-800 drop-shadow-lg">
              Home
            </div>
          </Link>
        </div>
        <div className="relative h-16">
          <Link to={"/rewards"} onClick={()=>{handleClick("rewards")}}>
            <AiFillGift size={30} className={`peer text-${icon==="rewards"?"blue-600":"gray-400"}`} />
            <div className="absolute -top-1 left-[150%] scale-0 peer-hover:scale-100 transition-transform duration-150 origin-left bg-white rounded-xl p-2 font-semibold text-gray-800 drop-shadow-lg">
              Rewards
            </div>
          </Link>
        </div>
        <div className="relative h-16">
          <Link to={"/sport"} onClick={()=>{handleClick("sports")}}>
            <MdOutlineSportsTennis size={30} className={`peer text-${icon==="sports"?"blue-600":"gray-400"}`} />
            <div className="absolute -top-1 left-[150%] scale-0 peer-hover:scale-100 transition-transform duration-150 origin-left bg-white rounded-xl p-2 font-semibold text-gray-800 drop-shadow-lg">
              Sports
            </div>
          </Link>
        </div>
        <div className="relative h-16">
          <Link to={"/events"} onClick={()=>{handleClick("events")}}>
            <BsFillCalendarEventFill size={30} className={`peer text-${icon==="events"?"blue-600":"gray-400"}`} />
            <div className="absolute -top-1 left-[150%] scale-0 peer-hover:scale-100 transition-transform duration-150 origin-left bg-white rounded-xl p-2 font-semibold text-gray-800 drop-shadow-lg">
              Description
            </div>
          </Link>
        </div>
      </div>
      <div className="w-full h-[10%] flex justify-center items-center">
        <FiLogOut size={55} className="text-red-700" />
      </div>
    </div>
  );
}

export default Navbar;
