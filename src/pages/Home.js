import React, { useRef, useEffect, useState } from 'react'
import TeamCard from '../components/TeamCard'
import Chart from '../components/Chart'
import Pie from '../components/Pie'
import SportCard from '../components/SportCard'
import { motion } from 'framer-motion'
import { getDoc, doc } from 'firebase/firestore'
import db from '../firebase/Firebase'

function Home() {

  const [chartData, setChartData] = useState([])
  const [pieData, setPieData] = useState({"Yoga": 1,"Football": 0,"Cricket": 2,"Tennis": 0,"Badminton": 0,"Swimming": 0,})
  const [sportsData, setSportsData] = useState([])
  const [eventsData, setEventsData] = useState([])

  const activityReducer = (data) => {
    console.log(data.activity)
    /* overall activity */
    data.activity.map((item) => {
      const d = new Date(item.history.date.seconds*1000)
      setChartData(e => [...e, {name: `${d.getDate()}-${d.getMonth()+1}`, hours: item.history.timeSpent}])
      /* sports activity */
      item.sports.map((sport) => {
        sport = sport[0].toUpperCase() + sport.slice(1)
        //console.log(sport, pieData.Yoga)
        const singleSportData = {}
        singleSportData[sport] = pieData[sport]+1
        setPieData((e)=>({...e, ...singleSportData}))
        return 0
      })
      return 0
    })
    data.sports.map((playerSport) => {
      setSportsData((e)=>([...e, playerSport]))
      console.log(playerSport)
      return 0
    })
    data.teams.map((playerEvent) => {
      //console.log("events", playerEvent)
      setEventsData((e)=>([...e, playerEvent]))
      return 0
    })
  }

  useEffect(() => {
    getDoc(doc(db, "users/oRf9cs69CmgSpuBGnoHO")).then((value)=>{
      //console.log(value.data())
      activityReducer(value.data())
      //setData(value.data())
    });
    console.log("work started");
    // eslint-disable-next-line
  }, []);

  const scrollRef1 = useRef()
  const scrollRef2 = useRef()

  return (
    <div className='ml-[10vh] w-[calc(100vw-100px)] overflow-x-hidden h-full flex flex-col overflow-auto'>
      {/* logo */}
      <div className='w-full h-12 flex justify-center items-center space-x-4 text-2xl font-sans'>
        logo
      </div>
      {/* charts */}
      <div className='w-full h-[40vh] flex'>
        <div className='h-full w-[60%] scale-y-90 scale-x-95 rounded-2xl bg-white flex justify-center items-center text-white border-2'>
          <Chart data={chartData}/>
        </div>
        <div className='h-full w-[40%] scale-y-90 scale-x-95 rounded-2xl  bg-white flex justify-center items-center text-white border-2'>
          <Pie data={pieData}/>
        </div>
      </div>
      {/* teams and events */}
      <div
        ref={scrollRef1}
        className='w-full h-[40vh] flex-col overflow-hidden py-10'>
        {/* scrollable cards */}
        <div className=' mx-10 text-3xl'>Your Sports</div>
        <motion.div 
          drag={'x'} 
          dragConstraints={scrollRef1}
          className='flex h-[95%] w-auto'>
            {sportsData.map((item, index) => {
              return(
                <SportCard type={item} key={index} />
              )
            })}
        </motion.div>
      </div>
      <div
        ref={scrollRef2}
        className='w-full h-[40vh] flex-col overflow-hidden py-10'>
        {/* scrollable cards */}
        <div className='mx-10 text-3xl'>Your Teams</div>
        <motion.div 
          drag={'x'} 
          dragConstraints={scrollRef2}
          className='flex h-[95%] w-auto'>
          {eventsData.map((item, index) => {
              return(
                <TeamCard name={item.name} type={item.type} key={index} />
              )
            })}
        </motion.div>
      </div>
    </div>
  )
}

export default Home