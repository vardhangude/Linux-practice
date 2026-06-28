# Linux Practice - Truncate & Split

## truncate

Used to change the size of a file.

### Reduce file size

```bash
truncate -s 40 file.txt
```

### Increase file size

```bash
truncate -s 60 file.txt
```

**Note:** Increasing the size adds empty (null) bytes.

---

## split

Used to split a large file into smaller files.

### Split every 2 lines

```bash
split -l 2 countries sep
```

Output:

```
sepaa
sepab
sepac
```

View the split files:

```bash
cat sepaa
cat sepab
cat sepac
```

---

## Commands Practiced

```bash
truncate -s 40 file.txt
truncate -s 60 file.txt
split -l 2 countries sep
cat sepaa
cat sepab
cat sepac
```

## Key Points

- `truncate` changes the file size.
- `split` divides a file into smaller files.
- `cat` is used to verify the output.

**Practice Date:** 28-Jun-2026 ✅
