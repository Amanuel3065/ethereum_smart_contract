pragma solidity 0.4.20;

contract Casino{
    address public owner;
    uint public minimumBet;
    uint public totalBet;
    uint public numberOfBets;
    uint public maxAmountOfBets = 100;
    address [] public players;

    //The address of the player and the user info
    struct Player{
        uint amountBet;
        uint numberSelected;
    }

    //This mapping returns the attributes of the player struct 
    //when provided with players' address
    mapping(address => Player) public playerInfo;

    function Casino(uint _minimumBet) public{
        owner = msg.sender;
        if(_minimumBet != 0) minimumBet = _minimumBet;

    }

    function kill() public{
        if(msg.sender == owner) selfdestruct(owner);
    }

    //to check if a player has previous bets or not
    function checkPlayerExists(address player) public contant  returns(bool){
        for(int i=0; i<players.length;i++){
            if(players[i] = player) return true;
        }
        return false;
    }
    
    //function to bet a number b/n 1 and 10
    function bet (uint numberSelected) public payable{
        require(!checkPlayerExists(msg.sender));
        require(numberSelected >= 1 && numberSelected <= 10);
        require(msg.value >= minimum Bet);

        playerInfo[msg.sender].amountBet = msg.value;
        playerInfo[msg.sender].numberSelected = numberSelected;
        numberOfBets++;
        players.push(msg.sender);
        totalBet += msg.value;

    }

    //function to generate a number between 1 and 10
    function generateNumberWinner() public {
        uint numberGenerated = block.number % 10 + 1;
        distributePrizes (numberGenerated);
    }


    //Function that distributes prizes based on number generated



}