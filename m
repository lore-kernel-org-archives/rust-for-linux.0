Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D82FE058;
	Fri, 16 Jan 2026 00:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768523771; cv=none; b=cGPrBWobK0HuCOJAkm+p+9XjBeCccfQ4AqyhX1U5i8fNQbe55dMz82CPtXSDLI5kS/rBWNqHgs97lMbDxTTNbgE4HcdlImWWowmHCAQaQG36N7knE+yQU5j9QpU3tR7VUb6IcneTRXK5JNkjT2LwY/JiTIw5I0lMp6zdxtTdAoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768523771; c=relaxed/simple;
	bh=ApvBkXicI2zoEGRrzQsJJHposj44s/SN+iBr72P8xoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xwx2y09nT3wMlteCOxgNo1OGZnSHAM8OG5yA1QQUkIlv4WHqe6Xlf6vLCbJ7tlAXyligErazLwJWZTKWcLcoCHzm4ijg3Gu8jCYhlfhe9RqDxCjllFahxNXsDUxfyYib4LUbISWXjlT2txtECeC7AicuWFSLkhPK8+SfJL92sR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EQuGI/ut; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EQuGI/ut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768523768;
	bh=ApvBkXicI2zoEGRrzQsJJHposj44s/SN+iBr72P8xoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EQuGI/ut6g1g/mtviAmk/tsAa7gaVSY1TIEb8dfsV0wGul+/P78+9eZ5NHunD8/Yb
	 VhM8nAAA7gDquW7Z5b+rx11ZNpIP+0W4HetRyvHn8oJ7pz/m8oaiOLtSN57i9h0fhr
	 79CXrwapT6UBEvsfyrJ20mlv53CG0nd6orgqRGLtciEbv58SCGxBZPfh0b0c2j3nej
	 0jtDLou17zFecne/59jWtUzBP8mbWurFbChvG1jlcu3wq8IYahu1lOMmo2oEzSpliz
	 IzsfG5AJ+tUGqRksGBMb3307XVzcM1fFJlt/VEeKiheGJnk1BbqgOFDUMEG8dR+jCk
	 XrVZqVGMJRMNw==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18E2A17E1406;
	Fri, 16 Jan 2026 01:36:05 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 15 Jan 2026 21:35:58 -0300
Subject: [PATCH 2/4] rust: drm: dispatch work items to the private data
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-aref-workitem-v1-2-9883e00f0509@collabora.com>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
In-Reply-To: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3

This implementation dispatches any work enqueued on ARef<drm::Device<T>> to
its driver-provided handler. It does so by building upon the newly-added
ARef<T> support in workqueue.rs in order to call into the driver
implementations for work_container_of and raw_get_work.

This is notably important for work items that need access to the drm
device, as it was not possible to enqueue work on a ARef<drm::Device<T>>
previously without failing the orphan rule.

The current implementation needs T::Data to live inline with drm::Device in
order for work_container_of to function. This restriction is already
captured by the trait bounds. Drivers that need to share their ownership of
T::Data may trivially get around this:

// Lives inline in drm::Device
struct DataWrapper {
  work: ...,
  // Heap-allocated, shared ownership.
  data: Arc<DriverData>,
}

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/device.rs | 54 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3ce8f62a0056..c760a743e1df 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -6,13 +6,13 @@
 
 use crate::{
     alloc::allocator::Kmalloc,
-    bindings, device, drm,
-    drm::driver::AllocImpl,
-    error::from_err_ptr,
-    error::Result,
+    bindings, device,
+    drm::{self, driver::AllocImpl},
+    error::{from_err_ptr, Result},
     prelude::*,
     sync::aref::{ARef, AlwaysRefCounted},
     types::Opaque,
+    workqueue::{HasWork, Work, WorkItem},
 };
 use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
 
@@ -227,3 +227,49 @@ unsafe impl<T: drm::Driver> Send for Device<T> {}
 // SAFETY: A `drm::Device` can be shared among threads because all immutable methods are protected
 // by the synchronization in `struct drm_device`.
 unsafe impl<T: drm::Driver> Sync for Device<T> {}
+
+impl<T, const ID: u64> WorkItem<ID> for Device<T>
+where
+    T: drm::Driver,
+    T::Data: WorkItem<ID, Pointer = ARef<Device<T>>>,
+    T::Data: HasWork<Device<T>, ID>,
+{
+    type Pointer = ARef<Device<T>>;
+
+    fn run(ptr: ARef<Device<T>>) {
+        T::Data::run(ptr);
+    }
+}
+
+// SAFETY:
+//
+// - `raw_get_work` and `work_container_of` return valid pointers by relying on
+// `T::Data::raw_get_work` and `container_of`. In particular, `T::Data` is
+// stored inline in `drm::Device`, so the `container_of` call is valid.
+//
+// - The two methods are true inverses of each other: given `ptr: *mut
+// Device<T>`, `raw_get_work` will return a `*mut Work<Device<T>, ID>` through
+// `T::Data::raw_get_work` and given a `ptr: *mut Work<Device<T>, ID>`,
+// `work_container_of` will return a `*mut Device<T>` through `container_of`.
+unsafe impl<T, const ID: u64> HasWork<Device<T>, ID> for Device<T>
+where
+    T: drm::Driver,
+    T::Data: HasWork<Device<T>, ID>,
+{
+    unsafe fn raw_get_work(ptr: *mut Self) -> *mut Work<Device<T>, ID> {
+        // SAFETY: The caller promises that `ptr` points to a valid `Device<T>`.
+        let data_ptr = unsafe { &raw mut (*ptr).data };
+
+        // SAFETY: `data_ptr` is a valid pointer to `T::Data`.
+        unsafe { T::Data::raw_get_work(data_ptr) }
+    }
+
+    unsafe fn work_container_of(ptr: *mut Work<Device<T>, ID>) -> *mut Self {
+        // SAFETY: The caller promises that `ptr` points at a `Work` field in
+        // `T::Data`.
+        let data_ptr = unsafe { T::Data::work_container_of(ptr) };
+
+        // SAFETY: `T::Data` is stored as the `data` field in `Device<T>`.
+        unsafe { crate::container_of!(data_ptr, Self, data) }
+    }
+}

-- 
2.52.0

