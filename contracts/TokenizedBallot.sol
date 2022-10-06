// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

interface ITokenizedVotes {
    function getPastVotes(address, uint256) external view returns (uint256);
}

contract TokenizedBallot {
    uint256 public referenceBlock;
    ITokenizedVotes public tokenContract;
    
    struct Proposal {
        bytes32 name;
        uint256 voteCount;
    }

    Proposal[] public proposals;

    constructor(
        bytes32[] memory proposalNames,
        address _TokenContract,
        uint256 _referenceBlock
        ) {
            for (uint256 i = 0; i < proposalNames.length; i++) {
                proposals.push(Proposal({
                    name: proposalNames[i],
                    voteCount: 0
                }));
            }
            tokenContract = ITokenizedVotes(_TokenContract);
            referenceBlock = _referenceBlock;
        }
            
        function vote(uint256 proposal, uint256 amount) public {
            uint256 votePower = votePower(msg.sender);
            require(votePower >= amount);
            proposals[proposal].voteCount += amount;
        }

        function votePower(address account) public view returns (uint256 votePower_) {
            votePower_ = tokenContract.getPastVotes(account, referenceBlock);
        } 

        function winningProposal() public view returns (uint256 winningProposal_) {
            uint256 winningVoteCount = 0;
            for (uint256 p = 0; p < proposals.length; p++) {
                if (proposals[p].voteCount > winningVoteCount) {
                    winningVoteCount = proposals[p].voteCount;
                    winningProposal_ = p;
                }
            }
        }
        function winnerName() public view returns (bytes32 winnerName_) {
            winnerName_ = proposals[winningProposal()].name;
        }

    }
}