Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E74942B75C;
	Wed,  4 Feb 2026 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237668; cv=none; b=qu+BrlQgegcJssqRYuJe6XlQpSsx8RYRynVnVzVxHaOqylnArl2gJ8fwwm2bW5XpjL3t3TFbRTS/0d/OlPTtW7tPP8FNdD70a7Bz8drsxgx16J4cjhavDx6w03Tf0/LPox4p1gChVdlK0YkM8w8bIm/tcML8RJ+ZdrCgOy860pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237668; c=relaxed/simple;
	bh=ApvBkXicI2zoEGRrzQsJJHposj44s/SN+iBr72P8xoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCsewoYi+XSEmeieNI1ZVpbYOHWiHk2re1WvE2i1mBGdet6CiUI35O8DDg/yFFAnDAL9Y048N+AdhDMMHVCKsErocW8SzE/q7rsmQKZfQgxcEF8wQtnUb9VrV0QPAIM0na2yv2XIrTfgFIO+8zLt7KfGkbGhOb2oAFW8hCTbmU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fy1kUwfX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fy1kUwfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770237666;
	bh=ApvBkXicI2zoEGRrzQsJJHposj44s/SN+iBr72P8xoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fy1kUwfXucF9asetdEhTZdZiF7CYpfsGAos4AIHK+G4XWTVyxvI1RlatDuaEtyx5l
	 XdbHJJ8hhsajCp00kKsST0btcX8N90RZHSHzQfjhDPhEv46KkRkLpNE1nmYqlKoihA
	 xHwlic7Z8M7wVtH90KqG3HdskrMEUF5BSvisFHW0RrXQFu9iOzQYV1GfR0mt5TIWZg
	 ratMe9jk7X03LQEa7bQtbm9L9zACzQIpmOvrNbfkCZxDBmZHDjTdSW401cyLA2X0eL
	 L0dVy8F/ekIyMhna6ajaLblaBsBxSxdlj68OmIIr/CcB4uU9kpkN7PR6Q2H/+RlBFQ
	 Ph8xmOarCdXVA==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 085CC17E1582;
	Wed,  4 Feb 2026 21:41:03 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 04 Feb 2026 17:40:40 -0300
Subject: [PATCH v2 2/4] rust: drm: dispatch work items to the private data
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
In-Reply-To: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>
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

