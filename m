Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE3C33263A
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204017; cv=none; b=Rg54+ENHGkLp4OUH/S9toJTwHz3AJ+U7bV/kjfljjWNA7TkLbnsibr9GY9lSRperoDkh5Un1FfIbDVZ/MazK+FEcEw28ybiqgVjehIy/02YRNdQtvcDBHlGw1z3eBB486gFYLrWmRKlbM0wvas/zkdXzWiHrx/BE3FY8Ifv6Gcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204017; c=relaxed/simple;
	bh=QtWo8P5YKWa7h8TNRt9TlodjKl3zyROY2qhZkWuq48c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dw5l/HU12eZlAZxO8n2ju3kC7JrRhlBqGEssgWoclXRyw0g1aMQN4zgd23L12dNDAxngdquccv2zvfGbU+Ezz4OBM1oUdR41yCHa86ma+x0OgB7ShQcPu5pvkxraoCmVUElXU6HrQ7wLB8hf89n3CFr17cGx07JrdStD0FINmaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pfHG7Plc; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pfHG7Plc"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-437681ecd32so2055067f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772204014; x=1772808814; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+VNCugl97hCWDDrYNPS5RzpJSd7EFZ58Iy0xFY0E+98=;
        b=pfHG7PlcF9YCVxeJWH2EPqA0n2K7F/9qzcEg1cMaM1nM+HS+D0CGZsKEeLFXGBSXDe
         cHDFf+Xjt007wcr1B5JW5CtK6CK8jQcS2Ipf0UoQgTB9MDby9qC+krnBDOwYeAJyW6Hx
         CsS0gaX363d5nHxdQOjs2BkP/sLmcxhd9JvCNp+7jbBR642kShcCEhSfinI3LYxE6Iwm
         My/9Tb+AFoGHxZbFMFdhhRyivRJ2c3p9sah1O4SZ2IhG4gJVAiEcYVVbjCOMvE6aAxSF
         2xfFhfdmLMl4cv0XBXrYAlTjRqDF7EdhAGSVTI8tLBrB3WXgJ3htFL9pMV8eGWbUucCF
         c/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204014; x=1772808814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+VNCugl97hCWDDrYNPS5RzpJSd7EFZ58Iy0xFY0E+98=;
        b=k1A2DEPwYvbBJk8U3zU4LeAOzEOa89wg6hAOhBEuyt7xU5+aMyug7iOTCsYbxtf88H
         VFgN7wruwFDO+8M+jCD7YHIAceTQuBbyw3b3b1N54QfLmZvWiT8v8032Lu4o5q5MWp+2
         NoiS3BJg0PTg0F00EtSuwC2RdaNqGmcFnQSs6whw0TvO44onx8U/vWu1B8BqH11ikrsz
         k68dMTynyFepoUwLwqMQcrcXJJxYKtM8fF3AI5tduLZ4aGjorbe6/jb7hGOfHGhGIDIn
         YRAhu1tvJ8zYqP5eGjqcWKEGYG+0Og/mlNqGbHwRQ+FZFoVepYZKxIUNhRGHLMu/BLPv
         YtnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOzmp1Ow1DGhMhCoTh/UQWnb6O0eRQnMRz6BU6YTTedXBLV3BxrqIKeF6Nrh+Hbc+APYppsgUzFMZC38ADvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJfWUo+J9nd+jpdTE4ozCWR01BcC5ekI7fzQKTNE+bQK6qYVjP
	IHGAe+OJPHC/cV3yspRWbCWEgsXY7u65hNgspRrPGnuBtf6jTnXBmbEs0a3s/K6/+Z877mmjq0F
	9Y6SFjDtHcScOjDgsdw==
X-Received: from wre15.prod.google.com ([2002:a05:6000:4b0f:b0:436:34d5:d963])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2012:b0:439:8b42:9923 with SMTP id ffacd0b85a97d-4399ddd870cmr5621898f8f.9.1772204013641;
 Fri, 27 Feb 2026 06:53:33 -0800 (PST)
