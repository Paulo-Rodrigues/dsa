import re
import unittest
from impl import Singly


class TestSingly(unittest.TestCase):
    def setUp(self) -> None:
        self.list = Singly()

    def test_is_empty(self):
        self.assertEqual(self.list.is_empty(), True)

    def test_push_on_empty_list(self):
        self.list.push(2)

        self.assertEqual(self.list.is_empty(), False)
        self.assertEqual(self.list.head.value, 2)
        self.assertEqual(self.list.tail.value, 2)
        self.assertEqual(self.list.size, 1)

    def test_push_on_non_empty_list(self):
        self.list.push(2)
        self.list.push(3)
        self.list.push(4)

        self.assertEqual(self.list.is_empty(), False)
        self.assertEqual(self.list.head.value, 2)
        self.assertEqual(self.list.head.next.value, 3)
        self.assertEqual(self.list.tail.value, 4)
        self.assertEqual(self.list.size, 3)

    def test_push_on_empty_list(self):
        self.assertEqual(self.list.pop(), None)

    def test_pop_on_non_empty_list(self):
        self.list.push(2)
        self.list.push(3)
        self.list.push(4)

        self.list.pop()

        self.assertEqual(self.list.is_empty(), False)
        self.assertEqual(self.list.head.value, 2)
        self.assertEqual(self.list.head.next.value, 3)
        self.assertEqual(self.list.tail.value, 3)
        self.assertEqual(self.list.size, 2)

    def test_search_on_empty_list(self):
        self.assertEqual(self.list.search(2), None)

    def test_search_found_value(self):
        self.list.push(2)
        self.list.push(3)
        self.list.push(4)

        result = self.list.search(3)

        self.assertEqual(result.value, 3)

    def test_search_not_found_value(self):
        self.list.push(2)
        self.list.push(3)
        self.list.push(4)

        result = self.list.search(5)

        self.assertEqual(result, None)

    def test_invert(self):
        self.list.push(2)
        self.list.push(3)
        self.list.push(4)

        self.list.invert()

        self.assertEqual(self.list.is_empty(), False)
        self.assertEqual(self.list.head.value, 4)
        self.assertEqual(self.list.head.next.value, 3)
        self.assertEqual(self.list.tail.value, 2)
        self.assertEqual(self.list.size, 3)


if __name__ == "__main__":
    unittest.main()
