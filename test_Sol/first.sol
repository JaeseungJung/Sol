pragma solidity 0.8.4;

contract FirstContract {
    string name = "vitalick";
    
    function getName() public view returns (string memory) {
        return name;
    }
    
    function setName(string memory _name) public {
        name = _name;
    }
    
    fallback() external payable {
      
    }
    
   uint age = 19;
    
    function getAge() public view returns (uint) {
        return age;
    }

    function setAge(uint _age) public {
        age = _age;
    }
   
}


// fallback~ 스마트컨트랙트에 이더를 입금하게 하는 코드


