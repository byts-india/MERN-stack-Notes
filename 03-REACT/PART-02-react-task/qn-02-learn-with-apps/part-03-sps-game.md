# SPS Game ( Stone paper scissor )

## `SPS game 😍`

### `SPSGame.jsx`

```javascript
import { useState } from "react";

const items = [
    { text: "stone", emoji: "🪨" },
    { text: "paper", emoji: "📃" },
    { text: "scissor", emoji: "✂️" }
];

// 👇 we will keep a function outside the component
// If that function has no logic, that access anything inside the component.
function validateScore(p1Text, p2Text) {
    if (p1Text === p2Text) {
        return 0;
    }
    if (p1Text === "stone" && (p2Text === "scissor")) {
        return 1;
    }
    if (p1Text === "paper" && (p2Text === "stone")) {
        return 1;
    }
    if (p1Text === "scissor" && (p2Text === "paper")) {
        return 1;
    }
    return -1;
}

export default function SPSGame() {
    const [player1, setPlayer1] = useState({});
    const [player2, setPlayer2] = useState({});
    const [score, setScore] = useState(0);

    function handleClick(selectedIdx) {
        const randomIdx = parseInt(Math.random() * 10) % 3;
        const p1Result = items[selectedIdx];
        const p2Result = items[randomIdx];
        setScore(score + validateScore(p1Result.text, p2Result.text));
        setPlayer1(p1Result);
        setPlayer2(p2Result);
    }

    return (
        <>
            <button onClick={() => handleClick(0)}>{items[0].text} : {items[0].emoji}</button>
            <button onClick={() => handleClick(1)}>{items[1].text} : {items[1].emoji}</button>
            <button onClick={() => handleClick(2)}>{items[2].text} : {items[2].emoji}</button>
            <p><strong>player1 :</strong> 🖐️ : {player1.emoji} {player1.text}</p>
            <p><strong>player2 :</strong> 🖐️ : {player2.emoji} {player2.text}</p>
            <p><strong>score : </strong>{score}</p>
        </>
    );
}
```

![image](https://github.com/user-attachments/assets/3695d0d5-df8f-4318-b7ad-d06dd9097100)

