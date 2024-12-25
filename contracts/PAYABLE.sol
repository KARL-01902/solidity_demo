// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract PAYABLE{

    function SendEtherToContract () public payable{
        // you can write code but not necessary 
        // your after this this contract can recieve ether
    }

    function FetchBalance() public view returns(uint){
        return address(this).balance;
        // this contract address balance is shown
        // ba;ance is shown in wei;
    }

}