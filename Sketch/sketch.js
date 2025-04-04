const grid_div = document.getElementById("grid_div");
const clearButton = document.getElementById("clearButton");
clearButton.addEventListener("click",() => clear());

var color = "black";
const width = 640;
const  height = 640;
let nSquares = 16;


const newGridButton = document.getElementById("newGridButton");
newGridButton.addEventListener("click", () =>{

   const input =  prompt("Insert grid size: ");
   nSquares = parseInt(input);
   console.log(nSquares);
   clear();
  // createGrid();

});


createGrid();



function createGrid(){

    let squareSize = width / nSquares;
    for (let i = 0; i < nSquares; i++) {
        for (let j = 0; j < nSquares; j++) {
            const square = document.createElement("div");
            square.className= "square";
            square.style.width = squareSize + "px";
            square.style.height = squareSize + "px";

            square.style.opacity = "0.3";

            square.addEventListener("mouseover", () => draw(square));
            grid_div.appendChild(square);
            
        }
     
    }

}

function draw(square){
    const currentOpacity = parseFloat(square.style.opacity);
    const newOpacity = Math.min(currentOpacity + 0.1, 1.0);
    square.style.opacity = newOpacity.toString();
    square.style.backgroundColor = color;
}

function clear(){

    grid_div.innerHTML = '';
 

    createGrid();
}