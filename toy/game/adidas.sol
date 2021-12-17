
https://etherscan.io/token/0x28472a58a490c5e09a238847f66a68a47cc76f0f?a=0x8c685c44facb8bf246fcb0e383cca4bd46634bf8



SecondaryRevenueSplitter
https://etherscan.io/address/0x6f3ca2ee8def7494064092d5212f681fef064b6b#code



#
#  Panoramix v4 Oct 2019 
#  Decompiled source of 0x28472a58A490c5e09A238847F66A68a47cC76f0f
# 
#  Let's make the world open source 
# 
#
#  I failed with these: 
#  - uri(uint256 _id)
#  - release(address _address)
#  - safeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values, bytes _data)
#  All the rest is below.
#

def storage:
  paused is uint8 at storage 0
  balanceOf is mapping of uint256 at storage 1
  stor2 is mapping of uint8 at storage 2
  stor3 is array of uint256 at storage 3
  totalSupply is mapping of uint256 at storage 4
  owner is addr at storage 5
  stor6 is array of struct at storage 6
  stor7 is array of struct at storage 7
  shares is mapping of uint256 at storage 10
  stor13 is uint8 at storage 13 offset 8
  stor13 is uint8 at storage 13 offset 16
  stor13 is uint8 at storage 13
  stor13 is uint256 at storage 13 offset 16
  stor13 is uint256 at storage 13
  mintPrice is uint256 at storage 14
  unknownab8e0a29 is uint256 at storage 15
  unknown3e8d1c07 is uint256 at storage 16
  unknown3b44c8d0 is uint256 at storage 17
  unknown81e3d057 is uint256 at storage 18
  unknown7b58de8b is uint256 at storage 19
  unknown019863c3 is uint256 at storage 20
  unknown2eb4a7ab is uint256 at storage 21
  unknownf8685030 is mapping of uint256 at storage 22
  storFE17 is uint256 at storage 0xfe17ef568e3e12ab5b9c7254a8d58478811de00f9e6eb34345acd53bf8fd09d3

def balanceOf(address _owner, uint256 _cardId): # not payable
  require calldata.size - 4 >=′ 64
  require _owner == _owner
  if not _owner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC1155: balance query for the zero address'
  return balanceOf[_cardId][addr(_owner)]

def unknown019863c3(): # not payable
  return unknown019863c3

def unknown2eb4a7ab(): # not payable
  return unknown2eb4a7ab

def unknown3b44c8d0(): # not payable
  return unknown3b44c8d0

def unknown3e8d1c07(): # not payable
  return unknown3e8d1c07

def exists(uint256 _tokenId): # not payable
  require calldata.size - 4 >=′ 32
  return bool(totalSupply[_tokenId])

def paused(): # not payable
  return bool(paused)

def mintPrice(): # not payable
  return mintPrice

def unknown7b58de8b(): # not payable
  return unknown7b58de8b

def unknown81e3d057(): # not payable
  return unknown81e3d057

def owner(): # not payable
  return owner

def unknownab8e0a29(): # not payable
  return unknownab8e0a29

def totalSupply(uint256 _id): # not payable
  require calldata.size - 4 >=′ 32
  return totalSupply[_id]

def shares(address _param1): # not payable
  require calldata.size - 4 >=′ 32
  require _param1 == _param1
  return shares[addr(_param1)]

def isApprovedForAll(address _owner, address _operator): # not payable
  require calldata.size - 4 >=′ 64
  require _owner == _owner
  require _operator == _operator
  return bool(stor2[addr(_owner)][addr(_operator)])

def unknownf8685030(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  require _param1 == addr(_param1)
  return unknownf8685030[_param1]

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def unknown5ee6509a(): # not payable
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if unknownab8e0a29 > -2:
      revert with 0, 17
  unknownab8e0a29++

def setPrice(uint256 _newPrice): # not payable
  require calldata.size - 4 >=′ 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  mintPrice = _newPrice

def unknown7cb64759(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  unknown2eb4a7ab = _param1

def pause(): # not payable
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if paused:
      revert with 0, 'Pausable: paused'
  paused = 1
  log Paused(address account=caller)

def unpause(): # not payable
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not paused:
      revert with 0, 'Pausable: not paused'
  paused = 0
  log Unpaused(address account=caller)

def renounceOwnership(): # not payable
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  owner = 0
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)

def unknownf260159e(): # not payable
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if unknownab8e0a29 <= 1:
      revert with 0, 'Cannot go below stage 1'
  if unknownab8e0a29 < 1:
      revert with 0, 17
  unknownab8e0a29--

def transferOwnership(address _newOwner): # not payable
  require calldata.size - 4 >=′ 32
  require _newOwner == _newOwner
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Ownable: new owner is the zero address'
  owner = _newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)

def supportsInterface(bytes4 _interfaceId): # not payable
  require calldata.size - 4 >=′ 32
  require _interfaceId == Mask(32, 224, _interfaceId)
  if 0xd9b67a2600000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  if 0xe89341c00000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  return (Mask(32, 224, _interfaceId) == 0x1ffc9a700000000000000000000000000000000000000000000000000000000)

def setApprovalForAll(address _to, bool _approved): # not payable
  require calldata.size - 4 >=′ 64
  require _to == _to
  require _approved == _approved
  if caller == _to:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC1155: setting approval status for self'
  stor2[caller][addr(_to)] = uint8(_approved)
  log ApprovalForAll(
        address owner=_approved,
        address operator=caller,
        bool approved=_to)

