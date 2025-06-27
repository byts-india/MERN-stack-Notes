# rating

## Rating app code.

### `Rating.jsx`

```javascript
import { useState } from "react";

const STYLE = {
    backgroundColor: 'black',
    color: 'white',
    padding: '10px'
};

export default function Rating() {
    const [count, setCount] = useState(3);
    function handleClick(value) {
        setCount(value);
    }
    return (
        <div style={STYLE}>
            {
                new Array(5).fill(0).map((val, idx) => {
                    if ((idx + 1) <= count) {
                        return (<span onClick={() => handleClick(idx + 1)}>❤️</span>);
                    } else {
                        return (<span onClick={() => handleClick(idx + 1)}>🤍</span>);
                    }
                })
            }
        </div>
    );
}
```

![image](https://github.com/user-attachments/assets/d5e67593-e5d2-4d53-892b-b2f1394fe959)

