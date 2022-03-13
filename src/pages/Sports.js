import React from "react";
import Logo from '../components/Logo'

export default function Sports(props) {
  console.log(props)
  return (
    <div className="ml-[10vh] w-[93vw] h-full flex flex-col overflow-auto px-2">
      <Logo />
    </div>
  );
}
