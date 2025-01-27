Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B536C1FDE28
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737974073; cv=none; b=YnyVwnpWRHi37BtkZj7sG5Te43rVaTQ4DELNZcLn9YPiuTAaYBkVuO+yumdFun1Ru+BT9WpkWyN0jVZ7cy0n5cxKQAgpN/ioCOrIscSIQtYI5BPbKBh9cUNto5knUubaHPUv8maWM2x6R8ig9QrC7j+kGRg5fuwRwpX20qdWhN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737974073; c=relaxed/simple;
	bh=ttAjlADe2z9qvjo9BjzNh0c6cDOy6zkyaaJyDb6M7mE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sSmzCj3jK9FrPk6dZHr+dDqNur8BGi4BY285Apvgo20m0hxPwY4dBS+ve2qVayyU8icsR42Us2obF4iQghcEcOsCdbhZ7klvwM+YbVuGd+5YWjOkVkm+4B9il1E+MKCEd7WrNZsb28vQolpcUnfgkus8Vq7WN6AJTtQPCpyF6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FDfzCH9Z; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FDfzCH9Z"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4362552ce62so20641455e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 02:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737974070; x=1738578870; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+dndn/M1tpjjYj5fSrp/cB2j25FLB5R2IYqQNLwoLE8=;
        b=FDfzCH9Z+EFNWuxls2iJEavwc0H3drT5O4zF7DsYbd8oIMK7bFSFrdyo+XawntXAux
         NmZCbMHhDkx8HiClufdK8ta0DjuseqqpnOQsmEuxKOvR//0fPHWySIpd/HWJ1q5TQXpx
         Ufd2yGMGMIJESpMIoaxWlE25P1jQbSBTu2baGHvQ+5vUEQIjh7/e5vr6eDNNn/9/FcJX
         sjm8Up6zZ2hHiqWQX7u/xc6GUJIEX7wjdLHAdyQlEVBlykXqGUMITiTQrXpnCWaK0pAJ
         /01hx4688xiglpfgnB4fezifz3+MPkbZr7tHJiOhPHp9aJsZMynpsUSEog0GmuXpHq/j
         ViPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974070; x=1738578870;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dndn/M1tpjjYj5fSrp/cB2j25FLB5R2IYqQNLwoLE8=;
        b=wslItKB2GUE3WO7QkksbtmPLoPeG5KDCkll+wnAxYXYzPnLDVdOdd1ALhL/m91T6Ah
         Kx0W4Dha73YXAoCNqB3eXEuUzIwqR5XbRWViKFkHCWYY/O2MXTSunNcUZzzDJb7oshPL
         SodjfwQ/e9KBE1ocQJga7gGzPUdb6mvPTn56NwyhSthoeVuJ9oAEBUE7XgcjIkSLGhUe
         B0kpOC+B87F+CPjU5DfWJKsHWAUIVH/mCUHsxJNlYs3pAUBXOI17MZRa0NfsMspbouvp
         gfmzyHjPm2wlHgcg/F2LoOTD9ye/Vx+FkYwReygjT1tXIxqj6pXVnb1oGtGO36TAnhGR
         92EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0xtiYifmSI2Db8Q1qiVD97QGumeVncU6s7caucsDDKz3biHLD3wDcRh0H7yxsuI/5HJ87QGvVZL8UtS4WQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD2JEl5jq84EjjvwdckUuODIcAdo/I6/4k99NG8h02FsBHndUM
	v7agd3ZQaUTlV6X1CA66ghqTLJUw7BB7VxDGEj4Eaep76h4A61+6wGQQ2W1P4Z10u1y2+k8Bz+D
	PK3ro43NNltWTPA==
X-Google-Smtp-Source: AGHT+IE7Uhb0PlTgE6Hcvo4FbvdFwJaE7zk4zSOS4XvMVCV/zCSDPJZzt4sQPxnLzAkvxNd/MYVbxe3ftg2+2dk=
X-Received: from wmd7.prod.google.com ([2002:a05:600c:6047:b0:436:6f3f:58de])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3593:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-4389144eea8mr445538175e9.30.1737974070104;
 Mon, 27 Jan 2025 02:34:30 -0800 (PST)
Date: Mon, 27 Jan 2025 10:33:58 +0000
In-Reply-To: <20250127-cursor-between-v5-0-f7c388c23642@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250127-cursor-between-v5-0-f7c388c23642@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5247; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ttAjlADe2z9qvjo9BjzNh0c6cDOy6zkyaaJyDb6M7mE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnl2Ew0rAT4RrxFPCY/oK+eyhxbCwlLKm+BHg9/
 se9pjlW/+uJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5dhMAAKCRAEWL7uWMY5
 RtAoEACpjUlkZf43Zium68jFcVcBW2krWS0i9//VdnDW9Rwra4BpeL93BUACEXAS6q9QFK7npsS
 X4TKZf+EzsDfsR0+FVlimi79NdmnmTez1oPivhQatFmoYKbJWvDpt+ciCW9rzs8eKfHi8asZfOj
 DvGiNA7fkuJDT1hzhHwGch644Imu/wle3XLRhnWMkvt5usjE7cywct8VUYhgrgwW3j+XAEs6mlg
 vT0z82d6PwZo/YrsSHkt9dJnii8VRrnn/Dd2PpU5V12TtFK1stbqzZQAmfuALqpwQa8e9CyqCDj
 wZlO2+I2sLYE2yqt30x50975WmUOYIBCRTcCqEs8JktYdyuC0GrovkpcqYPAlGiW50b872/e2JN
 nDJ1LT6X6FMeGLWW+Ux62CVB9D+/Zi/HHK8080if+4INB9GOyWaKoRljx3dIUPGI7uEpOkrUHRo
 VfYkP9Ik3wMMluX6NFZtmKbltHXwPbNsiPhydGtAemD8PvX8LmMhyuVxEpx439zdkr0DINo4/uI
 vXGW90KP6pIZgz+oBMt0JZIhbRMHwShOD1n7NpWsd4yc0eV0my5lPGs+1K43A2SZnRreK/8Z4FK
 aaskrlNuh0ouamfzmgEIuONwfwvUe5i+YfUnJBKy9tWP307xG1T34k1tOSk+w4o8t59uoBS6m6x ppVJLSWXBjC8XFQ==
