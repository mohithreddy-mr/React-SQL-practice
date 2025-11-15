import { useParams } from "react-router-dom";
const User = () => {
  const { name } = useParams();
  return (
    <div>
      <h1>Hii,This is {name}</h1>
    </div>
  );
};
export default User;
