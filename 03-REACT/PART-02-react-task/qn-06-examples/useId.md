# useId

## `UseIdExample.jsx`

```javascript
import { useId } from "react";

function UseIdExample() {
    const sampleId1 = useId();
    const sampleId2 = useId();
    const sampleId3 = useId();
    return (
        <>
            <p>the sample id is {sampleId1}</p>
            <p>the sample id is {sampleId2}</p>
            <p>the sample id is {sampleId3}</p>
        </>
    );
}

export default UseIdExample;
```
