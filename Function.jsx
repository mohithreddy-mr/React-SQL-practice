import { useReducer, useEffect } from "react";

const FETCH_INIT = "FETCH_INIT";
const FETCH_START = "FETCH_START";
const FETCH_ERROR = "FETCH_ERROR";

const intialState = {
  loading: true,
  data: null,
  error: null,
};
const dataHandler = (state, action) => {
  switch (action.type) {
    case FETCH_INIT:
      return { ...state, loading: true, error: null };
    case FETCH_START:
      return { ...state, loading: null, data: action.payload };

    default:
      return state;
  }
};

const Function = () => {
  const [state, dispatch] = useReducer(dataHandler, intialState);
  const dataBase = async () => {
    try {
      dispatch({ type: FETCH_INIT });
      const response = await fetch(
        "https://jsonplaceholder.typicode.com/users"
      );
      const newData = await response.json();
      dispatch({ type: FETCH_START, payload: newData });
    } catch (error) {
      dispatch({ type: FETCH_ERROR });
    }
  };
  useEffect(() => {
    dataBase();
  }, []);
  return (
    <div>
      {state.loading && <p>Loading...</p>}
      {state.data && (
        <div>
          {state.data.map((item) => {
            return <h1>{item.name}</h1>;
          })}
        </div>
      )}
      {state.error && <div>{alert(state.error)}</div>}
    </div>
  );
};
export default Function;
