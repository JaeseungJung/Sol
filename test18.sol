
pragma solidity 0.8.6;

contract Test18 {
    
    address owner;
    
    constructor() payable {
      owner = tx.origin;   
    }
    
      modifier onlyOwner () {
      require(msg.sender == owner);
     _;
    }

    /// 자주 쓰는 조건문을 모디파이어에 넣어 다음을 기대할 수 있음.
    // 코드를 간결화 / 사용 편의성 증대.
    
     function whoTxOrigin() view public returns (address){
        return tx.origin;  
    }
    
      function balanceOf() view public returns (uint){
        return address(this).balance;
    }
    
    
    function withdraw(address _to) public onlyOwner {
        payable(_to).transfer(address(this).balance);
    }
    
    }
    
contract Attack{
    
    fallback external payable {
        Test18().withdraw();
    }
}

// fallback 함수로 강제 실행. 