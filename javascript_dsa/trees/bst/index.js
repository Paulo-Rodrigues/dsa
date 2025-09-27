class TreeNode {
  constructor(value) {
    this.value = value
    this.left = null
    this.right = null
  }
}

class BST {
  constructor() {
    this.root = null
  }

  insert(value) {
    const new_node = new TreeNode(value)
    if (this.isEmpty()) return this.root = new_node

    let current = this.root

    while (current) {
      if (value < current.value) {
        if (current.left) {
          current = current.left
        } else {
          current.left = new_node
          break
        }
      }

      if (value > current.value) {
        if (current.right) {
          current = current.right
        } else {
          current.right = new_node
          break
        }
      }
    }
  }

  search(value) {
    if (this.isEmpty()) return null

    let current = this.root

    while (current) {
      if (value === current.value) return current

      if (value < current.value) {
        current = current.left
      } else {
        current.right
      }
    }

    return false
  }

  inOrder(current = this.root, result = []) {
    if (current === null) return result

    inOrder(current.left, result)
    result.push(current.value)
    inOrder(current.right, result)

    result
  }

  isEmpty() {
    return this.root === null
  }
}

export default BST
