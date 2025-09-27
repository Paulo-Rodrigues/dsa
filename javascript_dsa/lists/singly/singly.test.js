import { beforeEach, describe, it } from "node:test"
import assert from "node:assert"
import Singly from "./index.js"

describe("Singly Linked List", () => {
  let list;

  beforeEach(() => {
    list = new Singly()
  })

  describe("isEmpty", () => {
    it("return true", () => {
      assert.strictEqual(list.isEmpty(), true)
    })
  })

  describe("push", () => {
    it("on empty list", () => {
      list.push(2)

      assert.strictEqual(list.isEmpty(), false)
      assert.strictEqual(list.head.value, 2)
      assert.strictEqual(list.tail.value, 2)
      assert.strictEqual(list.size, 1)
    })

    it("on non empty list", () => {
      list.push(2)
      list.push(3)
      list.push(4)

      assert.strictEqual(list.isEmpty(), false)
      assert.strictEqual(list.head.value, 2)
      assert.strictEqual(list.head.next.value, 3)
      assert.strictEqual(list.tail.value, 4)
      assert.strictEqual(list.size, 3)
    })
  })

  describe("pop", () => {
    it("on empty list", () => {
      assert.strictEqual(list.pop(), null)
    })

    it("when head === tail", () => {
      list.push(2)

      list.pop()

      assert.strictEqual(list.isEmpty(), true)
      assert.strictEqual(list.head, null)
      assert.strictEqual(list.tail, null)
      assert.strictEqual(list.size, 0)
    })

    it("removes from the end", () => {
      list.push(2)
      list.push(3)
      list.push(4)

      list.pop()

      assert.strictEqual(list.isEmpty(), false)
      assert.strictEqual(list.head.value, 2)
      assert.strictEqual(list.head.next.value, 3)
      assert.strictEqual(list.tail.value, 3)
      assert.strictEqual(list.size, 2)
    })
  })

  describe("search", () => {
    it("on empty list", () => {
      assert.strictEqual(list.search(2), null)
    })

    it("found value", () => {
      list.push(2)
      list.push(3)
      list.push(4)
      list.push(5)

      const result = list.search(4)

      assert.strictEqual(result.value, 4)
    })

    it("not found value", () => {
      list.push(2)
      list.push(3)
      list.push(4)
      list.push(5)

      const result = list.search(6)

      assert.strictEqual(result, null)
    })
  })

  describe("invert", () => {
    it("in-place", () => {
      list.push(2)
      list.push(3)
      list.push(4)

      list.invert()

      assert.strictEqual(list.isEmpty(), false)
      assert.strictEqual(list.head.value, 4)
      assert.strictEqual(list.head.next.value, 3)
      assert.strictEqual(list.tail.value, 2)
      assert.strictEqual(list.size, 3)
    })
  })
})
