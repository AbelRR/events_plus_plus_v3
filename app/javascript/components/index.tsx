import * as react from "react";
import NumberFormat from 'react-number-format';
import '../../../app/assets/stylesheets/application.css'
import ReactDOM from "react-dom";
import gql from 'graphql-tag'
import { useQuery } from '@apollo/client'
import { withProvider } from "./graphqlProvider";
import React = require("react");

const GET_CLIENTS_BY_SEARCH_FIELD = gql`
  query SearchClientsByField($queryField: String, $searchQuery: String) {
    clientsByField(searchField: $queryField, searchInput: $searchQuery) {
      id
      address
      name
      phoneNumber
    }
  }
`;

function PhoneNumberInput({
  setSearchInput,
}) {

  return (
    <div className="px-4">
      Phone Number:
      <NumberFormat
        className="text-black"
        format="(###) ###-####"
        allowEmptyFormatting
        name="phone"
        mask="_"
        onChange={(e: { target: { value: any; }; }) => {
          const { value: maskedValue } = e.target;
          const plainValue = maskedValue.replace(/\D+/g, '');
          setSearchInput(plainValue)
          console.log({ maskedValue, plainValue });
        }}
        required
      />
    </div>
  );
}

const CustomerCard = ({ name, address, phoneNumber }) => {
  return <div className="p-4 mb-4 bg-blue-200 text-center max-w-sm rounded-lg">
    <div>
      Name: {name}
    </div>
    <div>
      Phone: {phoneNumber}
    </div>
    <div>
      Address: {address}
    </div>
  </div>
}

function CustomerList({ queryField, searchQuery }) {
  const { data: clientData, loading: clientLoading, error: clientError } = useQuery(GET_CLIENTS_BY_SEARCH_FIELD, {
    variables: {
      searchQuery: searchQuery,
      queryField: queryField,
    },
  })
  react.useEffect(() => {
    console.log({ clientData, clientLoading, clientError })
  })

  // return <>
  //   <CustomerCard name={"Abel Test"} phoneNumber={'5103434956'} address={'568 Juana'} />
  //   <CustomerCard name={"Ana Test"} phoneNumber={'5103434956'} address={'568 Juana'} />
  //   <CustomerCard name={"Carlos Test"} phoneNumber={'5103434956'} address={'568 Juana'} />
  // </>

  if (!clientData) { return <>Loading clients...</> }
  return (
    <div>
      Clients found:
      {clientData.clientsByField.map(c => {
        return (
          <CustomerCard name={c.name} phoneNumber={c.phoneNumber} address={c.address} />
        )
      })}
    </div>
  )
}

const PhoneInput = ({ searchQuery, setSearchInput }) => {
  return <PhoneNumberInput {...{ searchQuery, setSearchInput }} />
}

const NameInput = ({ searchQuery, setSearchInput }) => {
  return <>
    Name:
    <input value={searchQuery} onChange={(e) => setSearchInput(e.target.value)} />
  </>

}

const AddressInput = ({ searchQuery, setSearchInput }) => {
  return <>
    Address:
    <input value={searchQuery} onChange={(e) => setSearchInput(e.target.value)} />
  </>

}

const SearchByNavItem = ({ handleOnClick, children, selected }) => {
  const props = { onClick: handleOnClick, children }

  const sharedClassname = 'order-first md:order-none w-full py-3 text-center self-center'

  const Standard = () => (
    <i {...props} className={`
      ${sharedClassname}
      text-black hover:bg-green-500 cursor-pointer
    `} />
  )

  const Selected = () => (
    <i {...props} className={`
      ${sharedClassname}
      text-white
      bg-green-500
    `} />
  )

  if (selected) {
    return <Selected />
  }

  return (
    <Standard />
  )
}

const SearchByNav = ({ navItems, handleOnClickFn, isItemSelectedPredicate }) => {
  const { PHONE, ADDRESS, NAME } = {
    PHONE: "Phone", ADDRESS: "Address", NAME: "Name"
  }


  return <>
    <div className="font-bold text-2xl">Search by:</div>
    <div className={`
    border-solid border-black border-4
    mb-12 h-fit md:h-16 text-2xl
    flex flex-col md:flex-row justify-around content-center items-center
    
  `}>
      {navItems.map(item => {
        return <SearchByNavItem
          key={item.value}
          selected={isItemSelectedPredicate(item)}
          handleOnClick={() => handleOnClickFn(item)}>
          {item.label}
        </SearchByNavItem>
      })}
    </div>
  </>

}

const SearchBy = ({ searchQuery, setSearchInput }) => {
  const { PHONE, ADDRESS, NAME } = {
    PHONE: {
      value: "PHONE",
      label: "Phone",
      Input: PhoneInput,
      queryField: "phone_number"
    },
    ADDRESS: {
      value: "ADDRESS",
      label: "Address",
      Input: AddressInput,
      queryField: "address"
    },
    NAME: {
      value: "NAME",
      label: "Name",
      Input: NameInput,
      queryField: "name"
    },
  }
  // const [searchField, setSearchField] = React.useState(PHONE.value)
  const [searchField, setSearchField] = React.useState(PHONE)
  const setSearchFieldType = (item) => {
    setSearchInput('');
    searchField.value !== item.value && setSearchField(item)
  }

  return <div className="p-12 bg-gray-300 border-solid border-4 border-black rounded-lg min-w-half">
    <SearchByNav
      navItems={[PHONE, ADDRESS, NAME]}
      isItemSelectedPredicate={item => searchField.value === item.value}
      handleOnClickFn={item => setSearchFieldType(item)}
    />

    <div>
      <searchField.Input {...{ searchQuery, setSearchInput }} />
    </div>

    <div>
      <CustomerList searchQuery={searchQuery} queryField={searchField.queryField} />
    </div>
  </div >
}

const App = withProvider(() => {
  const [searchQuery, setSearchInput] = React.useState('');

  return (
    <>
      <div className="h-screen bg-gray-200 flex flex-col justify-between">
        <header className=" bg-red-200 text-4xl underline mb-8 pl-4 pt-4">
          Events++
        </header>
        <main className="bg-grayc flex justify-around h-4/5">
          <SearchBy {...{ searchQuery, setSearchInput }} />
        </main>
        <footer className=" bg-blue-200 text-xl mt-12 pl-4 pt-4">
          created using: rails 7 | react + ts | psql | graphql | tailwindcss
        </footer>
      </div>
    </>
  )
})

ReactDOM.render(
  <App />,
  document.getElementById('root')
)