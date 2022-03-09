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
        Hello World!
      </h1>
      <p>
        Made with: React + Rails 7 + Typescript + PSQL + GraphQL + Love
      </p>
    </>
  )
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
)