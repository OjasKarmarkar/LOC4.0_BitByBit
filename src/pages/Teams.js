import React from 'react'
import PlayerCard from '../components/PlayerCard'
function Teams() {
  return (
    <div className='ml-[10vh] h-full flex flex-col overflow-auto px-2'>
        <div className="flex-col p-5">
            <div className="flex w-full justify-between">
                <div className="font-bold text-xl mx-5 ">Team: Area Cricket</div>
                <div className="font-bold text-xl mr-5">Sport: Cricket</div>
            </div>
        <div className="flex">
            {/* player card */}
            <div className="flex flex-wrap">
            <PlayerCard pname='John Doe' level='1xp'/>
            <PlayerCard pname='Jane Kate' level='0xp'/>
            <PlayerCard pname='Rita Chabra' level='5xp'/>
            <PlayerCard pname='Mary Cletus' level='2xp'/>
            <PlayerCard pname='Rosy Roy' level='2xp'/>
            </div>
        </div>
        </div>
    </div>
  )
}

export default Teams