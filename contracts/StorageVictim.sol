
// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


contract StorageVictim {

   address immutable owner;
   
   struct Storage {
   
       address user;
       uint amount;
   }

   mapping(address => Storage) storages;

   constructor(){
       owner = msg.sender;
   }

   function store(uint _amount) public {
   
       // uninitialised pointer. str.user points to the storage address 0 which is "owner"
       
       Storage storage str = storages[msg.sender];
       
       str.user = msg.sender;
       
       str.amount = _amount;

       storages[msg.sender] = str;

   }
   function getStore() public view returns (address, uint) {
       
       Storage storage str = storages[msg.sender];
       
       return (str.user, str.amount);
   }
   
   function getOwner() public view returns (address) {
       
       return owner;
   }
}
