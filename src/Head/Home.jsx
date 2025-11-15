import { useNavigate } from "react-router-dom";
import { useState } from "react";
const Home = () => {
  const navigate = useNavigate();
  const [name, setName] = useState();
  function newPage() {
    navigate(`/user/${name}`);
  }
  return (
    <div>
      <h1> THIS IS HOME PAGE</h1>
      <input
        type="text"
        placeholder="Enter Your Name..."
        onChange={(e) => {
          setName(e.target.value);
        }}
        value={name}
      />
      <button
        onClick={() => {
          newPage();
        }}
      >
        Proceed
      </button>
    </div>
  );
};
export default Home;
