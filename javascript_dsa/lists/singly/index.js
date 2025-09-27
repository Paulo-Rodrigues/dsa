class ListNode {
  constructor(value, next = null) {
    this.value = value
    this.next = next
  }
}
class Singly {
  constructor() {
    this.head = null
    this.tail = null
    this.size = 0
  }

  push(value) {
    const new_node = new ListNode(value)

    if (this.isEmpty()) {
      this.head = new_node
      this.tail = new_node
    } else {
      this.tail.next = new_node
      this.tail = new_node
    }

    this.size += 1
  }

  pop() {
    if (this.isEmpty()) return null

    if (this.head === this.tail) {
      this.head = null
      this.tail = null
    } else {
      let current = this.head

      while (current.next !== this.tail) {
        current = current.next
      }

      current.next = null
      this.tail = current
    }

    this.size -= 1
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
    let prev = null
    let current = this.head

    while (current) {
      let temp = current.next
      current.next = prev
      prev = current
      current = temp
    }

    [this.head, this.tail] = [this.tail, this.head]
  }

  isEmpty() {
    return this.head === null && this.tail === null && this.size === 0
  }
}

export default Singly

