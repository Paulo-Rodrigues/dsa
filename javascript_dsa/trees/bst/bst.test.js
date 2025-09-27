import { beforeEach, describe, it } from "node:test"
import assert from "node:assert"
import BST from "./index.js"

describe("BST", () => {
  let tree;

  beforeEach(() => {
    tree = new BST()
  })

  describe("isEmpty", () => {
    it("return true", () => {
      assert.strictEqual(tree.isEmpty(), true)
    })
  })

  describe("insert", () => {
    it("on empty tree", () => {
      tree.insert(2)

      assert.strictEqual(tree.isEmpty(), false)
      assert.strictEqual(tree.root.value, 2)
      assert.strictEqual(tree.root.left, null)
      assert.strictEqual(tree.root.right, null)
    })

    it("on non empty tree left", () => {
      tree.insert(20)
      tree.insert(15)
      tree.insert(10)

      assert.strictEqual(tree.isEmpty(), false)
      assert.strictEqual(tree.root.value, 20)
      assert.strictEqual(tree.root.left.value, 15)
      assert.strictEqual(tree.root.left.left.value, 10)
      assert.strictEqual(tree.root.right, null)
    })

    it("on non empty tree right", () => {
      tree.insert(20)
      tree.insert(30)
      tree.insert(40)

      assert.strictEqual(tree.isEmpty(), false)
      assert.strictEqual(tree.root.value, 20)
      assert.strictEqual(tree.root.right.value, 30)
      assert.strictEqual(tree.root.right.right.value, 40)
      assert.strictEqual(tree.root.left, null)
    })

    it("complete tree", () => {
      tree.insert(20)
      tree.insert(30)
      tree.insert(40)
      tree.insert(15)
      tree.insert(10)

      assert.strictEqual(tree.isEmpty(), false)
      assert.strictEqual(tree.root.value, 20)
      assert.strictEqual(tree.root.right.value, 30)
      assert.strictEqual(tree.root.right.right.value, 40)
      assert.strictEqual(tree.root.left.value, 15)
      assert.strictEqual(tree.root.left.left.value, 10)
    })
  })

  describe("search", () => {
    it("return null on empty tree", () => {
      assert.strictEqual(tree.search(2), null)
    })

    it("found value", () => {
      tree.insert(20)
      tree.insert(30)
      tree.insert(40)
      tree.insert(15)
      tree.insert(10)

      const result = tree.search(15)

      assert.strictEqual(result.value, 15)
    })

    it("not found value", () => {
      tree.insert(20)
      tree.insert(30)
      tree.insert(40)
      tree.insert(15)
      tree.insert(10)

      const result = tree.search(50)

      assert.strictEqual(result, false)
    })
  })

  describe("traversals", () => {
    it("inOrder", () => {
      const expected = [10, 15, 20, 30, 40]

      tree.insert(20)
      tree.insert(30)
      tree.insert(40)
      tree.insert(15)
      tree.insert(10)

      assert.strictEqual(tree.inOrder(), expected)
    })
  })
})
