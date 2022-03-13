import React from 'react'
import { HiUserCircle } from "react-icons/hi";

function PlayerCard({pname,level}) {
  return (
    <div>
        <div className="flex m-5 p-3 rounded-xl w-72 h-36 single-tour items-center justify-center bg-slate-50 drop-shadow-xl shadow-gray-300">
                <HiUserCircle size={120} className='text-blue-700'/>
                <div className="flex-col text-lg">
                    <div className='flex m-2'>{pname}</div>
                    <div className='flex text-xl m-2'>Level: {level}</div>
                </div>
        </div>
    </div>
  )
}

export default PlayerCard