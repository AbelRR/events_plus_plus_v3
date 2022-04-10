import * as react from "react";
import '../../../app/assets/stylesheets/application.css'
import ReactDOM from "react-dom";
import gql from 'graphql-tag'
import {useQuery} from '@apollo/client'
import { withProvider } from "./graphqlProvider";
import React = require("react");

const GET_CLIENTS_BY_PHONE_NUMBER = gql`
  query SearchClientsByPhone($partialPhoneNumber: String) {
    clientsByPhone(partialPhoneNumber: $partialPhoneNumber) {
      id
      name
      phoneNumber
    }
  }
`;


const App = withProvider(() => {
  const [phoneInput, setPhoneInput] = React.useState('');
  const {data: clientData, loading: clientLoading, error: clientError} = useQuery(GET_CLIENTS_BY_PHONE_NUMBER, {
    variables: {
      partialPhoneNumber: phoneInput,
    },
  })
  react.useEffect(() => {
    console.log({clientData, clientLoading, clientError})
  })

  return (
    <>
      <h1 className="text-2xl">
        Hello World!
      </h1>
      <p>
        Made with: React + Rails 7 + Typescript + PSQL + GraphQL + Love
      </p>
      <hr />
      <input type="tel" onChange={(e) => {
        setPhoneInput(e.target.value)
      }}/>


      <div>
        {!phoneInput && 'type client phone number'}
        {clientLoading ? 'loading client data' : (
          <div>
            Clients found:
            {clientData.clientsByPhone.map(c => {
              return (
                <div onClick={() => {
                  setPhoneInput(c.phoneNumber)
                }}>
                  <div>
                    Name: {c.name}
                  </div>
                  <div>
                    Phone: {c.phoneNumber}
                  </div>
                </div>
              )
            })}
          </div>
        )}
      </div>
    </>
  )
})

ReactDOM.render(
  <App />,
  document.getElementById('root')
)