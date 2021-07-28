pragma solidity 0.8.6;

contract Test11 {
    
    mapping(address => uint) public txCount;
    mapping(address => uint) public win;
    
    function gamble(bool _answer) public {
        uint blockNum = block.number;
        bool answer;
        
        if(blockNum % 2 == 1){
            answer = true;
        } else if (blockNum % 2 == 0) {
            answer = false;
        }
        
        txCount[msg.sender]++;
        
        if(answer == _answer){
            win[msg.sender]++;
        }
    }
    
}