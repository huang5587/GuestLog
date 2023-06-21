import React, { useState } from "react";
import '../assets/stylesheets/form.css';

const FormInput = (props) => {
  const [focused, setFocused] = useState(false);
  const { label, errorMessage, onChange, id, ...inputProps } = props;

  const handleFocus = (e) => {
    setFocused(true);
  };

  return (
    <div className="formInput">
      <label>{label}</label>
      <input
        {...inputProps}
        onChange={onChange}
        onBlur={handleFocus}
        focused={focused.toString()}
      />
      <span>{errorMessage}</span>
    </div>
  );
};

const Guest = () => {

  const [values, setValues] = useState({
    fullName: "",
    phoneNumber: ""
  });

  const [submitStatus, setSubStatus] = useState(false);

  const inputs = [
    {
      id: 1,
      name: "fullName",
      type: "text",
      placeholder: "Your Full Name",
      errorMessage: "Full Name should be at least two words long.",
      label: "Full Name",
      pattern:  '[a-zA-Z0-9]+([ ][a-zA-Z0-9]+)*',
      required: true,
    },
    {
      id: 2,
      name: "phoneNumber",
      type: "text",
      placeholder: "Your Phone Number",
      errorMessage:
        "Phone Number should be 10-11 characters and include only numbers (0-9)",
      label: "Phone Number",
      pattern: '^[0-9]{10,11}$',
      required: true,
    },
  ];

  const handleSubmit = async (e) => {
    e.preventDefault();
    const guestData = {
      guest: {
        full_name: values.fullName,
        phone_number: values.phoneNumber
      }
    };
    const response = await fetch("http://localhost:3000/guests", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(guestData)
    });
    setSubStatus(true);
  };

  const onChange = (e) => {
    setValues({ ...values, [e.target.name]: e.target.value });
  };

  
  return (
    <div>
       {submitStatus ? (
         <div>
           <h2>Submission Successful</h2>
           <p>Thank you, {values.fullName}.</p>
         </div>
       ) : (
      <div className="Guest">
        <form onSubmit={handleSubmit}>
          <h1>Welcome to Mealpal!</h1>
          <p> Please submit your details below</p>
          {inputs.map((input) => (
            <FormInput
              key={input.id}
              {...input}
              value={values[input.name]}
              onChange={onChange}
            />
          ))}
          <button id = "submitButton">Submit</button>
        </form>
      </div>
       )
      };
    </div>
  );
}

export default Guest;

