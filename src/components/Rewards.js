import React from 'react'
import Card from './Card'

function Rewards() {
  var fullDate = new Date()
  var today = fullDate.toLocaleDateString('en-UK');
  var nextDate = new Date(new Date().getTime()+(7*24*60*60*1000)).toLocaleDateString('en-UK')
  return (
    <div className="flex-col ml-[10vh]">
      <div className="flex">
        <Card head="Congrats!" msg="For completing a 7 days streak" date={today}/>
        <Card head="Next Reward" msg="Complete a 14 days streak by" date={nextDate}/>
      </div>
      {/* parting line */}
      <div className="ml-5 w-[95%] h-[2px] my-1 bg-gray-300 rounded-full"></div>
      <div className='mx-10 text-xl font-bold'>
        Previous Rewards
      </div>
      <div className="flex">
        <Card head="Congrats!" msg="For completing a 7 days streak" date={today}/>
        <Card head="Next Reward" msg="Complete a 14 days streak by" date={nextDate}/>
      </div>
    </div>
  );
}

export default Rewards