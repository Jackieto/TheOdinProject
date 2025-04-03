const itemName = document.getElementById("itemName");

const button = document.getElementById("addItem");


const list = document.createElement("ul");

button.addEventListener("click", () =>{

    if(itemName.value != '' ){
        const item = document.createElement("li");
        
        const span = document.createElement("span");
        span.textContent = itemName.value;

        const deleteButton = document.createElement("button");
        deleteButton.textContent = "Delete";

        deleteButton.addEventListener("click", () => {

            list.removeChild(item);

        });

    
        item.appendChild(span);
        item.appendChild(deleteButton);
        itemName.value = '';

        list.appendChild(item);

    }
   
});

document.body.appendChild(list)



