export default function Welcome({ setTab }) {
    return (
        <div>
            <h1>welcome page</h1>
            <button onClick={() => setTab("sign-in")}> sign in </button>
            <button onClick={() => setTab("sign-up")}> sign up </button>
        </div>
    );
}