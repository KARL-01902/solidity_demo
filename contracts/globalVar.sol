// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract GLOBAL_VAR{
    // 1. msg.sender 
    // returns the address of user who has called the function

    function CallerAddress() public view returns(address){
        return msg.sender;
    }

    // 2. block.timestamp
    // returns the unix time stamp of the formed block 
    // can go to unix and convert time
    function BlockTimeStamp() public view returns(uint){
        return block.timestamp;
    }

    // 3. msg.value
    // used to pay an address
    
    function PayAddress(address payable addr) public payable{
        addr.transfer(msg.value);
    }
    
     // rest all global variables you can check out
}