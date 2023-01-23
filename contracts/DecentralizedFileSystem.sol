pragma solidity >=0.7.0 < 0.9.0;

contract Upload {
    // qwerty
    struct Access {
        address user;
        bool access; //true or false

    }

    // Mapping  with array

    Mapping(address => string[])value;
    mapping (address=> mapping(address=>bool)) ownership;
    mapping (address=> Access []) accessList;
    mapping( address => mapping (address=>bool)) previousData;


    function add(address _user, string memory url) external  external
    {
        value[_user].push(url);
    }
    function allow (address user) external {
        ownership[msg.sender][user] = true;
        accessList[msg.sender].push (Access (user,true));
    }

    function disallow (address user) external {
    ownership[msg.sender][user] = false;
    for(uint i=0; i< accessList[msg.sender].length;i++)
    {
        if(accessList[msg.sender][i].user ==  _user)
        {
            accessList[msg.sender][i].access = false;
        }
    }
    }
}