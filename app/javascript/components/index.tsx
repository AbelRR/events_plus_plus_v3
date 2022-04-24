import * as react from "react";
import NumberFormat from 'react-number-format';
import { useForm, Controller } from 'react-hook-form';
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

function phoneNumberIsValid(phoneNumber) {
  return phoneNumber.length === 10;
}

const CustomerCard = ({ name, address, phoneNumber, dummy }) => {
  return <div className={`
    flex justify-between md:px-4
    p-2 md:p-4 mb-2 md:mb-4 w-full text-center 
    rounded-lg ${dummy ? 'bg-gray-500' : 'bg-blue-500'} font-bold
  `}>
    <div className="flex-grow">
      <div className="text-md md:text-xl">
        Name: {name}
      </div>
      <div className="text-lg md:text-2xl">
        Phone: {phoneNumber}
      </div>
      <div className="text-sm md:text-lg">
        Address: {address}
      </div>
    </div>
    <button disabled={dummy} className={`${dummy ? 'bg-blue-300' : 'bg-orange-500'} p-2 md:p-8 rounded-xl`}>
      Select
    </button>
  </div>
}

const CustomerList = ({ queryField, searchQuery }) => {
  const { data: clientData, loading: clientLoading, error: clientError } = useQuery(GET_CLIENTS_BY_SEARCH_FIELD, {
    variables: {
      searchQuery,
      queryField,
    },
  })

  if (clientLoading) {
    return <div className="mt-4 mb-16">
      Loading clients...
    </div>
  }
  return (
    <div>
      {clientData.clientsByField.map(c => {
        return (
          <CustomerCard name={c.name} phoneNumber={c.phoneNumber} address={c.address} dummy={false} />
        )
      })}
      {searchQuery.length > 0 &&
        searchQuery.length < 10 && clientData.clientsByField.length < 6 && [1, 2, 3, 4, 5].map(c => {
          return (
            <CustomerCard name={'No user found'} phoneNumber={'123 345 4678'} address={"No address."} dummy={true} />
          )
        })}
    </div>
  )
}

const PhoneInput = ({ searchQuery, setSearchInput }) => {
  return (
    <div className="px-1">
      <NumberFormat
        defaultValue={searchQuery}
        className="text-2xl md:text-5xl w-full h-full"
        format="(###) ###-####"
        allowEmptyFormatting
        name="phone"
        mask="_"
        onChange={(e: { target: { value: any; }; }) => {
          const { value: maskedValue } = e.target;
          const plainValue = maskedValue.replace(/\D+/g, '');
          setSearchInput(plainValue)
        }}
        required
      />
    </div>
  );
}

const NameInput = ({ searchQuery, setSearchInput }) => {
  return <>
    <input className="text-2xl md:text-5xl w-full h-full" value={searchQuery} onChange={(e) => setSearchInput(e.target.value)} />
  </>

}

const AddressInput = ({ searchQuery, setSearchInput }) => {
  return <>
    <input className="text-2xl md:text-5xl w-full h-full" value={searchQuery} onChange={(e) => setSearchInput(e.target.value)} />
  </>
}

const InputWrapper = ({ label, children }) => {
  return <>
    <p className="font-bold text-2xl">{label}:</p>
    <div className="bg-white border-solid border-4 border-black mb-4 p-2">
      {children}
    </div>
  </>
}

const NewCustomer = ({ phoneNumber, setSearchInput }) => {
  const sharedInputStyling = "text-2xl md:text-5xl w-full h-full";
  const { control, register, handleSubmit, formState: { errors } } = useForm({
    defaultValues: {
      "Phone Number": phoneNumber,
      Name: '',
      Address: '',
    }
  });

  const onSubmit = data => console.log({ data });

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <p className="font-bold text-4xl py-6">Add customer</p>
      <Controller
        name="Phone Number"
        control={control}
        render={({ field }) =>
          <InputWrapper label='Phone Number'>
            <NumberFormat
              className={sharedInputStyling}
              {...field}
              format="(###) ###-####"
              allowEmptyFormatting
              name="phone"
              mask="_"
              required
              onChange={(e: { target: { value: any; }; }) => {
                const { value: maskedValue } = e.target;
                const plainValue = maskedValue.replace(/\D+/g, '');
                setSearchInput(plainValue)
              }}
            />
          </InputWrapper>
        }
      />
      <InputWrapper label={'Name'}>
        <input className={sharedInputStyling} type="text" placeholder="Name" {...register("Name", { required: true, maxLength: 80 })} />
      </InputWrapper>
      <InputWrapper label={'Address'}>
        <input className={sharedInputStyling} type="text" placeholder="Address" {...register("Address", {})} />
      </InputWrapper>

      <input type="submit" className={`bg-orange-500 p-4 w-full border-2 border-black rounded-xl`} value="Add Customer" />
    </form>
  );
}

const SearchByNavItem = ({ handleOnClick, children, selected }) => {
  const props = { onClick: handleOnClick, children, tabIndex: 0 }

  const sharedClassname = 'w-full py-2 md:py-3 text-center self-center'

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
  return <div className="mb-6 md:mb-12">
    <div className="font-bold text-2xl">Search by:</div>
    <div className={`
      border-solid border-black border-4
      h-fit md:h-16 md:text-2xl
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
  </div>

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

  return <div className={`
    bg-gray-300 border-solid border-4 border-black rounded-lg
      p-4 md:p-12 m-1 md:m-12 w-full md:w-3/4 h-full overflow-y-scroll
      flex-col snap-y
  `}>
    <SearchByNav
      navItems={[PHONE, ADDRESS, NAME]}
      isItemSelectedPredicate={item => searchField.value === item.value}
      handleOnClickFn={item => setSearchFieldType(item)}
    />

    <div className="container max-h-16 md:h-4/6 p-2">
      {searchField.value === PHONE.value && phoneNumberIsValid(searchQuery) ? (
        <div className="pb-8">
          <NewCustomer phoneNumber={searchQuery} setSearchInput={setSearchInput} />
        </div>
      ) : (
        <div className="snap-start">
          <p className="font-bold text-2xl">{searchField.label}:</p>
          <div className="bg-white border-solid border-4 border-black mb-6 md:mb-12 p-4">
            <searchField.Input {...{ searchQuery, setSearchInput }} />
          </div>
        </div>
      )}
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
        <main className="flex justify-around h-3/4">
          <SearchBy {...{ searchQuery, setSearchInput }} />
        </main>
        <footer className=" bg-blue-200 text-xl mt-12 pl-4 pt-4 sticky">
          created by Abel. tools used in project: rails 7 | psql | react + ts | graphql + apollo | tailwindcss
        </footer>
      </div>
    </>
  )
})

ReactDOM.render(
  <App />,
  document.getElementById('root')
)