def unknownab22ff02(uint256 _param1, uint256 _param2, uint256 _param3, uint256 _param4, uint256 _param5): # not payable
  require calldata.size - 4 >=′ 160
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if _param4 <= _param2:
      revert with 0, 'window combination not allowed'
  if _param1 <= _param3:
      revert with 0, 'window combination not allowed'
  if _param2 <= _param1:
      revert with 0, 'window combination not allowed'
  if _param5 <= _param4:
      revert with 0, 'window combination not allowed'
  unknown3b44c8d0 = _param1
  unknown81e3d057 = _param2
  unknown3e8d1c07 = _param3
  unknown7b58de8b = _param4
  unknown019863c3 = _param5

def unknown8f0d94b2(uint256 _param1, uint256 _param2, uint256 _param3): # not payable
  require calldata.size - 4 >=′ 96
  require _param1 == uint8(_param1)
  require _param2 == uint8(_param2)
  require _param3 == uint8(_param3)
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  uint8(stor13.field_0) = uint8(uint256(stor13.field_0) and -16711936)
  uint8(stor13.field_0) = uint8(_param1)
  uint8(stor13.field_8) = uint8(_param3)
  uint8(stor13.field_16) = uint8(_param2)
  Mask(240, 0, stor13.field_16) = Mask(240, 16, uint256(stor13.field_0) and -16711936) >> 16

def unknown02fe5305(array _param1): # not payable
  require calldata.size - 4 >=′ 32
  require _param1 <= 18446744073709551615
  require calldata.size >′ _param1 + 35
  if _param1.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(ceil32(_param1.length)) + 97 < 96 or ceil32(ceil32(_param1.length)) + 97 > 18446744073709551615:
      revert with 0, 65
  require _param1 + _param1.length + 36 <= calldata.size
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if bool(stor3.length):
      if bool(stor3.length) == uint255(stor3.length) * 0.5 < 32:
          revert with 0, 34
      if _param1.length:
          stor3[].field_0 = Array(len=_param1.length, data=_param1[all])
      else:
          stor3.length = 0
          idx = 0
          while (uint255(stor3.length) * 0.5) + 31 / 32 > idx:
              stor3[idx].field_0 = 0
              idx = idx + 1
              continue 
  else:
      if bool(stor3.length) == stor3.length.field_1 < 32:
          revert with 0, 34
      if _param1.length:
          stor3[].field_0 = Array(len=_param1.length, data=_param1[all])
      else:
          stor3.length = 0
          idx = 0
          while stor3.length.field_1 + 31 / 32 > idx:
              stor3[idx].field_0 = 0
              idx = idx + 1
              continue 

def burn(address _to, uint256 _amount, uint256 _stage): # not payable
  require calldata.size - 4 >=′ 96
  require _to == _to
  if block.timestamp <= unknown81e3d057:
      if storFE17 != 30000:
          revert with 0, 'Burn: not allowed during sale'
  if _to != caller:
      if not stor2[addr(_to)][caller]:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC1155: caller is not owner nor approved'
  if not _to:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC1155: burn from the zero address'
  mem[128] = _amount
  mem[160] = 1
  mem[192] = _stage
  mem[224] = 0
  if not _to:
      idx = 0
      while idx < 1:
          if idx >= 1:
              revert with 0, 50
          if idx >= 1:
              revert with 0, 50
          mem[0] = mem[(32 * idx) + 128]
          mem[32] = 4
          if totalSupply[mem[(32 * idx) + 128]] > !mem[(32 * idx) + 192]:
              revert with 0, 17
          totalSupply[mem[(32 * idx) + 128]] += mem[(32 * idx) + 192]
          if idx == -1:
              revert with 0, 17
          idx = idx + 1
          continue 
  idx = 0
  while idx < 1:
      if idx >= 1:
          revert with 0, 50
      if idx >= 1:
          revert with 0, 50
      mem[0] = mem[(32 * idx) + 128]
      mem[32] = 4
      if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + 192]:
          revert with 0, 17
      totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + 192]
      if idx == -1:
          revert with 0, 17
      idx = idx + 1
      continue 
  if balanceOf[_amount][addr(_to)] < _stage:
      revert with 0, 'ERC1155: burn amount exceeds balance'
  balanceOf[_amount][addr(_to)] -= _stage
  log 0xc3d58168: _amount, _stage, caller, _to, 0

