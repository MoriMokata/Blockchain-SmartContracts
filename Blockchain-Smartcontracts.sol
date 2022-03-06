// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract SmartContracts {  

  mapping (bytes32 => bool) private listSmartContracts;

  //---events---
  event AddedTx(
    address from,   
    string text,
    bytes32 hash,
    string time
  );

  event RegistrationError(
    address from,
    string text,
    string reason,
    string time
  );

  struct Respones{
    address from;
    string text;
    string time;
  }
  Respones[] respones;

  // store the proof for a student in the contract state
  function recordProof(bytes32 proof) private {
    listSmartContracts[proof] = true;
  }
  
  // record a student name
  function registration(string memory name,string memory time) public payable {
    
    

    //---check if msg.value != 0.001 ether---
    if(keccak256(bytes(name))==keccak256(bytes("Luxury Villa"))){
        if (msg.value != 0.001 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.001 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Vikasa Villa"))){
        if (msg.value != 0.002 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.002 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Sall Villa"))){
        if (msg.value != 0.003 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.003 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Serenity Villa"))){
        if (msg.value != 0.004 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.004 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Skydream Villa"))){
        if (msg.value != 0.005 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.005 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }else if(keccak256(bytes(name))==keccak256(bytes("Elysian Villa"))){
        if (msg.value != 0.006 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amount of Ether. 0.006 ether for registration",time);
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        }
        respones.push(Respones(msg.sender, name, time));
    }
      

    
 
    recordProof(hashing(name));
    
    //---fire the event---
    emit AddedTx(msg.sender, name, hashing(name),time);
    
  }
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }

  function ResponesData() public view returns(Respones[] memory){
    return respones;
  }
  
  // check name of student in this class
  function checkName(string memory name) public 
  view returns (bool) {
    return listSmartContracts[hashing(name)];
  }
}