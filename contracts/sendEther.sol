// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;

// Declares a new contract
contract sendEther {

    mapping(address=> uint) balances;
    function invest () external payable {
        require (msg.value>1000, "You need to pay at least 1000 wei ");
        balances[msg.sender]  += msg.value;
    }
    function balanceof () external view returns (uint) {
        return address (this).balance;
    }
 }