# css

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
- combinator 
   - descendant - `space`
   - child - `>`
   - adjacent - `+`
   - general  - `~`
- nesting

- pseudo-class
  - `:hover`
  - `:active`
  - `:visited`
  - `:nth-child()`

- pseudo-elements
  - `::before`
  - `::after`

## css inheritance

- inherit
  - inherit the property from nearest parent which has same property.
- initial

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
- text-shadow
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
- positioning
  - static
    - default value
  - fixed
    - position based on screen
    - won't move when scrolling
  - absolute
    - position based on screen
    - move when scrolling
  - relative
    - position based on its current position and relative to its parent.
    - eg: if top : 20px;
            top is being calculated from its previous position.

  - sticky
    - will stick to the screen
    - based on offset value provided.
    - offset values are nothing but.
      values provided in top, left, right, bottom.
    - offset is mandatory to make sticky work.

```css
header {
    position: sticky;
    top: 30px; /* this is offset for sticky */
}
```

### absolute vs fixed

- position based on screen is common for both
- `[ absolute ]` will move on scrolling
- `[ fixed ]` won't move on scrolling

### absolute vs relative

- `[ relative ]` position based on its current position and relative to its parent.
- `[ absolute ]` position based on its screen and not relative to its parent.

## text

- text-align
  - to make it center
- text-decoration
  - mostly in anchor tag
  - to remove underline
- text-transform
  - uppercase, lowercase - capitalize
- text-indent
- overflow
- text-overflow

```css
.overflow {
       overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
```

## font

- font-size
- font-family
- font-weight
- font-style
- letter-spacing
- word-spacing
- line-height

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
- em  - size of element
- rem - size of root element

### calc() function

eg: `width: calc(100vw - 200px)`

### colors units

- rgba `rgba(255,255,255,0.5)`
- rgba `rgba(255,255,255)`
- hexa code `#fffff`
- color keycodes `orange`

### RWD

- @media

```markdown
# syntax
	@media (condition) {
	  /* styles go here */
	}

Common Use — Responsive Design

	// Applies styles only when the screen width is 768px or less (usually tablets/mobiles).
	@media (max-width: 768px) {
	  body {
	    background-color: lightblue;
	  }
	}

```

- flex

```markdown
# flex :
- parent   : flex-container
- children : flex-items

# flex-container

	display: flex;

- flex-direction:
- flex-wrap
- justify-content
- align-items
- align-content
- gap: 1

# flex-items

- order : 0
- flex : 1    ( flex-[grow, shrink, basis])

```

- grid

```markdown
# search for "css generator"
```

### icon

link:favicon

- floating:
  - float : right;
  - float : left;