X-Mailer: b4 0.13.0
Message-ID: <20250127-cursor-between-v5-1-f7c388c23642@google.com>
Subject: [PATCH v5 1/2] rust: list: extract common code for insertion
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To prepare for a new cursor API that has the ability to insert elements
into the list, extract the common code needed for this operation into a
new `insert_inner` method.

Both `push_back` and `push_front` are updated to use the new function.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 70 ++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index fb93330f4af4..97b3599b7207 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -245,8 +245,20 @@ pub fn is_empty(&self) -> bool {
         self.first.is_null()
     }
 
-    /// Add the provided item to the back of the list.
-    pub fn push_back(&mut self, item: ListArc<T, ID>) {
+    /// Inserts `item` before `next` in the cycle.
+    ///
+    /// Returns a pointer to the newly inserted element. Never changes `self.first` unless the list
+    /// is empty.
+    ///
+    /// # Safety
+    ///
+    /// * `next` must be an element in this list or null.
+    /// * if `next` is null, then the list must be empty.
+    unsafe fn insert_inner(
+        &mut self,
+        item: ListArc<T, ID>,
+        next: *mut ListLinksFields,
+    ) -> *mut ListLinksFields {
         let raw_item = ListArc::into_raw(item);
         // SAFETY:
         // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
@@ -259,16 +271,16 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
         // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
         let item = unsafe { ListLinks::fields(list_links) };
 
-        if self.first.is_null() {
-            self.first = item;
+        // Check if the list is empty.
+        if next.is_null() {
             // SAFETY: The caller just gave us ownership of these fields.
             // INVARIANT: A linked list with one item should be cyclic.
             unsafe {
                 (*item).next = item;
                 (*item).prev = item;
             }
+            self.first = item;
         } else {
-            let next = self.first;
             // SAFETY: By the type invariant, this pointer is valid or null. We just checked that
             // it's not null, so it must be valid.
             let prev = unsafe { (*next).prev };
@@ -282,45 +294,27 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
                 (*next).prev = item;
             }
         }
+
+        item
+    }
+
+    /// Add the provided item to the back of the list.
+    pub fn push_back(&mut self, item: ListArc<T, ID>) {
+        // SAFETY:
+        // * `self.first` is null or in the list.
+        // * `self.first` is only null if the list is empty.
+        unsafe { self.insert_inner(item, self.first) };
     }
 
     /// Add the provided item to the front of the list.
     pub fn push_front(&mut self, item: ListArc<T, ID>) {
-        let raw_item = ListArc::into_raw(item);
         // SAFETY:
-        // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
-        // * If this requirement is violated, then the previous caller of `prepare_to_insert`
-        //   violated the safety requirement that they can't give up ownership of the `ListArc`
-        //   until they call `post_remove`.
-        // * We own the `ListArc`.
-        // * Removing items] from this list is always done using `remove_internal_inner`, which
-        //   calls `post_remove` before giving up ownership.
-        let list_links = unsafe { T::prepare_to_insert(raw_item) };
-        // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
-        let item = unsafe { ListLinks::fields(list_links) };
+        // * `self.first` is null or in the list.
+        // * `self.first` is only null if the list is empty.
+        let new_elem = unsafe { self.insert_inner(item, self.first) };
 
-        if self.first.is_null() {
-            // SAFETY: The caller just gave us ownership of these fields.
-            // INVARIANT: A linked list with one item should be cyclic.
-            unsafe {
-                (*item).next = item;
-                (*item).prev = item;
-            }
-        } else {
-            let next = self.first;
-            // SAFETY: We just checked that `next` is non-null.
-            let prev = unsafe { (*next).prev };
-            // SAFETY: Pointers in a linked list are never dangling, and the caller just gave us
-            // ownership of the fields on `item`.
-            // INVARIANT: This correctly inserts `item` between `prev` and `next`.
-            unsafe {
-                (*item).next = next;
-                (*item).prev = prev;
-                (*prev).next = item;
-                (*next).prev = item;
-            }
-        }
-        self.first = item;
+        // INVARIANT: `new_elem` is in the list because we just inserted it.
+        self.first = new_elem;
     }
 
     /// Removes the last item from this list.

-- 
2.48.1.262.g85cc9f2d1e-goog

