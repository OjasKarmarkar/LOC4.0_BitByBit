import React, { useState, useEffect } from "react";
import Logo from "../components/Logo";
import { getDoc, doc } from "firebase/firestore";
import db from "../firebase/Firebase";
import foodData from '../static/ml_ex1.json'

export default function Sports() {
  const [data, setData] = useState({});
  const [dataEx, setDataEx] = useState([]);
  const [video, setVideo] = useState(true);
  const [fetchData, setFetchData] = useState("")

  const activityReducer = (datas) => {
    // console.log(data.activity)
    /* overall activity */
    setData(datas);
    setDataEx(datas.ex);
    console.log(data);
  };

  useEffect(() => {
    let fData = foodData.meals.meals[2]
    setFetchData(fData)
  }, [])
  

  useEffect(() => {
    getDoc(doc(db, "sports/9reQErHMTmLqsBHR2Sk0")).then((value) => {
      //console.log(value.data())
      activityReducer(value.data());
      //setData(value.data())
    });
    console.log("work started");
    // eslint-disable-next-line
  }, []);

  return (
    <div className="p-4 ml-[10vh] w-[93vw] h-full flex flex-col overflow-auto">
      <Logo />
      <div className="border-2 mb-5 rounded-xl shadow-xl">
        <h2 className="font-semibold text-2xl text-center">{data.name}</h2>
        <h2 className="py-2 font-semibold text-xl text-center">
          {data.short_desc}
        </h2>
        <p className="font-medium py-4 text-center">{data.desc}</p>
      </div>

      <div className="flex w-full justify-center">
        <div className="w-1/2 h-full ml-20">
          <img
            src={data.img}
            alt={data.name}
            className="h-[60%] w-[60%] ml-10 text-center rounded-2xl drop-shadow-2xl"
          />
        </div>
        <div className="w-1/2 pr-10">
          <div className="flex rounded-xl border-2 shadow-xl h-full ">
            <div className="h-full w-[40%] overflow-clip rounded-l-xl">
              <img src="https://webknox.com/recipeImages/715563-556x370.jpg" alt="food"  className="h-full scale-x-150"/>
            </div>
            <div className="flex-col space-y-8 p-3">
              <div className="font-semibold text-3xl">
                {fetchData.title}
              </div>
              <div className="text-lg">
                Ready in <b>{fetchData.readyInMinutes}</b> minutes
              </div>
              <div className="text-lg">
              <b>{fetchData.servings}</b> Servings
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="text-2xl font-medium border-t-2 mt-5">
        <h1 className="py-4">Exercises</h1>
      </div>
      <div className="flex-col h-full align-center">
        <div className="w-full h-full flex justify-center ">
          {dataEx.map((exercise, index) => {
            return (
              <button
                key={index}
                className="text-2xl m-4 bg-blue-500 hover:bg-blue-700 text-white font-bold my-5 py-2 px-4 rounded-xl"
                onClick={() => setVideo(!video)}
              >
                {exercise.name}
              </button>
            );
          })}
          {/* <button className="text-2xl bg-blue-500 hover:bg-blue-700 text-white font-bold my-5 py-2 px-4 rounded">
            {data.ex[0].name}
          </button> */}
        </div>
        <div className="w-full h-full flex justify-center">
          <iframe
            className="w-[50%] aspect-video"
            src={
              video
                ? "https://www.youtube.com/embed/ET_cKo1Ta1s"
                : "https://www.youtube.com/embed/fOdrW7nf9gw"
            }
            title="YouTube video player"
            frameBorder="0"
            allowFullScreen
          ></iframe>
        </div>
      </div>
    </div>
  );
}
