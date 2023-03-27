# depth-first

```go
// Uses a recursive algorithm to traverse the tree. 
// The DepthFirstTraversal function takes a closure as an argument, which is called on each node as it is visited. 
// The function then calls itself recursively on the left and right children of the current node.

type Node struct {
    Value int
    Left  *Node
    Right *Node
}

func (n *Node) DepthFirstTraversal(visit func(*Node)) {
    if n == nil {
        return
    }
    visit(n)
    n.Left.DepthFirstTraversal(visit)
    n.Right.DepthFirstTraversal(visit)
}
```

# breadth-first

```go
// Uses a queue to traverse the tree. 
// The BreadthFirstTraversal function takes a closure as an argument, which is called on each node as it is visited. 
// The function uses a slice to implement the queue, and appends the left and right children of each node to the queue as it is visited.

type Node struct {
    Value int
    Left  *Node
    Right *Node
}

func (n *Node) BreadthFirstTraversal(visit func(*Node)) {
    q := []*Node{n}
    for len(q) > 0 {
        node := q[0]
        q = q[1:]
        visit(node)
        if node.Left != nil {
            q = append(q, node.Left)
        }
        if node.Right != nil {
            q = append(q, node.Right)
        }
    }
}
```

