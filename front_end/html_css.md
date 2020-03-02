[资源](https://learn.shayhowe.com/html-css/building-your-first-web-page/)


## Introducation
Hyper Text Markup Language， give the content structure.
- element a, p
- tag ```<a> <p>```

CSS, is a presentation language, style the content.
- selector  designates which element of html to style. 一般target id或class或者type。
    1. 选type p {} 
    2. 选class .`$className` {}
    3. 选id   #`$idName` {}
- properties  color/font/backgroud/height...
- value

### html 引入 CSS
```
<head>
  <link rel="stylesheet" href="main.css">
</head>
```

```<div> block element, <span> in line element```

优先用有语义的标签。```<header> <article> <footer> <nav>```等.

### CSS
CSS解析是自上而下的。相同的selector，下面的会覆盖上面的。  
不同的selector权重不同，(type：001) -> (class：010) -> (id：100)。  
结合selector,可以改变权重 ```.classname p``` is 010 + 001 -> 011
css 可以有层,下面两个标签公用16px。  
 ``` css
 .btn {
  font-size: 16px;
}
.btn-danger {
  background: red;
}
.btn-success {
  background: green;
}
```
color 的16进制刚好是rgb(0-255)的16进制转换.  
rgba(255, 102, 0, .5)。 a是透明度，0不可见，1完全可见.  
Percentages，```width: 50%``` parent element的百分比。  
Em， ```width: 4em``` A single em unit is equivalent to an element’s font size. font-size = 15px，则width是60px。  

### Box model

#### display
every element has a default display property, one of:  
 ```
block, inline, 
inline-block,  // 可以使用block标签的行内display
none.   // hide
 ```
### box model 是什么
**every element on a page is a rectangular box** and may have width, height, padding, borders, and margins.  
inline-element不能设置width，height。  
margins在border外，一般用于定位，inline-element不可用；padding在border内， inline可用。
```css
 div {
    border: 2px solid #4a9b94;
    border-radius: 5px;
    border-top-right-radius: 0px;
    height: 100px;
    margin: 20px auto;
    margin-left: 100px;
    padding: 20px;
    width: 50%;
  }
  ```

  ### Position
  `float`