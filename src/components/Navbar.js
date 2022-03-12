import React from 'react'
import { BsFillCameraFill } from "react-icons/bs";

function Navbar() {
  return (
    <div className='fixed h-full w-[10vh] border-2 z-10'>
      <div className='w-full h-[10%] flex justify-center items-center'>
        <BsFillCameraFill size={55} className="text-blue-700" />
      </div>
      <div className='w-full h-[80%] flex flex-col justify-start items-center pt-10 space-y-5'>
        <div className='relative h-16'>
          <BsFillCameraFill size={30} className="peer text-blue-600" />
          <div className='absolute -top-1 left-[150%] scale-0 peer-hover:scale-100 transition-transform duration-150 origin-left bg-white rounded-xl p-2 font-semibold text-gray-800 drop-shadow-lg'>Description</div>
        </div>
        <div className='relative h-16'>
          <BsFillCameraFill size={30} className="peer text-gray-400" />
          <div className='absolute -top-1 left-[150%] scale-0 peer-hover:scale-100 transition-transform duration-150 origin-left bg-white rounded-xl p-2 font-semibold text-gray-800 drop-shadow-lg'>Description</div>
        </div>
        <div className='relative h-16'>
          <BsFillCameraFill size={30} className="peer text-gray-400" />
          <div className='absolute -top-1 left-[150%] scale-0 peer-hover:scale-100 transition-transform duration-150 origin-left bg-white rounded-xl p-2 font-semibold text-gray-800 drop-shadow-lg'>Description</div>
        </div>
        <div className='relative h-16'>
          <BsFillCameraFill size={30} className="peer text-gray-400" />
          <div className='absolute -top-1 left-[150%] scale-0 peer-hover:scale-100 transition-transform duration-150 origin-left bg-white rounded-xl p-2 font-semibold text-gray-800 drop-shadow-lg'>Description</div>
        </div>
      </div>
      <div className='w-full h-[10%] flex justify-center items-center'>
        <BsFillCameraFill size={55} className="text-red-700" />
      </div>
    </div>
  )
}

export default Navbar