# web tech

![image](https://github.com/user-attachments/assets/374e7e9e-2f11-4e80-9726-bcfb52841ab2)
![image](https://github.com/user-attachments/assets/3b90b256-7161-4578-be1c-6346dfafb28d)
![image](https://github.com/user-attachments/assets/1ecb1545-0c12-4994-b74b-6873d19a3584)

## vs code shortcuts and other short cuts

![image](https://github.com/user-attachments/assets/4f53a7ac-017e-419b-92c2-369919961af2)
![image](https://github.com/user-attachments/assets/8ced5047-8719-4197-b581-d3aa71cd12d4)

## working of intenet

![image](https://github.com/user-attachments/assets/6d82a253-fecf-4832-9ae1-4ca71971a176)
![image](https://github.com/user-attachments/assets/641e2dfa-7197-4c70-9c24-d34b0c670cd4)

## DEV TOOLS

![image](https://github.com/user-attachments/assets/2ccf6a00-985f-4681-8b7b-b336591b064e)
![image](https://github.com/user-attachments/assets/8e1fbdf0-7cd4-42b0-9bb3-72b72aea3f1c)


## css

- cascading style sheet

## CSS structure

 1. selector
 2. declaration
 3. properties
 4. property value

```css
/* this is css comments */

p { /* here `p` is selector */
    color: red;
    /* color: properties */
    /* red : property value */
    /* all together called as declaration */
    background-color: black;
}
```

![image](https://github.com/user-attachments/assets/a93a71d5-5540-46da-b888-4911e55f7ced)


## declaration

- we can declare css in following ways
  - inline
  - internal
  - external

## selectors

- tag - element - type
- universal `*`
- Class      `.box`
- Id   `#id-example`
- Attribute - eg: `div[name="username"]`

- pseudo-class
  - `:hover`
  - `:first-child`
  - `:nth-child()`

- pseudo-elements
  - `::before`
  - `::after`

## user-agent style sheet

- browser created styles

## css box model

1. width
2. padding
3. border
4. margin

## basics

- background-color
- color
- box-shadow

## css layouts

- normal flow
- display
  - outer display type
    - block
    - inline
    - inline-block
  - inner diplay type
    - flex
    - grid

## text

- text-align
  - to make it center
- text-decoration
  - mostly in anchor tag
  - to remove underline
- text-transform
  - uppercase, lowercase - capitalize
- text-indent

## font

- font-size
- font-family
- font-weight
- font-style
- letter-spacing
- word-spacing

## background

- image : url
- image : linear-gradient
- color
- position
- repeat
- size

## transition

- to apply animation when transfer from one state to another state.
- eg:
  - button hover
  - button click

```css
div {
    color: orange;
    transition-duration: 2s;
    transition-delay: 0.5s;
    transition-timing-function: linear;
    transition-property: color;
}
div:hover{
    color: red;
}
```

---

### css values and units

Most frequently used units:

- px - pixel
- % - percentage
- vh - viewport height
- vw  - viewport width


### colors units

- rgba `rgba(255,255,255,0.5)`
- rgba `rgba(255,255,255)`
- hexa code `#fffff`
- color keycodes `orange`

### RWD

- flex

link:favicon

- floating:
  - float : right;
  - float : left;

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        
    </style>
</head>

<body>
    <p>hello fr om line 1</p>
    <p id="line-2">hello from line 2</p>
    <p>hello from line 3</p>
    <p class="last">hello from line 4</p>
    <p class="last">hello from line 5</p>
</body>

</html>
```

### INSTAGRAM

```html

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>instagram</title>
    <!-- link:favicon -->
    <link rel="shortcut icon" href="./instagram-logo.png" type="image/x-icon">
    <style>
        body {
            padding: 0px;
            margin: 0px;
            height: 100vh;
            /* viewport(screen) height */
            background-color: gray;
            font-size: large;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        .flex-center {
            /* center */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .mobile-phone {
            height: 650px;
            width: 400px;
            background-color: white;
            border: 5px solid black;
            border-radius: 20px;
        }

        header {
            background-color: ghostwhite;
            height: 5%;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .camera {
            height: 25px;
            width: 25px;
            border-radius: 50%;
            background-color: black;
        }

        main {
            width: 100%;
            padding: 10px;
        }

        .section-01 {
            height: 200px;
            display: flex;
        }

        img {
            height: 60px;
            width: 60px;
            border-radius: 50%;
        }

        .profile-section {
            width: 30%;
        }

        .detail-section {
            width: 70%;
            display: flex;
            justify-content: space-around;
            text-align: center;
        }
    </style>
</head>

<body class="flex-center">
    <!-- div.mobile-phone -->
    <div class="mobile-phone">
        <header class="flex-center">
            <div class="camera"></div>
        </header>
        <main id="instagram">
            <section>
                <p>avinash</p>
            </section>
            <section class="section-01">
                <div class="profile-section">
                    <img src="https://i.pinimg.com/736x/b6/1b/ed/b61bed48c000da085d0775a9ae02dc6b.jpg" alt="luffy">
                </div>
                <div class="detail-section">
                    <div>
                        <div>4</div>
                        <div>posts</div>
                    </div>
                    <div>
                        <div>40</div>
                        <div>followers</div>
                    </div>
                    <div>
                        <div>40</div>
                        <div>following</div>
                    </div>
                </div>
            </section>
        </main>
    </div>
</body>

</html>
```


### MAIN TASK

```html
<!DOCTYPE html>
<html lang="en" contenteditable>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>task</title>
    <style>
        body {
            font-family: monospace;
            background-color: black;
            color: white;
        }

        ol {
            /* margin-top: 100px; */
            background-color: #303841;
            margin-left: 10px;
            margin-right: 10px;
            width: 543px;
        }

        li::marker {
            content: counter(list-item) "  ";
            color: #848b93;
        }

        .red-pink {
            color: #ec5f66;
        }

        .orange {
            color: #f8ae57;
        }

        .blue {
            color: #5db4b3;
        }

        .bg-red-pink {
            background-color: #ec5f66;
        }

        .bg-gray {
            background-color: #404954;
        }

        .indent-4::before {
            content: "abcd";
            opacity: 0;
        }

        pre {
            margin-top: 0px;
            margin-bottom: 0px;
        }
    </style>
</head>

<body onload="start()">
    <ol>
        <li><span class="red-pink">#</span> who created world wide web:</li>
        <li class="bg-gray indent-4">- Tim Berner lee: Working in CERN</li>
        <li class="bg-gray indent-4">- HTML created1989</li>
        <li class="orange">-------------------------------------------------</li>
        <li><span class="red-pink">#</span> world wide web and html:</li>
        <li class="bg-gray indent-4">- how it is related.</li>
        <li class="bg-gray indent-4">- Enables content sharing over the Internet through user-friendly ways.</li>
        <li class="orange">-------------------------------------------------</li>
        <li><span class="red-pink">#</span> Browser:</li>
        <li class="bg-gray indent-4">- First browser: Netscape</li>
        <li><span class="blue">[</span> <span class="orange">browser Engine</span> <span class="blue">]</span>:</li>
        <li><span style="color: #6396cb;">Browser-engine</span>
            <span class="bg-red-pink">
                is core concept of web browser responsible for rendering, web content, interpreting HTML,
                CSS, and Javascript code, and displaying webpages to user.
        </li>
        </span>
        <li class="bg-gray  indent-4">Examples:</li>
        <li class="bg-gray">
            <pre>        - Blink        : developed by google </pre>
        </li>
        <li class="bg-gray">
            <pre>        - Webkit       : developed by Apple </pre>
        </li>
        <li class="bg-gray">
            <pre>        - Gecko        : developed by Mozilla </pre>
        </li>
        <li class="bg-gray">
            <pre>        - Trident      : developed by Microsoft </pre>
        </li>
        <!-- <script src="./script.js"></script> -->
</body>

</html>
```

