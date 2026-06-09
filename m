Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837EB39F19F
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997602; cv=none; b=XEM9ZrrTtenwNlk2HZ55ZItjaHJLRCIeMO3xCIwX0mYNiJpKMMehdb+xC/Ypq7G8i07Pdb2yC8ZqL1w1sa9wapqHzNejITGtGUCcCrVw3NpMGgbSzSCfMxCNJntrj7d0vQfmTFsLTAqCBr85IHLGp0UhKqrijgyxl7h4MknRIwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997602; c=relaxed/simple;
	bh=TFN1brMmJPT4EhXbIbhzfRIZtN6J0E/h4fXHuYijQvo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=my93dZaP5D3Ygs5FywtmVPp00OxGtLkXUCRnmCc9WOf7X4r27txKnpnQiBiolzpitoHF6Aaa4zV4VBK/B365q/K2FIP9CCxbTxc9Ls7q5ifP0XuGfbjEQeeSIoBKRW0E6UPE9x7C9OTlM6OnmhUQySMHJs3Up/3kM5ZooiSGPvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OEJXkDfi; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OEJXkDfi"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45ef66cc579so2195446f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 02:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780997599; x=1781602399; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qz58x4cngup+sL4Jsy2H5GzNpqLAA2yZfnAXUBuF4xs=;
        b=OEJXkDfio282nTYT+zcBHn6vMwnkqm/RgqirlcGp8O3O/xD+iaAclKUEqkCdF0RsD9
         T3vpIeuKjqMnEKJojya/PlhRMxOXAnE7CAIzJeDTPz+kP4duZ6QJOFXW4G8VUI9eNIEN
         WvA6F3fXfpVJ1Xt6cYnhlxU+upwW5xST8NioqnfkvhbmobcGuXDF73XPnktFOeEtiLSL
         qT2/Q76KZ8BGk8tnB5p5bW6QoJZVH2QAr7NfZjgEy/NT9N4ncu1LGO7PLwbH06NRQ0be
         7H3E0blAG8Jrt9psripeM1O+YngUFn8fIPHFXBbta+uDPxpP0YW/r1hNg6M6Vt0Y0t84
         8H0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997599; x=1781602399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qz58x4cngup+sL4Jsy2H5GzNpqLAA2yZfnAXUBuF4xs=;
        b=HqE4TcyYf+vwiSgM/Ie9bO0/3M73TUJTcCBUkmPTqiq0EXHx2HrV3Sk7VJ7F6E7irj
         YLwYXH1ryiU2tvKGDr4kVRHiVYYGprNxZp6crjYyKKFlxjm7WANcPXYqDEK7wU70k2//
         iGgxUj0zt+2nV0nzQvE7bgS7e+m+XtNzDdlJXPnrsPjd86oEnYXHkT4gdEwbuT02WYSF
         bbku57775b5GcN9IXZ+cwrPykN4YyeEYAJ63FtFGaHjmKwPNwzD61d849iID8AbCZltI
         yut+6u82UoUMmLGzua6mcjkJSczqSZTKGgMVo43wqvF3nkfNU/3eCPCSFunMiLP5PjQX
         UJ2g==
X-Forwarded-Encrypted: i=1; AFNElJ/RIj9HfAC6Sl29GH1gSNEw+J3LQiQbIXJ1uQ7Nd4sps3v4nRaWMXC5LHApBmx4f9Zz9Yjvu5rnpCQEzJEfKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxTFtOR7uZ4BuXs7qHdwWuNykxTtR9OSLI2340ElqnK4kNqnAZ
	h3WxZ/kufRKmDtKkO+2cHVrNOmTK5CsP+hCmPGvM54Zl2vw+VEW//vADfdQUoXZW1Y8M4Ts9GOb
	UkmgT8bsq7heVnj5dUw==
