import { AreaChart, Area, Tooltip, CartesianGrid, XAxis, YAxis } from 'recharts';


function Chart() {

    const data = [{name: 'Page A', uv: 400}, {name: 'Page A', uv: 800}, {name: 'Page A', uv: 300}, {name: 'Page A', uv: 900}, ];
    return(
    <AreaChart width={800} height={250} data={data}
        margin={{ top: 10, right: 30, left: -10, bottom: 0 }}>
        <defs>
        <linearGradient id="colorUv" x1="0" y1="0" x2="0" y2="1">
            <stop offset="5%" stopColor="#8884d8" stopOpacity={0.8}/>
            <stop offset="95%" stopColor="#8884d8" stopOpacity={0}/>
        </linearGradient>
        <linearGradient id="colorPv" x1="0" y1="0" x2="0" y2="1">
            <stop offset="5%" stopColor="#82ca9d" stopOpacity={0.8}/>
            <stop offset="95%" stopColor="#82ca9d" stopOpacity={0}/>
        </linearGradient>
        </defs>
        <XAxis axisLine={false} tickLine={false} dataKey="name" />
        <YAxis axisLine={false} tickLine={false} />
        <CartesianGrid strokeDasharray="3 3" />
        <Tooltip />
        <Area type="monotone" dataKey="uv" stroke="#8884d8" fillOpacity={1} fill="url(#colorUv)" />
        <Area type="monotone" dataKey="pv" stroke="#82ca9d" fillOpacity={1} fill="url(#colorPv)" />
    </AreaChart>
    )};
export default Chart