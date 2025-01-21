Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40A81F0E44
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454502; cv=none; b=Eo3a3CyskxEY/5cFVSsqDCpcDsOvCgPVYGthK3IqOTMCOn6fHA0p3zPl3YOY02ExlAnV987ppE5xh1EGdCwE5y6yOIAm2AHuRUDdDCs+/IunqcbGq7Y1hG7mZTA0TapJgsVU1rocu/9dZHBu2/6lYvgL3KoKq3I/yRuHGQYj8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454502; c=relaxed/simple;
	bh=YAa0Xd/y5nA6HKIEWD6ZAFpkLjnkYG1Be72E8SZ47wI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mannT46cefG5oQXOD/Q4T7bL9B1E1esa85WtvygHgEbxoyhD2n8Q+pkVykKPa+5tFqGc3DhYOf0CAZYoXlbgYvccN+6+1MbhivhXlXDEvWWbTNmWs3gXWY4qi6+l6WPn5IePKcxJAZ/5koXkYB4eZ7g+QMZoya3x0ynC8pOQRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OFZLtqDe; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OFZLtqDe"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361a8fc3bdso28230645e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737454498; x=1738059298; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4ya++wD2l9KD/DO+Dbw2L7cYN6dIxoseiq0xEJfP9Y=;
        b=OFZLtqDegXHRDGmtuGbqz0/c9Sp8qoMzp0qL3TPzOzMjA4TfNbcmSivWyrico7VGAL
         qoBQ3DCb/W585AQDAacpZIeznHuG9vHaKO03iCHOM48/7l9DfXi7HJ97CtwNIlTkBqRx
         mqS+Wrw7dYSFG1Gj/ZZixrQ/agdQCUkIWXt9FaYFHD2qeh1/vritHNOmNxZcWNWSAPEn
         14LABY//qAOJ4snVQPvW00LezFO/M9mVr3HWuKx4hItijd/+BwXHRpQfEHFUqMlCZA8H
         3veJAG19ymrn6JaE3+78r1mR9cZKFoMr2cBgthbkTouGbg9GfpmkY/X6giv+JrVjqmpz
         lDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454498; x=1738059298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4ya++wD2l9KD/DO+Dbw2L7cYN6dIxoseiq0xEJfP9Y=;
        b=YT1xhakRK7sqcZ3yLZ+jeXmKjXJ/2Cnj1H5hC4vRRXsDU0ExRhps6iZju0UGrOxGCC
         CJMhy/BzbVnGEYrx8uaGGpXrpZ/n99CdnqC4dZt1o5ZUfssyMhyAwT4vGkKu87SprEKn
         u/ipH9UTalNJ3xaNRrqJDkITnXSCI0j8Lg77uJhH0STvgPVbgo4oMC+DbRcgmXxXhaaH
         b96gxgWo1kXm981fM62qUlan3z93OSN1GMya4o8Onl+ArwifDbXM5uTNcxz4cTOva3l1
         /wzgZsu9TO/Le7pDDAMhdBcYLVo5px2OLp4tZt3nWhP+JHf9G6+fo0HFQukleV7ICVaV
         QTMg==
X-Forwarded-Encrypted: i=1; AJvYcCVVjimzIuqDqtEqjXYZGN7oq4FSITXKNn0xGI4wsdRN75xRmpOpJgLvzEm+/IAKFyPS+b4UfUf2SoW4tRwcOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDmrXzjrpRdnVMWgaK6qvpN/5CtjShyCcXHyM60rJxkpTAVCK8
	qNUcc6TxZOJFM5iJo9DnfGrqMmDqn6MUOxxJ9JqLx3X5Hq30XG8rISr5ZVaeq8AdrbjXg+CsfBe
	VSyzCJyCCoJ6xeg==
