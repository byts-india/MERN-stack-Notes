# BASICS OF WEB TECH

-  The Internet  <https://www.youtube.com/watch?v=Dxcc6ycZ73M>
-  Client & Server <https://www.youtube.com/watch?v=kBXQZMmiA4s>
-  IP address and URL  <https://www.youtube.com/watch?v=5o8CwafCxnU>


## Basic HTML Tags

- `<!DOCTYPE>` declaration, which specifies the document type and version of HTML being used.
- `<html>` structure tags
- `<head>` structure tags
- `<body>` structure tags
- `<title>` HTML page document title. Displayed title on top of webpage.
- `<h1> to <h6>` headings and subheadings within the document
- `<br/>` line break
- `<hr>`  horizontal line
- `<!-- -->` HTML comments

### Formatting Tags

- `<pre>` tag in HTML stands for "**preformatted text**"
- `<sub>` sub script
- `<sup>` super script
- `<strong>` make text bold
- `<code>` write codes

### Forms and Input

- `<form>`
- `<input>`
- `<label>`
- `<textarea>`
- `<select>`
- `<optgroup>`
- `<option>`
- `<datalist>`
- `<button>`
- `<fieldset>` to create a outline
- `<legend>` to give title for above 👆 fieldset

### list

- `<ul>` un ordered list
- `<ol>` ordered list
- `<li>` list

### Frame

- `iframe`

### images

- `img` image
- `canvas` drawing shapes
- `svg` support vector graphics

### audio / video

- `audio`
- `video`
- `source`

### tables

- `table`
- `caption`
- `thead`
- `tbody`
- `tfoot`
- `th`
- `td` table data
- `tr` table row
- `col` column
- `colgroup` column group

### semantics

- 🏷️
Semantic HTML tags are used to provide meaning and structure to the content of a webpage. They help both browsers and developers understand the purpose and context of different sections of the page.
- `main`
- `header`
- `section`
- `footer`
- `aside`
- `nav`
- 👇Difference between div and span
- `div` tag is a block-level element used to group together other HTML elements into sections or divisions of a web page
- `span` tag is an inline-level element used to apply styles or manipulate portions of text within a larger block of content. it is used to apply styling or scripting to a specific part of the text, such as changing its color, font, or applying other inline styles.

### Script tags

- `<script>` to include and write `JS` codes
- `<noscript>` to display if `JS` is disabled in browser

---

### ATTRIBUTES

### Global attributes

- `id`
- `class`
- `style` to apply inline style
- `contenteditable` make html content editable
- `hidden` make a tag invisible
- `title` a description about a tag. which will be shown as pop on hover.

### Event attributes

- `onchange` The **onchange** event occurs when the value of an input element, such as a text field, dropdown list, or checkbox, is changed by the user and then loses focus. It is commonly used to trigger actions or validations when the user makes a selection or input.
- `onload` The **onload** event occurs when a webpage and all its external resources ***(such as images, scripts, and stylesheets)*** have finished loading in the browser window. It is often used to initialize scripts, perform actions once the page is fully rendered, or dynamically modify page elements.
- `onpagehide`  The onpagehide event is triggered when the current webpage is about to be hidden or unloaded, such as when the user navigates to another page or closes the browser tab/window. It can be used to perform cleanup tasks or save the current state before the page is hidden or unloaded.
- `onpageshow` The onpageshow event is the counterpart of onpagehide. It occurs when a hidden webpage is about to be shown or reloaded, such as when the user navigates back to the page or restores a closed tab/window. It can be used to reinitialize scripts or restore the previous state of the page.
- `onunload` The onunload event occurs when the current webpage is about to be unloaded, either by navigating to another page, closing the browser tab/window, or reloading the page. It is commonly used to prompt the user for confirmation before leaving the page or to perform cleanup tasks, such as releasing resources or saving data.
- 

#### EXAMPLES


