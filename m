Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3A20E032
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630109; cv=none; b=ly5Wd0/OX4euab4TxfTwHvXUq2WWskQ4r9nhABwxJrfC08klqM8znbZfv0XDZYAmfYVfQH4YP5JJP32DYFvI4dYnSqlDbzyHmXQ1EdR4mZC8D2WLz3t2sDQg+jeudPQuaVF3/NsIg7ey+Atq8v1XgU6/chCfkVV/NGkNvv0vUHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630109; c=relaxed/simple;
	bh=8gUAK7/7eXcXwtwPNMbFGWORoWgSfmFE26RlCQmmpnw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FLdpDFwlwNLL3UWIKfOtT7vUg6F5kylVVAOWHccg1d1rJVVfBe2iT9+n6Dg3/UbT6D+S4Hx00Y3GC9m3bmEFDttqRkFu1NmkkkRYuT+KHJZJ0dxFDJ4ZHiwU/WUUvoqrVjqqff1x6fK5ovywPZ5rI2XkGj74M0590MXL7cTHWmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=juG0wD6u; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="juG0wD6u"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43624b08181so4140915e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 03:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737630105; x=1738234905; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XTXYCK7WnevgyfO2tx5d7nnFYECwGZUA9UP3HhSJ3c=;
        b=juG0wD6uSi1ixFZFBj6pgyT1fKZsI090ol6wu8212jfNgGppF7uN2oBPNsohMkTSCA
         w4XuDjyjJWnckzEsz02nM3jdN+EyIPVPfgXYpRLdXgD3VgGBfP7S1+OrAb6eo8kksIHz
         56e8MAWKkcy9rHi249NyHhz2lYCW7DBEJAw5gsBBS5UfN5qYOFvJKTEu7r9Ig/eUaZyo
         zBttKtHVePJ9LM04xOJ/lgpzSHpEM75TSIl/wFNLa+cV88xVpbQ947B658djmNghZ6aS
         uhfvJo5K0qEY3VG7VXf/RNYygDY51XRvVaSL71+CQ8O+xrREoN0VVH6ObtopmJ+87Qbo
         /jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630105; x=1738234905;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XTXYCK7WnevgyfO2tx5d7nnFYECwGZUA9UP3HhSJ3c=;
        b=eNFHSz8bU4zfn+vRTQ96WiffgywCCwrvmXX9vwLFY1kzfVtFAIVvVP7lXtDrHOb9xF
         Tjfyp/NtIvqBYyArAzwqWeMuplrDPFrBNSMgNroW9f1IsWcZp/pAo6m+khsYxxBw57ZB
         pltzLtrvToFvr+AFpivcZ8xjBWWHjuwuJa1gKTvocra+Kw02oCM88YkZeU8GKkEEv+IZ
         l4Ji60FlI3vKVHXxI6mnpjOMXmBQdw0YhPAAcS245osHbDYAGkWhZTF47y7JLBZ5Omq6
         7LaxTBmGKTvh/axLmZO5MwZQtjQmXzh/tgSgNorFLdghdnmWEb37afUNlpl1GPLKA/30
         hHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxb4pr1XlYy5BnPaZdf1+6VZQcQF0q6C2mg8bRszRi1n97/wKhPxVrhLfIkor6rBYjgQbw3DvyHyocwl+FWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBuhAFBHagECz9HIh9le5TdUchvekXHlFrgXwdUQBqRBw4s9Ed
	ZVwpDrfpGmo/as8+EIGIuryyivUdnt14mc14/zuWyFXozbFmLwddk62rZ/9fYU5qvECcwvczyGh
	HA/tX3YXWsHKcJw==
