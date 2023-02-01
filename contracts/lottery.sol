// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract lotteryApp {
    //   1. A manager address
    address public manager;
    //   2. Participants address
    address payable[] public participants;
    address payable public winner;

    constructor() {
        manager = msg.sender;
    }

    receive() external payable {
        require(
            msg.value ==1 ether,
            "Need to pay 0.0001 ether to participate in the lottery"
        );
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint256) {
        require(msg.sender == manager, "You are not the manager");
        return address(this).balance;
    }

    function randomNumberGenerator() private view returns (uint256) {
        uint256 timestamp = block.timestamp;
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        timestamp,
                        participants.length
                    )
                )
            );
    }

    function getParticipantLength() public view returns (uint256) {
        require(msg.sender == manager, "You are not the manager");
        return participants.length;
    }

    function allParticipants() public view returns (address payable[] memory) {
        return participants;
    }

    function luckyWinner() public {
        require(msg.sender == manager, "You are not the manager");
        //   4. start lottery (min 3 lottery)
        require(
            participants.length >= 3,
            "At least 3 person needed to start a lottery"
        );
        uint256 rand = randomNumberGenerator();

        uint256 index = rand % getParticipantLength();
        winner = participants[index];
        //   3.  Send lottery fee to Manager
        winner.transfer(getBalance());

        // Need to revert the transaction
        participants = new address payable[](0);
    }
}
