# context api [ `useContext`, `createContext`]

## `LikeContext.jsx`

```javascript
import { createContext, useState } from "react";

const LikeContext = createContext();

function LikeProvider({ children }) {
    const [likeCount, setLikeCount] = useState(0);

    return (
        <>
            <LikeContext.Provider value={[ likeCount, setLikeCount ]}>
                {children}
            </LikeContext.Provider>
        </>
    )
}

export { LikeContext, LikeProvider };
```

## `LikeExample.jsx`

```javascript
import { useContext, useState } from "react";
import { LikeContext, LikeProvider } from "./LikeContext";

function Heart() {
    const [ likeCount, setLikeCount ] = useContext(LikeContext);
    const [like, setLike] = useState(false);
    function handleLike() {
        // false -> true     : like    +1
        // true  -> false    : unlike  -1
        if (like) {
            setLikeCount(likeCount - 1);
        }
        else {
            setLikeCount(likeCount + 1);
        }
        setLike(!like);
    }
    return (
        <span onClick={handleLike} style={{ color: 'red' }}>
            {
                like ? <i className="fa-solid fa-heart"></i> : <i className="fa-regular fa-heart"></i>
            }
        </span>
    );
}

function Display() {
    const { likeCount } = useContext(LikeContext);
    return <p> the count is {likeCount} </p>;
}

export default function LikeExample() {

    return (
        <>
            <LikeProvider>
                <Display>   </Display>
                <Heart></Heart>
                <Heart></Heart>
                <Heart></Heart>
                <Heart></Heart>
                <Heart></Heart>
                <Heart></Heart>
                <Heart></Heart>
                <Heart></Heart>
                <Heart></Heart>
                <Heart></Heart>
            </LikeProvider>
        </>
    )
}
```

## ``
