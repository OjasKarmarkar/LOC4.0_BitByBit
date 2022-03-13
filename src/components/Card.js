import React from "react";
import { IoIosTrophy } from "react-icons/io";


function Card({trophy,head, msg,date}) {
    // const {msg, date } = props

    return (
      <div>
        {/* outer box */}
        <div className="flex m-5 p-3 rounded-xl w-72 h-72 single-tour items-center justify-center bg-slate-50 drop-shadow-xl shadow-gray-300">
          
          {/* trophy react-icon */}
          <div className="w-full justify-center">
              <IoIosTrophy size={120} className={trophy}/>
          </div>

          <div className="mr-2 flex-row items-center justify-center">
            <p className="text-center text-xl my-1 font-bold">{head}</p>
            <p className="text-center my-2 text-lg">{msg}</p>
            <p className="text-center my-1 text-lg">{date}</p>
          </div>
        </div>
      </div>
    );
}

export default Card