import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";
import gql from 'graphql-tag'
import {useQuery} from '@apollo/client'
import { withProvider } from "./graphqlProvider";

const GET_ORDER = gql`
  query Order($id: ID!) {
    order(id: $id) {
      id
      deliveryDateTime
      inventoryItems {
        id
        inventoryItemType
      }
    }
  }
`;

// const ordersQuery = gql`
//   query order14 {
//     order(id: 14) {
//       id
//       deliveryDateTime
//       inventoryItems {
//         id
//         inventoryItemType
//       }
//     }
//   }
// `
// import axios from "axios";

// const API_URL = "http://localhost:3000/api/v1/books"

// function getApiData() {
//   return axios.get(API_URL).then(response => response.data);
// }

const App = withProvider(() => {
  const {data, loading, error} = useQuery(GET_ORDER, {
    variables: {
      id: 14
    },
  })
  useEffect(() => {
    console.log({data, loading, error})
  })

  return (
    <>
      <h1>
        Hello World!
      </h1>
      <p>
        Made with: React + Rails 7 + Typescript + PSQL + GraphQL + Love
      </p>
      <hr />
      <h2>First Order</h2>
      {data && data.order && data.order.id}
      {data && data.order && "Delivery: " + data.order.deliveryDateTime}
      {data && data.order && data.order.inventoryItems && data.order.inventoryItems.map(item => {
        return item.inventoryItemType;
      })}
    </>
  )
})

ReactDOM.render(
  <App />,
  document.getElementById('root')
)