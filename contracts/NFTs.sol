//SPDX-License-Identifier : MIT
pragma solidity ^0.8.0;

contract NFTs {
    struct NFT {
        string image;
        string owner;
        uint floorValue;
    }

    NFT[] public nfts;

    function storeNFT(string memory _image, string memory _owner, uint _floorValue) public {
        NFT memory newNFT = NFT({
            image: _image,
            owner: _owner,
            floorValue: _floorValue
        });

        nfts.push(newNFT);
    }

    function retrieveNFT(uint _index) public view returns (string memory, string memory, uint) {
        NFT memory nftToRetrieve = nfts[_index];
        return (nftToRetrieve.image, nftToRetrieve.owner, nftToRetrieve.floorValue);
    }
}