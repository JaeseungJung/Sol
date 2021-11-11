//0x6dAB0795e34bf49D1504ffC79F1ecab410026640

//출석 인증 컨트랙트입니다. 호출하고 addname에 이름 등록하고, attending 누르면 
//출석 상태가 false => true로 바뀝니다. LookUp을 눌러 확이 가능하고,
//Owner가 출석을 초기화할 수 있습니다.

pragma solidity 0.8.6;

contract attendingCheck {
    
    struct Student {
        string name;
        bool state;
    }
    
    Student[] students;
    
    mapping(address => uint) count;
    mapping(address => string) name;
    
    address owner;
    
    
    constructor() {
        count[msg.sender] = 1;
        name[msg.sender] = "HanSooYoung";
        owner = msg.sender;
    }
    
    
    function addName(string memory _name) public {
    name[msg.sender] = _name;
    bool _state = false;
    students.push(Student(_name, _state));
    }
    
    function attending() public {
        require( count[msg.sender] == 0);
        count[msg.sender] = 1;
        string memory selectName = name[msg.sender];
        for(uint i=0; i<students.length;i++) {
         if(keccak256(abi.encodePacked(students[i].name)) == keccak256(abi.encodePacked(selectName))) {
             students[i].state = true;
          }
        }
    }
    
    function getCount() view public returns (uint){
        return count[msg.sender];
    }
    
    function getName() view public returns (string memory){
        return name[msg.sender];
    }
    
    function LookUp() public view returns(Student[] memory) {
    return students;
    }
    
    function initialize() public {
        require(msg.sender ==owner);
        for(uint i=0; i<students.length;i++) {
            students[i].state = false;
        }
    }
}