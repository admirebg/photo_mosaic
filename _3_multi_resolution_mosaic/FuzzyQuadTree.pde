// Basically QuadTree class, but with fuzzy boundaries.
class FuzzyQuadTree extends QuadTree {
  float delta;
  
  FuzzyQuadTree(Box b, float delta) {
    super(b);
    this.delta = delta;
  }

  FuzzyQuadTree(Box b, int level, float delta) {
    super(b, level);
    this.delta = delta;
  }

  // Divide into 4 smaller quadtrees.
  // If this exceeds the recursion limit, it will just return null.
  QuadTree[] divide() {
    if (children == null && level < maxLevel) {
      children = new QuadTree[4];
      Box[] b2 = b.quarter();
      for(int i = 0; i < 4; ++i) {
        children[i] = (QuadTree) new FuzzyQuadTree(b2[i], level + 1, delta);
      }
    }
    return children;
  }

}
