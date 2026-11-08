// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ProposalContract
/// @notice Create proposals and vote "yes" on them. Each address can vote once per proposal.
contract ProposalContract {
    struct Proposal {
        string title;
        string description;
        uint256 yesVotes;
        address creator;
    }

    uint256 public constant PASS_THRESHOLD = 10;

    Proposal[] public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event ProposalCreated(uint256 indexed proposalId, address indexed creator, string title);
    event Voted(uint256 indexed proposalId, address indexed voter, uint256 yesVotes);

    function create(
        string calldata title,
        string calldata description
    ) external returns (uint256 proposalId) {
        require(bytes(title).length > 0, "Title required");

        proposalId = proposals.length;
        proposals.push(
            Proposal({
                title: title,
                description: description,
                yesVotes: 0,
                creator: msg.sender
            })
        );

        emit ProposalCreated(proposalId, msg.sender, title);
    }

    function voteYes(uint256 proposalId) external {
        require(proposalId < proposals.length, "Invalid proposal ID");
        require(!hasVoted[proposalId][msg.sender], "Already voted");

        hasVoted[proposalId][msg.sender] = true;
        proposals[proposalId].yesVotes++;

        emit Voted(proposalId, msg.sender, proposals[proposalId].yesVotes);
    }

    function isSucceeded(uint256 proposalId) external view returns (bool) {
        require(proposalId < proposals.length, "Invalid proposal ID");
        return proposals[proposalId].yesVotes >= PASS_THRESHOLD;
    }

    function proposalCount() external view returns (uint256) {
        return proposals.length;
    }
}
