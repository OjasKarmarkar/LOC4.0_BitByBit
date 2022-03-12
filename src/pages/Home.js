import React, { useRef } from 'react'
import TeamCard from '../components/TeamCard'
import { motion } from 'framer-motion'

function Home() {

  const scrollRef = useRef()

  return (
    <div className='ml-[10vh] w-[93vw] h-full flex flex-col overflow-auto'>
      {/* logo */}
      <div className='w-full h-12 flex justify-center items-center'>
        logo
      </div>
      {/* charts */}
      <div className='w-full h-[40vh] flex'>
        <div className='h-full w-[60%] scale-y-90 scale-x-95 rounded-2xl bg-blue-500 flex justify-center items-center text-white'>
          bar chart
        </div>
        <div className='h-full w-[40%] scale-y-90 scale-x-95 rounded-2xl bg-blue-500 flex justify-center items-center text-white'>
          pie chart
        </div>
      </div>
      {/* teams and events */}
      <div
        ref={scrollRef}
        className='w-full h-[40vh] flex-col overflow-hidden py-5'>
        {/* scrollable cards */}
        <div className=' mx-10'>Your sports</div>
        <motion.div 
          drag={'x'} 
          dragConstraints={scrollRef}
          className='flex h-[95%] w-[calc(300px*6)]'>
          <TeamCard/>
          <TeamCard/>
          <TeamCard/>
          <TeamCard/>
          <TeamCard/>
          <TeamCard/>
        </motion.div>
      </div>
      <div
        ref={scrollRef}
        className='w-full h-[40vh] flex-col overflow-hidden py-5'>
        {/* scrollable cards */}
        <div className='mx-10'>Your Teams</div>
        <motion.div 
          drag={'x'} 
          dragConstraints={scrollRef}
          className='flex h-[95%] w-[calc(300px*6)]'>
          <TeamCard/>
          <TeamCard/>
          <TeamCard/>
          <TeamCard/>
          <TeamCard/>
          <TeamCard/>
        </motion.div>
      </div>
    </div>
  )
}

export default Home