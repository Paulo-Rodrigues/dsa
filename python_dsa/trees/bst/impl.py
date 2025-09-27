class TreeNode:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BST:
    def __init__(self):
        self.root = None

    def insert(self, value):
        new_node = TreeNode(value)

        if self.is_empty():
            self.root = new_node
            return

        current = self.root

        while current:
            if value < current.value:
                if current.left:
                    current = current.left
                else:
                    current.left = new_node
                    break
            elif value > current.value:
                if current.right:
                    current = current.right
                else:
                    current.right = new_node
                    break
            else:
                break

    def search(self, value):
        if self.is_empty():
            return None

        current = self.root

        while current:
            if value == current.value:
                return current
            else:
                if value < current.value:
                    current = current.left
                else:
                    current = current.right

    def in_order(self, current=None, result=None):
        if current is None:
            current = self.root
        if result is None:
            result = []

        if current.left:
            self.in_order(current.left, result)

        result.append(current.value)

        if current.right:
            self.in_order(current.right, result)

        return result

    def is_empty(self):
        return self.root is None
