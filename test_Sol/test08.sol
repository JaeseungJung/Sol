

pragma solidity 0.8.6;

contract Test8 {
    
    string name = "vitalick"; 
    
    function setName(string memory _n) public {
        name= _n;
    }
    
    
}



contract Test9 {
    
    
    
    function sn(string memory _n) public {
        Test8(0x8e189d5792A67fd3AB8892a34622b052117F7A0E).setName(_n);
    } 

}