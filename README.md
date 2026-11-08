# Solidity Proposal Struct Challenge

A beginner Solidity exercise: a small contract for creating proposals and voting on them.

## The `Proposal` struct

```solidity
struct Proposal {
    string title;        // short title
    string description;  // longer explanation
    uint256 yesVotes;    // number of "yes" votes
    address creator;     // who created the proposal
}
```

## Functions

| Function | Description |
| --- | --- |
| `create(title, description)` | Creates a proposal (title required) and returns its ID |
| `voteYes(proposalId)` | Adds one "yes" vote; each address can vote once per proposal |
| `isSucceeded(proposalId)` | `true` once `yesVotes >= PASS_THRESHOLD` (10) |
| `proposalCount()` | Number of proposals created |

Events: `ProposalCreated` and `Voted`.

## Try it in Remix

Compile with Solidity `0.8.20` or newer, deploy on the "Remix VM", then call the functions from the "Deployed Contracts" panel.

## Limitations

- Voting is one address, one vote. A single person can still use many addresses (no Sybil resistance).
- There is no "no" vote, voting deadline, or proposal cancellation.

Learning exercise only; not audited and not for production use.

## License

MIT
