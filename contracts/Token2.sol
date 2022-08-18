
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import '.ITest.sol';
// WEB3 TOKEN 
contract ERC20_W3B is IERC20{
  uint public totalsupply=30000;
  mapping(address=> uint) public balance;
  mapping(address=> mapping(address=>uint)) public Allowance;
  string public name="web3Bridge";
  string public symbol='W3B';

function transfer(address recipient, uint amount) external override returns(bool){
  balance [msg.sender]-= amount;
  balance[recipient]+=amount;
  emit Transfer(msg.sender, recipient, amount);
  return true;
}

function approve(address spender, uint amount) external override  returns(bool){
  Allowance[msg.sender][spender]= amount;
  emit Approval(msg.sender, spender, amount);
  return true;
}

 function transferFrom(address sender, address recipient, uint amount) external override returns(bool){
 Allowance[sender][msg.sender] -= amount;
  balance [sender]-= amount;
  balance[recipient]+=amount;
  emit Transfer(msg.sender, recipient, amount);
  return true;
 }

}
