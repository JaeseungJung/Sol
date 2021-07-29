pragma solidity ^0.4.19;

contract Check {
    
    
  
    struct student {
        string name;
        address stu_Address;
        uint attendance;
       
    }

      student[] public students;
      
    
    function _createStudent  (string _name, address _address) public {
    students.push(student(_name, _address,0));
}


    function _checkAttendance (string _name, address _address) public {
    students.push(student(_name, _address,1));
}

 function allReset () public {
    student[attendance] = 0;
}

function isAbsence (address msg.sender) public {
    return student(address msg.sender).attendance;
}

}


// 다음 부분 구현이 어렵습니다.

// 함수 _checkAttendance에서 인자로 받은 이름과 주소로 
// _createStudent에서 생성한 student 구조체에 접근해서 1로 바꿔 주고 싶습니다. 

// 함수 allReset 에서는 새로운날 출석 여부를 나타내는  attendance 값을 모두 0으로 바꿔 초기화 하고 싶습니다. 