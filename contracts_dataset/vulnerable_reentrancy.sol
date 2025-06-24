pragma solidity ^0.8.0;
contract Vulnerable {
    mapping(address => uint) public balances;
    function withdraw() public {
        uint bal = balances[msg.sender];
        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");
        balances[msg.sender] = 0;
    }
}