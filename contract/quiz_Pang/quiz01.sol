pragma solidity 0.8.6;

contract Quiz01 {
    
    string rightAnswer;
    bytes32 hashAnswer;
    
    constructor(string memory _rightAnswer) payable {
        rightAnswer =  _rightAnswer;
        hashAnswer = keccak256(abi.encodePacked(_rightAnswer));
    }
    
    function getAnswer() public view returns (string memory) {
       return rightAnswer;
    }
    
    function gethashAnswer() public view returns (bytes32) {
       return hashAnswer;
    }
    
    
     function emptyAnswer() public view returns (bytes32) {
       return keccak256(abi.encodePacked(""));
    }
    

    function answer(string memory answer) public {
        bytes32 hashAnswer2 = keccak256(abi.encodePacked(answer));
        require (hashAnswer == hashAnswer2);
        payable(msg.sender).transfer(address(this).balance);
       
       
    }
    
    
}
