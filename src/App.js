import React from "react";
import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Navbar from "./components/Navbar";
import "./App.css";
import Sports from "./pages/Sports";
import Rewards from "./components/Rewards";
import Events from "./pages/Events";

function App() {
  return (
    <>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/sport" element={<Sports />} />
        <Route path="/rewards" element={<Rewards />} />
        <Route path="/events" element={<Events />} />
      </Routes>
    </>
  );
}

export default App;