X-Google-Smtp-Source: AGHT+IF3qsqoT9CNqHCtxLfPHjzzz7x9atGPwDDcwjJGt2AYlCg3OxDpZ1GGwalDoDiFaUzfsXNhfEqV2DX2uYw=
X-Received: from wmbjx9.prod.google.com ([2002:a05:600c:5789:b0:436:e723:5be0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e1c:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-438913bf655mr160034015e9.3.1737454498359;
 Tue, 21 Jan 2025 02:14:58 -0800 (PST)
Date: Tue, 21 Jan 2025 10:14:24 +0000
In-Reply-To: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=16101; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=YAa0Xd/y5nA6HKIEWD6ZAFpkLjnkYG1Be72E8SZ47wI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnj3ObFF6rcWiF70NSLcer9quCzPbwUoU/fUGEW
 ydSn6l30M6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ49zmwAKCRAEWL7uWMY5
 RgaXD/9yvCMoEPSs8L+c/STBPgBIpncOHEF3Su6WtJQZsswMIE6qh21B8mpSm6IKbLKvjPu4N6z
 7j/KryTw8ZfyMyBHWjWe0CSfGoGmHc6M+zz+r05LOMMnTOzwo5H3ZeaED7s5T0/Qnu4dl6SOVkd
 s5MW6fBNANEVVdhH3gy19D3BMTzo/wT39qf+m2N+neHFUNwaVQzEDyT2H/YpBNV0jBhiDIiAjWs
 4BzUa9eYsyMAqQWkPVA7UetrKRJBljJRbAyKeBzANR7pk5/vm7efFuuWU2rLdyY+AW4o+TPxCVe
 ZAxC+6xFSdL49JnQ8XW62TKW4UsIdNwxvRedkHLZR6htzyF8H7yYK2hDXDgyXKrnw+EWRtF2kxi
 itrdt1Z09RgpLqm71BSy8G870sLV1AcTQGHWkHAd8BZZnsFsqZAkovmByROX2EFB82D9PwZOHRA
 VY9CRj28yBzqlWE0h7ExciR4+vSLYNnmfc8jvcegax5KNC6mIALBZaAda8K+oUYPedcucQi93Up
 iKMGCX1OrES3CrX5zNMsb8N+/7ljn1IAe5K32o35Dg9pstJRYwgRvVpGfr/LEossWOIZCaqonf8
 aiNayQWzt/DmEWbLfSo7iqBp+g16WbOne7iF97b3oY+vxSjQKw+EV6qn8CKXi9a4Wc7xpRCoa32 mwDmQSCZxhGFMvw==
X-Mailer: b4 0.13.0
Message-ID: <20250121-cursor-between-v2-2-1b24cd377618@google.com>
Subject: [PATCH v2 2/2] rust: list: make the cursor point between elements
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

I've been using the linked list cursor for a few different things, and I
find it inconvenient to use because all of the functions have signatures
along the lines of `Self -> Option<Self>`. The root cause of these
signatures is that the cursor points *at* an element, rather than
*between* two elements.

Thus, change the cursor API to point between two elements. This is
inspired by the stdlib linked list (well, really by this guy [1]), which
also uses cursors that point between elements.

The `peek_next` method returns a helper that lets you look at and
optionally remove the element, as one common use-case of cursors is to
iterate a list to look for an element, then remove that element.

For many of the methods, this will reduce how many we need since they
now just need a prev/next method, instead of the current state where you
may end up needing all of curr/prev/next. Also, if we decide to add a
function for splitting a list into two lists at the cursor, then a
cursor that points between elements is exactly what makes the most
sense.

Another advantage is that this means you can now have a cursor into an
empty list.

Link: https://rust-unofficial.github.io/too-many-lists/sixth-cursors-intro.html [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 331 +++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 276 insertions(+), 55 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 97b3599b7207..314222d12bfc 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -483,17 +483,21 @@ pub fn push_all_back(&mut self, other: &mut List<T, ID>) {
         other.first = ptr::null_mut();
     }
 
-    /// Returns a cursor to the first element of the list.
-    ///
-    /// If the list is empty, this returns `None`.
-    pub fn cursor_front(&mut self) -> Option<Cursor<'_, T, ID>> {
-        if self.first.is_null() {
-            None
-        } else {
-            Some(Cursor {
-                current: self.first,
-                list: self,
-            })
+    /// Returns a cursor that points before the first element of the list.
+    pub fn cursor_front(&mut self) -> Cursor<'_, T, ID> {
+        // INVARIANT: `self.first` is in this list.
+        Cursor {
+            next: self.first,
+            list: self,
+        }
+    }
+
+    /// Returns a cursor that points after the last element in the list.
+    pub fn cursor_back(&mut self) -> Cursor<'_, T, ID> {
+        // INVARIANT: `next` is allowed to be null.
+        Cursor {
+            next: core::ptr::null_mut(),
+            list: self,
         }
     }
 
