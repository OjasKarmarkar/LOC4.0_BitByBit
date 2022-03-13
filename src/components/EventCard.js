import React from "react";

function EventCard(props) {
  return (
    <div className="border-2 rounded-xl hover:shadow-2xl w-[22%]  tansition-all duration-300 m-4">
      <div className="flex justify-center rounded-xl p-3">
        <img
          src={props.img}
          alt="eventpicture"
          className="h-[50%] w-[50%] justify-center align-middle py-2 "
        />
      </div>
      <div>
        <div className="border-b-2 ">
          <h2 className="w-full h-full p-3 text-lg font-medium">
            {props.title}
          </h2>
          <p className="p-3">{props.desc}</p>
        </div>
        <div className="p-3 text-xl font-semibold">
          <h1>Sport</h1>
        </div>
      </div>
    </div>
  );
}

export default EventCard;
