import React from "react";
import ReactDOM from "react-dom";

function Clock() {
    return (
        <h1>
            Hello Clock 1:23:45
        </h1>
    )
}

ReactDOM.render(
    <Clock />,
    document.getElementById('clock')
)