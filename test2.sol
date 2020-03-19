// ----------------------------------------------------------------------------------------------------------------------//
// this smart contract makes use of mappings and modifiers to make a simple code
// I have just written this smart contract to develop an intuitive understanding of mappings and function modifiers
// Function modifiers are used to check for certain condition before any  function is called. e.g we can check where the address
// calling the function is same as owner of smart contract who deployed the contract or it can be used to make a certain function
// available only before or after certain time. Time in solidity used is Unix Epoch Time.
// mapping is just a hash table or we can say key/value table where each key is associated with a respective value. 
// ----------------------------------------------------------------------------------------------------------------------//
pragma solidity ^0.5.1;
contract test{
    address owner;
    
    // constructor to set owner address to the adress from which the conract is deployed. Constructors can
    // be easily understood if we compare them with C++
    constructor () public{
        owner = msg.sender;
    }
    mapping(uint => users) public userdb;
    
    
    // this modifier checks for the condition before allowing call to delUser fucntion
    
    modifier onlyAdmin()
    {
        require (msg.sender == owner);
        _;
    }
    uint user_c = 0;    //this variable keeps record of the number of users in the database
    
    // struct which has two values id and name of user. Struct in solidity is 
    //same as in other Object Oriented Languages
    
    struct users{
        uint id;
        string name;
    }
    
    // this function can be called by everyone on the blockchain as it is public to everyone and has no modifier
    
    function addUser(uint idss,string memory ss) public {
        user_c +=1;
        userdb[user_c] = users(idss,ss);
    }
    
    // this function can only be called by the admin who deployed the smart contract
    
    function delUser(uint iduser) public onlyAdmin
    {
        userdb[iduser] = users(0,'nulldata');
    }
    
}
