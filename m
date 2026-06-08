Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7E23E832C
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930393; cv=none; b=P36pa//3WCVn/3urMl+xcFQHTLuJs2fllJcmaGP/eQ7sWusnuZS7oENr2dwt8t1TQfT99hFddeLRT04WBWjjefGdEsh+QyrVDD47r2dzw0b3ASeVPSuy8xNS3gMHO+pqrVWFPAzypwocS7J77L9w8oIusudk2xVX+yjUkP2Is7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930393; c=relaxed/simple;
	bh=WSMGmUCz6zik8PmOBp5kSTmlhN0LEI560XqVjmuAeo4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=u+Oyscqff6ESErt2TLw1T7EedQh20AOmwboh51hdKJvI+YsH8FzN5hSyOlv+N9KDDa89oCtng0mmWoUlxeETn4bzfiewngIzP2u0mayYDyq8sh9s/shTs/FwJ1q0fy3dGshqKMEC/Qergn7nZcfusEQeRwZ0LEZ8cjTRO8ZkDVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J81aozCN; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J81aozCN"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45ef66cc579so1874801f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780930389; x=1781535189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3wnAmQdiyRt/t2O7FQdXmw09IgukPHTVLXcWfbV+JHA=;
        b=J81aozCNneAPExSpdoYrJOz8RRMy+s2uaSgTZltEJktiUI5sw3xLAR4XxCgHh7judp
         VExIXFPvSN5g2UoWhrCvgx0Ka3I86iXvxTMKmsRp1FQtOQ8XccEs/8C1140/3BRU4ajw
         odhoQaRKMua311sKVPQ4J+AgYbRUp0brRP93JkRIdl/fWvEI7LRuvSzC6KmMq116d5/0
         Qd9b74IM8C9vIC6ZD4EKvJve2J+YgKDOZNmChDuOxkwrEapnX+R8GR44r+kQMbupsdOX
         EzUxFcg2HefTg+3X7ZgqNn5uG/AkpXsmMFcclhAzbLIsd1r5H7yw1Ib2egmgktbOheaZ
         5U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930389; x=1781535189;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wnAmQdiyRt/t2O7FQdXmw09IgukPHTVLXcWfbV+JHA=;
        b=POlYRzWWFhme3H3xZoUrz/N/3t3UPvu0R/dxuRhKcgkfhkdDk26twNdO3MW3zoJSDb
         bwpCdZGhzp6VlfAM5RLvcXKs2vQgd9rHTnxXdNwtqW65yiUcTnNDfoDZEagpyMeZ1iIw
         HyvfVWrbVACzhT+uafb0kD/sCalqXx8GdXhkunOS/FSt9+nWmXgum7ixwhiyTt7dx02W
         DZrAKCjRtCHjIfF+4TWHc7RDYtUCYnRAKlnLEZyBnqCMlrDHQjF6aZXPgUlaPAADJkQn
         8l3W4WJ+jH3sGik2Zef4gh8xZisn7BDLDVmUYZ5koRLmoXZ5TrRmZODWJDtyPTllfl2l
         Sx/A==
X-Forwarded-Encrypted: i=1; AFNElJ/MHKzYgYbbCguUg18OO7BimFSsZr9uMSNBjVl1GzMQa70VqQWwnXUxgCbrF+o0fPWQ6IEoSOnBvU8wPpPOnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9vtYPS0QWG5ZQzp5jxk0Rg7AIMOBGoOz7Ia3SsofmC7zJ+0VN
	eW30Og5KEmPfsBWMzNi84MpMKYNRz0wsodO+15RFlhfIFGPOO8MsSzUvBd320MIU9/lThLV+CgZ
	gTqJYedzssg2ksXSK7Q==
