class DoublyNode {
  constructor(value, next = null, prev = null) {
    this.value = value
    this.next = next
    this.prev = prev
  }
}

class Doubly {
  constructor() {
    this.head = null
    this.tail = null
    this.size = 0
  }

  push(value) {
    const new_node = new DoublyNode(value)

    if (this.isEmpty()) {
      this.head = new_node
      this.tail = new_node
    } else {
      new_node.prev = this.tail
      this.tail.next = new_node
      this.tail = new_node
    }

    this.size += 1
  }

  pop() {
    if (this.isEmpty()) return null

    const removed_value = this.tail.value

    if (this.head === this.tail) {
      this.head = null
      this.tail = null
    } else {
      this.tail = this.tail.prev
      this.tail.next = null
    }

    this.size -= 1
    return removed_value
  }

  search(value) {
    if (this.isEmpty()) return null

    let current = this.head
    while (current) {
      if (value === current.value) return current
      current = current.next
    }
    return null
  }

  invert() {
    let current = this.head
    while (current) {
      let temp = current.next
      current.next = current.prev
      current.prev = temp
      current = temp
    }

    [this.head, this.tail] = [this.tail, this.head]
  }

  isEmpty() {
    return this.head === null && this.tail === null && this.size === 0
  }
}

export default Doubly
