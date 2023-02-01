// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;

// Declares a new contract
contract eventDemo {
     event newTrade (
         uint256 indexed date,
         address indexed from,
         address indexed to,
         uint256 amount
     );

     function trade (address to, uint256 amount) external {
         emit newTrade(now, msg.sender, to, amount);
     }
}