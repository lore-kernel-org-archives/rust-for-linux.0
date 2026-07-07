Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C1F3E5A0D
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420148; cv=none; b=sMW0mBYV3T4DEv+/H29j2QFXC35mQY73G0DRu4mjNO+t2LWcny6Lre2NDGC9GY/sougMtgctGf9oZplEbAD3VATuEYtaUDpeYMcffDBS6aI07VVcq9B7Jb7BjXtm91/slI4hP/bIhxQj6YG7tYh2L3PYCMbjcTQftL1sKhoug6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420148; c=relaxed/simple;
	bh=ieN8LcQSOYTmYkGGlnrF789cjM/PHqz+scnAhPVhgKY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hp6hldcLg4+Bf6zjja/RdwsT37eG0DpaDSC+5vm+34CqRnlf5c6A74rEMrjRs4QaT/TgpIFqCzfefqtdZIRwxi7o+eoEKa5MWBpPaBnQIRrHlWgVSoLIyOkWoKcscYc/AiHM5rJNEcucdzd5qtaUhMFxxx5a6qIogp9VD3bmXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pb7QE81l; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pb7QE81l"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-698c15b962cso613743a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783420142; x=1784024942; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXoBkrIF/6+NkhcX7sOgk5YaURN2pn4kfuAhXa7DLiY=;
        b=Pb7QE81lZGH/Bq/qGkU3/cK435JV/v8pfDEf5WLm4e8jiyQzDfmMCEs8USWXEuBLZV
         9jXrwR8Ji/j70Blgn0qUHOP1Au/VXdpM4OHJLnHDHm98iIRi1EE70+CQT3bRWS0ia3NG
         vuY+LnXDAKmZnAa5bbuhyBhdnJp7J/f+KX421X7bG+7VM9ADu5BUsZqX6Qq93ljRjccl
         KvPZAukF++KOKrTdPWboWAOu216pp8l+RyjsOMX6e7WVVConuOnxVG3VO3g/0+bmqsg+
         iSyDKYfmuzt0wznM0Cg6XupxIOeqdJOKQ6LV9HavnEHpvWM6Cr1H6x8WgMvnz03BcZYx
         480w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420142; x=1784024942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXoBkrIF/6+NkhcX7sOgk5YaURN2pn4kfuAhXa7DLiY=;
        b=gl+tHVwbLFD5DADPCM025IOpHmRwpy3dRhXelxTQFTawK/jG3D+3Bm4Aaw2qp0mKYJ
         /ZwnyZceqfjWjrlfdYcECp1qOH/YjUcQ6LQmmZU7+JEGLZLg9h9FZG0q7NHwhPjqmZL/
         SQmWEdL0z0Hpc69PRupqfYTuALvRB6U6lrCucZZmJDAD33J3XppXurblbowsIWAyaON4
         mglhIIb7OhWBNh0PkUNmze6v4LPneAEJZln/1m2GmEhVxc5iQz4MGf+W5nhjQqdiVjw8
         uSVQGFyfZwq1gjgacsQn1pRfAs+VcInXnublbhKDlWtaD5jj+52rd1g8vS+pbtnxfKp7
         6bUw==
X-Forwarded-Encrypted: i=1; AHgh+RplgLAuqQCcgl6WXKtLoNhpC9PxgtfhJB4Z1ZekbMRV70OD0INn73o5aOO1ECSIScUvWrJalznGqnKXUkPTtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzThZ7U5yJ3fQmUS2dTXz54ejdNQmqM02sF8HWQiglq74RH1e25
	xyht+30Qq1y/E00xYIjmpe/XUfXTid/9aisod321VDycak64n4mCXRtL3HciutrhiAN74r6bc0M
	Sr7aAf2M8R6KV4U6FfQ==
X-Received: from edrs11.prod.google.com ([2002:aa7:c54b:0:b0:697:8017:9116])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51c8:b0:69a:2ee6:4ca5 with SMTP id 4fb4d7f45d1cf-69a8565171amr2470686a12.4.1783420141541;
 Tue, 07 Jul 2026 03:29:01 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:28:51 +0000
