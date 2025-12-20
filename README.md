# current class notes

## `TodoPage.jsx`

```jsx
import { useState } from "react";
import Card from "../components/Card";

function TodoPage() {
    const [title, setTitle] = useState("");
    const [desc, setDesc] = useState("");

    const [items, setItems] = useState([]);


    function handleAdd() {
        if (title.trim() != "" && desc.trim() != "") {
            let obj = {
                title: title,
                desc: desc
            };
            items.push(obj);
            setItems([...items]);
            setTitle("");
            setDesc("");
        }
    }
    function handleDelete(idx) {
        let temp = [];
        for (let i = 0; i < items.length; i++) {
            if (i != idx)
                temp.push(items[i]);
        }
        setItems(temp);
    }
    function handleEdit(idx) {
        let newTitle = prompt("enter new title");
        let newDesc = prompt("enter new desc");
        if (newTitle != null && newTitle.trim() != "" &&
            newDesc != null && newDesc.trim() != "") {
            let temp = [];
            for (let i = 0; i < items.length; i++) {
                if (i == idx) {
                    let obj = {
                        title: newTitle,
                        desc: newDesc
                    };
                    temp.push(obj);
                }
                else temp.push(items[i]);
            }
            setItems(temp);
        } else {
            alert("Invalid data");
        }
    }
    return (
        <>
            <main className="min-h-screen w-screen flex flex-col justify-center item items-center">
                <h1 className="uppercase font-bold mb-5">Todo Page</h1>
                <section>
                    <input
                        value={title}
                        onChange={(e) => setTitle(e.target.value)}
                        type="text"
                        placeholder="Enter title"
                    />
                    <br />
                    <textarea
                        rows={5}
                        value={desc}
                        onChange={(e) => setDesc(e.target.value)}
                        type="text"
                        placeholder="Enter desc"
                    />
                    <br />
                    <button
                        onClick={handleAdd}
                        className="bg-green-300"
                    >
                        add
                    </button>
                </section>
                <section>

                    {
                        items.map((value, index) => {
                            return <Card
                                key={index}
                                id={index}
                                title={value.title}
                                desc={value.desc}
                                handleDelete={handleDelete}
                                handleEdit={handleEdit}
                            />;
                        })
                    }

                </section>

            </main>
        </>
    );
}
export default TodoPage;
```

## `Card.jsx`

```jsx
function Card({
    id = 0,
    title = "def title",
    desc = "def desc",
    handleDelete,
    handleEdit
}) {
    return (
        <div className="min-w-sm bg-slate-300 my-2 p-4 rounded-sm">
            <h3 className="uppercase font-semibold">{id + 1}.{title}</h3>
            <p className="text-gray-600 p-2">{desc}</p>
            <div className="flex justify-end">
                <button className="bg-orange-200 ml-2" onClick={() => handleEdit(id)}>edit</button>
                <button className="bg-red-300 ml-2" onClick={() => handleDelete(id)}>delete</button>
            </div>
        </div>
    );
}
export default Card;
```

##  `index.css`

```css
@import "tailwindcss";
input, textarea {
    background-color: black;
    margin: 2px;
    padding: 4px;
    color: white;
    width: 200px;
}
button{
  padding: 4px;
  border-radius: 3px;
  min-width: 100px;
  box-shadow: 1.5px 1.5px 1.5px 1px grey;
  transition: all;
  transition-duration: 0.2s;
}
button:active {
  box-shadow: 0.5px 0.5px 0.5px 1px grey;
}
```


# MERN-stack-Notes
A MERN stack notes

![image](https://github.com/user-attachments/assets/4fbb00fb-912a-4216-89d3-9c7f5684ee1e)

![image](https://github.com/user-attachments/assets/1a591590-a194-45a8-bed9-f4130843dc4e)
