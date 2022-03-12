import React from "react";
import EventCard from "../components/EventCard";
import logo from "../components/event.png";

function Events() {
  return (
    <div className="ml-[10vh] w-[93vw] h-full flex flex-col overflow-auto px-2">
      <h2 className="font-bold py-4 text-2xl">Upcoming Events</h2>
      <div className="flex p-4 flex-wrap ">
        <EventCard
          img={logo}
          title="Event1"
          desc="Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, alias."
        />
        <EventCard
          img={logo}
          title="Event1"
          desc="Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, alias."
        />
        <EventCard
          img={logo}
          title="Event1"
          desc="Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, alias."
        />
        <EventCard
          img={logo}
          title="Event1"
          desc="Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, alias."
        />
        <EventCard
          img={logo}
          title="Event1"
          desc="Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, alias."
        />
        <EventCard
          img={logo}
          title="Event1"
          desc="Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, alias."
        />
        <EventCard
          img={logo}
          title="Event1"
          desc="Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, alias."
        />
        <EventCard
          img={logo}
          title="Event1"
          desc="Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, alias."
        />
      </div>
    </div>
  );
}

export default Events;
