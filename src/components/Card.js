import React from "react";
import logo from './trophy3d-removebg-preview.png'

function Card({head, msg,date}) {
    // const {msg, date } = props

    return (
      <div className="" >
        <div className="m-5 p-3 rounded-xl w-72 h-72 single-tour flex-col items-center justify-center bg-blue-400">
          <div className="w-full flex justify-center">
            <div className="w-36 h-36">
              <img className="object-contain" src={logo} alt="trophy" />
            </div>
          </div>
          <div className="flex-col items-center justify-center">
            <p className="text-center text-xl my-1 font-bold">{head}</p>
            <p className="text-center my-2 text-lg">{msg}</p>
            <p className="text-center my-1 text-lg">{date}</p>
          </div>
        </div>
      </div>
    );
}

export default Card