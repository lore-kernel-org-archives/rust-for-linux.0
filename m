Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6D63F0762
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527024; cv=none; b=SZ7OZRZkN2UUiKI+rHqVXUlLFteYKkOYGT+suMK3Fdpe5GI8i1oqtOtuaiUR9yXRryPCL6pp8PYmwYjsA4P6kTSvbJTT9qqJamnoOfAsooTkfX4mrMhg9dvjrqgJbndJstRpK4la2rbPpZrwXqE2poa5cXibo6MU16FhHJhvwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527024; c=relaxed/simple;
	bh=nU8CMklrZ4pzGEGPtJR5y5DoyOiug+EmYak7mSKNXJQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UxHCtYK7mWnyU9nC4Dc+3qn88I4pMTAh2P8MT24xBy5HgR9YfnCjQF00Q4CGDGbRY0Q0oF9Tkk391axx/yinaSLZRxUSPmD5A0rUO2u6Eq8g03LTrqOtMuCnSyTauIPgUJyPC4eRHLoaGz/70d2eN3mDTELnxi4xqmgB9G0FUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nPNwYLFg; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nPNwYLFg"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490ab3f6e55so18772325e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527017; x=1782131817; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v2gf6or+nNI5nNsuVDLEiXsD4C1ozOp69hEfNPSp0eM=;
        b=nPNwYLFgLFL5UaQP7R1y3BZFFW+s9IjQdzzJvYCSchOTzGwa46+ESu3w0A/PtuBSgR
         H4FEDGGKjmQ3zKYfEZJzbuHLKuhSpe92ssVsvbYypS4wi77v5CVyaPt8Q9JA8ihfqR6v
         R3AiPigjLwp3hkdfOWE8k54lXJK4aodi+dufzpuHLJnJEdEldbLTCBRA0NKqPuvzGeSk
         t0STl0UAj5WvTAGsbOHntrXE4BAY8POT4UeKUIevwedFvcQlDoIn7wCAL7E8huiSyv7/
         otE4cG6x9UsQ/sMp982ZOmRcUzpNISj6HtQD2MPdXH/Ih6Zd4eMGvjkEvpL5fvdKKDQS
         PFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527017; x=1782131817;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2gf6or+nNI5nNsuVDLEiXsD4C1ozOp69hEfNPSp0eM=;
        b=lCv8n6xLnADYIy3PYHyOauK3mQngL2SMiFfL3VD8MMa1mi+Qq1dsP7FRp1dzkxP46O
         ZxibutA34uN4LZjWj34i6wpGG5Jkl2oxSuAxcPRVOdmiN74d6Msfwrvxc347Ym5J0MOc
         +CIueeMUqliHzLkA4m8eme4rfT4k0ND+CW1s8NIGjH7Pv3qx4qGfAt1elV24jDEIBbk6
         RUFmb8r//pKuFU6bzpLW9MbAlmhunUYJu/IoDWxfk+y+5kV67KcjOoQhEproDZH2cAo/
         SDioZOs22BAn3kBTwlh1VmIFgsChtDy1REAkcv6I339W0C6G3mTtxIH760QEJ1mlatk7
         tIEA==
X-Forwarded-Encrypted: i=1; AFNElJ/pTfEXVaEx87Yplz1W98X0qtqHk+gKZ++tKYTrD62fBjX/hTHCpmvs6xqQvhvaIYtgBAZLlSsOwPGoL+oqpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZEfv0VYKaZYMqXhuZNJmK0KyNQienQgf0EvDJNmnMHBE98LK8
	LnJdTzeR99cJWUUdYvXI/+IVr5yM9jJ/k4GMWcOpxuurnDtnu5+G9ryafUu6NxfFOvU05zZTGZW
	Af9RtQZZWtJMjsVkvLQ==
