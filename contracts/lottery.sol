// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract lottery{
    // manager
    address public manager;
    // players
    address payable[] public players;
    // winner
    address payable public winner;

    // default constructor
    constructor(){
        manager = msg.sender;
    }
    
    function addPlayer(address payable _player) public payable {
        require(msg.value == 1 ether, "wrong amount to transfer plz transfer 1ETH");
        players.push(_player);
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }                                               // difficulty

    function getBalance() public view returns(uint){
        // require(msg.sender==manager, "You are not manager!");
        return address(this).balance;   // returns balance in wei
    }

    function winnerDecider() public payable{
        require(players.length>=3, "insufficient no of players");
        uint windx = random()% players.length;
        winner = players[windx];
        // transfer the just formed contract balancec to winner
        winner.transfer(address(this).balance);
        players =  new address payable[](0);
    }
}