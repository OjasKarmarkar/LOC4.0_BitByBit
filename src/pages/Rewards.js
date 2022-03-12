import React from 'react'
import Card from '../components/Card'

function Rewards() {
  var fullDate = new Date()
  var today = fullDate.toLocaleDateString('en-UK');
  var nextDate = new Date(new Date().getTime()+(7*24*60*60*1000)).toLocaleDateString('en-UK')
  return (
    <div className="flex-col ml-[10vh]">
      <div className='mx-10 my-2 text-2xl font-bold'>
        New and Upcoming Rewards
      </div>
      
      {/* new and upcoming rewards */}
      <div className="flex">
        <div className="flex flex-wrap w-full">
          <Card trophy='text-gray-400' head="Congrats!" msg="For completing a 7 days streak" date={today}/>
          <Card trophy='text-amber-300' head="Next Reward" msg="Complete a 14 days streak by" date={nextDate}/>
        </div>
      </div>

      {/* parting line */}
      <div className="mx-12 w-[90%] h-[2px] my-4 bg-gray-200 rounded-full"></div>
      
      <div className='mx-10 text-2xl font-bold'>
        Previous Rewards
      </div>

      {/* wrapping flexbox */}
      <div className="flex">
        <div className="flex flex-wrap w-full">
          <Card trophy='text-amber-300' head="Congrats!" msg="For completing a 14 days streak" date={'9/3/2022'}/>
          <Card trophy='text-gray-400' head="Congrats!" msg="For completing a 7 days streak" date={'23/2/2022'}/>
          <Card trophy='text-amber-300' head="Congrats!" msg="Well done! you ran 10 km today" date={'20/2/2022'}/>
          <Card trophy='text-gray-400' head="Congrats!" msg="Complete a 3 days streak by" date={'18/2/2022'}/>
          <Card trophy='text-red-900' head="Congrats!" msg="You ran 5 km today" date={'15/2/2022'}/>
          <Card trophy='text-red-900' head="Hurray!" msg="You won a Welcome Reward!" date={'1/2/2022'}/>
        </div>
      </div>
    </div>
  );
}

export default Rewards