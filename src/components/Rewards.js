import React from 'react'
import Card from './Card'
// import '../rewards.css'

function Rewards() {
  var fullDate = new Date()
  var today = fullDate.toLocaleDateString('en-UK');
  var nextDate = new Date(new Date().getTime()+(7*24*60*60*1000)).toLocaleDateString('en-UK')
  return (
    <div className="flex">
      <Card head="Congrats!" msg="For completing a 7 days streak" date={today}/>
      <Card head="Next Reward" msg="Complete a 14 days streak by" date={nextDate}/>
    </div>
  );
}

export default Rewards