# CONDITIONAL RENDERING

## conditional rendering using if

```javascript

// A SAMPLE CODE FOR: CONDITIONAL RENDERING :
import { useState } from "react";


// writing styles inside react
const DARK_THEME = {
    backgroundColor: 'black',
    color: 'white'
}
const LIGHT_THEME  = {
    backgroundColor: 'white',
    color: 'black'
}

function ChildComp({ mode }) {
    if (mode) {
        return (
            <ul>
                <li> "In order for the light to shine so brightly, the darkness must be present." - Francis Bacon</li>
                <li> "The dark does not destroy the light; it defines it. It's our fear of the dark that casts our joy into the shadows." - Brené Brown</li>
                <li> "Even in the darkest night, the stars still shine." - Unknown</li>
            </ul>
        );
    } else {
        return (
            <ul>
                <li>"There are two ways of spreading light: to be the candle or the mirror that reflects it." - Edith Wharton</li>
                <li>"Light tomorrow with today." - Elizabeth Barrett Browning</li>
                <li>"Wherever you go, no matter what the weather, always bring your own sunshine." - Anthony J. D'Angelo</li>
            </ul>
        )
    }
}
function ParentComp() {
    // true  - refers to dark theme
    // false - refers to light theme
    const [mode, setMode] = useState(true);
    function handleClick() {
        setMode(!mode);
    }
    return (
        <div style={mode ? DARK_THEME : LIGHT_THEME }>
            <button onClick={handleClick}>change mode to {mode ? "🌤️ light" : "🌙 dark"}</button>
            <ChildComp mode={mode} />
        </div>
    );
}

export default ParentComp;
```

![image](https://github.com/user-attachments/assets/ef53e385-f30a-435d-8cc6-47ea8cb679fd)
