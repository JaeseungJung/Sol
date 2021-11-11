#
#  Panoramix v4 Oct 2019 
#  Decompiled source of bsc:0x16729528002F37922b79795c732d28FEEe682698
# 
#  Let's make the world open source 
# 
#
#  I failed with these: 
#  - unknownca87928a(?)
#  All the rest is below.
#
# https://bscscan.com/address/0x16729528002f37922b79795c732d28feee682698#code

const getTime = block.timestamp

def storage:
  owner is addr at storage 0
  stor1 is uint256 at storage 1
  unknown1c9c4197Address is addr at storage 2
  unknown5f16ec52Address is addr at storage 3
  tokenAddress is addr at storage 4
  tokenReward is uint256 at storage 5
  unknowndaff1b07 is uint256 at storage 6
  unknown6517a034 is uint256 at storage 7
  unknown2116ecff is array of uint256 at storage 8
  unknowna7be0d8c is uint256 at storage 9
  unknown4b3e0509 is uint256 at storage 10
  unknown72806bdd is uint256 at storage 11
  unknown13beb28e is uint256 at storage 12
  unknownda6ffda7 is uint256 at storage 13
  startTime is uint256 at storage 14
  period is uint256 at storage 15
  unknownb7ed646d is uint256 at storage 16
  unknownb1c94d94 is uint256 at storage 17
  unknown040cb859 is uint256 at storage 18
  unknown2f1141b8 is uint256 at storage 19
  isStart is uint8 at storage 20
  unknownb231f172 is array of uint256 at storage 21

def unknown040cb859() payable: 
  return unknown040cb859

def unknown13beb28e() payable: 
  return unknown13beb28e

def unknown1c9c4197() payable: 
  return unknown1c9c4197Address

def unknown2116ecff(uint256 _param1) payable: 
  require calldata.size - 4 >= 32
  require _param1 < unknown2116ecff.length
  return unknown2116ecff[_param1]

def unknown2f1141b8() payable: 
  return unknown2f1141b8

def unknown4b3e0509() payable: 
  return unknown4b3e0509

def unknown5f16ec52() payable: 
  return unknown5f16ec52Address

def unknown6517a034() payable: 
  return unknown6517a034

def tokenReward() payable: 
  return tokenReward

def unknown72806bdd() payable: 
  return unknown72806bdd

def startTime() payable: 
  return startTime

def isStart() payable: 
  return bool(isStart)

def owner() payable: 
  return owner

def unknowna7be0d8c() payable: 
  return unknowna7be0d8c

def unknownb1c94d94() payable: 
  return unknownb1c94d94

def unknownb231f172(addr _param1, uint256 _param2) payable: 
  require calldata.size - 4 >= 64
  require _param2 < unknownb231f172[_param1]
  return unknownb231f172[_param1][_param2]

def unknownb7ed646d() payable: 
  return unknownb7ed646d

def unknownda6ffda7() payable: 
  return unknownda6ffda7

def unknowndaff1b07() payable: 
  return unknowndaff1b07

def period() payable: 
  return period

def token() payable: 
  return tokenAddress

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def setEnd() payable: 
  if owner != caller:
      revert with 0, '"Ownable: caller is not the owne'
  isStart = 0

def setStart() payable: 
  if owner != caller:
      revert with 0, '"Ownable: caller is not the owne'
  isStart = 1

def unknownc352a349() payable: 
  return unknowna7be0d8c, unknown4b3e0509, unknown13beb28e, unknownda6ffda7, startTime, unknown040cb859

def transferOwnership(address _newOwner) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, '"Ownable: caller is not the owne'
  if _newOwner:
      owner = _newOwner

def unknown13dfa182() payable: 
  if unknown72806bdd >= unknown4b3e0509:
      return 0
  if unknown72806bdd > unknown4b3e0509:
      revert with 0, 'SafeMath: subtraction overflow'
  return (unknown4b3e0509 - unknown72806bdd)

def getTokenBalance() payable: 
  require ext_code.size(tokenAddress)
  static call tokenAddress.balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  return ext_call.return_data[0]

def unknowna8b78ed0() payable: 
  if owner != caller:
      revert with 0, '"Ownable: caller is not the owne'
  stor1++
  unknown13beb28e = sha3(block.hash(block.number), block.timestamp, stor1) % 28
  stor1++
  unknownda6ffda7 = sha3(block.hash(block.number), block.timestamp, stor1) % 28
  startTime = block.timestamp
  unknown2f1141b8 = block.timestamp
  isStart = 1
  log 0x4dedf145: 1

