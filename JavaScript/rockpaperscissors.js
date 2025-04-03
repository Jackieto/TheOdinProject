
const game_div = document.getElementById("game");
var player_win = "YOU WIN!";
var computer_win = "YOU LOSE!";
var draw = "DRAW!";
var rounds = 0;
var victories_cpu = 0;
var victories_player = 0;


function getComputerChoice(){

    const choices = ["Rock","Paper","Scissor"];
    
    let option = Math.floor(Math.random() * 3);

    return choices[option];

}

function tryAgain(result){

    const playerMoves = document.getElementById("playerMoves-div");
    playerMoves.remove();
    const optionh3 = document.getElementById("choose-h3");
    optionh3.remove();


    //add score

    if(result == player_win){
        victories_player++;

        const player_score_label = document.getElementById("player_score");
        player_score_label.textContent = "Player Score: " + victories_player;

    }

    if(result == computer_win){
        const computer_score_label = document.getElementById("computer_score");
        computer_score_label.textContent = "Computer Score: " + victories_cpu;
        victories_cpu++;
    }


    const tryAgainMessage = document.createElement("h2");

    tryAgainMessage.textContent = result + " Click the button to play again";

    game_div.appendChild(tryAgainMessage);


    const newRoundButton = document.createElement("button");
    newRoundButton.textContent = "New round";

    //reset UI
    newRoundButton.addEventListener("click", () => {
        game_div.replaceChildren();
        game();

    });

    game_div.appendChild(newRoundButton);
}

function game(){


    const optionh3 = document.createElement("h3");
    optionh3.textContent = "Choose an  option!";
    optionh3.id = "choose-h3";

    game_div.appendChild(optionh3);
    
    let player_option;

    const playerMoves = document.createElement("div");
    playerMoves.id = "playerMoves-div";
    
    const buttonLabels = ["Rock", "Paper", "Scissors"];

    buttonLabels.forEach((label) => {

        const optionButton = document.createElement("button");
        optionButton.textContent = label;
        optionButton.addEventListener("click",() => playRound(optionButton.textContent));
        playerMoves.appendChild(optionButton);

    });

    game_div.appendChild(playerMoves);
}


function playRound(player_move){


    let player_win = "YOU WIN!";
    let computer_win = "YOU LOSE!";
    let draw = "DRAW!";

    console.log(player_move);
    let computer_move = getComputerChoice();


    const computerMoveText = document.createElement("h3");
    const playerMoveText = document.createElement("h3");

    playerMoveText.textContent = "Your  move: " +  player_move;

    computerMoveText.textContent = "Your opononent move: " +  computer_move;

    game_div.appendChild(playerMoveText);
    
    game_div.appendChild(computerMoveText);


    if (player_move === computer_move) {
        result = draw;
    } 
    else if (
        (player_move === "Rock" && computer_move === "Scissors") ||
        (player_move === "Paper" && computer_move === "Rock") ||
        (player_move === "Scissors" && computer_move === "Paper")
    ) {
        result = player_win;
    } 
    else {
        result = computer_win;
    }

    tryAgain(result);


}

const startButton = document.getElementById("startButton");

startButton.addEventListener("click", () => {

    startButton.remove();
    
    const header_div = document.getElementById("header");

    const player_score_label = document.createElement("h2");
    player_score_label.id = "player_score";
    player_score_label.textContent = "Player Score: " + victories_player;
    player_score_label.style.marginRight = "10 px"; 

    const computer_score_label = document.createElement("h2");
    computer_score_label.id = "computer_score";
    computer_score_label.textContent = "computer Score: " + victories_cpu;
    computer_score_label.style.marginRight = "10 px"; 

    header_div.appendChild(player_score_label);
    header_div.appendChild(computer_score_label);




    game();
   

});
    

