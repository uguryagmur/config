#include <iostream>
#include <queue>
#include <stack>
#include <vector>
using namespace std;

// Helper functions
template <typename A> string to_csv(vector<A> v);

string wrap_round(string s) { return "(" + s + ")"; }

string wrap_curly(string s) { return "{" + s + "}"; }

string wrap_square(string s) { return "[" + s + "]"; }

string wrap_angle(string s) { return "<" + s + ">"; }

// Main functions
string to_string(string s) { return '"' + s + '"'; }

string to_string(const char *s) { return to_string((string)s); }

string to_string(bool b) { return (b ? "true" : "false"); }

template <typename A, typename B> string to_string(pair<A, B> p) {
  return "(" + to_string(p.first) + ", " + to_string(p.second) + ")";
}

string to_string(vector<bool> v) { return wrap_curly(to_csv(v)); }

template <typename A> string to_string(A v) {
  bool first = true;
  string res = "{";
  for (const auto &x : v) {
    if (!first) {
      res += ", ";
    }
    first = false;
    res += to_string(x);
  }
  res += "}";
  return res;
}

template <typename A> string to_string(vector<vector<A>> v) {
  bool first = true;
  string res = "\n{";
  for (const auto x : v) {
    if (!first) {
      res += ", ";
      res += "\n";
    }
    first = false;
    res += to_string(x);
  }
  res += "}";
  return res;
}

template <typename A> string to_string(queue<A> q) {
  vector<A> v;
  while (!q.empty()) {
    v.push_back(q.front());
    q.pop();
  }
  string res = "<=" + wrap_curly(to_csv(v)) + "<=";
  return res;
}

template <typename A> string to_string(deque<A> dq) {
  vector<A> v;
  while (!dq.empty()) {
    v.push_back(dq.front());
    dq.pop_front();
  }
  string res = "<=>" + wrap_curly(to_csv(v)) + "<=>";
  return res;
}

template <typename A> string to_string(stack<A> s) {
  vector<A> v;
  while (!s.empty()) {
    v.push_back(s.top());
    s.pop();
  }
  string res = "<=>" + wrap_curly(to_csv(v));
  return res;
}
template <typename A, typename B, typename C>
string to_string(priority_queue<A, B, C> q) {
  vector<A> v;
  while (!q.empty()) {
    v.push_back(q.top());
    q.pop();
  }
  string res = "<=>>" + wrap_curly(to_csv(v));
  return res;
}

template <typename A> string to_csv(vector<A> v) {
  string res;
  bool first = true;
  for (A x : v) {
    if (!first) {
      res += ", ";
    }
    first = false;
    res += to_string(x);
  }
  return res;
}

void debug_out() { cout << endl; }

template <typename Head> void debug_out(Head H) {
  cout << to_string(H) << endl;
}

template <typename Head, typename... Tail> void debug_out(Head H, Tail... T) {
  cout << to_string(H) << ", ";
  debug_out(T...);
}

#define debug(...) cout << "[" << #__VA_ARGS__ << "]: ", debug_out(__VA_ARGS__)