def unknown4e1273f4(): # not payable
  require calldata.size - 4 >=′ 64
  require cd <= 18446744073709551615
  require cd <′ calldata.size
  if ('cd', 4).length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * ('cd', 4).length) + 97 < 96 or ceil32(32 * ('cd', 4).length) + 97 > 18446744073709551615:
      revert with 0, 65
  mem[96] = ('cd', 4).length
  require cd * ('cd', 4).length) + 36 <= calldata.size
  s = 128
  idx = cd[4] + 36
  while idx < cd * ('cd', 4).length) + 36:
      require cd[idx] == addr(cd[idx])
      mem[s] = cd[idx]
      s = s + 32
      idx = idx + 32
      continue 
  require cd <= 18446744073709551615
  require cd <′ calldata.size
  if ('cd', 36).length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * ('cd', 36).length) + 98 < 97 or ceil32(32 * ('cd', 4).length) + ceil32(32 * ('cd', 36).length) + 98 > 18446744073709551615:
      revert with 0, 65
  mem[ceil32(32 * ('cd', 4).length) + 97] = ('cd', 36).length
  require cd * ('cd', 36).length) + 36 <= calldata.size
  idx = cd[36] + 36
  s = ceil32(32 * ('cd', 4).length) + 129
  while idx < cd * ('cd', 36).length) + 36:
      mem[s] = cd[idx]
      idx = idx + 32
      s = s + 32
      continue 
  if ('cd', 4).length != ('cd', 36).length:
      revert with 0, 'ERC1155: accounts and ids length mismatch'
  if ('cd', 4).length > 18446744073709551615:
      revert with 0, 65
  mem[ceil32(32 * ('cd', 4).length) + ceil32(32 * ('cd', 36).length) + 98] = ('cd', 4).length
  if ('cd', 4).length:
      mem[ceil32(32 * ('cd', 4).length) + ceil32(32 * ('cd', 36).length) + 130 len 32 * ('cd', 4).length] = call.data[calldata.size len 32 * ('cd', 4).length]
  idx = 0
  while idx < ('cd', 4).length:
      if idx >= ('cd', 4).length:
          revert with 0, 50
      if idx >= ('cd', 36).length:
          revert with 0, 50
      if not mem[(32 * idx) + 140 len 20]:
          revert with 0, 'ERC1155: balance query for the zero address'
      mem[0] = mem[(32 * idx) + 140 len 20]
      mem[32] = sha3(mem[(32 * idx) + ceil32(32 * ('cd', 4).length) + 129], 1)
      if idx >= ('cd', 4).length:
          revert with 0, 50
      mem[(32 * idx) + ceil32(32 * ('cd', 4).length) + ceil32(32 * ('cd', 36).length) + 130] = balanceOf[mem[(32 * idx) + ceil32(32 * ('cd', 4).length) + 129]][addr(mem[(32 * idx) + 128])]
      if idx == -1:
          revert with 0, 17
      idx = idx + 1
      continue 
  return Array(len=('cd', 4).length, data=mem[ceil32(32 * ('cd', 4).length) + ceil32(32 * ('cd', 36).length) + 130 len 32 * ('cd', 4).length]), 

def purchase(uint256 _tokenId) payable: 
  require calldata.size - 4 >=′ 32
  if paused:
      revert with 0, 'Pausable: paused'
  if block.timestamp < unknown3b44c8d0:
      revert with 0, 'Purchase: window closed'
  if block.timestamp > unknown81e3d057:
      revert with 0, 'Purchase: window closed'
  if uint8(stor13.field_8) <= unknownf8685030[caller]:
      revert with 0, 'max tx amount exceeded'
  if _tokenId <= 0:
      revert with 0, 'Purchase: amount prohibited'
  if _tokenId > uint8(stor13.field_0):
      revert with 0, 'Purchase: amount prohibited'
  if storFE17 > !_tokenId:
      revert with 0, 17
  if storFE17 + _tokenId > 30000:
      revert with 0, 'Purchase: Max supply reached'
  if _tokenId and mintPrice > -1 / _tokenId:
      revert with 0, 17
  if _tokenId * mintPrice != call.value:
      revert with 0, 'Purchase: Incorrect payment'
  if unknownf8685030[caller] > -2:
      revert with 0, 17
  unknownf8685030[caller]++
  if not caller:
      revert with 0, 'ERC1155: mint to the zero address'
  mem[160] = 0
  mem[192] = 1
  mem[224] = _tokenId
  idx = 0
  while idx < 1:
      if idx >= 1:
          revert with 0, 50
      if idx >= 1:
          revert with 0, 50
      mem[0] = mem[(32 * idx) + 160]
      mem[32] = 4
      if totalSupply[mem[(32 * idx) + 160]] > !mem[(32 * idx) + 224]:
          revert with 0, 17
      totalSupply[mem[(32 * idx) + 160]] += mem[(32 * idx) + 224]
      if idx == -1:
          revert with 0, 17
      idx = idx + 1
      continue 
  if not caller:
      idx = 0
      while idx < 1:
          if idx >= 1:
              revert with 0, 50
          if idx >= 1:
              revert with 0, 50
          mem[0] = mem[(32 * idx) + 160]
          mem[32] = 4
          if totalSupply[mem[(32 * idx) + 160]] < mem[(32 * idx) + 224]:
              revert with 0, 17
          totalSupply[mem[(32 * idx) + 160]] -= mem[(32 * idx) + 224]
          if idx == -1:
              revert with 0, 17
          idx = idx + 1
          continue 
  if balanceOf[0][caller] > !_tokenId:
      revert with 0, 17
  balanceOf[0][caller] += _tokenId
  log 0xc3d58168: 0, _tokenId, caller, 0, caller
  if ext_code.size(caller):
      require ext_code.size(caller)
      call caller.0xf23a6e61 with:
           gas gas_remaining wei
          args caller, 0, 0, _tokenId, 160, 0
      if not ext_call.success:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      require return_data.size >=′ 32
      require ext_call.return_data == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
          revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
  log Purchased(
        uint256 tokenId=_tokenId,
        address owner=0,
        uint256 purchasePrice=caller)

