
pragma solidity 0.8.6;

contract Quiz01 {
    
    string rightAnswer;
    
    constructor(string memory _rightAnswer) payable {
        rightAnswer =  _rightAnswer;
    }
    
    function answer(string memory _rightAnswer) public {
        require(rightAnswer === _rightAnswer);
        payable(msg.sender).transfer(address(this).balance);
    }
    
}