X-Received: from wrbdk14.prod.google.com ([2002:a05:6000:b4e:b0:45e:f7f7:7a3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:54f:b0:45e:8547:f21e with SMTP id ffacd0b85a97d-4603063c06amr20785886f8f.36.1780930389191;
 Mon, 08 Jun 2026 07:53:09 -0700 (PDT)
Date: Mon, 08 Jun 2026 14:53:02 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE3XJmoC/x2MOwqAQAwFryKpDcQv6lXEQnejpomyARHEuxtsB
 obhvQeMk7DBkD2Q+BKTQ12KPIOwz7oxSnSHksqWWupwEY2cUA8nr4Z2imI1Ewdqup7qCnx6epL 7vx2n9/0AP/BrF2YAAAA=
X-Change-Id: 20260608-binder-noderefs-spin-3a0ec0589043
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10793; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=WSMGmUCz6zik8PmOBp5kSTmlhN0LEI560XqVjmuAeo4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqJtdPisXX4LdHizO85OsEK9dcDgpYsagPbhDZn
 NTxxLdzmK+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaibXTwAKCRAEWL7uWMY5
 RqjOD/4yt/yNBHa4x77DNVGz2DuVeOkQNKIOsE+jYfYPGCwMXHIgJSHeeUkS3IqUnipJtlEbXdU
 XJKfSYiZoNMrmI7OscPz4fGdmYRynzjailZifFNFDrKNWLwqvrQ2sJXjrVgHFLWKGrh7PGRdpA6
 +6QQkc3K5pdHZ8W4oSEmCzYs6PKZJsJmEDyNYIpbqRHyt/A/yZDTwOgZpd9fBN1DAgrMoUz8r7V
 X8zpaQFXag7f1z5JpD7LJLbGGLh10oA1Zwj4SEpY2jIK84VmzOgP9ExsAgqfDeIh5Mpb7s/+iCI
 iTE7UC4xXwuQZ3M9fOf+1+EtceXIZKw2XnHPUi7Pzj2h+dEnDgBN6qjU8hOUSaANbgtgwuWet+f
 RMZNE4qu+fnQEiswASy1VKdTCS/qisbP+uJvliELAcYA5iSjxMhA6YPdVmzfCCLKAkseB51lzXr
 CTg3d+hiSSU3y8Kr5iZnWiaDgKGfTyPCrXH3KQeQZgOLVZy847Km1HSei3H76lNlFA7A/NF+Wfe
 YFlu4J+CekciSqg60bEeBX1gsr/nSYtmy0njCashePMwDlzxSGjONQ3MfMp2R4KG0d7o7D5+2y/
 v2p7IEAbX+itViwFvYbEf1Daxv1ptQjT813UQXBEp0VmoJZNePYs5e1VhVM+CVOakgKGU2geQBZ fJogcwKvxPXJyUw==
X-Mailer: b4 0.14.3
Message-ID: <20260608-binder-noderefs-spin-v1-1-2584cb4e49ff@google.com>
Subject: [PATCH] rust_binder: update Process::node_refs to use SpinLock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Unfortunately the current use of a mutex for this lock leads to priority
inversion. Traces have been observed where a process is trying to obtain
this mutex for 22ms, but it's unable to do so because the thread holding
the lock is scheduled out. Since this occurred on a UI thread, that is
an extremely long delay.

To support this change, logic in freeze.rs is updated to avoid
reallocating under the lock by adding a retry loop to
request_freeze_notif(). The remove_freeze_listener() function is also
updated to avoid calling kvfree() under the lock.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/freeze.rs  | 67 +++++++++++++++++++++++++++------------
 drivers/android/binder/node.rs    | 55 ++++++++++++++++++--------------
 drivers/android/binder/process.rs |  6 ++--
 3 files changed, 80 insertions(+), 48 deletions(-)

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
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 96b8440ceac6..e3c6eccce730 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -30,7 +30,7 @@
     sync::{
         aref::ARef,
         lock::{spinlock::SpinLockBackend, Guard},
-        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
+        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SpinLock, UniqueArc,
     },
     task::Task,
     uaccess::{UserSlice, UserSliceReader},
@@ -455,7 +455,7 @@ pub(crate) struct Process {
     // Node references are in a different lock to avoid recursive acquisition when
     // incrementing/decrementing a node in another process.
     #[pin]
-    node_refs: Mutex<ProcessNodeRefs>,
+    node_refs: SpinLock<ProcessNodeRefs>,
 
     // Work node for deferred work item.
     #[pin]
@@ -510,7 +510,7 @@ fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
                 cred,
                 inner <- kernel::new_spinlock!(ProcessInner::new(), "Process::inner"),
                 pages <- ShrinkablePageRange::new(&super::BINDER_SHRINKER),
-                node_refs <- kernel::new_mutex!(ProcessNodeRefs::new(), "Process::node_refs"),
+                node_refs <- kernel::new_spinlock!(ProcessNodeRefs::new(), "Process::node_refs"),
                 freeze_wait <- kernel::new_condvar!("Process::freeze_wait"),
                 task: current.group_leader().into(),
                 defer_work <- kernel::new_work!("Process::defer_work"),

---
base-commit: da61573f783897ae5a96c8f1c71aad6242344feb
change-id: 20260608-binder-noderefs-spin-3a0ec0589043

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

