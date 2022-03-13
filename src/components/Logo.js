import React from 'react'
import { BiRun } from "react-icons/bi";

function Logo() {
  return (
    <div className='w-full h-12 flex justify-center items-center space-x-4 text-2xl font-sans mb-3'>
        <BiRun size={50} className='text-blue-500'/> <p className='text-5xl font-semibold text-blue-800'>Fit-tastic</p>
      </div>
  )
}

export default Logo