X-Received: from wmqi7.prod.google.com ([2002:a05:600c:3547:b0:490:5e18:ff1c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:314a:b0:490:da12:f1fa with SMTP id 5b1f17b1804b1-490ec503f0cmr164316725e9.31.1781527017056;
 Mon, 15 Jun 2026 05:36:57 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:36:41 +0000
In-Reply-To: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8714; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=nU8CMklrZ4pzGEGPtJR5y5DoyOiug+EmYak7mSKNXJQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqL/HlQ7fchwgODwGJBHs0vFLh68QtTVjmTaV5Q
 QZVEd6dNrSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCai/x5QAKCRAEWL7uWMY5
 RtsxEACXdxI+z6PPVIUPO4GzFs5e6XDXd5UX/hL/+ztXZSzDrfsz5YsLjRIceMW7lSdwZzCAFXB
 4FQx9MEOX1VzIuHzt0sLdgfSu0liiYRE1Ez34ytvTrCAcGQw3jtGEC2mg3YtCorICmBe2rUSPRC
 ASY7Ya23Bxf0/2NTSo3yajzs6hNODlOr7gNXUlVngt6iBEEHYHk8jlxN3LKIBlZ64/a0F0Tokoy
 ppnh7UUl1g/DEcQo4y3rJl/oeXhMIZ+DNWr9/1KzEi+0itqsSrih4kJRzdYgQjbtgzdKz0prbUr
 IgTnUzX4rBqhpNu69wRJlBPLs+/EsAGQghD5rU4tkJhh1HBTpV/8n14AZOBM5hihCQvvBjxHvbp
 ty6Km7/X2ejisxvXOCQWGtIGjaxUFLCaqqJoFwi0rQS91zvowPPXED5OJjRP4gmrltj4E1fxuAb
 PfoWeBSAXtWZyPjUCXYUREthtsd8oFfIyFDlp6r4KFTrBsk6nBxX0ZpN+ITxY+okF6ZC3wdrmkW
 VdHMu6UJh7j6+JMuko6RyCCqB8zNm1w2NGzmbl2UU0EUbXzjOygW98YtnpWPK08ONGBCMaFurG+
 BElV4kx8L+1wjBv6zPwunB0GTg/wYC23LSR1HFMt9OAh5DRVy1Fv0rFErueWJ6vLgd1C+3AISs5 Zz5ZUmY5sz7vw9g==
X-Mailer: b4 0.14.3
Message-ID: <20260615-binder-noderefs-spin-v3-1-3235f5a3e0a0@google.com>
Subject: [PATCH v3 1/6] rust_binder: avoid allocating under node_refs for
 freeze listeners
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

The node_refs mutex needs to be changed to a spinlock, so in preparation
for that, update freeze.rs to avoid allocating under the node_refs lock.
This is done by adding a retry loop so that if add_freeze_listener()
requires reallocating the KVVec<_> of freeze listeners, the caller will
allocate a larger vector and retry.

Analogously, the remove_freeze_listener() function is updated to return
the empty KVVec<_> when it is no longer needed, to avoid calling
kvfree() under the node_refs lock.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/freeze.rs | 65 +++++++++++++++++++++++++++-------------
 drivers/android/binder/node.rs   | 47 ++++++++++++++---------------
 2 files changed, 67 insertions(+), 45 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 53b60035639a..2aef4f62cd11 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -173,36 +173,58 @@ pub(crate) fn request_freeze_notif(
         let msg = FreezeMessage::new(GFP_KERNEL)?;
         let alloc = RBTreeNodeReservation::new(GFP_KERNEL)?;
 
+        let mut afl_vec_alloc = KVVec::new();
+        let mut info;
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
+                    afl_vec_alloc = KVVec::with_capacity(resize_target, GFP_KERNEL)?;
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
+                        node: info.node_ref().node.clone(),
                         last_is_frozen: None,
                         is_pending: false,
                         is_clearing: false,
@@ -273,6 +295,7 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
         let handle = hc.handle;
         let cookie = FreezeCookie(hc.cookie);
 
+        let _to_free_fl;
         let alloc = FreezeMessage::new(GFP_KERNEL)?;
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
@@ -293,7 +316,7 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
             return Err(EINVAL);
         };
         listener.is_clearing = true;
-        listener.node.remove_freeze_listener(self);
+        _to_free_fl = listener.node.remove_freeze_listener(self);
         *info.freeze() = None;
         let mut msg = None;
         if !listener.is_pending {
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 69f757ff7461..53fc8ba42e86 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -657,33 +657,29 @@ fn do_work_locked(
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
+                return Ok(Err((1 + len).next_power_of_two()));
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
     }
 
-    pub(crate) fn remove_freeze_listener(&self, p: &Arc<Process>) {
-        let _unused_capacity;
+    pub(crate) fn remove_freeze_listener(&self, p: &Arc<Process>) -> KVVec<Arc<Process>> {
         let mut guard = self.owner.inner.lock();
         let inner = self.inner.access_mut(&mut guard);
         let len = inner.freeze_list.len();
@@ -694,9 +690,12 @@ pub(crate) fn remove_freeze_listener(&self, p: &Arc<Process>) {
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
2.54.0.1136.gdb2ca164c4-goog

