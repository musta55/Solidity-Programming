// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;

// Declares a new contract
contract setter {
    // Storage. Persists in between transactions
    uint256 public x=0;

    // Allows the unsigned integer stored to be changed
    function set(uint256 newValue) public {
        x = newValue;
    }

}