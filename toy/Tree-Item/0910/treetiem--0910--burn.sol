// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "./vrf.sol";



contract TreeItems is ERC1155, RandomNumberConsumer{
    
    mapping(address => uint) public balances;
    mapping(address => uint) public ticket_Chekcer;
    address public owner;

    uint256 public constant Baby = 0;
    uint256 public constant Iron = 1;
    uint256 public constant Bronze = 2;
    uint256 public constant SILVER = 3;
    uint256 public constant GOLD = 4;
    uint256 public constant Platinum = 5;
    uint256 public constant Diamond = 6;
    uint256 public constant Draw_Ticket = 7;
    
    
        constructor() public ERC1155("https://raw.githubusercontent.com/JaeseungJung/Sol/main/toy/Tree-Item/{id}.json") {
        owner = msg.sender; 
        
        _mint(msg.sender, Baby, 10**14, "");
        _mint(msg.sender, Iron, 10**12, "");
        _mint(msg.sender, Bronze, 10**10, "");
        _mint(msg.sender, SILVER, 10**8, "");
        _mint(msg.sender, GOLD, 10**6, "");
        _mint(msg.sender, Platinum, 10**4, "");
        _mint(msg.sender, Diamond, 10**2, "");
        
        _mint(msg.sender, Draw_Ticket, 10**7, "");

}
    
    
        modifier onlyOwner () {
        require(msg.sender == owner);
        _;
}


    function donate() public payable {
        
        uint give_ticket_amount;
        uint diamonNumber;
        uint platinumNumber;
        uint goldNumber;
        uint silverNumber;
        uint bronzeNumber;
        uint ironNumber;
        uint babyNumber;
        uint treeNumber; 
        
        balances[msg.sender] += msg.value;
        
        give_ticket_amount = balances[msg.sender]/(5*(10**17)) - ticket_Chekcer[msg.sender];
        
       
        
         if(give_ticket_amount >= 1) {
            _safeTransferFrom(owner, msg.sender, 7, give_ticket_amount, "");
            ticket_Chekcer[msg.sender] += give_ticket_amount;
        }
        
        
        treeNumber = msg.value/(5*(10**14));
       
        if(treeNumber<10) {
            _safeTransferFrom(owner, msg.sender, 0, treeNumber, "");
        }else if(treeNumber<100) {
            ironNumber = treeNumber/10;
            babyNumber = treeNumber%10;
            
            _safeTransferFrom(owner, msg.sender, 0, babyNumber, "");
            _safeTransferFrom(owner, msg.sender, 1, ironNumber, "");
        }else if(treeNumber<1000) {
            bronzeNumber = treeNumber/100;
            ironNumber =  (treeNumber%100)/10;
            babyNumber = (treeNumber%100)%10;
            
             _safeTransferFrom(owner, msg.sender, 0, babyNumber, "");
              _safeTransferFrom(owner, msg.sender, 1, ironNumber, "");
               _safeTransferFrom(owner, msg.sender, 2, bronzeNumber, "");
        }else if (treeNumber<10000) {
            silverNumber = treeNumber/1000;
            bronzeNumber = (treeNumber%1000)/100;
            ironNumber = (treeNumber%1000)%100/10;
            babyNumber = (treeNumber%1000)%100%10;
            
            _safeTransferFrom(owner, msg.sender, 0, babyNumber, "");
              _safeTransferFrom(owner, msg.sender, 1, ironNumber, "");
               _safeTransferFrom(owner, msg.sender, 2, bronzeNumber, "");
               _safeTransferFrom(owner, msg.sender, 3, silverNumber, "");
               
        } else if (treeNumber<100000) {
            goldNumber = treeNumber/10000;
            silverNumber = (treeNumber%10000)/1000;
            bronzeNumber = (treeNumber%10000)%1000/100;
            ironNumber = (treeNumber%10000)%1000%100/10;
            babyNumber = (treeNumber%10000)%1000%100%10;
            
            _safeTransferFrom(owner, msg.sender, 0, babyNumber, "");
              _safeTransferFrom(owner, msg.sender, 1, ironNumber, "");
               _safeTransferFrom(owner, msg.sender, 2, bronzeNumber, "");
               _safeTransferFrom(owner, msg.sender, 3, silverNumber, "");
                 _safeTransferFrom(owner, msg.sender, 4, goldNumber, "");
                 
        } else if (treeNumber<1000000)  {
            platinumNumber = treeNumber/100000;
            goldNumber = (treeNumber%100000)/10000;
            silverNumber = (treeNumber%100000)%10000/1000;
            bronzeNumber = (treeNumber%100000)%10000%1000/100;
            ironNumber = (treeNumber%100000)%10000%1000%100/10;
            babyNumber = (treeNumber%100000)%10000%1000%100%10;
            
            _safeTransferFrom(owner, msg.sender, 0, babyNumber, "");
              _safeTransferFrom(owner, msg.sender, 1, ironNumber, "");
               _safeTransferFrom(owner, msg.sender, 2, bronzeNumber, "");
               _safeTransferFrom(owner, msg.sender, 3, silverNumber, "");
                 _safeTransferFrom(owner, msg.sender, 4, goldNumber, "");
                  _safeTransferFrom(owner, msg.sender, 5, platinumNumber, "");
        
         } else   {
            diamonNumber = treeNumber/10**6;
            platinumNumber = (treeNumber%10**6)/100000;
            goldNumber = (treeNumber%10**6)%100000/10000;
            silverNumber = (treeNumber%10**6)%100000%10000/1000;
            bronzeNumber = (treeNumber%10**6)%100000%10000%1000/100;
            ironNumber = (treeNumber%10**6)%100000%10000%1000%100/10;
            babyNumber = (treeNumber%10**6)%100000%10000%1000%100%10;
            
            _safeTransferFrom(owner, msg.sender, 0, babyNumber, "");
              _safeTransferFrom(owner, msg.sender, 1, ironNumber, "");
               _safeTransferFrom(owner, msg.sender, 2, bronzeNumber, "");
               _safeTransferFrom(owner, msg.sender, 3, silverNumber, "");
                 _safeTransferFrom(owner, msg.sender, 4, goldNumber, "");
                  _safeTransferFrom(owner, msg.sender, 5, platinumNumber, "");
                          _safeTransferFrom(owner, msg.sender, 6, diamonNumber, "");
        
    }
    
    
    }
    
     
      function merge_cards(uint fromID) public  {
          uint toID = fromID + 1;
        
        _safeTransferFrom(msg.sender, owner, fromID, 10, "");
        _safeTransferFrom(owner, msg.sender, toID, 1, "");
     }


   function draw() public  {
         
        _safeTransferFrom(msg.sender, owner, 7, 1 , "");
      
   
     }
     

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
       
    }


    function donation_balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
}


    uint[] public item_ids = [0,1,2,3,4,5,6,7];

    function all_tree_burn() public {
        for(uint i=0; i<item_ids.length; i++){
            _burn(msg.sender, item_ids[i],balanceOf(msg.sender,item_ids[i]));
        }
        }
       



      receive() external payable {}

}

