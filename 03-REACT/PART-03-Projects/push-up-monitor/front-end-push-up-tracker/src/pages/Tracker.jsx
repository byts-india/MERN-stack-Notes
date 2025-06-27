import { useEffect, useState } from "react";

export default function Tracker({ setTab, setAuth, userId }) {
    const [count, setCount] = useState(0);

    // using useEffect so that we can run our logic only once. when component loads.
    useEffect(() => {
        const requestOptions = {
            method: "GET",
            redirect: "follow"
        };
        // change this 👇 URL to your back end hosted url. ⚠️ This url will not work for you. ⚠️

        fetch("https://back-end-push-up-tracker.vercel.app/gym/" + userId, requestOptions)
            .then((response) => response.json())
            .then((result) => {
                if (result.status) {
                    setCount(result.data.count);
                } else {
                    alert("something went wrong.");
                    setAuth(false);
                }
            })
            .catch((error) => console.error(error));
    }, []);

    function handleLogOut() {
        setAuth(false);
        setTab('welcome');
    }
    function handleClick() {
        setCount(count + 1);
    }
    function handleSave() {
        const myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        const raw = JSON.stringify({
            "_id": userId,
            "count": count
        });

        const requestOptions = {
            method: "PUT",
            headers: myHeaders,
            body: raw,
            redirect: "follow"
        };
        // change this 👇 URL to your back end hosted url. ⚠️ This url will not work for you. ⚠️

        fetch("https://back-end-push-up-tracker.vercel.app/gym/update-count", requestOptions)
            .then((response) => response.json())
            .then((result) => {
                if (result.status) {
                    alert("updated successfully");
                } else {
                    alert("something went wrong.");
                    setAuth(false);
                }
            })
            .catch((error) => console.error(error));
    }
    return (
        <div>
            <button onClick={handleLogOut}>log-out</button>
            <br />
            <button onClick={handleSave}>save</button>
            <h1>track your push ups </h1>
            <p>
                <button onClick={handleClick}>
                    <span> count </span>
                    <i className="fa-solid fa-dumbbell"></i>
                    <span> {count} </span>
                </button>
            </p>
        </div>
    );
}