def safeTransferFrom(address _from, address _to, uint256 _id, uint256 _value, bytes _data): # not payable
  require calldata.size - 4 >=′ 160
  require _from == _from
  require _to == _to
  require _data <= 18446744073709551615
  require _data + 35 <′ calldata.size
  if _data.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(ceil32(_data.length)) + 97 < 96 or ceil32(ceil32(_data.length)) + 97 > 18446744073709551615:
      revert with 0, 65
  require _data + _data.length + 36 <= calldata.size
  if _from != caller:
      if not stor2[addr(_from)][caller]:
          revert with 0, 'ERC1155: caller is not owner nor approved'
  if not _to:
      revert with 0, 'ERC1155: transfer to the zero address'
  mem[ceil32(ceil32(_data.length)) + 129] = _id
  mem[ceil32(ceil32(_data.length)) + 161] = 1
  mem[ceil32(ceil32(_data.length)) + 193] = _value
  if not _from:
      idx = 0
      while idx < 1:
          if idx >= 1:
              revert with 0, 50
          if idx >= 1:
              revert with 0, 50
          mem[0] = mem[(32 * idx) + ceil32(ceil32(_data.length)) + 129]
          mem[32] = 4
          if totalSupply[mem[(32 * idx) + ceil32(ceil32(_data.length)) + 129]] > !mem[(32 * idx) + ceil32(ceil32(_data.length)) + 193]:
              revert with 0, 17
          totalSupply[mem[(32 * idx) + ceil32(ceil32(_data.length)) + 129]] += mem[(32 * idx) + ceil32(ceil32(_data.length)) + 193]
          if idx == -1:
              revert with 0, 17
          idx = idx + 1
          continue 
  if not _to:
      idx = 0
      while idx < 1:
          if idx >= 1:
              revert with 0, 50
          if idx >= 1:
              revert with 0, 50
          mem[0] = mem[(32 * idx) + ceil32(ceil32(_data.length)) + 129]
          mem[32] = 4
          if totalSupply[mem[(32 * idx) + ceil32(ceil32(_data.length)) + 129]] < mem[(32 * idx) + ceil32(ceil32(_data.length)) + 193]:
              revert with 0, 17
          totalSupply[mem[(32 * idx) + ceil32(ceil32(_data.length)) + 129]] -= mem[(32 * idx) + ceil32(ceil32(_data.length)) + 193]
          if idx == -1:
              revert with 0, 17
          idx = idx + 1
          continue 
  if balanceOf[_id][addr(_from)] < _value:
      revert with 0, 'ERC1155: insufficient balance for transfer'
  balanceOf[_id][addr(_from)] -= _value
  if balanceOf[_id][_to] > !_value:
      revert with 0, 17
  balanceOf[_id][_to] += _value
  log 0xc3d58168: _id, _value, caller, _from, _to
  if ext_code.size(_to):
      require ext_code.size(_to)
      call _to.0xf23a6e61 with:
           gas gas_remaining wei
          args caller, addr(_from), _id, _value, Array(len=_data.length, data=_data[all])
      if not ext_call.success:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      require return_data.size >=′ 32
      require ext_call.return_data == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
          revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'

def unknown4bbce33f(uint256 _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  if paused:
      revert with 0, 'Pausable: paused'
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC1155: balance query for the zero address'
  if balanceOf[_param1][caller] < _param2:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'BurnCardForOther: amount not allowed'
  if _param2 <= 0:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'BurnCardForOther: amount not allowed'
  if block.timestamp < unknown7b58de8b:
      revert with 0, 'BurnCardForOther: window closed'
  if block.timestamp > unknown019863c3:
      revert with 0, 'BurnCardForOther: window closed'
  if _param1 >= unknownab8e0a29:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'BurnCardForOther: card cannot be burned'
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC1155: burn from the zero address'
  mem[128] = _param1
  mem[160] = 1
  mem[192] = _param2
  mem[224] = 0
  if not caller:
      idx = 0
      while idx < 1:
          if idx >= 1:
              revert with 0, 50
          if idx >= 1:
              revert with 0, 50
          mem[0] = mem[(32 * idx) + 128]
          mem[32] = 4
          if totalSupply[mem[(32 * idx) + 128]] > !mem[(32 * idx) + 192]:
              revert with 0, 17
          totalSupply[mem[(32 * idx) + 128]] += mem[(32 * idx) + 192]
          if idx == -1:
              revert with 0, 17
          idx = idx + 1
          continue 
  idx = 0
  while idx < 1:
      if idx >= 1:
          revert with 0, 50
      if idx >= 1:
          revert with 0, 50
      mem[0] = mem[(32 * idx) + 128]
      mem[32] = 4
      if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + 192]:
          revert with 0, 17
      totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + 192]
      if idx == -1:
          revert with 0, 17
      idx = idx + 1
      continue 
  if balanceOf[_param1][caller] < _param2:
      revert with 0, 'ERC1155: burn amount exceeds balance'
  balanceOf[_param1][caller] -= _param2
  log 0xc3d58168: _param1, _param2, caller, caller, 0
  if not caller:
      revert with 0, 'ERC1155: mint to the zero address'
  mem[320] = unknownab8e0a29
  mem[352] = 1
  mem[384] = _param2
  idx = 0
  while idx < 1:
      if idx >= 1:
          revert with 0, 50
      if idx >= 1:
          revert with 0, 50
      mem[0] = mem[(32 * idx) + 320]
      mem[32] = 4
      if totalSupply[mem[(32 * idx) + 320]] > !mem[(32 * idx) + 384]:
          revert with 0, 17
      totalSupply[mem[(32 * idx) + 320]] += mem[(32 * idx) + 384]
      if idx == -1:
          revert with 0, 17
      idx = idx + 1
      continue 
  if not caller:
      idx = 0
      while idx < 1:
          if idx >= 1:
              revert with 0, 50
          if idx >= 1:
              revert with 0, 50
          mem[0] = mem[(32 * idx) + 320]
          mem[32] = 4
          if totalSupply[mem[(32 * idx) + 320]] < mem[(32 * idx) + 384]:
              revert with 0, 17
          totalSupply[mem[(32 * idx) + 320]] -= mem[(32 * idx) + 384]
          if idx == -1:
              revert with 0, 17
          idx = idx + 1
          continue 
  if balanceOf[stor15][caller] > !_param2:
      revert with 0, 17
  balanceOf[stor15][caller] += _param2
  log 0xc3d58168: unknownab8e0a29, _param2, caller, 0, caller
  if ext_code.size(caller):
      require ext_code.size(caller)
      call caller.0xf23a6e61 with:
           gas gas_remaining wei
          args caller, 0, unknownab8e0a29, _param2, 160, 0
      if not ext_call.success:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      require return_data.size >=′ 32
      require ext_call.return_data == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
          revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
  log 0x7e3df7e1: _param2, _param1, unknownab8e0a29, caller

