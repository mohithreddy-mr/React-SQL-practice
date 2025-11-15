import Home from "./Head/Home";
import About from "./Head/About";
import Contact from "./Head/Contact";
import "./styles.css";
import { Routes, Route } from "react-router-dom";
import Nav from "./Components/Nav";
import User from "./Head/User";

export default function App() {
  return (
    <div className="App">
      <Nav />
      <Routes>
        <Route path="/home" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/user/:name" element={<User />} />
        <Route path="*" element={<h1>Incorrect Route</h1>} />
      </Routes>
    </div>
  );
}