In-Reply-To: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8271; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ieN8LcQSOYTmYkGGlnrF789cjM/PHqz+scnAhPVhgKY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTNTqiyJ77pNgmLdIYWt0ZO5bYyAZLdqECj2KK
 sYot7jRxNWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakzU6gAKCRAEWL7uWMY5
 RoLfEACHlTQrzHAE58rXtzZQ+XXXJLiGqJjUjs7wEUEZOJMEzhbC1M1Nebb9xg2Hh3OFwi86SSR
 23D7s6/R9cldJE9eTj17QqbqtIxBNykChMpEp9s7UteB5Jpvh2cFpbVNyPgVnesGki8jHuKyU5L
 Tiu7U8YN8BeqfMvh1VLB1E1r5dS85QvpcCSsxizV6lz5y2OvcHtiFWS6CB3dIm0jb/4rCrWGULa
 PIhV0B8hEC4yonB6n6WymCbjvBcfJ4hBkHOsD9bp8LEmtMY0tqwmLBOZZQw5xLIgJUDpTSEZBoF
 6wDY0SjJNzIvgiDL9Kbke6rp1YzX51BbLT2mXZ5O3izM2g7DIjGNOKc7kjpASmNkXS/qGw0aQlh
 uP3W9SzSWA6wpb6kc8yoo08Ydq0nixTGzaBzCUd6J4Il/bqefL/vsikYVPQLe1WmMTbm1XsZu9K
 YLho2Capp8A1uR+vKVmGi6N0PR1ZGsry7IjvNPokKpsPh0sG9LWA1b2ZkWi66+2Ov7k1NDOE269
 MOMkV2TjAmFME0NkQz5xghFhZ7PGofGOf8V+IJsxt6G0HJT5IGWxtmYlkCRP13vdGuC90uHId3Y
 LBv6YYCGPKGfrrmfFrF7ez3+JHC1X4ZBR30qAqttGu0nTfErf31f0UpK7LVvz7MKlPLC1YlHaj4 hICM8wWHr14WE9g==
X-Mailer: b4 0.14.3
Message-ID: <20260707-binder-noderefs-spin-v4-1-7c3c8bc16339@google.com>
Subject: [PATCH v4 1/6] rust_binder: avoid allocating under node_refs for
 freeze listeners
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
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
 drivers/android/binder/node.rs   | 41 +++++++++++++------------
 2 files changed, 64 insertions(+), 42 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index e0bc159da63d..f43388ed6ae2 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -180,36 +180,58 @@ pub(crate) fn request_freeze_notif(
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
@@ -280,6 +302,7 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
         let handle = hc.handle;
         let cookie = FreezeCookie(hc.cookie);
 
+        let _to_free_fl;
         let alloc = FreezeMessage::new(GFP_KERNEL)?;
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
@@ -300,7 +323,7 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
             return Err(EINVAL);
         };
         listener.is_clearing = true;
-        listener.node.remove_freeze_listener(self);
+        _to_free_fl = listener.node.remove_freeze_listener(self);
         *info.freeze() = None;
         let mut msg = None;
         if !listener.is_pending {
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 979366276680..59c5ab747bf4 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -659,29 +659,26 @@ fn do_work_locked(
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
 
     pub(crate) fn remove_freeze_listener(&self, p: &Process) -> KVVec<Arc<Process>> {
@@ -697,6 +694,8 @@ pub(crate) fn remove_freeze_listener(&self, p: &Process) -> KVVec<Arc<Process>>
                 p.pid_in_current_ns()
             );
         }
+        // If the vector is empty it needs to be freed. However, we can't free it here because that
+        // might sleep, so return it to the caller.
         if inner.freeze_list.is_empty() {
             return mem::take(&mut inner.freeze_list);
         }

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

