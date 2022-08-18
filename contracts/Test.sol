// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Imaginations{

  struct Details{
    string name;
    uint time;
    bool completed;
  }
   mapping(uint=> mapping(bytes32=> Details)) identity;
   Details[] public details;


  function create(string calldata _name,uint _time) external{
    require(_time>=block.timestamp, "Time Expired!!!");
    details.push(Details({name:_name, completed:false, time:_time}));
  }

  function update(string calldata _name, uint _y, uint _time ) external {
    Details storage x= details[_y];
    x.name= _name;
    x.time=_time;
   
  }


  function get(uint _x) external view returns(string memory, bool, uint) {
  Details storage y= details[_x];
  return (y.name, y.completed, y.time);
  }

function Key(string calldata Name, uint _x) public returns(bytes32){
    IfCreated(_x);   
    return keccak256(abi.encodePacked(Name));
    
}

    function individualDetails(uint _x, bytes32 key) view public returns(Details memory) {
        Details storage you= identity[_x][key];
        return you; 
    }

  function IfCreated(uint _x) public returns(bool){
    Details storage C= details[_x];
   return C.completed=!C.completed;
  }

}
 













