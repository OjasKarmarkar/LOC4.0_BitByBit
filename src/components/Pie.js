import React from 'react'
import { RadarChart, Radar, PolarGrid, PolarAngleAxis,PolarRadiusAxis, Legend } from 'recharts';

function Pie(props) {
    
const data = [
  {
    "sport": "Yoga",
    "days": 0
  },
  {
    "sport": "Football",
    "days": 0
  },
  {
    "sport": "Cricket",
    "days": 0
  },
  {
    "sport": "Tennis",
    "days": 0
  },
  {
    "sport": "Badminton",
    "days": 0
  },
  {
    "sport": "Swimming",
    "days": 0
  }
  ]
  data.map((item, index) => {
    data[index].days += props.data[item.sport]
    return 0
  })
  //console.log(props.data)

                            
    return(
    <RadarChart outerRadius={90} width={730} height={250} data={data}>
    <PolarGrid />
    <PolarAngleAxis dataKey="sport" />
    <PolarRadiusAxis angle={30} domain={[-1, 'auto']} tickFormatter={e=>e!==-1?e:''}/>
    <Radar dataKey="days" stroke="#8884d8" fill="#8884d8" fillOpacity={0.6} />
    
    <Legend />
    </RadarChart>
    )
}
export default Pie