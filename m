Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2107A3358B8
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768746392; cv=none; b=Kp5YEMHLZe5xJy8xxoGBz+Ro4ncDpMGtHYtFlwHYGZ008tER4b5cYM0X27kJgwT39h7Y+H77ijV7YZrTO4XG9WZ0VXtiXU19uv84GR0xj53MJN6mDa0Wb3zbIX2qsc4/PBahGMBSdEQs+NN44Em4OBrRwA2TM99KalLDjgnlYcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768746392; c=relaxed/simple;
	bh=s0cwsEgG7g9n4Hg+hiJoeBEv+lAIY6fNgwF2jLJh4do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rmIWrYgG6vchWfwh9wdt7HZH+iZM72Mn+LzvF27Ue0k5wC7GuyK64y6l0XoeIF+td4eNoVCPeuO8unYkP1mRuIOfkN3I3zGyv6kWKn434gqrh4r8dXyE3TQXpJxtIOYU8ZWWmKfOVW4lDIVa+D4nhSabtIZPpJAEnU9UbHCJwOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClQ0qAjU; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClQ0qAjU"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ae38f81be1so4153930eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768746389; x=1769351189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l68fmGn3uGtJbeW4EuRWDFel44wfPBgfn/qQavBDiKU=;
        b=ClQ0qAjUAYpqoIXRHL0yyGPrZ5MXeusS7qchA0s7TFsq2XdcyPMlhCRyTIw9zFyHDv
         nfr74ieHkOJEv09Hmv8paxvHElYjPzPmX+4rgBjUHZOrEhGk1B/1laaOst/SbdhyDkgq
         jymFJz10+stVhkePR9pV/e+d2XllRB4c+dejcOuBWMl6a3EjjASLLrhVKevG4qJIcKrq
         3HI1GaMWW/Ov73zRsiYlfJ7sDOKX0EpW16PajZ0otpOtTm3LYkiboego4ZX7Gj+7WEOK
         GOSqL7l4yC5LkWpBqbj0TTZGndS4+hzZpRlXypbhKo+Oan7qeQzGrxDuxZe69xMP3Vq0
         8IDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768746389; x=1769351189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l68fmGn3uGtJbeW4EuRWDFel44wfPBgfn/qQavBDiKU=;
        b=AipJqMb1HuvJhT3dMWiFWNVrVOrtBXoUCxgvHAtkO2IPY3cAtS/j8wLbfUBdykLspF
         /P3I2WWjSjxmvKVE8oHCzzALCKWUTrrV0TSRIE4UkY4bVl7wXdYgF+9tnvZeXr7Vz+Rr
         z2sblAN1B6e0Rw+S+f2O+JA3y2ezdsJlCpKTbJUl0WZ2Z6IQk/dMLgrFgSeroB7+hd6w
         ZIpdZYh6mTAKpcZXoydByNBUTV14E7IQ2j5sUBje8xvsY863HYpU+BgIDnZuncgxgkXR
         o13SAoT0jkSU7PWeRP3fBdPzCGur/eOPF+ur/ADy7H4NrHwGOV642Pmbzm54uDlx3xSp
         IrYg==
X-Forwarded-Encrypted: i=1; AJvYcCXTdO8ww5opRrb7sCsi36tGRzUfLsqBusFsIpJ36RmNo6bD15hGe9rcGBVvhlo5Nhe2/mTOQ57PiOrnrjbscg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8WqTgcwL8slddBn+M3HHdx0cIy39vPN/KiEiycXDZ1rt8Cu2U
	uCT6hwhGp0bTPI6Ig/t4fWXklbwyykQrAmIbbin0Rzrcz8efn1R2LtXg
X-Gm-Gg: AY/fxX6bIRW3sxDXDxD8VkoSrIUjYqAu/UV/Wq9EsZYpgYO6hmRH4YgpgUewHgrjsy6
	ToPww47TiDlOpRxNiJo0leb+nxGaVS0OPcaz8c70+dHwEYn8QJhig3II9U869+aPpGraow43srn
	n+8NzvfF42qP9edW5BwQb+Odd8IpYRfhLG77mV88yZNO1s5mUdG4RQcDDECXj60WZxSAI26EqNx
	CCoQQx+nKCqXC1uoK0mDwjP0K1QK6l0+hnOrx8YOTrE5hOBgsmXEG1LMUV7VeNPdjMt0pzeBzIc
	bpBgPtNEFL3Hu35Hv5hHiQEEw65H+z1LUW6lCxFSaqiz8dIGnehWgAUrWjkUKM8wi8zExaY7WbW
	0c6YnnU2VPMQNRY5+dIuYHpCJHEWEQThQyOP9jSP56u4zj9A0i5vxn9+602Ks/ExKn1sslToAue
	mESttSxsooz5UaNU8NxnD+koafuD+j+5+P75S8Ri9LRoVOJ/YjKftWz9eEskUe8qSeyZod40IWJ
	Q==
X-Received: by 2002:a05:7300:cc14:b0:2ae:53a5:8ed4 with SMTP id 5a478bee46e88-2b6b4ea9443mr5241246eec.30.1768746388028;
        Sun, 18 Jan 2026 06:26:28 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:46de:79e9:ba96:f42a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c11c4sm9428742eec.1.2026.01.18.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 06:26:27 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@google.com>,
	Carlos Llamas <cmllamas@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v2] rust_binder: refactor context management to use KVVec
Date: Sun, 18 Jan 2026 07:26:23 -0700
Message-ID: <20260118142623.1188141-1-jason.kei.hall@gmail.com>
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
v2:
  - Used real name in Signed-off-by.
  - Updated subject prefix to 'rust_binder:' and removed 'rust-next'.
  - Changed return types from KVec to KVVec as request.
  - Added cc: rust-for-linux@vger.kernel.org to email.
  - Note: Kept manual loops for cloning because try_clone/from_iter
    helpers for KVVec are not currently available / I couldn't get it
    to work.
---
 drivers/android/binder/context.rs | 77 ++++++++++++++-----------------
 drivers/android/binder/process.rs |  4 +-
 2 files changed, 38 insertions(+), 43 deletions(-)

diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index 3d135ec03ca7..b3adab830b51 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -3,8 +3,8 @@
 // Copyright (C) 2025 Google LLC.
 
 use kernel::{
-    error::Error,
-    list::{List, ListArc, ListLinks},
+    alloc::kvec::{KVVec, KVec},
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
@@ -90,17 +74,24 @@ pub(crate) fn new(name: &CStr) -> Result<Arc<Self>> {
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
+        self.manager
+            .lock()
+            .all_procs
+            .push(proc, GFP_KERNEL)
+            .map_err(Error::from)
     }
 
     pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Process) {
@@ -108,8 +99,12 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Process) {
             pr_err!("Context::deregister_process called on the wrong context.");
             return;
         }
-        // SAFETY: We just checked that this is the right list.
-        unsafe { self.manager.lock().all_procs.remove(proc) };
+        // Safe removal using retain
+        self.manager.lock().all_procs.retain(|p| {
+            let p1 = Arc::as_ptr(p);
+            let p2 = proc as *const Process;
+            p1 != p2
+        });
     }
 
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {
@@ -158,13 +153,11 @@ pub(crate) fn for_each_proc<F>(&self, mut func: F)
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
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 132055b4790f..c3676fc7785d 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -513,7 +513,9 @@ fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
         )?;
 
         let process = list_process.clone_arc();
-        process.ctx.register_process(list_process);
+        process
+            .ctx
+            .register_process(Arc::from(list_process.as_arc_borrow()))?;
 
         Ok(process)
     }
-- 
2.43.0

