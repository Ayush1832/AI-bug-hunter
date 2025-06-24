pragma solidity ^0.8.0;
contract Secure {
    mapping(address => uint) public balances;
    function withdraw() public {
        uint bal = balances[msg.sender];
        balances[msg.sender] = 0;
        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");
    }
}