X-Received: from wmjl22.prod.google.com ([2002:a7b:c356:0:b0:490:b6a8:96fa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:529b:b0:48f:e230:1d12 with SMTP id 5b1f17b1804b1-490c2625f9bmr287679925e9.31.1780997598448;
 Tue, 09 Jun 2026 02:33:18 -0700 (PDT)
Date: Tue, 09 Jun 2026 09:33:07 +0000
In-Reply-To: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8960; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=TFN1brMmJPT4EhXbIbhzfRIZtN6J0E/h4fXHuYijQvo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqJ93aNehuGCRoIuDZavdmo/p8AuGo/j0YQbyK1
 C4jkH+XQ4uJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaifd2gAKCRAEWL7uWMY5
 RqfGEACoOaL5+Zm1MaICF+hbBE94LQViSNr/fesCSp+O31WTuwNH6B9IdVpK9H4GrInnij+2B3W
 oOMJjRmPbm84eHnswuUa6eeKXTr6ezt0phHJCkEkzE2r8CMvIacK7PRMUCkx9cWFeS2Ah+A5bFW
 P6gI2jLrGlB3fZONQc4qkMPclfq8okSP1oHejV75a5WtJ7InQ5baRa9swpezNBgEVLupDRpPdqn
 Mx2Zr3akUQuD8ogcRQEY4PZO3sCtXe1XYZVBDT7bselq0/I7W880eX2AT3f9ZaEJBZ5w/ieDV7U
 2WCMjgrvLwwZTJdsCiTtMnwAdCHioUOLDKt7T0S8g3qukp8xBONT+xBn1yXsACC8xQVlHjayyLJ
 bb0gLYDWN+FVVl/YfqMFZDkBuaGnBJ0dKY8J3qLv6Fg2BQSZySBEgHb3hpn/WwXKwKxaLXDOTwI
 ILx4IpJBRsiqYem2nbO+KeWhF56TXfLFqIS7Qld1hpuDkiVTjC1j9U4UNWhT3EwRWorxAXsOTUJ
 M6XFWtcJ5Z7uopb8WKB4qD1wIe7yd01Out687DjRgxUBHwkzXPKYlteQrWoKSXFsViGgk8Wb2qX
 fZy8lacalZ4dJa5NChhSTWdYrOLNVV3EZxOFmC5XIQSYukATDBGHmbx+p+0LG1JseXoWW+so4lp LwAcIANxKeWl04w==
X-Mailer: b4 0.14.3
Message-ID: <20260609-binder-noderefs-spin-v2-1-eafde2ff376c@google.com>
Subject: [PATCH v2 1/6] rust_binder: avoid allocating under node_refs for
 freeze listeners
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

The node_refs mutex needs to be changed to a spinlock, so in preparation
for that, update freeze.rs to avoid allocating under the node_refs lock.
This is done by adding a retry loop so that if add_freeze_listener()
requires reallocating the KVVec<_> of freeze listeners, the caller will
allocate a larger vector and retry.

Analogously, the remove_freeze_listener() function is updated to return
the empty KVVec<_> when it is no longer needed, to avoid calling
kvfree() under the node_refs lock.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/freeze.rs | 67 +++++++++++++++++++++++++++-------------
 drivers/android/binder/node.rs   | 55 +++++++++++++++++++--------------
 2 files changed, 77 insertions(+), 45 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 53b60035639a..20041689e98d 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -173,36 +173,60 @@ pub(crate) fn request_freeze_notif(
         let msg = FreezeMessage::new(GFP_KERNEL)?;
         let alloc = RBTreeNodeReservation::new(GFP_KERNEL)?;
 
+        let mut afl_vec_alloc = KVVec::new();
+        let mut info;
+        let mut node;
+        let mut freeze_entry;
         let mut node_refs_guard = self.node_refs.lock();
-        let node_refs = &mut *node_refs_guard;
-        let Some(info) = node_refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION invalid ref {}\n", handle);
-            return Err(EINVAL);
-        };
-        if info.freeze().is_some() {
-            pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION already set\n");
-            return Err(EINVAL);
-        }
-        let node_ref = info.node_ref();
-        let freeze_entry = node_refs.freeze_listeners.entry(cookie);
-
-        if let rbtree::Entry::Occupied(ref dupe) = freeze_entry {
-            if !dupe.get().allow_duplicate(&node_ref.node) {
-                pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie\n");
+        loop {
+            let node_refs = &mut *node_refs_guard;
+            info = match node_refs.by_handle.get_mut(&handle) {
+                Some(info) => info,
+                None => {
+                    pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION invalid ref {}\n", handle);
+                    return Err(EINVAL);
+                }
+            };
+            if info.freeze().is_some() {
+                pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION already set\n");
                 return Err(EINVAL);
             }
-        }
+            let node_ref = info.node_ref();
+            node = node_ref.node.clone();
+            freeze_entry = node_refs.freeze_listeners.entry(cookie);
+
+            if let rbtree::Entry::Occupied(ref dupe) = freeze_entry {
+                if !dupe.get().allow_duplicate(&node_ref.node) {
+                    pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie\n");
+                    return Err(EINVAL);
+                }
+            }
 
-        // All failure paths must come before this call, and all modifications must come after this
-        // call.
-        node_ref.node.add_freeze_listener(self, GFP_KERNEL)?;
+            // Now we add to the node's freeze listener list, with retry and re-allocate if the
+            // vector is full.
+            //
+            // To ensure that the node is added atomically, this is the first time we modify any
+            // state. When this call succeeds, all other modifications must occur without the
+            // possibility for any failure paths.
+            match node_ref
+                .node
+                .add_freeze_listener(self, &mut afl_vec_alloc)?
+            {
+                Ok(()) => break,
+                Err(resize_target) => {
+                    drop(node_refs_guard);
+                    Node::resize_for_add_freeze_listener(&mut afl_vec_alloc, resize_target)?;
+                    node_refs_guard = self.node_refs.lock();
+                }
+            }
+        }
 
         match freeze_entry {
             rbtree::Entry::Vacant(entry) => {
                 entry.insert(
                     FreezeListener {
                         cookie,
-                        node: node_ref.node.clone(),
+                        node,
                         last_is_frozen: None,
                         is_pending: false,
                         is_clearing: false,
@@ -273,6 +297,7 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
         let handle = hc.handle;
         let cookie = FreezeCookie(hc.cookie);
 
+        let _to_free_fl;
         let alloc = FreezeMessage::new(GFP_KERNEL)?;
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
@@ -293,7 +318,7 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
             return Err(EINVAL);
         };
         listener.is_clearing = true;
-        listener.node.remove_freeze_listener(self);
+        _to_free_fl = listener.node.remove_freeze_listener(self);
         *info.freeze() = None;
         let mut msg = None;
         if !listener.is_pending {
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 69f757ff7461..fb27674a8c94 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -657,33 +657,37 @@ fn do_work_locked(
     pub(crate) fn add_freeze_listener(
         &self,
         process: &Arc<Process>,
-        flags: kernel::alloc::Flags,
-    ) -> Result {
-        let mut vec_alloc = KVVec::<Arc<Process>>::new();
-        loop {
-            let mut guard = self.owner.inner.lock();
-            // Do not check for `guard.dead`. The `dead` flag that matters here is the owner of the
-            // listener, no the target.
-            let inner = self.inner.access_mut(&mut guard);
-            let len = inner.freeze_list.len();
-            if len >= inner.freeze_list.capacity() {
-                if len >= vec_alloc.capacity() {
-                    drop(guard);
-                    vec_alloc = KVVec::with_capacity((1 + len).next_power_of_two(), flags)?;
-                    continue;
-                }
-                mem::swap(&mut inner.freeze_list, &mut vec_alloc);
-                for elem in vec_alloc.drain_all() {
-                    inner.freeze_list.push_within_capacity(elem)?;
-                }
+        // If the vector needs to be resized, it's done via this argument.
+        vec_alloc: &mut KVVec<Arc<Process>>,
+    ) -> Result<Result<(), usize>> {
+        let mut guard = self.owner.inner.lock();
+        // Do not check for `guard.dead`. The `dead` flag that matters here is the owner of the
+        // listener, not the target.
+        let inner = self.inner.access_mut(&mut guard);
+        let len = inner.freeze_list.len();
+        if len == inner.freeze_list.capacity() {
+            if len >= vec_alloc.capacity() {
+                // Request the caller to reallocate.
+                return Ok(Err(1 + len));
+            }
+            mem::swap(&mut inner.freeze_list, vec_alloc);
+            for elem in vec_alloc.drain_all() {
+                inner.freeze_list.push_within_capacity(elem)?;
             }
-            inner.freeze_list.push_within_capacity(process.clone())?;
-            return Ok(());
         }
+        inner.freeze_list.push_within_capacity(process.clone())?;
+        Ok(Ok(()))
+    }
+
+    pub(crate) fn resize_for_add_freeze_listener(
+        vec_alloc: &mut KVVec<Arc<Process>>,
+        target_size: usize,
+    ) -> Result {
+        *vec_alloc = KVVec::with_capacity(target_size.next_power_of_two(), GFP_KERNEL)?;
+        Ok(())
     }
 
-    pub(crate) fn remove_freeze_listener(&self, p: &Arc<Process>) {
-        let _unused_capacity;
+    pub(crate) fn remove_freeze_listener(&self, p: &Arc<Process>) -> KVVec<Arc<Process>> {
         let mut guard = self.owner.inner.lock();
         let inner = self.inner.access_mut(&mut guard);
         let len = inner.freeze_list.len();
@@ -694,9 +698,12 @@ pub(crate) fn remove_freeze_listener(&self, p: &Arc<Process>) {
                 p.pid_in_current_ns()
             );
         }
+        // If the vector is empty it needs to be freed. However, we can't free it here because that
+        // might sleep, so return it to the caller.
         if inner.freeze_list.is_empty() {
-            _unused_capacity = mem::take(&mut inner.freeze_list);
+            return mem::take(&mut inner.freeze_list);
         }
+        KVVec::new()
     }
 
     pub(crate) fn freeze_list<'a>(&'a self, guard: &'a ProcessInner) -> &'a [Arc<Process>] {

-- 
2.54.0.1064.gd145956f57-goog

