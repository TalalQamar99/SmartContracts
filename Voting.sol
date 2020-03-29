//This smart contract implements the logic of election voting system.
//The voters are authorized by the person who deployed the contract.
//Voters can only vote once and only authorized vote are counted.
//Un-authorized may votes but their vote isn't counted in the result.
pragma solidity ^0.5.0;


contract Election{

//struct to hold name and vote count of candidate
 struct Candidate{
		string name;
		uint votecount;
		}
//struct for voter information. voted stores status of voter i.e whether he has voted or not    
struct Voter{
    bool voted;
    uint voteIndex;
    uint weight;
    }
    
address public owner;
string  public name; //name of election
mapping(address =>Voter) public voters;
Candidate[] public candidates;
uint public auctionEnd;


event ElectionResult(string name,uint votecount); //event to happen when authorized address executes end function


constructor(string memory _name,uint duration,string memory candidate1,string memory candidate2) public{
    owner = msg.sender;
	  name = _name;
	  auctionEnd = now + (duration*1 minutes);
	  candidates.push(Candidate(candidate1,0));
	  candidates.push(Candidate(candidate2,0));
}

function Authorize(address voter) public
        {
          require(msg.sender == owner);
          require(!voters[voter].voted);
          voters[voter].weight = 1;
        }
function vote(uint candidateIndex) public
        {
          require (now  <auctionEnd);
          require(!voters[msg.sender].voted);
          voters[msg.sender].voted = true;
          voters[msg.sender].voteIndex = candidateIndex;
          candidates[candidateIndex].votecount +=voters[msg.sender].weight;
      }
function end() public
      {
          require(msg.sender ==owner);
          require(now>=auctionEnd);

      for(uint i=0;i<candidates.length;i++)
              {
                  emit ElectionResult(candidates[i].name,candidates[i].votecount);
               }
      }
 
} 
