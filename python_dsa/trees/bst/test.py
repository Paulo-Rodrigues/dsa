import unittest
from impl import BST


class TestBST(unittest.TestCase):
    def setUp(self):
        self.tree = BST()

    def test_is_empty(self):
        self.assertEqual(self.tree.is_empty(), True)

    def test_insert_on_empty_tree(self):
        self.tree.insert(100)

        self.assertEqual(self.tree.is_empty(), False)
        self.assertEqual(self.tree.root.value, 100)
        self.assertEqual(self.tree.root.left, None)
        self.assertEqual(self.tree.root.right, None)

    def test_insert_on_non_empty_tree_left(self):
        self.tree.insert(100)
        self.tree.insert(80)
        self.tree.insert(70)

        self.assertEqual(self.tree.is_empty(), False)
        self.assertEqual(self.tree.root.value, 100)
        self.assertEqual(self.tree.root.left.value, 80)
        self.assertEqual(self.tree.root.left.left.value, 70)
        self.assertEqual(self.tree.root.right, None)

    def test_insert_on_non_empty_tree_right(self):
        self.tree.insert(100)
        self.tree.insert(200)
        self.tree.insert(300)

        self.assertEqual(self.tree.is_empty(), False)
        self.assertEqual(self.tree.root.value, 100)
        self.assertEqual(self.tree.root.right.value, 200)
        self.assertEqual(self.tree.root.right.right.value, 300)
        self.assertEqual(self.tree.root.left, None)

    def test_insert_on_non_empty_tree_does_not_duplicate(self):
        self.tree.insert(100)
        self.tree.insert(200)
        self.tree.insert(200)
        self.tree.insert(300)

        self.assertEqual(self.tree.is_empty(), False)
        self.assertEqual(self.tree.root.value, 100)
        self.assertEqual(self.tree.root.right.value, 200)
        self.assertEqual(self.tree.root.right.right.value, 300)
        self.assertEqual(self.tree.root.left, None)

    def test_insert_complete_tree(self):
        self.tree.insert(100)
        self.tree.insert(200)
        self.tree.insert(300)
        self.tree.insert(80)
        self.tree.insert(70)

        self.assertEqual(self.tree.is_empty(), False)
        self.assertEqual(self.tree.root.value, 100)
        self.assertEqual(self.tree.root.right.value, 200)
        self.assertEqual(self.tree.root.right.right.value, 300)
        self.assertEqual(self.tree.root.left.value, 80)
        self.assertEqual(self.tree.root.left.left.value, 70)

    def test_search_on_empty_tree(self):
        self.assertEqual(self.tree.search(2), None)

    def test_search_when_found_element(self):
        self.tree.insert(100)
        self.tree.insert(200)
        self.tree.insert(300)
        self.tree.insert(80)
        self.tree.insert(70)

        result = self.tree.search(70)

        self.assertEqual(result.value, 70)

    def test_search_when_not_found_element(self):
        self.tree.insert(100)
        self.tree.insert(200)
        self.tree.insert(300)
        self.tree.insert(80)
        self.tree.insert(70)

        result = self.tree.search(500)

        self.assertEqual(result, None)

    def test_in_order_traversal(self):
        self.tree.insert(100)
        self.tree.insert(200)
        self.tree.insert(300)
        self.tree.insert(80)
        self.tree.insert(70)

        self.assertEqual(self.tree.in_order(), [70, 80, 100, 200, 300])


if __name__ == "__main__":
    unittest.main()
