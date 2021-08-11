pragma solidity 0.8.6;

contract Target {
    
    uint public num;
    
    event Test(uint a, uint b, address c);
    
    function test(uint _a, uint _b ) public returns (uint){
        num = _a + _b;
        emit Test(_a, _b, msg.sender);
        return _a + _b;
    }
    
    function pwn() public {
        
    }
}

contract Deligataion {
    
    uint public num;
    
    function callTest(address _contract, uint _a, uint _b) public returns (bool, bytes memory, address){
        (bool success, bytes memory data) = address(_contract).call(abi.encodeWithSignature("test(uint256,uint256)", _a, _b));
        return (success, data, _contract);
    }
    
    function delegatecallTest(address _contract, uint _a, uint _b) public returns (bool, bytes memory, address) {
        (bool success, bytes memory data) = address(_contract).delegatecall(abi.encodeWithSignature("test(uint256,uint256)", _a, _b));
        return (success, data, _contract);
    }
}