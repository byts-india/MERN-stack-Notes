# Like meter

## things to learn

- event handling. `onclick={handleClick}`
- basic state concept
- include external css
- 

### `Like meter code 😍`

- This code has been written within App.js and App.css file.
- Inorder to get heart icon. You need to use font-awesome.
- copy below link code and paste it inside `public/index.html` file, as shown below.
- Make sure to keep it inside `<head>` tag.
```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
```
![image](https://github.com/user-attachments/assets/4b45500d-64cb-43b6-9930-f644c22f8dbd)


#### `App.jsx` I have renamed `App.js` file to `App.jsx`.

```javascript
import { useState } from "react";
import "./App.css";

function App() {
  const [count, setCount] = useState(0); 
  function handleClick() {
    setCount(count + 1);              
  }
  return (
    <div className="container">
      like : {count}
      <br />
      <i id="heart" onClick={handleClick} className="fa-solid fa-heart"></i>
    </div>
  );
}

export default App;
```
#### `App.css`

```css
.container {
  margin: 10px;
  padding: 10px;
  background-color: black;
  color: white;
  width: fit-content;
}

#heart:active {
  color: red;
}
```

![image](https://github.com/user-attachments/assets/56cfd5db-ed10-407d-a98c-32affeb08378)

