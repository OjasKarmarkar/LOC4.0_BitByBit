import React from "react";

export default function Sports() {
  return (
    <div className="ml-[10vh] w-[93vw] h-full flex flex-col overflow-auto px-2">
      <h2>Sport Name</h2>
      <p>
        Description Lorem ipsum dolor, sit amet consectetur adipisicing elit.
        Molestiae ipsum ipsa laudantium inventore distinctio perspiciatis
        mollitia non, ex nobis. Quasi deleniti impedit aliquam a itaque atque
        molestias ullam, consectetur minus iste. Quisquam, sit sunt. Accusantium
        commodi tenetur totam modi labore?
      </p>
      <div className="bg-blue-200 h-full py-4">
        <img src="" alt="Sport image" />
      </div>
      <div className="flex h-full">
        <div className="w-1/2 h-full">
          <button className="bg-blue px-4">Button1</button>
          <button className="bg-blue px-4">Button1</button>
          <button className="bg-blue px-4">Button1</button>
          <button className="bg-blue px-4">Button1</button>
          <button className="bg-blue px-4">Button1</button>
        </div>
        <div className="w-1/2 bg-slate-600 h-full">
          <iframe
            className="w-full aspect-video"
            src="https://www.youtube.com/embed/Oe421EPjeBE"
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