@@ -573,69 +577,286 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
 
 /// A cursor into a [`List`].
 ///
+/// A cursor always rests between two elements in the list. This means that a cursor has a previous
+/// and next element, but no current element. It also means that it's possible to have a cursor
+/// into an empty list.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::list::{List, ListArc, ListLinks};
+///
+/// #[pin_data]
+/// struct ListItem {
+///     value: u32,
+///     #[pin]
+///     links: ListLinks,
+/// }
+///
+/// kernel::list::impl_has_list_links! {
+///     impl HasListLinks<0> for ListItem { self.links }
+/// }
+/// kernel::list::impl_list_arc_safe! {
+///     impl ListArcSafe<0> for ListItem { untracked; }
+/// }
+/// kernel::list::impl_list_item! {
+///     impl ListItem<0> for ListItem { using ListLinks; }
+/// }
+///
+/// // Use a cursor to remove the first element with the given value.
+/// fn remove_first(list: &mut List<ListItem>, value: u32) -> Option<ListArc<ListItem>> {
+///     let mut cursor = list.cursor_front();
+///     while let Some(next) = cursor.peek_next() {
+///         if next.value == value {
+///             return Some(next.remove());
+///         }
+///         cursor.move_next();
+///     }
+///     None
+/// }
+///
+/// // Use a cursor to remove all elements with the given value. The removed elements are moved to
+/// // a new list.
+/// fn remove_all(list: &mut List<ListItem>, value: u32) -> List<ListItem> {
+///     let mut out = List::new();
+///     let mut cursor = list.cursor_front();
+///     while let Some(next) = cursor.peek_next() {
+///         if next.value == value {
+///             out.push_back(next.remove());
+///         } else {
+///             cursor.move_next();
+///         }
+///     }
+///     out
+/// }
+///
+/// // Use a cursor to insert a value at a specific index. Returns an error if the index is out of
+/// // bounds.
+/// fn insert_at(list: &mut List<ListItem>, new: ListArc<ListItem>, idx: usize) -> Result {
+///     let mut cursor = list.cursor_front();
+///     for _ in 0..idx {
+///         if !cursor.move_next() {
+///             return Err(EINVAL);
+///         }
+///     }
+///     cursor.insert_next(new);
+///     Ok(())
+/// }
+///
+/// // Merge two sorted lists into a single sorted list.
+/// fn merge_sorted(list: &mut List<ListItem>, merge: List<ListItem>) {
+///     let mut cursor = list.cursor_front();
+///     for to_insert in merge {
+///         while let Some(next) = cursor.peek_next() {
+///             if to_insert.value < next.value {
+///                 break;
+///             }
+///             cursor.move_next();
+///         }
+///         cursor.insert_prev(to_insert);
+///     }
+/// }
+/// ```
+///
 /// # Invariants
 ///
-/// The `current` pointer points a value in `list`.
+/// The `next` pointer is null or points a value in `list`.
 pub struct Cursor<'a, T: ?Sized + ListItem<ID>, const ID: u64 = 0> {
-    current: *mut ListLinksFields,
     list: &'a mut List<T, ID>,
+    /// Points at the element after this cursor, or null if the cursor is after the last element.
+    next: *mut ListLinksFields,
 }
 
 impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> Cursor<'a, T, ID> {
-    /// Access the current element of this cursor.
-    pub fn current(&self) -> ArcBorrow<'_, T> {
-        // SAFETY: The `current` pointer points a value in the list.
-        let me = unsafe { T::view_value(ListLinks::from_fields(self.current)) };
-        // SAFETY:
-        // * All values in a list are stored in an `Arc`.
-        // * The value cannot be removed from the list for the duration of the lifetime annotated
-        //   on the returned `ArcBorrow`, because removing it from the list would require mutable
-        //   access to the cursor or the list. However, the `ArcBorrow` holds an immutable borrow
-        //   on the cursor, which in turn holds a mutable borrow on the list, so any such
-        //   mutable access requires first releasing the immutable borrow on the cursor.
-        // * Values in a list never have a `UniqueArc` reference, because the list has a `ListArc`
-        //   reference, and `UniqueArc` references must be unique.
-        unsafe { ArcBorrow::from_raw(me) }
+    /// Returns a pointer to the element before the cursor.
+    ///
+    /// Returns null if there is no element before the cursor.
+    fn prev_ptr(&self) -> *mut ListLinksFields {
+        let mut next = self.next;
+        let first = self.list.first;
+        if next == first {
+            // We are before the first element.
+            return core::ptr::null_mut();
+        }
+
+        if next.is_null() {
+            // We are after the last element, so we need a pointer to the last element, which is
+            // the same as `(*first).prev`.
+            next = first;
+        }
+
+        // SAFETY: `next` can't be null, because then `first` must also be null, but in that case
+        // we would have exited at the `next == first` check. Thus, `next` is an element in the
+        // list, so we can access its `prev` pointer.
+        unsafe { (*next).prev }
     }
 
