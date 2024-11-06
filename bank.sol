// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract bank{
    address public accholder;
        uint256 balance=0;
    constructor(){
        accholder=msg.sender;
    }
    // 0xd9145CCE52D386f254917e481eB44e9943F39138 contract address

    function withdraw()payable public{
        require(balance>0,"you dont have engough balance");
        // payable-bcoz i can send the money
        require(msg.sender==accholder,"you are not the account holder");
        payable(msg.sender).transfer(balance);
        balance=0;
    }
    function deposit()public payable  {
        require(msg.value>0,"Deposit amount should be greater than 0");
         require(msg.sender==accholder,"you are not the account holder");
        balance+=msg.value;
    }
    function showBalance()public view returns(uint){
        // view is there for read process only
         require(msg.sender==accholder,"you are not the account holder");
        return balance;

    }
}
