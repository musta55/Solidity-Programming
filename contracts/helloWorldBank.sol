// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;

// Declares a new contract
contract helloWorldBank {
    address payable public owner;
    mapping(address => uint)private balances;

    constructor () public payable {
        owner  = payable(msg.sender);
    }
    // AUthentication
     function isOwner() public view returns (bool){
         return msg.sender ==owner;
     }
    modifier onlyOwner () {
        require (isOwner());
        _;
    }

    // Deposit function
    function deposit () public payable 
    {
        require(balances[msg.sender] + msg.value >= balances[msg.sender]);
        balances[msg.sender]+=msg.value;
    }
// Checks effects interaction pattern
    function withdraw (uint withdrawAmount)  public {
        require (withdrawAmount<= balances[msg.sender],"You do not have enough money to withdraw");
        balances[msg.sender]-=withdrawAmount;
      owner.transfer(withdrawAmount);
    }
// modifier
    function withdrawAll() public onlyOwner{
        owner.transfer(address(this).balance);
    }
    // Withdraw function


    // get balance function

    function getbalance() public view returns (uint) {
        return balances[msg.sender];
    }

 }