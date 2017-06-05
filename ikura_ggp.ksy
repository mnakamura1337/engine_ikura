meta:
  id: ikura_ggp
  endian: le
  file-extension: ggp
seq:
  - id: magic
    contents: GGPFAIKE
  - id: bit_depth
    type: u4
  - id: xor_key
    size: 8
    process: xor([71, 71, 80, 70, 65, 73, 75, 69]) # = "GGPFAIKE"
  - id: ofs_img
    type: u4
  - id: len_img
    type: u4
  - id: ofs_regions
    type: u4
  - id: len_regions
    type: u4
instances:
  img:
    pos: ofs_img
    size: len_img
    process: xor(xor_key)
  regions:
    pos: ofs_regions
    size: len_regions