X-Google-Smtp-Source: AGHT+IFGOL6rkA2a1sZ96eXbtU/9c+XWA017wOY71visxxWNewAjASw+pzsy5OmsGtJdXwFXhjEiPx+QpLQb3pQ=
X-Received: from wmoq19.prod.google.com ([2002:a05:600c:46d3:b0:434:a8d7:e59b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3206:b0:436:fdac:26eb with SMTP id 5b1f17b1804b1-438b885272dmr25175625e9.7.1737630105185;
 Thu, 23 Jan 2025 03:01:45 -0800 (PST)
Date: Thu, 23 Jan 2025 11:01:09 +0000
In-Reply-To: <20250123-cursor-between-v4-0-cb06698db94c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250123-cursor-between-v4-0-cb06698db94c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=17643; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8gUAK7/7eXcXwtwPNMbFGWORoWgSfmFE26RlCQmmpnw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnkiGRTBq1ywyRxnIwDvvx8jPAn7F+e82BxGi+c
 8//gkh3OyqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5IhkQAKCRAEWL7uWMY5
 Rg3eD/4+d13MaW2GO261lQ3SbPSoUATkzDaq1Q546bOD7tsn9xL7z+eFKBfOSLfoptfFiZD1azt
 JLWyTzoXNLtcclWHg9omPeHWnRSUYEEKa6VJ1pNQPMaGUlRgUP0j2KcKe4RlGPMJ7RGqI0Mb1PD
 whgTQwPhcmm8lkIuKg84lyx6/B+yqYiPmluqmw4jDL2kmljyAMVugxcmlyACWOFyDn7aHEIPYVQ
 P2jli2QWu4YUyoq6wAO3oDvLDykeU+H4tMTo+dQUN8g9xrT7mpG497Z+XSUg9exdYOx8WQ+feMi
 JJNqJiYjV6M841YYfVLDooZJFDC9lOKEZCchOCR1nLjRps0uhsHLbNqbjIqumKxlyWdBraPnzrX
 z0v8ZwMI3475Yb8dYt54xsyA+LEJcxmZG3wjngw+F08lzU/x25zqlYu8j4UALq2rU6Dl0ZnewDe
 NxQ3OrNBrtBxbULjE/rrZ9vphuklR063UoBmFOM4QII2xOVjqRE3D4AoaP2LKEaWKzZeEuWdtWg
 vTWcGZkIzSx2msI/qeQfQ5LvoaXr+lhh5Tdc2qe1/Fu+0IOkzR/kqCzDilBbfECn/HFr821kn1X
 EOi7kY2RvSpFFRrsJy/JreP3bST/O3xM+B3N3VzRSJNpJip6QpaK/sDmLySN+5DKnXjTPyv8PEf /11PrYVsDF+Smeg==
X-Mailer: b4 0.13.0
Message-ID: <20250123-cursor-between-v4-2-cb06698db94c@google.com>
Subject: [PATCH v4 2/2] rust: list: make the cursor point between elements
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
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 370 ++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 315 insertions(+), 55 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 97b3599b7207..b83016e5bcd9 100644
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
 
@@ -573,69 +577,325 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
 
 /// A cursor into a [`List`].
 ///
+/// A cursor always rests between two elements in the list. This means that a cursor has a previous
+/// and next element, but no current element. It also means that it's possible to have a cursor
+/// into an empty list.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::prelude::*;
+/// use kernel::list::{List, ListArc, ListLinks};
+///
+/// #[pin_data]
+/// struct ListItem {
+///     value: u32,
+///     #[pin]
+///     links: ListLinks,
+/// }
+///
+/// impl ListItem {
+///     fn new(value: u32) -> Result<ListArc<Self>> {
+///         ListArc::pin_init(try_pin_init!(Self {
+///             value,
+///             links <- ListLinks::new(),
+///         }), GFP_KERNEL)
+///     }
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
+///
+/// let mut list = List::new();
+/// list.push_back(ListItem::new(14)?);
+/// list.push_back(ListItem::new(12)?);
+/// list.push_back(ListItem::new(10)?);
+/// list.push_back(ListItem::new(12)?);
+/// list.push_back(ListItem::new(14)?);
+/// assert_eq!(remove_all(&mut list, 12).iter().count(), 2);
+/// // [14, 10, 14]
+/// assert!(remove_first(&mut list, 14).is_some());
+/// // [10, 14]
+/// insert_at(&mut list, ListItem::new(12)?, 1)?;
+/// // [10, 12, 14]
+///
+/// let mut list2 = List::new();
+/// list.push_back(ListItem::new(11)?);
+/// list.push_back(ListItem::new(13)?);
+/// merge_sorted(&mut list, list2);
+///
+/// let mut items = list.into_iter();
+/// assert_eq!(items.next().unwrap().value, 10);
+/// assert_eq!(items.next().unwrap().value, 11);
+/// assert_eq!(items.next().unwrap().value, 12);
+/// assert_eq!(items.next().unwrap().value, 13);
+/// assert_eq!(items.next().unwrap().value, 14);
+/// assert!(items.next().is_none());
+/// # Result::<(), Error>::Ok(())
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
+    }
+
+    /// Remove the next element from the list.
+    pub fn remove_next(&mut self) -> Option<ListArc<T, ID>> {
+        self.peek_next().map(|v| v.remove())
+    }
+
+    /// Remove the previous element from the list.
+    pub fn remove_prev(&mut self) -> Option<ListArc<T, ID>> {
+        self.peek_prev().map(|v| v.remove())
     }
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
 
-    /// Remove the current element from the list.
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
+    // If you change the `ptr` field to have type `ArcBorrow<'a, T>`, it might seem like you could
+    // get rid of the `CursorPeek::arc` method and change the deref target to `ArcBorrow<'a, T>`.
+    // However, that doesn't work because 'a is too long. You could obtain an `ArcBorrow<'a, T>`
+    // and then call `CursorPeek::remove` without giving up the `ArcBorrow<'a, T>`, which would be
+    // unsound.
+    type Target = T;
+
+    fn deref(&self) -> &T {
+        // SAFETY: `self.ptr` points at an element in `self.cursor.list`.
+        let me = unsafe { T::view_value(ListLinks::from_fields(self.ptr)) };
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
2.48.1.262.g85cc9f2d1e-goog

