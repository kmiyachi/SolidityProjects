pragma solidity ^0.4.15;
// Proof of Existence contract, version 2
contract Proof2 {
  // state
  bytes32[] private proofs;
  // store a proof of existence in the contract state
  // *transactional function*
  function storeProof(bytes32 proof) {
    proofs.push(proof);
  }
// calculate and store the proof for a document
  // *transactional function*
  function notarize(string document) {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }
// helper function to get a document's sha256
  // *read-only function*
  function proofFor(string document) constant returns (bytes32) {
    return sha256(document);
  }
// check if a document has been notarized
  // *read-only function*
  function checkDocument(string document) constant returns (bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }
  // returns true if proof is stored
  // *read-only function*
  function hasProof(bytes32 proof) constant returns (bool) {
    for (uint256 i = 0; i < proofs.length; i++) {
      if (proofs[i] == proof) {
        return true;
      }
    }
    return false;
  }
}

