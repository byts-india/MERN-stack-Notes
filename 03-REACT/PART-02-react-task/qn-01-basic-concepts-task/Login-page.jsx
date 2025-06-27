import { useState } from "react";

function HomePage() {
    return <h1>Home page</h1>;
}

function LoginPage() {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [auth, setAuth] = useState(false);

    function handleSubmit() {
        if (username === "admin" && password === "admin") {
            setAuth(true);
        } else {
            alert("wrong credentials");
        }
    }

    if (auth) {
        return <HomePage />;
    } else {
        return (
            <>
                <label>username</label><br />
                <input type="text" value={username} onChange={(e) => setUsername(e.target.value)} /><br />
                <label>password</label><br />
                <input type="password" password={password} onChange={(e) => setPassword(e.target.value)} /><br />
                <button onClick={handleSubmit}>submit</button>
            </>
        );
    }
}

export default LoginPage;