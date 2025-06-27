# `step 01` Design your HTML with CSS

## `HTML CODE`

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MY MINI APPLICATION</title>
    <link rel="stylesheet" href="./my-style.css">
</head>

<!--  🏷️ Lets split this into components -->

<body>
    <div id="root">
        <div class="container">
            <!-- 📦 App component  -->
            <div id="app">
                <div class="title">
                    MY MINI APPLICATION
                </div>
                <!-- 📦 Header component  -->
                <header>
                    <input type="text" placeholder="Type your task to be added...">
                    <div class="plus">+</div>
                </header>
                <!-- 📦 FilterSection component  -->
                <section class="filter">
                    <div class="tag selected">Favorite ⭐</div>
                    <div class="tag">Important 🏷️</div>
                </section>
                <!-- 📦 ListItems component  -->
                <section class="list-items">
                    <!-- 📦 Card Component -->
                    <div class="card">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor reiciendis minus vitae
                            porro aliquid. Magni mollitia blanditiis porro, consequatur, eius autem libero iure
                            laudantium nulla ullam aperiam animi ad explicabo?</p>
                        <div class="time">10:00 AM</div>
                        <div class="misc">
                            <span class="tag selected">🏷️</span>
                            <span class="tag">⭐</span>
                        </div>
                    </div>
                    <div class="card">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor reiciendis minus vitae
                            porro aliquid. Magni mollitia blanditiis porro, consequatur, eius autem libero iure
                            laudantium nulla ullam aperiam animi ad explicabo?</p>
                        <div class="time">10:00 AM</div>
                        <div class="misc">
                            <span class="tag selected">🏷️</span>
                            <span class="tag">⭐</span>
                        </div>
                    </div>
                    <div class="card">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor reiciendis minus vitae
                            porro aliquid. Magni mollitia blanditiis porro, consequatur, eius autem libero iure
                            laudantium nulla ullam aperiam animi ad explicabo?</p>
                        <div class="time">10:00 AM</div>
                        <div class="misc">
                            <span class="tag selected">🏷️</span>
                            <span class="tag">⭐</span>
                        </div>
                    </div>
                    <div class="card">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor reiciendis minus vitae
                            porro aliquid. Magni mollitia blanditiis porro, consequatur, eius autem libero iure
                            laudantium nulla ullam aperiam animi ad explicabo?</p>
                        <div class="time">10:00 AM</div>
                        <div class="misc">
                            <span class="tag selected">🏷️</span>
                            <span class="tag">⭐</span>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</body>

</html>
```

## `Style sheet`

```css
body {
    margin: 0px;
    font-family: monospace;
    /* default to all application */
}

#root {
    background-color: black;

    height: 100vh;
    /* background image */
    background-image: url('https://wallpapers.com/images/hd/firewatch-forest-scenery-1jb6bbfx3a7hmtnn.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    /* align your child tag - vertical / horizontal - center */
    display: flex;
    align-items: center;
    justify-content: center;
}

/* application styles */
.container {
    background-color: rgba(0, 0, 0, 0.582);

    border: 5px solid black;
    border-radius: 5px;

    height: 90%;
    width: 90%;
    /* align your child tag - vertical / horizontal - center */
    display: flex;
    align-items: center;
    justify-content: center;
}

#app {
    background-color: white;
    border: 2px solid white;

    height: 90%;
    width: 300px;

    padding: 10px;
    /* bring scroll on y axis */
    overflow-y: scroll;
    position: relative;
    /* background image */
    background-image: url('https://wallpaper.forfun.com/fetch/b4/b4d430320229744245679e19e50b6f03.jpeg');
    background-size: cover;
}

/* title styles */
.title {
    background-color: white;
    padding: 10px;
    text-align: center;
    font-weight: 800;
    letter-spacing: 2px;
}

/* footer design */
header {
    /* make some thing sticky*/
    top: 0px;
    position: sticky;
    z-index: 100;

    background-color: rgb(74, 74, 74);

    min-height: 30px;
    width: 100%;

    margin-top: auto;
    margin-bottom: 0px;
    /* flex box */
    display: flex;
    justify-content: space-around;
    align-items: center;
}



header>input {
    background-color: rgba(255, 255, 255, 0);
    color: white;

    width: 80%;
}

header>input:focus-visible {
    /* outline is outside of border. */
    /* Note: Outline differs from borders! Unlike border,
     the outline is drawn outside the element's border,
      and may overlap other content.
       Also, the outline is NOT a part of 
       the element's dimensions; 
       the element's total width and height 
       is not affected by the width of the outline. */
    outline: none;
}

header>.plus {
    background-color: black;
    color: white;

    font-weight: 900;
    /* create circle */
    width: 20px;
    height: 20px;
    border: 1px solid white;
    border-radius: 50%;
    /* align text center */
    text-align: center;
    display: grid;
    align-items: center;
    /* give btn effect */
    cursor: pointer;
}

header>.plus:hover {
    background-color: rgb(45, 45, 45);
}

header>.plus:active {
    background-color: white;
    color: black;
}

/* filter section */
.filter {
    color: white;
    margin-top: 10px;
    /* flex box */
    width: 100%;
    display: flex;
    justify-content: flex-end;
}

.filter>.tag {
    background-color: white;
    color: black;

    border-radius: 2px;

    margin: 2px;
    padding: 2px;
    padding-left: 10px;
    padding-right: 10px;

    cursor: pointer;

    opacity: 60%;
}

.filter>.selected {
    opacity: 100%;
}

/* card styles */
.card {
    background-color: rebeccapurple;
    color: white;

    padding: 5px;
    margin-top: 5px;
}

.card .time {
    width: 100%;
    text-align: right;
}

.card .tag {
    cursor: pointer;

    opacity: 20%;
}

.card .selected {
    opacity: 100%;
}


.misc {
    border-top: 2px solid gray;
    margin: 2px;
    padding-top: 5px;
}
```
