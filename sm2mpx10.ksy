meta:
  id: sm2mpx10
  endian: le
seq:
  - id: header
    type: header
  - id: index
    size: header.index_size - header.header_size
    type: index
types:
  header:
    seq:
      - id: magic
        contents: "SM2MPX10"
      - id: num_files
        type: u4
      - id: index_size
        type: u4
      - id: archive_name
        type: str
        size: 12
        encoding: SJIS
      - id: header_size
        type: u4
  index:
    seq:
      - id: entries
        type: index_entry
        repeat: eos
  index_entry:
    seq:
      - id: filename
        type: str
        size: 12
        encoding: SJIS
        pad-right: 0
      - id: offset
        type: u4
      - id: size
        type: u4
    instances:
      body:
        io: _root._io
        pos: offset
        size: size