-    /// Move the cursor to the next element.
-    pub fn next(self) -> Option<Cursor<'a, T, ID>> {
-        // SAFETY: The `current` field is always in a list.
-        let next = unsafe { (*self.current).next };
+    /// Access the element after this cursor.
+    pub fn peek_next(&mut self) -> Option<CursorPeek<'_, 'a, T, true, ID>> {
+        if self.next.is_null() {
+            return None;
+        }
+
+        // INVARIANT:
+        // * We just checked that `self.next` is non-null, so it must be in `self.list`.
+        // * `ptr` is equal to `self.next`.
+        Some(CursorPeek {
+            ptr: self.next,
+            cursor: self,
+        })
+    }
+
+    /// Access the element before this cursor.
+    pub fn peek_prev(&mut self) -> Option<CursorPeek<'_, 'a, T, false, ID>> {
+        let prev = self.prev_ptr();
+
+        if prev.is_null() {
+            return None;
+        }
+
+        // INVARIANT:
+        // * We just checked that `prev` is non-null, so it must be in `self.list`.
+        // * `self.prev_ptr()` never returns `self.next`.
+        Some(CursorPeek {
+            ptr: prev,
+            cursor: self,
+        })
+    }
+
+    /// Move the cursor one element forward.
+    ///
+    /// If the cursor is after the last element, then this call does nothing. This call returns
+    /// `true` if the cursor's position was changed.
+    pub fn move_next(&mut self) -> bool {
+        if self.next.is_null() {
+            return false;
+        }
+
+        // SAFETY: `self.next` is an element in the list and we borrow the list mutably, so we can
+        // access the `next` field.
+        let mut next = unsafe { (*self.next).next };
 
         if next == self.list.first {
-            None
-        } else {
-            // INVARIANT: Since `self.current` is in the `list`, its `next` pointer is also in the
-            // `list`.
-            Some(Cursor {
-                current: next,
-                list: self.list,
-            })
+            next = core::ptr::null_mut();
         }
+
+        // INVARIANT: `next` is either null or the next element after an element in the list.
+        self.next = next;
+        true
     }
 
-    /// Move the cursor to the previous element.
-    pub fn prev(self) -> Option<Cursor<'a, T, ID>> {
-        // SAFETY: The `current` field is always in a list.
-        let prev = unsafe { (*self.current).prev };
+    /// Move the cursor one element backwards.
+    ///
+    /// If the cursor is before the first element, then this call does nothing. This call returns
+    /// `true` if the cursor's position was changed.
+    pub fn move_prev(&mut self) -> bool {
+        if self.next == self.list.first {
+            return false;
+        }
 
-        if self.current == self.list.first {
-            None
+        // INVARIANT: `prev_ptr()` always returns a pointer that is null or in the list.
+        self.next = self.prev_ptr();
+        true
+    }
+
+    /// Inserts an element where the cursor is pointing and get a pointer to the new element.
+    fn insert_inner(&mut self, item: ListArc<T, ID>) -> *mut ListLinksFields {
+        let ptr = if self.next.is_null() {
+            self.list.first
         } else {
-            // INVARIANT: Since `self.current` is in the `list`, its `prev` pointer is also in the
-            // `list`.
-            Some(Cursor {
-                current: prev,
-                list: self.list,
-            })
-        }
+            self.next
+        };
+        // SAFETY:
+        // * `ptr` is an element in the list or null.
+        // * if `ptr` is null, then `self.list.first` is null so the list is empty.
+        unsafe { self.list.insert_inner(item, ptr) }
+    }
+
+    /// Inserts an element after this cursor.
+    pub fn insert_next(&mut self, item: ListArc<T, ID>) {
+        self.next = self.insert_inner(item);
+    }
+
+    /// Inserts an element before this cursor.
+    pub fn insert_prev(&mut self, item: ListArc<T, ID>) {
+        self.insert_inner(item);
     }
 
