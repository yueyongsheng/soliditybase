// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(uint256 => mapping(string => uint256)) public candidateVotes;
    uint256 public currentVersion = 1;

    // 允许用户投票给某个人
    function vote(string calldata candidateName) external {
        require(
            bytes(candidateName).length > 0,
            "candidateName name cannot be empty"
        );
        candidateVotes[currentVersion][candidateName] += 1;
    }

    //返回某个 候选人的得票数
    function getVotes(
        string calldata candidateName
    ) external view returns (uint256) {
        return candidateVotes[currentVersion][candidateName];
    }
    address public immutable owner = msg.sender;
    // 充值所有人的得票数
    function resetVotes() external {
        require(msg.sender == owner, "Only owner can reset votes");
        currentVersion += 1;
    }
}
