 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProposalContract {
    struct Proposal {
        string title;
        string description;
        uint256 yesVotes;
    }

    Proposal[] public proposals;

    function create(
        string memory title,
        string memory description
    ) public {
        proposals.push(
            Proposal({
                title: title,
                description: description,
                yesVotes: 0
            })
        );
    }

    function voteYes(uint256 proposalId) public {
        require(proposalId < proposals.length, "Invalid proposal ID");
        proposals[proposalId].yesVotes++;
    }

    function isSucceeded(
        uint256 proposalId
    ) public view returns (bool) {
        require(proposalId < proposals.length, "Invalid proposal ID");
        return proposals[proposalId].yesVotes >= 10;
    }
}
