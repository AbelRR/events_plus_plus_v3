import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";
import Books from './books';
import axios from "axios";

const API_URL = "http://localhost:3000/api/v1/books"

function getApiData() {
  return axios.get(API_URL).then(response => response.data);
}

function App() {
  const [books, setBooks] = useState([]);
  useEffect(() => {
    let mounted = true;
    getApiData().then(items => {
      if (mounted) {
        setBooks(items)
      }
    })
    return () => (mounted = false);
  }, [])

  return (
    <>
      <h1>
        Hello Clock 1:23:45
      </h1>
      <Books books={books} />
    </>
  )
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
)