def withdrawToken(uint256 _amount) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, '"Ownable: caller is not the owne'
  require ext_code.size(tokenAddress)
  call tokenAddress.transfer(address to, uint256 value) with:
       gas gas_remaining wei
      args owner, _amount
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32

def unknown3d8efb4c() payable: 
  require not isStart
  idx = 0
  while idx < unknownb231f172[caller]:
      require idx < unknownb231f172[caller]
      mem[96] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000
      mem[100] = caller
      mem[132] = unknownb231f172[caller][idx]
      require ext_code.size(unknown1c9c4197Address)
      call unknown1c9c4197Address.transfer(address to, uint256 value) with:
           gas gas_remaining wei
          args caller, unknownb231f172[caller][idx]
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      mem[0] = caller
      mem[32] = 21
      idx = idx + 1
      continue 
  unknownb231f172[caller] = 0
  idx = 0
  while unknownb231f172[caller] > idx:
      unknownb231f172[caller][idx] = 0
      idx = idx + 1
      continue 

def unknown2e5970c2(uint256 _param1) payable: 
  require calldata.size - 4 >= 32
  mem[96] = 0x59d5519400000000000000000000000000000000000000000000000000000000
  mem[100] = _param1
  require ext_code.size(unknown1c9c4197Address)
  static call unknown1c9c4197Address.getPet(uint256 id) with:
          gas gas_remaining wei
         args _param1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[96 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = ceil32(return_data.size) + 96
  require return_data.size >= 352
  _13 = mem[384]
  require mem[384] <= 4294967296
  require mem[384] + 32 <= return_data.size
  require return_data.size >= mem[mem[384] + 96] + mem[384] + 32 and mem[mem[384] + 96] <= 4294967296
  mem[ceil32(return_data.size) + 96] = mem[mem[384] + 96]
  _16 = mem[_13 + 96]
  mem[ceil32(return_data.size) + 128 len ceil32(mem[_13 + 96])] = mem[_13 + 128 len ceil32(mem[_13 + 96])]
  if not _16 % 32:
      idx = 0
      s = 0
      while idx < mem[ceil32(return_data.size) + 96]:
          require idx < mem[ceil32(return_data.size) + 96]
          if uint8(mem[idx + ceil32(return_data.size) + 128]) >> 248 < 48:
              idx = idx + 1
              s = s
              continue 
          if uint8(mem[idx + ceil32(return_data.size) + 128]) >> 248 > 57:
              idx = idx + 1
              s = s
              continue 
          idx = idx + 1
          s = (10 * s) + (uint8(mem[idx + ceil32(return_data.size) + 128]) >> 248) - 48
          continue 
      mem[_16 + ceil32(return_data.size) + 128] = 0x61a7690000000000000000000000000000000000000000000000000000000000
      mem[_16 + ceil32(return_data.size) + 132] = s
      require ext_code.size(unknown5f16ec52Address)
      static call unknown5f16ec52Address.0x61a76900 with:
              gas gas_remaining wei
             args s
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      mem[_16 + ceil32(return_data.size) + 128 len return_data.size] = ext_call.return_data[0 len return_data.size]
      mem[64] = _16 + (2 * ceil32(return_data.size)) + 128
      require return_data.size >= 32
      _133 = mem[_16 + ceil32(return_data.size) + 128 len 4], Mask(224, 32, s) >> 32
      require mem[_16 + ceil32(return_data.size) + 128 len 4], Mask(224, 32, s) >> 32 <= 4294967296
      require mem[_16 + ceil32(return_data.size) + 128 len 4], Mask(224, 32, s) >> 32 + 32 <= return_data.size
      require mem[_16 + ceil32(return_data.size) + mem[_16 + ceil32(return_data.size) + 128 len 4], Mask(224, 32, s) >> 32 + 128] <= 4294967296 and mem[_16 + ceil32(return_data.size) + 128 len 4], Mask(224, 32, s) >> 32 + (32 * mem[_16 + ceil32(return_data.size) + mem[_16 + ceil32(return_data.size) + 128 len 4], Mask(224, 32, s) >> 32 + 128]) + 32 <= return_data.size
      mem[_16 + (2 * ceil32(return_data.size)) + 128] = mem[_16 + ceil32(return_data.size) + mem[_16 + ceil32(return_data.size) + 128 len 4], Mask(224, 32, s) >> 32 + 128]
      mem[_16 + (2 * ceil32(return_data.size)) + 160 len floor32(mem[_16 + ceil32(return_data.size) + _133 + 128])] = mem[_16 + ceil32(return_data.size) + _133 + 160 len floor32(mem[_16 + ceil32(return_data.size) + _133 + 128])]
      require unknown13beb28e < mem[_16 + (2 * ceil32(return_data.size)) + 128]
      if mem[(32 * unknown13beb28e) + _16 + (2 * ceil32(return_data.size)) + 191 len 1] < unknownda6ffda7:
          return 0
      require unknown13beb28e + 2 < mem[_16 + (2 * ceil32(return_data.size)) + 128]
      if mem[(32 * unknown13beb28e + 2) + _16 + (2 * ceil32(return_data.size)) + 191 len 1] < unknownda6ffda7:
          return 0
      require unknown13beb28e + 3 < mem[_16 + (2 * ceil32(return_data.size)) + 128]
      if mem[(32 * unknown13beb28e + 3) + _16 + (2 * ceil32(return_data.size)) + 191 len 1] < unknownda6ffda7:
          return 0
  else:
      mem[floor32(_16) + ceil32(return_data.size) + 128] = mem[floor32(_16) + ceil32(return_data.size) + -(_16 % 32) + 160 len _16 % 32]
      idx = 0
      s = 0
      while idx < mem[ceil32(return_data.size) + 96]:
          require idx < mem[ceil32(return_data.size) + 96]
          if uint8(mem[idx + ceil32(return_data.size) + 128]) >> 248 < 48:
              idx = idx + 1
              s = s
              continue 
          if uint8(mem[idx + ceil32(return_data.size) + 128]) >> 248 > 57:
              idx = idx + 1
              s = s
              continue 
          idx = idx + 1
          s = (10 * s) + (uint8(mem[idx + ceil32(return_data.size) + 128]) >> 248) - 48
          continue 
      mem[floor32(_16) + ceil32(return_data.size) + 160] = 0x61a7690000000000000000000000000000000000000000000000000000000000
      mem[floor32(_16) + ceil32(return_data.size) + 164] = s
      require ext_code.size(unknown5f16ec52Address)
      static call unknown5f16ec52Address.0x61a76900 with:
              gas gas_remaining wei
             args s
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      mem[floor32(_16) + ceil32(return_data.size) + 160 len return_data.size] = ext_call.return_data[0 len return_data.size]
      mem[64] = floor32(_16) + (2 * ceil32(return_data.size)) + 160
      require return_data.size >= 32
      _135 = mem[floor32(_16) + ceil32(return_data.size) + 160 len 4], Mask(224, 32, s) >> 32
      require mem[floor32(_16) + ceil32(return_data.size) + 160 len 4], Mask(224, 32, s) >> 32 <= 4294967296
      require mem[floor32(_16) + ceil32(return_data.size) + 160 len 4], Mask(224, 32, s) >> 32 + 32 <= return_data.size
      require mem[floor32(_16) + ceil32(return_data.size) + mem[floor32(_16) + ceil32(return_data.size) + 160 len 4], Mask(224, 32, s) >> 32 + 160] <= 4294967296 and mem[floor32(_16) + ceil32(return_data.size) + 160 len 4], Mask(224, 32, s) >> 32 + (32 * mem[floor32(_16) + ceil32(return_data.size) + mem[floor32(_16) + ceil32(return_data.size) + 160 len 4], Mask(224, 32, s) >> 32 + 160]) + 32 <= return_data.size
      mem[floor32(_16) + (2 * ceil32(return_data.size)) + 160] = mem[floor32(_16) + ceil32(return_data.size) + mem[floor32(_16) + ceil32(return_data.size) + 160 len 4], Mask(224, 32, s) >> 32 + 160]
      mem[floor32(_16) + (2 * ceil32(return_data.size)) + 192 len floor32(mem[floor32(_16) + ceil32(return_data.size) + _135 + 160])] = mem[floor32(_16) + ceil32(return_data.size) + _135 + 192 len floor32(mem[floor32(_16) + ceil32(return_data.size) + _135 + 160])]
      require unknown13beb28e < mem[floor32(_16) + (2 * ceil32(return_data.size)) + 160]
      if mem[(32 * unknown13beb28e) + floor32(_16) + (2 * ceil32(return_data.size)) + 223 len 1] < unknownda6ffda7:
          return 0
      require unknown13beb28e + 2 < mem[floor32(_16) + (2 * ceil32(return_data.size)) + 160]
      if mem[(32 * unknown13beb28e + 2) + floor32(_16) + (2 * ceil32(return_data.size)) + 223 len 1] < unknownda6ffda7:
          return 0
      require unknown13beb28e + 3 < mem[floor32(_16) + (2 * ceil32(return_data.size)) + 160]
      if mem[(32 * unknown13beb28e + 3) + floor32(_16) + (2 * ceil32(return_data.size)) + 223 len 1] < unknownda6ffda7:
          return 0
  return 1
