import { useState } from "react";
import SignIn from "../pages/SignIn";
import SignUp from "../pages/SignUp";
import Tracker from "../pages/Tracker";
import Welcome from "../pages/Welcome";

export default function MainComp() {
    const [tab, setTab] = useState("welcome"); // default value
    const [auth, setAuth] = useState(false); // default value
    const [userId, setUserId] = useState("");

    switch (tab) {
        case "sign-in":
            return <SignIn setTab={setTab} setAuth={setAuth} setUserId={setUserId} />;
        case "sign-up":
            return <SignUp setTab={setTab} setAuth={setAuth} setUserId={setUserId} />;
        case "tracker":
            // below I have used ternary operator so that double check if auth is true, then only go to Tracker component.
            return auth ? <Tracker setAuth={setAuth} setTab={setTab} userId={userId} /> : <Welcome />;
        default:
            return <Welcome setTab={setTab} />;
    }
}