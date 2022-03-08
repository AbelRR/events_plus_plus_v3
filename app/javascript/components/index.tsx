import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";
import axios from "axios";

// const API_URL = "http://localhost:3000/api/v1/books"

// function getApiData() {
//   return axios.get(API_URL).then(response => response.data);
// }

function App() {
  return (
    <>
      <h1>
        Hello Rails 7 + Typescript + PSQL
      </h1>
    </>
  )
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
)