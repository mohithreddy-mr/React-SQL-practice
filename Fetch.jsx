import { useState, useEffect } from "react";
const Fetch = () => {
  const Detail = "https://jsonplaceholder.typicode.com/posts";
  const [user, setUser] = useState([]);
  const userHandler = async () => {
    const response = await fetch(Detail);
    const newData = await response.json();
    setUser(newData);
  };
  useEffect(() => {
    userHandler();
  }, []);

  return (
    <div>
      {user.map((item) => {
        return (
          <div>
            <h1 style={{ color: "blue" }}>{item.title}</h1>
            <h2 style={{ color: "red" }}>{item.body}</h2>
          </div>
        );
      })}
    </div>
  );
};
export default Fetch;
