//0x3b53229CcCbd8E3Ee02E56bfAd1419bf2A671842

pragma solidity 0.8.6;

contract Quiz {
    
    constructor() payable {
        
    }
    
    function answer(string memory _answer) public {
        payable(msg.sender).transfer(address(this).balance);
    }
    
    
}


