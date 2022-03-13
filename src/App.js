import React from "react";
import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Navbar from "./components/Navbar";
import "./App.css";
import Sports from "./pages/Sports";
import Rewards from "./pages/Rewards";
import Events from "./pages/Events";
import Teams from "./pages/Teams"

function App() {
  return (
    <>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/sport" element={<Sports />} />
        <Route path="/rewards" element={<Rewards />} />
        <Route path="/events" element={<Events />} />
        <Route path="/teams" element={<Teams />} />
      </Routes>
    </>
  );
}

export default App;
