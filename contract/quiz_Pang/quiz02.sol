pragma solidity 0.8.6;

import '/qpang.sol' ;

contract Quiz02 {
    
    address private admin;
    bytes32 private hashedAnswer;
    
    mapping (uint=>string) private answers;
    mapping (uint=>uint) private isSolved; 
    mapping (address=>uint) public winningCount; 
    
      modifier onlyAdmin{ 
        require(msg.sender==admin);
        _;
    }
    
    constructor() payable {
        admin=msg.sender;
    }
    
    function createQ(uint qNum, string memory qAnswer) onlyAdmin  public  {
      answers[qNum] = qAnswer;
      isSolved[qNum] = 0;
    }
        
    function getAnswer(uint qNum) onlyAdmin public view returns (string memory) {
       return answers[qNum];
    }
    
     function getHashedAnswer(uint qNum) onlyAdmin public  returns (bytes32) {
         return keccak256(abi.encodePacked(msg.sender, answers[qNum]));      
    }
    
      function balanceOf() view onlyAdmin public returns  (uint){
        return address(this).balance;
    }

    
    function answer(uint qNum, bytes32 _hash) public {
        require(isSolved[qNum] == 0);
        hashedAnswer = keccak256(abi.encodePacked(msg.sender, answers[qNum]));
        require ( hashedAnswer == _hash);
        payable(msg.sender).transfer(0.1 ether);
        winningCount[msg.sender] ++;
        isSolved[qNum] = 1;
    }
    
    
    
}