def name(): # not payable
  if bool(stor6.length):
      if bool(stor6.length) == uint255(stor6.length) * 0.5 < 32:
          revert with 0, 34
      if bool(stor6.length):
          if bool(stor6.length) == uint255(stor6.length) * 0.5 < 32:
              revert with 0, 34
          if Mask(256, -1, stor6.length):
              if 31 < uint255(stor6.length) * 0.5:
                  mem[128] = uint256(stor6.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor6.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor6[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor6.length), data=mem[128 len ceil32(uint255(stor6.length) * 0.5)])
              mem[128] = 256 * stor6.length.field_8
      else:
          if bool(stor6.length) == stor6.length.field_1 < 32:
              revert with 0, 34
          if stor6.length.field_1:
              if 31 < stor6.length.field_1:
                  mem[128] = uint256(stor6.field_0)
                  idx = 128
                  s = 0
                  while stor6.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor6[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor6.length), data=mem[128 len ceil32(uint255(stor6.length) * 0.5)])
              mem[128] = 256 * stor6.length.field_8
      mem[ceil32(uint255(stor6.length) * 0.5) + 192 len ceil32(uint255(stor6.length) * 0.5)] = mem[128 len ceil32(uint255(stor6.length) * 0.5)]
      if ceil32(uint255(stor6.length) * 0.5) > uint255(stor6.length) * 0.5:
          mem[ceil32(uint255(stor6.length) * 0.5) + (uint255(stor6.length) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor6.length), data=mem[128 len ceil32(uint255(stor6.length) * 0.5)], mem[(2 * ceil32(uint255(stor6.length) * 0.5)) + 192 len 2 * ceil32(uint255(stor6.length) * 0.5)]), 
  if bool(stor6.length) == stor6.length.field_1 < 32:
      revert with 0, 34
  if bool(stor6.length):
      if bool(stor6.length) == uint255(stor6.length) * 0.5 < 32:
          revert with 0, 34
      if Mask(256, -1, stor6.length):
          if 31 < uint255(stor6.length) * 0.5:
              mem[128] = uint256(stor6.field_0)
              idx = 128
              s = 0
              while (uint255(stor6.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor6[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor6.length % 128, data=mem[128 len ceil32(stor6.length.field_1)])
          mem[128] = 256 * stor6.length.field_8
  else:
      if bool(stor6.length) == stor6.length.field_1 < 32:
          revert with 0, 34
      if stor6.length.field_1:
          if 31 < stor6.length.field_1:
              mem[128] = uint256(stor6.field_0)
              idx = 128
              s = 0
              while stor6.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor6[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor6.length % 128, data=mem[128 len ceil32(stor6.length.field_1)])
          mem[128] = 256 * stor6.length.field_8
  mem[ceil32(stor6.length.field_1) + 192 len ceil32(stor6.length.field_1)] = mem[128 len ceil32(stor6.length.field_1)]
  if ceil32(stor6.length.field_1) > stor6.length.field_1:
      mem[ceil32(stor6.length.field_1) + stor6.length.field_1 + 192] = 0
  return Array(len=stor6.length % 128, data=mem[128 len ceil32(stor6.length.field_1)], mem[(2 * ceil32(stor6.length.field_1)) + 192 len 2 * ceil32(stor6.length.field_1)]), 

def symbol(): # not payable
  if bool(stor7.length):
      if bool(stor7.length) == uint255(stor7.length) * 0.5 < 32:
          revert with 0, 34
      if bool(stor7.length):
          if bool(stor7.length) == uint255(stor7.length) * 0.5 < 32:
              revert with 0, 34
          if Mask(256, -1, stor7.length):
              if 31 < uint255(stor7.length) * 0.5:
                  mem[128] = uint256(stor7.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor7.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor7[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor7.length), data=mem[128 len ceil32(uint255(stor7.length) * 0.5)])
              mem[128] = 256 * stor7.length.field_8
      else:
          if bool(stor7.length) == stor7.length.field_1 < 32:
              revert with 0, 34
          if stor7.length.field_1:
              if 31 < stor7.length.field_1:
                  mem[128] = uint256(stor7.field_0)
                  idx = 128
                  s = 0
                  while stor7.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor7[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor7.length), data=mem[128 len ceil32(uint255(stor7.length) * 0.5)])
              mem[128] = 256 * stor7.length.field_8
      mem[ceil32(uint255(stor7.length) * 0.5) + 192 len ceil32(uint255(stor7.length) * 0.5)] = mem[128 len ceil32(uint255(stor7.length) * 0.5)]
      if ceil32(uint255(stor7.length) * 0.5) > uint255(stor7.length) * 0.5:
          mem[ceil32(uint255(stor7.length) * 0.5) + (uint255(stor7.length) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor7.length), data=mem[128 len ceil32(uint255(stor7.length) * 0.5)], mem[(2 * ceil32(uint255(stor7.length) * 0.5)) + 192 len 2 * ceil32(uint255(stor7.length) * 0.5)]), 
  if bool(stor7.length) == stor7.length.field_1 < 32:
      revert with 0, 34
  if bool(stor7.length):
      if bool(stor7.length) == uint255(stor7.length) * 0.5 < 32:
          revert with 0, 34
      if Mask(256, -1, stor7.length):
          if 31 < uint255(stor7.length) * 0.5:
              mem[128] = uint256(stor7.field_0)
              idx = 128
              s = 0
              while (uint255(stor7.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor7[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor7.length % 128, data=mem[128 len ceil32(stor7.length.field_1)])
          mem[128] = 256 * stor7.length.field_8
  else:
      if bool(stor7.length) == stor7.length.field_1 < 32:
          revert with 0, 34
      if stor7.length.field_1:
          if 31 < stor7.length.field_1:
              mem[128] = uint256(stor7.field_0)
              idx = 128
              s = 0
              while stor7.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor7[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor7.length % 128, data=mem[128 len ceil32(stor7.length.field_1)])
          mem[128] = 256 * stor7.length.field_8
  mem[ceil32(stor7.length.field_1) + 192 len ceil32(stor7.length.field_1)] = mem[128 len ceil32(stor7.length.field_1)]
  if ceil32(stor7.length.field_1) > stor7.length.field_1:
      mem[ceil32(stor7.length.field_1) + stor7.length.field_1 + 192] = 0
  return Array(len=stor7.length % 128, data=mem[128 len ceil32(stor7.length.field_1)], mem[(2 * ceil32(stor7.length.field_1)) + 192 len 2 * ceil32(stor7.length.field_1)]), 

def unknown9245011d(uint256 _param1, uint256 _param2, array _param3) payable: 
  require calldata.size - 4 >=′ 96
  require _param3 <= 18446744073709551615
  require _param3 + 35 <′ calldata.size
  require _param3.length <= 18446744073709551615
  require _param3 + (32 * _param3.length) + 36 <= calldata.size
  if paused:
      revert with 0, 'Pausable: paused'
  if block.timestamp < unknown3e8d1c07:
      revert with 0, 'Early access: window closed'
  if block.timestamp > unknown81e3d057:
      revert with 0, 'Early access: window closed'
  if storFE17 > !_param1:
      revert with 0, 17
  if storFE17 + _param1 > 20380:
      revert with 0, 'Early access: max supply reached'
  mem[0] = caller
  mem[32] = 22
  if uint8(stor13.field_16) <= unknownf8685030[caller]:
      revert with 0, 'max tx amount exceeded'
  mem[128] = _param2
  mem[160] = caller
  mem[180] = 2
  mem[96] = 84
  mem[64] = (32 * _param3.length) + 244
  mem[212] = _param3.length
  mem[244 len 32 * _param3.length] = call.data[_param3 + 36 len 32 * _param3.length]
  mem[(32 * _param3.length) + 244] = 0
  idx = 0
  s = 0
  while idx < _param3.length:
      if idx >= mem[212]:
          revert with 0, 50
      _202 = mem[(32 * idx) + 244]
      if s + sha3(mem[128 len 84]) > mem[(32 * idx) + 244]:
          mem[mem[64] + 32] = mem[(32 * idx) + 244]
          mem[mem[64] + 64] = s + sha3(mem[128 len 84])
          _204 = mem[64]
          mem[mem[64]] = 64
          mem[64] = mem[64] + 96
          if idx == -1:
              revert with 0, 17
          idx = idx + 1
          s = sha3(mem[_204 + 32 len mem[_204]])
          continue 
      mem[mem[64] + 32] = s + sha3(mem[128 len 84])
      mem[mem[64] + 64] = _202
      _208 = mem[64]
      mem[mem[64]] = 64
      mem[64] = mem[64] + 96
      if idx == -1:
          revert with 0, 17
      idx = idx + 1
      s = sha3(mem[_208 + 32 len mem[_208]])
      continue 
  if s != unknown2eb4a7ab:
      revert with 0, 'MerkleDistributor: Invalid proof.'
  if _param1 <= 0:
      revert with 0, 'Purchase: amount prohibited'
  if _param1 > uint8(stor13.field_0):
      revert with 0, 'Purchase: amount prohibited'
  if storFE17 > !_param1:
      revert with 0, 17
  if storFE17 + _param1 > 30000:
      revert with 0, 'Purchase: Max supply reached'
  if _param1 and mintPrice > -1 / _param1:
      revert with 0, 17
  if _param1 * mintPrice != call.value:
      revert with 0, 'Purchase: Incorrect payment'
  mem[0] = caller
  mem[32] = 22
  if unknownf8685030[caller] > -2:
      revert with 0, 17
  unknownf8685030[caller]++
  _224 = mem[64]
  mem[64] = mem[64] + 32
  mem[_224] = 0
  if not caller:
      revert with 0, 'ERC1155: mint to the zero address'
  _226 = mem[64]
  mem[mem[64]] = 1
  mem[64] = mem[64] + 64
  if 0 >= mem[_226]:
      revert with 0, 50
  mem[_226 + 32] = 0
  mem[_226 + 64] = 1
  mem[64] = _226 + 128
  mem[_226 + 96] = _param1
  _381 = mem[_226]
  idx = 0
  while idx < _381:
      if idx >= 1:
          revert with 0, 50
      if idx >= mem[_226]:
          revert with 0, 50
      mem[0] = mem[(32 * idx) + _226 + 32]
      mem[32] = 4
      if totalSupply[mem[0]] > !mem[(32 * idx) + _226 + 96]:
          revert with 0, 17
      totalSupply[mem[0]] += mem[(32 * idx) + _226 + 96]
      if idx == -1:
          revert with 0, 17
      idx = idx + 1
      continue 
  if caller:
      mem[0] = caller
      mem[32] = sha3(0, 1)
      if balanceOf[0][caller] > !_param1:
          revert with 0, 17
      balanceOf[0][caller] += _param1
      log 0xc3d58168: 0, _param1, caller, 0, caller
      if ext_code.size(caller):
          mem[_226 + 128] = 0xf23a6e6100000000000000000000000000000000000000000000000000000000
          mem[_226 + 132] = caller
          mem[_226 + 164] = 0
          mem[_226 + 196] = 0
          mem[_226 + 228] = _param1
          mem[_226 + 260] = 160
          _404 = mem[_224]
          mem[_226 + 292] = mem[_224]
          mem[_226 + 324 len ceil32(_404)] = mem[_224 + 32 len ceil32(_404)]
          if ceil32(_404) > _404:
              mem[_226 + _404 + 324] = 0
          require ext_code.size(caller)
          call caller.0xf23a6e61 with:
               gas gas_remaining wei
              args caller, 0, 0, _param1, 160, mem[_226 + 292 len ceil32(_404) + 32]
          if not ext_call.success:
              revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
          require return_data.size >=′ 32
          require ext_call.return_data == Mask(32, 224, ext_call.return_data[0])
          if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
              revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
  else:
      _531 = mem[_226]
      idx = 0
      while idx < _531:
          if idx >= 1:
              revert with 0, 50
          if idx >= mem[_226]:
              revert with 0, 50
          mem[0] = mem[(32 * idx) + _226 + 32]
          mem[32] = 4
          if totalSupply[mem[0]] < mem[(32 * idx) + _226 + 96]:
              revert with 0, 17
          totalSupply[mem[0]] -= mem[(32 * idx) + _226 + 96]
          if idx == -1:
              revert with 0, 17
          _531 = mem[_226]
          idx = idx + 1
          continue 
      mem[0] = caller
      mem[32] = sha3(0, 1)
      if balanceOf[0][caller] > !_param1:
          revert with 0, 17
      balanceOf[0][caller] += _param1
      log 0xc3d58168: 0, _param1, caller, 0, caller
      if ext_code.size(caller):
          mem[_226 + 128] = 0xf23a6e6100000000000000000000000000000000000000000000000000000000
          mem[_226 + 132] = caller
          mem[_226 + 164] = 0
          mem[_226 + 196] = 0
          mem[_226 + 228] = _param1
          mem[_226 + 260] = 160
          _553 = mem[_224]
          mem[_226 + 292] = mem[_224]
          mem[_226 + 324 len ceil32(_553)] = mem[_224 + 32 len ceil32(_553)]
          if ceil32(_553) > _553:
              mem[_226 + _553 + 324] = 0
          require ext_code.size(caller)
          call caller.0xf23a6e61 with:
               gas gas_remaining wei
              args caller, 0, 0, _param1, 160, mem[_226 + 292 len ceil32(_553) + 32]
          if not ext_call.success:
              revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
          require return_data.size >=′ 32
          require ext_call.return_data == Mask(32, 224, ext_call.return_data[0])
          if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
              revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
  log Purchased(
        uint256 tokenId=_param1,
        address owner=0,
        uint256 purchasePrice=caller)

def unknown6b20c454(): # not payable
  require calldata.size - 4 >=′ 96
  require cd == addr(cd)
  require cd <= 18446744073709551615
  require cd <′ calldata.size
  if ('cd', 36).length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * ('cd', 36).length) + 97 < 96 or ceil32(32 * ('cd', 36).length) + 97 > 18446744073709551615:
      revert with 0, 65
  mem[96] = ('cd', 36).length
  require cd * ('cd', 36).length) + 36 <= calldata.size
  idx = cd[36] + 36
  s = 128
  while idx < cd * ('cd', 36).length) + 36:
      mem[s] = cd[idx]
      idx = idx + 32
      s = s + 32
      continue 
  require cd <= 18446744073709551615
  require cd <′ calldata.size
  if ('cd', 68).length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * ('cd', 68).length) + 98 < 97 or ceil32(32 * ('cd', 36).length) + ceil32(32 * ('cd', 68).length) + 98 > 18446744073709551615:
      revert with 0, 65
  mem[ceil32(32 * ('cd', 36).length) + 97] = ('cd', 68).length
  require cd * ('cd', 68).length) + 36 <= calldata.size
  idx = cd[68] + 36
  s = ceil32(32 * ('cd', 36).length) + 129
  while idx < cd * ('cd', 68).length) + 36:
      mem[s] = cd[idx]
      idx = idx + 32
      s = s + 32
      continue 
  if block.timestamp > unknown81e3d057:
      if caller == addr(cd):
          if not addr(cd):
              revert with 0, 'ERC1155: burn from the zero address'
          if ('cd', 36).length != ('cd', 68).length:
              revert with 0, 'ERC1155: ids and amounts length mismatch'
          mem[ceil32(32 * ('cd', 36).length) + ceil32(32 * ('cd', 68).length) + 98] = 0
          if addr(cd):
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if balanceOf[mem[(32 * idx) + 128]][addr(cd)] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 'ERC1155: burn amount exceeds balance'
                  mem[0] = addr(cd)
                  mem[32] = sha3(mem[(32 * idx) + 128], 1)
                  balanceOf[mem[(32 * idx) + 128]][addr(cd)] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              var62001 = ('cd', 36).length
              var67001 = ('cd', 68).length
          else:
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] > !mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] += mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if balanceOf[mem[(32 * idx) + 128]][addr(cd)] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 'ERC1155: burn amount exceeds balance'
                  mem[0] = addr(cd)
                  mem[32] = sha3(mem[(32 * idx) + 128], 1)
                  balanceOf[mem[(32 * idx) + 128]][addr(cd)] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              var66001 = ('cd', 36).length
      else:
          if not stor2[addr(cd)][caller]:
              revert with 0, 'ERC1155: caller is not owner nor approved'
          if not addr(cd):
              revert with 0, 'ERC1155: burn from the zero address'
          if ('cd', 36).length != ('cd', 68).length:
              revert with 0, 'ERC1155: ids and amounts length mismatch'
          mem[ceil32(32 * ('cd', 36).length) + ceil32(32 * ('cd', 68).length) + 98] = 0
          if addr(cd):
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if balanceOf[mem[(32 * idx) + 128]][addr(cd)] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 'ERC1155: burn amount exceeds balance'
                  mem[0] = addr(cd)
                  mem[32] = sha3(mem[(32 * idx) + 128], 1)
                  balanceOf[mem[(32 * idx) + 128]][addr(cd)] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              var64001 = ('cd', 36).length
              var69001 = ('cd', 68).length
          else:
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] > !mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] += mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if balanceOf[mem[(32 * idx) + 128]][addr(cd)] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 'ERC1155: burn amount exceeds balance'
                  mem[0] = addr(cd)
                  mem[32] = sha3(mem[(32 * idx) + 128], 1)
                  balanceOf[mem[(32 * idx) + 128]][addr(cd)] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              var68001 = ('cd', 36).length
  else:
      if storFE17 != 30000:
          revert with 0, 'Burn: not allowed during sale'
      if caller == addr(cd):
          if not addr(cd):
              revert with 0, 'ERC1155: burn from the zero address'
          if ('cd', 36).length != ('cd', 68).length:
              revert with 0, 'ERC1155: ids and amounts length mismatch'
          mem[ceil32(32 * ('cd', 36).length) + ceil32(32 * ('cd', 68).length) + 98] = 0
          if addr(cd):
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if balanceOf[mem[(32 * idx) + 128]][addr(cd)] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 'ERC1155: burn amount exceeds balance'
                  mem[0] = addr(cd)
                  mem[32] = sha3(mem[(32 * idx) + 128], 1)
                  balanceOf[mem[(32 * idx) + 128]][addr(cd)] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              var63001 = ('cd', 36).length
              var68001 = ('cd', 68).length
          else:
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] > !mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] += mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if balanceOf[mem[(32 * idx) + 128]][addr(cd)] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 'ERC1155: burn amount exceeds balance'
                  mem[0] = addr(cd)
                  mem[32] = sha3(mem[(32 * idx) + 128], 1)
                  balanceOf[mem[(32 * idx) + 128]][addr(cd)] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              var67001 = ('cd', 36).length
      else:
          if not stor2[addr(cd)][caller]:
              revert with 0, 'ERC1155: caller is not owner nor approved'
          if not addr(cd):
              revert with 0, 'ERC1155: burn from the zero address'
          if ('cd', 36).length != ('cd', 68).length:
              revert with 0, 'ERC1155: ids and amounts length mismatch'
          mem[ceil32(32 * ('cd', 36).length) + ceil32(32 * ('cd', 68).length) + 98] = 0
          if addr(cd):
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if balanceOf[mem[(32 * idx) + 128]][addr(cd)] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 'ERC1155: burn amount exceeds balance'
                  mem[0] = addr(cd)
                  mem[32] = sha3(mem[(32 * idx) + 128], 1)
                  balanceOf[mem[(32 * idx) + 128]][addr(cd)] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              var65001 = ('cd', 36).length
              var70001 = ('cd', 68).length
          else:
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] > !mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] += mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 4
                  if totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 17
                  totalSupply[mem[(32 * idx) + 128]] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              idx = 0
              while idx < ('cd', 36).length:
                  if idx >= ('cd', 36).length:
                      revert with 0, 50
                  if idx >= ('cd', 68).length:
                      revert with 0, 50
                  if balanceOf[mem[(32 * idx) + 128]][addr(cd)] < mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]:
                      revert with 0, 'ERC1155: burn amount exceeds balance'
                  mem[0] = addr(cd)
                  mem[32] = sha3(mem[(32 * idx) + 128], 1)
                  balanceOf[mem[(32 * idx) + 128]][addr(cd)] -= mem[(32 * idx) + ceil32(32 * ('cd', 36).length) + 129]
                  if idx == -1:
                      revert with 0, 17
                  idx = idx + 1
                  continue 
              var69001 = ('cd', 36).length
  log 0x4a39dc06: Array(len=('cd', 36).length, data=memem[ceil32(32 * ('cd', 36).length) + 129 len 32 * ('cd', 68).length]), (32 * ('cd', 36).length) + 96, caller, addr(cd

