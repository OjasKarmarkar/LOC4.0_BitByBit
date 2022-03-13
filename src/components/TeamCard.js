import React from 'react'
import badminton from '../static/badminton.png'
import cricket from '../static/cricket.png'
import swimming from '../static/swimming.png'
import yoga from '../static/yoga.png'
import football from '../static/football.png'
import { TiArrowRight } from "react-icons/ti";
import { Link } from "react-router-dom";

function TeamCard(props) {
  let image
  if (props.type === "Cricket") {
    image = cricket
  } else if (props.type === "Swimming") {
    image = swimming
  } else if (props.type === "Yoga") {
    image = yoga
  } else if (props.type === "Football") {
    image = football
  } else if (props.type === "Badminton") {
    image = badminton
  }
  return (
    <div className="relative w-[300px] h-full scale-[93%] rounded-2xl flex justify-center items-center drop-shadow-xl hover:drop-shadow-2xl bg-gray-500 hover:bg-gray-700 text-white transition-all overflow-clip">
      <img
        src={image}
        alt="badminton"
        className="absolute -z-10 opacity-25 -left-5 -bottom-5 w-[90%]"
      />
      <div className="h-full w-full relative">
        <p className="absolute top-5 left-5 text-4xl font-bold">{props.name}</p>
        <p className="absolute bottom-5 right-10 text-3xl font-semibold flex items-end group">
          <Link
              to="/teams"
              // type={props.type}
              // onClick={() => setType(props.type)}
            >View{" "}
            <TiArrowRight className="group-hover:scale-150 transition-transform" />{" "}
          </Link>
        </p>
      </div>
    </div>
  );
}

export default TeamCard