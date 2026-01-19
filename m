Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E6235BDB4
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829468; cv=none; b=kRE5OfV8Za9w3i4xi20jPcQTXPh0xRbpWDF7lfBSGkrS+0FRXDPW/Jv8pse6iO1onEAzOsHcMU10tuRRncH42EWKcvo1U+wQY7M8frcr36k2Txr5B4VcSbvS1ijoF7Mq7gdWos07BkYIU6YoYQvpK/TrXX61UNFXd9WvmcE4nwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829468; c=relaxed/simple;
	bh=eXcO94OFOcHR7+hsnfY8B8wyTFSz/c6veamKxvqRoa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Paa5ZlSI6uyIp+NTiXkgP0fAyzjGsmjahjRWg3LkZbvWEYQneONcuWUYpwQ3eWmdPPryfA5wutOxyG3Y8fYLrkGwMAuL5yIAZjdRaX32ZGO9ru43f4E+0sSuDBE8Cr8UoNRHyCO8QTJwbRpawXcL9oFF0AEr6TziBxyFiBqWI+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqLQhoAX; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqLQhoAX"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b6bfb0004aso5628942eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 05:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768829466; x=1769434266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgdJQu8qSrktuaqsrPAanYGNzpWljTQSEn1drXaKpKY=;
        b=MqLQhoAXAA2G7u6nzQqO8y7JK2Ss7rj3jhk5bOWnD3Qe1Y40gnHTYR0BGiVf3cC28Y
         3/wqsclZmpZYmDoYWF+n4iJFF2BnzN5Shm+VPbypq0MKQy52jyINMlHDvZRLbFwf979/
         unbnMBtK5ULikHb7JYAFS1TJ62ZW5Bv7HBzi0JkL+I7Plt+pD/alQWIg5f7Jlr7l+67L
         /Me6GQXtzVSCVojHGUDn6xSLHAsqS4j+r1bhyia8inoi3IJhe31n4B15j5g84gx3Yzky
         oNKb65z59KH53BOlZmxuRW3NZlxHh7SFt4ubi0x5UcHPwfo5+Hhpat4jfh32+9lqpCa8
         0lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768829466; x=1769434266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgdJQu8qSrktuaqsrPAanYGNzpWljTQSEn1drXaKpKY=;
        b=B5LyZ+V8pwtZNAzWrIwNw7t/tUVgWhP5w9z579oQDNik2XXnqVdHc6arCE+tOWtyG1
         Dg5ChrZK+TDi/bEPy8B7e7P2jaCefi+9g9UjxDpaadTgAJswuKiJaly4rjbwGSz6Uz/G
         jaelJi2OMJqsK3fGZasA7OIsIbiZKpF+jO9xguhDJDtKlRrmH9X+t7DX5bPOnrPZg6Sz
         N0C0DC+sabltgmp7mI0rttvAjSrCZTVE6++sV7/QDBEjcyMLE4jN/1fXPKv7HQ7NNjMG
         XHbSn0p+5aUbII2X/ZtHTl86aju5Kwrhrd4K6t9wrmqQIx5qqAdRMJSYwdqFw6MOEBJT
         hsXg==
X-Gm-Message-State: AOJu0YzhQN5Bj7L1f68V/h63wZR7wZ7uj7KWIpbmgjcmHCKLnCkUQIwm
	D5ZW5kTBcUXwJCqzrmAcly9ib39g7kLExt8DpfBv3y8WKqDwf4/n70BG
X-Gm-Gg: AZuq6aLqNDBcnyKT16IITCRoct4BX2vBVuopupVI5EfMKXIwiPZ8Ob4pve8B/n4dIIk
	vIoOo2YvgKMjO/zdDzuyFcoVDSot5iwFniuX4g4V2xEQ4oxkIatYZpYfPX4IE00OeatmCQ5FSmN
	WQcUQ9dPwSh3wLev35d7k8NIrMmbunPL7vvjY521lEsuhep97VvFge2+kC4QFFsF5uo8fGsG/uC
	20X+YMdWveH3qIn7FDVCwtKUruWnblTeWpqqAgGTgXkkh+IK1YXuA/P+2ASDG63+qS9+q+FXPnI
	D1iZq+FCxdJ/z0FJJu6MHrmvHId/MJjxs4NxkzvH4Jxrqsf4H/d+mAKL2uwdUkonbbD5ot+MYhd
	NghG0D5aXABl1+9YuhAKSm2W/yEpDquAgsbZYVyRx0JGeqA2NcDazDqy3MY+6o1VNDvMs9Jbogb
	JZFpBWLWSXxmpTKtVaUGC/rBmgS9ZQBct6T181dWLbeJQOO2NycL/PcCIddaTj5sp9OiU5HPdp
