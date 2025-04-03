const container = document.querySelector("#container");

const content = document.createElement("div");

content.classList.add("content");
content.textContent = "This is the glorious text-content!";

container.appendChild(content);


const red_paragraph = document.createElement("p");

red_paragraph.textContent = "Im a red paragraph!";
red_paragraph.style.color = "red";


container.appendChild(red_paragraph);

const blue_subheader = document.createElement("h3");

blue_subheader.textContent = "I'm a blue h3!";
blue_subheader.style.color = "blue";

container.appendChild(blue_subheader);

const pink_div = document.createElement("div");

pink_div.style.backgroundColor = "pink";
pink_div.style.border = "2px solid black";


const h1 = document.createElement("h1");

h1.textContent = "I'm in a div!";

pink_div.appendChild(h1);


const paragraph_in_div = document.createElement("p");
paragraph_in_div.textContent = "Me too!";
pink_div.appendChild(paragraph_in_div);
//pink_div.textContent = "pink_dov";


container.appendChild(pink_div);



function alertFunction(){
    alert("YAY! YOU DID IT!");
}

const buttons = document.querySelectorAll("button");


buttons.forEach((button) => {

    button.addEventListener("click", () => {
        alert(button.id);
    })

})