-    /// Remove the current element from the list.
+    /// Remove the next element from the list.
+    pub fn remove_next(&mut self) -> Option<ListArc<T, ID>> {
+        self.peek_next().map(|v| v.remove())
+    }
+
+    /// Remove the previous element from the list.
+    pub fn remove_prev(&mut self) -> Option<ListArc<T, ID>> {
+        self.peek_prev().map(|v| v.remove())
+    }
+}
+
+/// References the element in the list next to the cursor.
+///
+/// # Invariants
+///
+/// * `ptr` is an element in `self.cursor.list`.
+/// * `ISNEXT == (self.ptr == self.cursor.next)`.
+pub struct CursorPeek<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64> {
+    cursor: &'a mut Cursor<'b, T, ID>,
+    ptr: *mut ListLinksFields,
+}
+
+impl<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64>
+    CursorPeek<'a, 'b, T, ISNEXT, ID>
+{
+    /// Remove the element from the list.
     pub fn remove(self) -> ListArc<T, ID> {
-        // SAFETY: The `current` pointer always points at a member of the list.
-        unsafe { self.list.remove_internal(self.current) }
+        if ISNEXT {
+            self.cursor.move_next();
+        }
+
+        // INVARIANT: `self.ptr` is not equal to `self.cursor.next` due to the above `move_next`
+        // call.
+        // SAFETY: By the type invariants of `Self`, `next` is not null, so `next` is an element of
+        // `self.cursor.list` by the type invariants of `Cursor`.
+        unsafe { self.cursor.list.remove_internal(self.ptr) }
+    }
+
+    /// Access this value as an [`ArcBorrow`].
+    pub fn arc(&self) -> ArcBorrow<'_, T> {
+        // SAFETY: `self.ptr` points at an element in `self.cursor.list`.
+        let me = unsafe { T::view_value(ListLinks::from_fields(self.ptr)) };
+        // SAFETY:
+        // * All values in a list are stored in an `Arc`.
+        // * The value cannot be removed from the list for the duration of the lifetime annotated
+        //   on the returned `ArcBorrow`, because removing it from the list would require mutable
+        //   access to the `CursorPeek`, the `Cursor` or the `List`. However, the `ArcBorrow` holds
+        //   an immutable borrow on the `CursorPeek`, which in turn holds a mutable borrow on the
+        //   `Cursor`, which in turn holds a mutable borrow on the `List`, so any such mutable
+        //   access requires first releasing the immutable borrow on the `CursorPeek`.
+        // * Values in a list never have a `UniqueArc` reference, because the list has a `ListArc`
+        //   reference, and `UniqueArc` references must be unique.
+        unsafe { ArcBorrow::from_raw(me) }
+    }
+}
+
+impl<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64> core::ops::Deref
+    for CursorPeek<'a, 'b, T, ISNEXT, ID>
+{
+    // This can't use `ArcBorrow<'a, T>` as the target type because 'a is too long. It would let
+    // you obtain an `ArcBorrow<'a, T>` and then call `CursorPeek::remove` without giving up the
+    // `ArcBorrow<'a, T>`.
+    type Target = T;
+
+    fn deref(&self) -> &T {
+        // SAFETY: `self.ptr` points at an element in `self.cursor.list`.
+        let me = unsafe { T::view_value(ListLinks::from_fields(self.cursor.next)) };
+
+        // SAFETY: The value cannot be removed from the list for the duration of the lifetime
+        // annotated on the returned `&T`, because removing it from the list would require mutable
+        // access to the `CursorPeek`, the `Cursor` or the `List`. However, the `&T` holds an
+        // immutable borrow on the `CursorPeek`, which in turn holds a mutable borrow on the
+        // `Cursor`, which in turn holds a mutable borrow on the `List`, so any such mutable access
+        // requires first releasing the immutable borrow on the `CursorPeek`.
+        unsafe { &*me }
     }
 }
 

-- 
2.48.0.rc2.279.g1de40edade-goog