X-Received: by 2002:a05:7301:6088:b0:2a7:27d:66e3 with SMTP id 5a478bee46e88-2b6b3f136d6mr9662207eec.2.1768829465811;
        Mon, 19 Jan 2026 05:31:05 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:a42d:ec5:48c1:73b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6c2de1f29sm11096882eec.15.2026.01.19.05.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:31:05 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@google.com>,
	Carlos Llamas <cmllamas@google.com>,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v3] rust_binder: refactor context management to use KVVec
Date: Mon, 19 Jan 2026 06:31:01 -0700
Message-ID: <20260119133101.23708-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260118142623.1188141-1-jason.kei.hall@gmail.com>
References: <20260118142623.1188141-1-jason.kei.hall@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the linked list management in context.rs with KVVec.
This simplifies the ownership model by using standard
Arc-based tracking and moves away from manual unsafe list removals.

The refactor improves memory safety by leveraging Rust's contiguous
collection types while maintaining proper error propagation for
allocation failures during process registration.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/rust-for-linux/linux/issues/1215
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
---
v3:
  - Simplified register_process using ?.
  - Used Arc::ptr_eq for comparisons in deregister_process.
  - Changed deregister_process to take &Arc<Process>.
  - Added capacity shrinking logic to Context's process list.
  - Optimized get_procs_with_pid to iterate directly under the lock.
  - Removed ListArc usage in process.rs.
---
 drivers/android/binder/context.rs | 91 ++++++++++++++-----------------
 drivers/android/binder/process.rs |  5 +-
 2 files changed, 44 insertions(+), 52 deletions(-)

diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index 3d135ec03ca7..dedcfd9dfea2 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -3,8 +3,8 @@
 // Copyright (C) 2025 Google LLC.
 
 use kernel::{
-    error::Error,
-    list::{List, ListArc, ListLinks},
+    alloc::kvec::KVVec,
+    error::code::*,
     prelude::*,
     security,
     str::{CStr, CString},
@@ -17,22 +17,19 @@
 kernel::sync::global_lock! {
     // SAFETY: We call `init` in the module initializer, so it's initialized before first use.
     pub(crate) unsafe(uninit) static CONTEXTS: Mutex<ContextList> = ContextList {
-        list: List::new(),
+        contexts: KVVec::new(),
     };
 }
 
 pub(crate) struct ContextList {
-    list: List<Context>,
+    contexts: KVVec<Arc<Context>>,
 }
 
-pub(crate) fn get_all_contexts() -> Result<KVec<Arc<Context>>> {
+pub(crate) fn get_all_contexts() -> Result<KVVec<Arc<Context>>> {
     let lock = CONTEXTS.lock();
-
-    let count = lock.list.iter().count();
-
-    let mut ctxs = KVec::with_capacity(count, GFP_KERNEL)?;
-    for ctx in &lock.list {
-        ctxs.push(Arc::from(ctx), GFP_KERNEL)?;
+    let mut ctxs = KVVec::with_capacity(lock.contexts.len(), GFP_KERNEL)?;
+    for ctx in lock.contexts.iter() {
+        ctxs.push(ctx.clone(), GFP_KERNEL)?;
     }
     Ok(ctxs)
 }
@@ -42,7 +39,7 @@ pub(crate) fn get_all_contexts() -> Result<KVec<Arc<Context>>> {
 struct Manager {
     node: Option<NodeRef>,
     uid: Option<Kuid>,
-    all_procs: List<Process>,
+    all_procs: KVVec<Arc<Process>>,
 }
 
 /// There is one context per binder file (/dev/binder, /dev/hwbinder, etc)
@@ -51,28 +48,16 @@ pub(crate) struct Context {
     #[pin]
     manager: Mutex<Manager>,
     pub(crate) name: CString,
-    #[pin]
-    links: ListLinks,
-}
-
-kernel::list::impl_list_arc_safe! {
-    impl ListArcSafe<0> for Context { untracked; }
-}
-kernel::list::impl_list_item! {
-    impl ListItem<0> for Context {
-        using ListLinks { self.links };
-    }
 }
 
 impl Context {
     pub(crate) fn new(name: &CStr) -> Result<Arc<Self>> {
         let name = CString::try_from(name)?;
-        let list_ctx = ListArc::pin_init::<Error>(
+        let ctx = Arc::pin_init(
             try_pin_init!(Context {
                 name,
-                links <- ListLinks::new(),
                 manager <- kernel::new_mutex!(Manager {
-                    all_procs: List::new(),
+                    all_procs: KVVec::new(),
                     node: None,
                     uid: None,
                 }, "Context::manager"),
@@ -80,8 +65,7 @@ pub(crate) fn new(name: &CStr) -> Result<Arc<Self>> {
             GFP_KERNEL,
         )?;
 
-        let ctx = list_ctx.clone_arc();
-        CONTEXTS.lock().list.push_back(list_ctx);
+        CONTEXTS.lock().contexts.push(ctx.clone(), GFP_KERNEL)?;
 
         Ok(ctx)
     }
@@ -90,26 +74,35 @@ pub(crate) fn new(name: &CStr) -> Result<Arc<Self>> {
     ///
     /// No-op if called twice.
     pub(crate) fn deregister(&self) {
-        // SAFETY: We never add the context to any other linked list than this one, so it is either
-        // in this list, or not in any list.
-        unsafe { CONTEXTS.lock().list.remove(self) };
+        // Safe removal using retain
+        CONTEXTS.lock().contexts.retain(|c| {
+            let p1 = Arc::as_ptr(c);
+            let p2 = self as *const Context;
+            p1 != p2
+        });
     }
 
-    pub(crate) fn register_process(self: &Arc<Self>, proc: ListArc<Process>) {
+    pub(crate) fn register_process(self: &Arc<Self>, proc: Arc<Process>) -> Result {
         if !Arc::ptr_eq(self, &proc.ctx) {
             pr_err!("Context::register_process called on the wrong context.");
-            return;
+            return Err(EINVAL);
         }
-        self.manager.lock().all_procs.push_back(proc);
+        self.manager.lock().all_procs.push(proc, GFP_KERNEL)?;
+        Ok(())
     }
 
-    pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Process) {
+    pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
         if !Arc::ptr_eq(self, &proc.ctx) {
             pr_err!("Context::deregister_process called on the wrong context.");
             return;
         }
-        // SAFETY: We just checked that this is the right list.
-        unsafe { self.manager.lock().all_procs.remove(proc) };
+        let mut manager = self.manager.lock();
+        manager.all_procs.retain(|p| !Arc::ptr_eq(p, proc));
+        let len = manager.all_procs.len();
+        let cap = manager.all_procs.capacity();
+        if len < cap / 2 && cap > 128 {
+            let _ = manager.all_procs.reserve(0, GFP_KERNEL);
+        }
     }
 
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {
@@ -158,23 +151,23 @@ pub(crate) fn for_each_proc<F>(&self, mut func: F)
         }
     }
 
-    pub(crate) fn get_all_procs(&self) -> Result<KVec<Arc<Process>>> {
+    pub(crate) fn get_all_procs(&self) -> Result<KVVec<Arc<Process>>> {
         let lock = self.manager.lock();
-        let count = lock.all_procs.iter().count();
-
-        let mut procs = KVec::with_capacity(count, GFP_KERNEL)?;
-        for proc in &lock.all_procs {
-            procs.push(Arc::from(proc), GFP_KERNEL)?;
+        let mut procs = KVVec::with_capacity(lock.all_procs.len(), GFP_KERNEL)?;
+        for proc in lock.all_procs.iter() {
+            procs.push(Arc::clone(proc), GFP_KERNEL)?;
         }
         Ok(procs)
     }
 
-    pub(crate) fn get_procs_with_pid(&self, pid: i32) -> Result<KVec<Arc<Process>>> {
-        let orig = self.get_all_procs()?;
-        let mut backing = KVec::with_capacity(orig.len(), GFP_KERNEL)?;
-        for proc in orig.into_iter().filter(|proc| proc.task.pid() == pid) {
-            backing.push(proc, GFP_KERNEL)?;
+    pub(crate) fn get_procs_with_pid(&self, pid: i32) -> Result<KVVec<Arc<Process>>> {
+        let lock = self.manager.lock();
+        let mut matching_procs = KVVec::new();
+        for proc in lock.all_procs.iter() {
+            if proc.task.pid() == pid {
+                matching_procs.push(Arc::clone(proc), GFP_KERNEL)?;
+            }
         }
-        Ok(backing)
+        Ok(matching_procs)
     }
 }
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 132055b4790f..286d1badf19b 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -496,7 +496,7 @@ fn run(me: Arc<Self>) {
 impl Process {
     fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
         let current = kernel::current!();
-        let list_process = ListArc::pin_init::<Error>(
+        let process = Arc::pin_init::<Error>(
             try_pin_init!(Process {
                 ctx,
                 cred,
@@ -512,8 +512,7 @@ fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
             GFP_KERNEL,
         )?;
 
-        let process = list_process.clone_arc();
-        process.ctx.register_process(list_process);
+        process.ctx.register_process(process.clone())?;
 
         Ok(process)
     }
-- 
2.43.0