Date: Fri, 27 Feb 2026 14:53:21 +0000
In-Reply-To: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7717; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QtWo8P5YKWa7h8TNRt9TlodjKl3zyROY2qhZkWuq48c=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpoa/pzPOdES2/7cVKZ61hU+XUQxw3v7s+j5qoL
 FtjNb34GdiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaaGv6QAKCRAEWL7uWMY5
 RtE2D/91uCUQPvF4Pk9klmmJOtOa15O/QjDzCojwgbQdAWwYcp7ckWjXj2OREe2/eP7JHsf4UVL
 egt4Fdj2x0zJdgMwh7c4mLuwSNuw+rgH6HptyXz5j/ftRXyc9aTxoftDRu295Jylg59XDRd43rx
 Lqs8hY7ZOJllsnzhlKcxlYISWxMDCGSSAKoxo50fBy2YC12OZK5hn8lrcplWa0NR2Cu4ZdY9lX9
 uSyGvWWGj1JqxPm7IAvse9KWZo5/qaFVGgGPnAqSzcw3TgliGR34+9arYZrBHdevXz7E/tCvri3
 qD6MCwppeyvFJtfOXbObAt6EknCItVCkRBiPwsIRLc7SuhpKZ9WiDId3YAoRTRHvPOKwvQCXF1g
 83M6G3ORv9eERjKdlJJaJj6ftXx9noag7mLA6N4LDtZGw7PwR+q289gIrt+iOYuDLIVws10eTS+
 rrfhDJFAcU9U/99ASzmbkn2yoCsLY7/ddFaoPNCkgVy0prK9VNtgkA3pvpiTRtyyo4tv5ptLjmA
 +nCIIk/MER0WfPb04YZWWqLN+Xi4BNYYFDDsTZcG7pfNc1iVe8+MyRdbsxsEsYW2ZGv75UJKX+M
 Jl47/dIBPQQV9u85h8FOIAuYNaB6jzJbwC5z3MbqGiR6TmLPb83SyJYabjGnHnxrZwhz7nFLPq6 1cZj2XCeiJS/hMg==
X-Mailer: b4 0.14.3
Message-ID: <20260227-create-workqueue-v3-2-87de133f7849@google.com>
Subject: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

Creating workqueues is needed by various GPU drivers. Not only does it
give you better control over execution, it also allows devices to ensure
that all tasks have exited before the device is unbound (or similar) by
running the workqueue destructor.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/workqueue.c |   7 ++
 rust/kernel/workqueue.rs | 190 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..e4b9d1b3d6bf 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -14,3 +14,10 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
 	INIT_LIST_HEAD(&work->entry);
 	work->func = func;
 }
+
+__rust_helper
+struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
+						     int max_active, const void *data)
+{
+	return alloc_workqueue(fmt, flags, max_active, data);
+}
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 1acd113c04ee..4ef02a537cd9 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -186,7 +186,10 @@
 //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
 
 use crate::{
-    alloc::{AllocError, Flags},
+    alloc::{
+        self,
+        AllocError, //
+    },
     container_of,
     prelude::*,
     sync::Arc,
@@ -194,7 +197,11 @@
     time::Jiffies,
     types::Opaque,
 };
