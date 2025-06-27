# CONDITIONAL RENDERING

## conditional rendering using switch

### sample code to tab switching

```javascript
// MainApp.jsx
import { useState } from "react";
import NavBar from "./NavBar";
import SwitchPage from "./SwitchPage";

function MainApp() {
    const [tab, setTab] = useState("library");
    return (
        <>
            <NavBar tab={tab} setTab={setTab} />
            <SwitchPage tab={tab} />
        </>
    );
}

export default MainApp;
```

```javascript
// NavBar.jsx
function NavBar({ tab, setTab }) {
    return (
        <nav>
            <button disabled={tab === "home"} onClick={() => setTab("home")}>home</button>
            <button disabled={tab === "library"} onClick={() => setTab("library")}>library</button>
            <button disabled={tab === "about"} onClick={() => setTab("about")}>about</button>
        </nav>
    );
}

export default NavBar;
```

```javascript
// SwitchPage.jsx
import AboutPage from "./AboutPage";
import HomePage from "./HomePage";
import LibraryPage from "./LibraryPage";

function SwitchPage({ tab }) {
    switch (tab) {
        case "home":
            return <HomePage />;
        case "library":
            return <LibraryPage />;
        case "about":
            return <AboutPage />;
        default:
            return <HomePage />;
    }
}

export default SwitchPage;
```

```javascript
// AboutPage.jsx
function AboutPage() {
    return (<p>AboutPage</p>);
}

export default AboutPage;
```

```javascript
// LibraryPage.jsx
function LibraryPage() {
    return (<p>LibraryPage</p>);
}

export default LibraryPage;
```

```javascript
// HomePage.jsx
function HomePage() {
    return (<p>HomePage</p>);
}

export default HomePage;
```
