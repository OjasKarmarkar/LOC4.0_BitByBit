import React, { useState, useEffect } from "react";
import Logo from "../components/Logo";
import { getDoc, doc } from "firebase/firestore";
import db from "../firebase/Firebase";

export default function Sports() {
  const [data, setData] = useState({});
  const [dataEx, setDataEx] = useState([]);
  const [video, setVideo] = useState(true);
  const activityReducer = (datas) => {
    // console.log(data.activity)
    /* overall activity */
    setData(datas);
    setDataEx(datas.ex);
    console.log(data);
  };

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
      <div className="border-2 mb-5 rounded-xl shadow-xl">
        <h2 className="font-semibold text-2xl text-center">{data.name}</h2>
        <h2 className="py-2 font-semibold text-xl text-center">
          {data.short_desc}
        </h2>
        <p className="font-medium py-4 text-center">{data.desc}</p>
      </div>

      <div className="flex w-full justify-center">
        <img
          src={data.img}
          alt={data.name}
          className="h-[40%] w-[40%] text-center rounded-2xl drop-shadow-2xl"
        />
      </div>
      <div className="text-2xl font-medium border-t-2 mt-5">
        <h1 className="py-4">Exercises</h1>
      </div>
      <div className="flex-col h-full align-center">
        <div className="w-full h-full flex justify-center ">
          {dataEx.map((exercise, index) => {
            return (
              <button
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
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
          ></iframe>
        </div>
      </div>
    </div>
  );
}