-use core::marker::PhantomData;
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::NonNull, //
+};
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -340,7 +347,7 @@ pub fn enqueue_delayed<W, const ID: u64>(
     /// This method can fail because it allocates memory to store the work item.
     pub fn try_spawn<T: 'static + Send + FnOnce()>(
         &self,
-        flags: Flags,
+        flags: alloc::Flags,
         func: T,
     ) -> Result<(), AllocError> {
         let init = pin_init!(ClosureWork {
@@ -353,6 +360,183 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
     }
 }
 
+/// Workqueue builder.
+///
+/// A valid combination of workqueue flags contains one of the base flags (`WQ_UNBOUND`, `WQ_BH`,
+/// or `WQ_PERCPU`) and a combination of modifier flags that are compatible with the selected base
+/// flag.
+///
+/// For details, please refer to `Documentation/core-api/workqueue.rst`.
+pub struct Builder {
+    flags: bindings::wq_flags,
+    max_active: i32,
+}
+
+impl Builder {
+    /// Not bound to any cpu.
+    #[inline]
+    pub fn unbound() -> Builder {
+        Builder {
+            flags: bindings::wq_flags_WQ_UNBOUND,
+            max_active: 0,
+        }
+    }
+
+    /// Bound to a specific cpu.
+    #[inline]
+    pub fn percpu() -> Builder {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU,
+            max_active: 0,
+        }
+    }
+
+    /// Set the maximum number of active cpus.
+    ///
+    /// If not set, a reasonable default value is used. The maximum value is `WQ_MAX_ACTIVE`.
+    #[inline]
+    pub fn max_active(mut self, max_active: u32) -> Builder {
+        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
+        self
+    }
+
+    /// Allow this workqueue to be frozen during suspend.
+    #[inline]
+    pub fn freezable(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_FREEZABLE;
+        self
+    }
+
+    /// This workqueue may be used during memory reclaim.
+    #[inline]
+    pub fn mem_reclaim(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_MEM_RECLAIM;
+        self
+    }
+
+    /// Mark this workqueue as cpu intensive.
+    #[inline]
+    pub fn cpu_intensive(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_CPU_INTENSIVE;
+        self
+    }
+
+    /// Make this workqueue visible in sysfs.
+    #[inline]
+    pub fn sysfs(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_SYSFS;
+        self
+    }
+
+    /// Mark this workqueue high priority.
+    #[inline]
+    pub fn highpri(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_HIGHPRI;
+        self
+    }
+
+    /// Allocates a new workqueue.
+    ///
+    /// The provided name is used verbatim as the workqueue name.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue;
+    ///
+    /// // create an unbound workqueue registered with sysfs
+    /// let wq = workqueue::Builder::unbound().sysfs().build(c"my-wq")?;
+    ///
+    /// // spawn a work item on it
+    /// wq.try_spawn(
+    ///     GFP_KERNEL,
+    ///     || pr_warn!("Printing from my-wq"),
+    /// )?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn build(self, name: &CStr) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * c"%s" is compatible with passing the name as a c-string.
+        // * the builder only permits valid flag combinations
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                c"%s".as_char_ptr(),
+                self.flags,
+                self.max_active,
+                name.as_char_ptr().cast::<c_void>(),
+            )
+        };
+
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+
+    /// Allocates a new workqueue.
+    ///
+    /// # Examples
+    ///
+    /// This example shows how to pass a Rust string formatter to the workqueue name, creating
+    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::AllocError,
+    ///     workqueue::{self, OwnedQueue},
+    /// };
+    ///
+    /// fn my_wq(num: u32) -> Result<OwnedQueue, AllocError> {
+    ///     // create a percpu workqueue called my-wq-{num}
+    ///     workqueue::Builder::percpu().build_fmt(fmt!("my-wq-{num}"))
+    /// }
+    /// ```
+    #[inline]
+    pub fn build_fmt(self, name: kernel::fmt::Arguments<'_>) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * c"%pA" is compatible with passing an `Arguments` pointer.
+        // * the builder only permits valid flag combinations
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                c"%pA".as_char_ptr(),
+                self.flags,
+                self.max_active,
+                core::ptr::from_ref(&name).cast::<c_void>(),
+            )
+        };
+
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+}
+
+/// An owned kernel work queue.
+///
+/// Dropping a workqueue blocks on all pending work.
+///
+/// # Invariants
+///
+/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
+pub struct OwnedQueue {
+    queue: NonNull<Queue>,
+}
+
+impl Deref for OwnedQueue {
+    type Target = Queue;
+    fn deref(&self) -> &Queue {
+        // SAFETY: By the type invariants, this pointer references a valid queue.
+        unsafe { &*self.queue.as_ptr() }
+    }
+}
+
+impl Drop for OwnedQueue {
+    fn drop(&mut self) {
+        // SAFETY: The `OwnedQueue` is being destroyed, so we can destroy the workqueue it owns.
+        unsafe { bindings::destroy_workqueue(self.queue.as_ptr().cast()) }
+    }
+}
+
 /// A helper type used in [`try_spawn`].
 ///
 /// [`try_spawn`]: Queue::try_spawn

-- 
2.53.0.473.g4a7958ca14-goog

