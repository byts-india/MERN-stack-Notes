# Reaction

## `Reaction in like meter code 😎`

- This code has been written seperate file Reaction.jsx.
- Instead of using font awesome icons, I have used inbuild emojis.
- To see the output. Make sure to include this code function App.jsx.
- Below is the sample `App.jsx` code.
- 💡 note: css is same as previous example.

### `App.jsx`

```javascript
import Reaction from "./Reaction";

export default function App() {
  return (
    <>
      <LikeMeter />
    </>
  );
}
```
### `Reaction.jsx`

```javascript
import { useState } from "react";
import "../App.css"; // 👈 make sure to include correct .css file.

const reactionArray = ["🥲", "😞", "😔", "😟", "☹️", "😊", "😄", "😁", "😀", "😃", "😆", "😂"]
function Reaction() {
    const [count, setCount] = useState(0); // 👈 01
    const [emoji, setEmoji] = useState(reactionArray[0]);
    function handleClick() {
        if (count <= reactionArray.length) {
            setEmoji(reactionArray[count + 1]);
        } else {
            setEmoji(reactionArray[reactionArray.length - 2]);
        }          // 👈 02
        setCount(count + 1)
    }
    return (
        <div className="container">
            like : {count}{emoji}
            <br />
            <i id="heart" onClick={handleClick} className="fa-solid fa-heart"></i>
        </div>
    );
}

export default Reaction;

```


![image](https://github.com/user-attachments/assets/a59e7329-fde9-4ae0-ab46-a661b49aa1f6)

