# Using Checksums to Create Train-Test Splits

```python
from zlib import crc32

def check_if_in_test_set(instance_id, train_test_ratio):
	unsigned_32_bit_checksum = crc32(instance_id)
	# 0xffffffff = Max value of 32 bit unsigned integer - all 1 in binary
	force_to_32_bit_unsigned = unsigned_32_bit_checksum & 0xffffffff
	in_test_set_check = force_to_32_bit_unsigned < train_test_ratio * 2**32
	return in_test_set_check
```

Ensures that the test set remains the same across runs, even after updating the dataset.
This assumes the identifier remains the same.

> Adapted from:
>
> Géron, Aurélien. 2019. Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow: Concepts, Tools, and Techniques to Build Intelligent Systems. Second edition. Beijing Boston Farnham Sebastopol Tokyo: O’Reilly. ISBN: 978-1-4920-3264-9.