```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html example</title>
    <style>
        /* 🚀 Styles will be given below 🚀 */
        body {
            margin: 0px;
            /* 👆 It is advisable to keep above code, 
            just to make sure, you don't see any gaps. */
            padding: 20px;
            /* 
            you can goto this link : 🔗 https://cssgradient.io/ 
            where you can easily generate gradient css code.
            */
            background: rgb(183, 72, 100);
            background: radial-gradient(circle, rgba(183, 72, 100, 1) 10%, rgba(155, 183, 72, 1) 34%, rgba(72, 183, 155, 1) 66%, rgba(100, 72, 183, 1) 93%);
            background-attachment: fixed;
            /* the above code make sure, this background will scroll, even if scrolling is there. */
            font-family: Georgia, 'Times New Roman', Times, serif;
            /* some css values will be applied to itself. and to its children's also. */
            /* eg.
                - font-family
                - font-size
                - color
                - text-transform 
            */
            /* But we don't have to worry about that.
                That's because, It is purely related to the properties context.
                
                01. in this example, font-family is a property,
                    which is obviously has to be applied to all children within body tag.
                    Applying font family to body tag, alone doesn't make sense. 
                02. like border, which suppose to get applied to that particular tag alone.
                    where as, we can't say border should be create to its tag, and its children tags.
                */
        }

        code {
            background-color: black;
            color: white;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
        }

        pre {
            /* 👇 fit-content will adjust based the content size*/
            width: fit-content;
            padding: 20px;
            border-radius: 5px;
            background-color: black;
            /* colors can mention in different ways.
            - one of the way is using hexadecimal code,
            */
            color: #D985A0;
        }

        h1 {
            text-transform: uppercase;
            font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
            letter-spacing: 2px;
            word-spacing: 2px;
            font-weight: 100;
            /* Below code will create a text shadow, 
             - where, first 2 values refers to x and y axis distance it should be moved.
             - you can give negative values also.
             - last value 4px, will responsible for blur effect.  */
            text-shadow: 2.5px 2.5px 4px #DB8780;
            color: white;
        }

        h2 {
            text-align: center;
            text-decoration-line: underline;
            text-decoration-style: wavy;
            text-decoration-color: #A096D6;
            /* 
            - you can either use above code. or below one.
            - where below one is called shorthand css. like short hand operator in other programming languages. 
            */
            /* text-decoration: underline wavy #A75954; */
        }

        hr {
            /* color: greenyellow; */
            /* 
            The above code will not work for make hr line color. 
            you have use below code, 👇 */
            border-block-color: skyblue;
        }

        section {
            background-color: rgba(255, 255, 255, 0.288);
            padding: 20px;
        }
    </style>
</head>

<body>

    <section>
        <!-- Main Title of the Webpage -->
        <h1>Maths Formulas and Code Snippets</h1>

        <!-- Subheading for Formulas -->
        <h2>Common Maths Formulas</h2>

        <!-- Quadratic Formula with Superscript and Subscript -->
        <h3>Quadratic Formula</h3>
        <p>The quadratic formula is:</p>
        <p>
            <strong>x</strong> = <sup>-b</sup> ± √(<strong>b</strong><sup>2</sup> - 4<strong>ac</strong>) /
            2<strong>a</strong>
        </p>
    </section>
    <hr>
    <section>

        <!-- Subheading for Code Snippets -->
        <h2>Code Snippets</h2>

        <!-- Preformatted text -->
        <h3>Example of a Function in Python:</h3>
        <pre>
def quadratic_formula(a, b, c):
    # calculate the discriminant
    d = (b**2) - (4*a*c)
    # find two solutions
    sol1 = (-b-cmath.sqrt(d))/(2*a)
    sol2 = (-b+cmath.sqrt(d))/(2*a)
    return sol1, sol2
    </pre>
        <p>
            In above code I have used <code>math.sqrt</code> to find square root.
        </p>
    </section>
    <hr>

    <section>
        <!-- Subheading for Other Formulas -->
        <h2>Other Useful Formulas</h2>

        <!-- Pythagorean Theorem -->
        <h3>Pythagorean Theorem</h3>
        <p>
            In a right triangle, the square of the length of the hypotenuse (<strong>c</strong>) is equal to the sum of
            the
            squares of the lengths of the other two sides (<strong>a</strong> and <strong>b</strong>):
        </p>
        <p>
            <strong>c</strong><sup>2</sup> = <strong>a</strong><sup>2</sup> + <strong>b</strong><sup>2</sup>
        </p>

        <hr>

        <!-- Footer with small heading -->
        <h6>End of Document</h6>
    </section>

</body>

</html>
```

![image](https://github.com/user-attachments/assets/a9fe3860-56cd-4193-8d7f-8ee42289a21d)

