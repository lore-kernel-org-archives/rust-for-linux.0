Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8E21ABBB
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916486; cv=none; b=rVJgq7KxTsNIp52Lz3AoinQLFJC35v2pPogIjEeUl+kcY8Hw+mIDQ3xOAX/y9osDwB6cVUewJg/zpR+3N5lxr9Yu75VuHYPpDqcBQe283e2kk9jtLsIBw03nv/70TY7qcUj6h4MLQsJOdhEw2s2xFf4Dooad1PMurNvMGGxfl98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916486; c=relaxed/simple;
	bh=p0f6I5EZzmpKZxY4Id2U+rvJA+3l7CP6ompDuOSZcF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdCSTODxd1ZTQ/wpgbQWlOngWLGY4tMUm78M7OgE4C+ZeXhcUqm+NhKOTGkRVA8qLU0lvFBhwBT63Z8JxUcpeQLQgxawYDSNEy4TAUS1d4BrtoJKvbgTkx0fV1JLjFSVGpkqrqTyonJBKhVpZHI2X8VoaoIOyOGhb5nfxSVaFBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdGooRq1; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdGooRq1"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-121a0bcd376so1052972c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 05:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768916484; x=1769521284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxNMUvcFDRDyo819s9ijKBWJ2/BhKTnu9hq6sC458h0=;
        b=QdGooRq1tHefNghKkzVx4wGAiZc0yT/uLcImlkJdvKSrZLb3PkMF2gxUcWsO7Q5S/c
         2BLO9hMcPa/AD77+crcxSQrasF46D24AkqOW0mtDSoYGl4SYTM5CpHuVZTGYhUkib4jY
         T2lecqjWOzLNZOnAF2xF7y49gMHOItOW7JiEu1J38AeUQ6S08GsX1dFgHUbbCz7amQx3
         7SVEGu+76Yc4NPOYDyaP0/QxTm/irt6OJ/wyar+543MPGGqefn2Of2GS6Gzc2sPzj9dZ
         fISsmBEa4nYYHPdYm3IpFukqH0nqzjgRwg17X4nJ7QQEv8uk0tyWl5YVxv5nUGzNk6tT
         JAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916484; x=1769521284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxNMUvcFDRDyo819s9ijKBWJ2/BhKTnu9hq6sC458h0=;
        b=gYeCvxLsf3ooUEwQCdgMMURnRTgDg+fCu1Eqpeb8AB4zwi4Lt0ORKb27K1d6JIbW4W
         Xs+k8nkQY7xLf/8UFEtB+qiuSIKQylhjllRgqKtU/4TDguA06WDUPgS0qumu6te/jWKL
         g1rmCYrBd00zT6mYx+cZDHBn9to6Xc5DIktwc0HAWV15cPjmx9wllDirEsfnyKmixcgY
         Hmta7jTlRWqzCkaY27gPVcbocM/YJkiVHatwLWL3bFQ7zizcl4SrQyPuoqQEKK6TtD8p
         A1quCvHNrbAZvHuUGzvbSy8lB+NkAPuavYa7MeO3JXbpE5Mj1jB8C6pxZW7RAJXeLHZb
         2Yag==
X-Gm-Message-State: AOJu0Yx6es4ehBa4rWQg5cb9c2CWCCpGNA1wdTzp0sIPVO+NU3aHnDA1
	0OJ2hLBMwq6Rzp1w7DrX6YgDtWvwBj5ZZ7Om/d5IwtoXzb0bkAVb0EFrzjaPaA==
X-Gm-Gg: AY/fxX5G2C54tbXyhm1sUv1C3UAdcqQ4jsWzB7rUp2rArF5w6eGLn2LXCYB3nAqkLt5
	YIND62ywsplaAQNm9apGJ8kUnwvdfGIN+CKtfs7c0ZXhsm74qSloOlTtShu7Gh3Dy+3YO5YwijM
	LJyakbSF5xNzcS1QaKx6HM8ZC1FMlbwYaOJkqs5yuIirC8S2J5UWWaCVUdELogYH9fq5Rai4B3Q
	mYdzvEF0GZq2gbtn/9L/sj3GzFjgotMZydBbXzI3+B+yaKx1UDlB5bOzQ6F/0CeQaqJXfkK7IZp
	c5TTn1cJeJtNTP+n4DWrRXOV0dGLVWbVJH06djj90WKk381AERY7KeYnwk1LgCxr2Mzbd7+EV0N
	NSa6DOtSQ/W1TxneG5z4DtNUS5IFPmYZ6JVLBhuMtVsxQVeJt3RC3YDFsapty472xS+JbIg52ES
	+6n6rVJUwg28xbhPHqud6W7XfWLkXmmHZKNRepoTr+pNZ///JKM4QjHNnG3G85HKA=
X-Received: by 2002:a05:7022:6b92:b0:123:348b:979c with SMTP id a92af1059eb24-1246a970575mr1504440c88.6.1768916483488;
        Tue, 20 Jan 2026 05:41:23 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:3a7a:7bcc:1dce:2822])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10736sm20752470c88.14.2026.01.20.05.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:41:22 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@google.com>,
	Carlos Llamas <cmllamas@google.com>,
	jason.kei.hall@gmail.com
Subject: [PATCH v4] rust_binder: refactor context management to use KVVec
Date: Tue, 20 Jan 2026 06:41:19 -0700
Message-ID: <20260120134119.98048-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
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
v4:
  - Added Arc::ptr_eq to deregister.
  - Removed dead code from deregister_process.
---
 drivers/android/binder/context.rs | 84 +++++++++++++------------------
 drivers/android/binder/process.rs |  5 +-
 2 files changed, 36 insertions(+), 53 deletions(-)

diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index 3d135ec03ca7..c7b75efef217 100644
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
@@ -89,27 +73,27 @@ pub(crate) fn new(name: &CStr) -> Result<Arc<Self>> {
     /// Called when the file for this context is unlinked.
     ///
     /// No-op if called twice.
-    pub(crate) fn deregister(&self) {
-        // SAFETY: We never add the context to any other linked list than this one, so it is either
-        // in this list, or not in any list.
-        unsafe { CONTEXTS.lock().list.remove(self) };
+    pub(crate) fn deregister(self: &Arc<Self>) {
+        // Safe removal using retain
+        CONTEXTS.lock().contexts.retain(|c| !Arc::ptr_eq(c, self));
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
     }
 
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {
@@ -158,23 +142,23 @@ pub(crate) fn for_each_proc<F>(&self, mut func: F)
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

