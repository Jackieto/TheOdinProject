const readline = require("readline-sync");

function getComputerChoice(){

    const choices = ["rock","paper","scissor"];
    
    let option = Math.floor(Math.random() * 3);

    return choices[option];

}

let victories_cpu = 0;
let victories_player = 0;

