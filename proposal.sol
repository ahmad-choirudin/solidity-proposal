struct Proposal {
    string title;
    string description;
}

Proposal[] public proposals;

function create(
    string memory title,
    string memory description
) public {
    proposals.push(Proposal({
        title: title,
        description: description
    }));
}
