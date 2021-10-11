// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import 'hardhat/console.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import '@openzeppelin/contracts/utils/Strings.sol';
import { Base64 } from './libraries/Base64.sol';

contract ScorpyNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string[] colors = ['red', 'gold', 'blue', 'red', 'red', 'blue', 'red', 'blue', 'blue', 'red', 'gold', 'blue', 'red', 'red', 'blue'];

    function pickRandomColor(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked('COLOR', Strings.toString(tokenId))));
        rand = rand % colors.length;
        return colors[rand];
    }

    string[] firstWords = ['Slightly', 'Totally', 'Rusty', 'Slightly', 'Very', 'Totally', 'Mega', 'Rusty', 'Slightly', 'Very', 'Rusty', 'Rusty', 'Rusty', 'Rusty', 'Rusty'];
    string[] secondWords = ['Normal', 'Normal', 'Normal', 'Normal', 'Normal', 'Rare', 'Epic', 'Epic', 'Normal', 'Normal', 'Nice', 'Nice', 'Nice', 'Nice', 'Normal'];
    string[] thirdWords = ['Scorpy', 'Scorpy', 'Scorpy', 'Scorpy', 'Scorpy', 'Scorpy', 'Scorpy', 'Scorpy', 'Scorpion', 'Scorpion', 'Scorpion', 'Scorpion', 'SKing', 'SKing', 'SGOD' ];
    
    event NewNFTMinted(address sender, uint256 tokenId);

    constructor() ERC721 ("ScorpyNFT","STING") {
        console.log('Hisss... Hisss... Imma Sting you');
    }

    function pickRandomFirstWord(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked('FIRST_WORD', Strings.toString(tokenId))));
        rand = rand % firstWords.length;
        return firstWords[rand];
    }

    function pickRandomSecondWord(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked('SECOND_WORD', Strings.toString(tokenId))));
        rand = rand % secondWords.length;
        return secondWords[rand];
    }

    function pickRandomThirdWord(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked('THIRD_WORD', Strings.toString(tokenId))));
        rand = rand % thirdWords.length;
        return thirdWords[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function makeNFT() public {
        uint256 newItemId = _tokenIds.current();

        string memory textColor = pickRandomColor(newItemId);
        string memory baseSvg = string(abi.encodePacked("<?xml version='1.0' standalone='no'?> <!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 20010904//EN' 'http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd'> <svg version='1.0' xmlns='http://www.w3.org/2000/svg' width='500.000000pt' height='500.000000pt' viewBox='0 0 2350.000000 2350.000000' preserveAspectRatio='xMidYMid meet'> <g transform='translate(0.000000,2350.000000) scale(0.100000,-0.100000)' fill='#000000' stroke='none'> <path d='M0 11750 l0 -11750 11750 0 11750 0 0 11750 0 11750 -11750 0 -11750 0 0 -11750z m23420 0 l0 -11670 -3865 0 -3865 0 0 604 0 604 418 -5 c229 -2 485 -8 567 -13 83 -4 152 -6 153 -5 10 9 21 1059 22 1925 0 1165 -17 4880 -26 5498 l-6 442 -1684 0 -1684 0 0 920 0 920 -530 0 -530 0 0 -1185 0 -1185 -140 0 -140 0 0 -310 0 -310 -80 0 -80 0 0 -1190 0 -1190 -160 0 -160 0 0 1190 0 1190 -75 0 -75 0 0 310 0 309 -137 3 -138 3 -5 1185 -5 1185 -370 6 c-203 3 -389 7 -412 8 l-43 1 0 375 0 375 160 0 160 0 0 430 0 430 -215 0 -215 0 0 135 0 135 -125 0 -125 0 0 195 0 195 -500 0 -500 0 0 -285 0 -285 330 0 330 0 0 -125 0 -125 290 0 290 0 0 -345 0 -345 -625 0 -625 0 0 -380 0 -380 565 0 565 0 0 -247 c0 -137 -3 -555 -7 -930 l-6 -683 -1709 0 -1708 0 0 -3936 0 -3937 605 8 605 7 0 -565 c0 -310 -3 -579 -6 -596 l-6 -31 -3909 0 -3909 0 0 11670 0 11670 11670 0 11670 0 0 -11670z'/> <path d='M9780 20545 l0 -205 -230 0 -230 0 -2 -187 -3 -188 -282 -3 -283 -2 0 -305 0 -305 -280 0 -280 0 0 -560 0 -560 -170 0 -170 0 0 -240 0 -239 -137 -3 -138 -3 -3 -1172 -2 -1173 135 0 135 0 0 -250 0 -250 175 0 175 0 0 -425 0 -425 300 0 300 0 0 -190 0 -190 115 0 115 0 0 195 0 195 40 0 40 0 0 230 0 230 390 0 390 0 0 -230 0 -230 520 0 520 0 0 455 0 455 -950 0 -950 0 0 100 0 100 693 2 692 3 3 178 2 177 -695 0 -695 0 0 100 0 100 1700 0 1700 0 0 -345 0 -345 310 0 310 0 0 -585 0 -585 220 0 220 0 2 -502 c2 -277 4 -407 5 -290 l3 212 220 0 220 0 0 190 0 190 185 0 185 0 0 190 0 190 308 2 307 3 3 523 2 522 235 0 235 0 0 150 0 150 120 0 120 0 0 1175 0 1175 -120 0 -120 0 0 240 0 240 -235 0 -235 0 0 560 0 560 -310 0 -310 0 -2 303 -3 302 -167 3 -168 2 0 190 0 190 -275 0 -275 0 0 205 0 205 -1815 0 -1815 0 0 -205z'/> </g> <text x='50%' y='50%' font-size='10em' class='base' dominant-baseline='middle' text-anchor='middle' fill='", textColor ,"'>"));


        string memory first = pickRandomFirstWord(newItemId);
        string memory second = pickRandomSecondWord(newItemId);
        string memory third = pickRandomThirdWord(newItemId);
        string memory combinedWord = string(abi.encodePacked(first, second, third));

        string memory finalSvg = string(abi.encodePacked(baseSvg, combinedWord, '</text></svg>'));
        
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        combinedWord,
                        '", "description": "An extremely are collection of Scorpy NFTs.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );

        string memory finalTokenURI = string(abi.encodePacked('data:application/json;base64,', json));

        console.log("\n--------------------");
        console.log(finalTokenURI);
        console.log("--------------------\n");

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, finalTokenURI);
        
        console.log("A new ScorpyNFT: %s has been minted to %s",  newItemId, msg.sender);

        _tokenIds.increment();

        emit NewNFTMinted(msg.sender, newItemId);
    }
}