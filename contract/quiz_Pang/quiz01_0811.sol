pragma solidity 0.8.6;

contract Quiz01 {
    
    string rightAnswer;
    bytes32 public hashedAnswer;
    
    constructor(string memory _rightAnswer) payable {
        rightAnswer =  _rightAnswer;
    }
    
    function getAnswer() public view returns (string memory) {
       return rightAnswer;
    }
    
     function getHashedAnswer() public returns (bytes32) {
        hashedAnswer = keccak256(abi.encodePacked(msg.sender, rightAnswer));
        return hashedAnswer;
       
    }
    
      function balanceOf() view public returns (uint){
        return address(this).balance;
    }

    
    function answer(bytes32 _hash) public {
        hashedAnswer = keccak256(abi.encodePacked(msg.sender, rightAnswer));
        require ( hashedAnswer == _hash);
        payable(msg.sender).transfer(address(this).balance);
    }
    
    
}
