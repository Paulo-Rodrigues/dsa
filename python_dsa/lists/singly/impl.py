from logging import currentframe


class SinglyNode:
    def __init__(self, value):
        self.value = value
        self.next = None


class Singly:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0

    def push(self, value):
        new_node = SinglyNode(value)

        if self.is_empty():
            self.head = new_node
            self.tail = new_node
        else:
            self.tail.next = new_node
            self.tail = new_node

        self.size += 1

    def pop(self):
        if self.is_empty():
            return None

        current = self.head

        while current.next != self.tail:
            current = current.next

        current.next = None
        self.tail = current

        self.size -= 1

    def search(self, value):
        if self.is_empty():
            return None

        current = self.head

        while current:
            if current.value == value:
                return current
            current = current.next

    def invert(self):
        prev = None
        current = self.head

        while current:
            temp = current.next
            current.next = prev
            prev = current
            current = temp

        self.head, self.tail = self.tail, self.head

    def is_empty(self):
        return self.head is None and self.tail is None and self.size == 0
