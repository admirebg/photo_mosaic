// QuadTree class. Subdivide it at will.


class QuadTree {
  Box b;
  QuadTree[] children;
  int level;
  static final int maxLevel = 3; //8;
  
  QuadTree(Box b) {
    this.b = b;
    children = null;
    level = 0;
  }

  QuadTree(Box b, int level) {
    this.b = b;
    children = null;
    this.level = level;
  }

  // Divide into 4 smaller quadtrees.
  // If this exceeds the recursion limit, it will just return null.
  QuadTree[] divide() {
    if (children == null && level < maxLevel) {
      children = new QuadTree[4];
      Box[] b2 = b.quarter();
      for(int i = 0; i < 4; ++i) {
        children[i] = new QuadTree(b2[i], level + 1); 
      }
    }
    return children;
  }
  
  // Draw - recursively - the entire quadtree.
  void drawMe() {
    b.drawMe();
    if (children == null) return;
    for(int i = 0; i < 4; ++i) {
      children[i].drawMe();
    }
  }
  
  // Find the smallest of the child quadtrees which contains the given point.
  // If none are found, return null. This won't subdivide any further.
  QuadTree getSmallestIntersect(float x, float y) {
    if (children == null) {
      if (b.pointInside(x,y)) {
        return this;
      }
      else {
        return null;
      }
    }
    for(int i = 0; i < 4; ++i) {
      QuadTree q = children[i].getSmallestIntersect(x, y);
      if (q != null) {
        return q;
      }
    }
    return null;
  }
}
