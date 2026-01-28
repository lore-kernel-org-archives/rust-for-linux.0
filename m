Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478EE37105B;
	Wed, 28 Jan 2026 18:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624991; cv=none; b=XWF1SHoiQqpmkbd/8KjhMcqQfNoGJpzMkKQjWwMbmyPPDVy5b55D1xmva3K7qOab/QE1jSUSUYdW57BT92CAufpLFtQJ/R9/kQXiO3hWNInhSwl0voFQVA3P7PO4QH5UiQdKuTjKTHXyEywNDOfqyKTB2D0BPPw1QYVFXkCeFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624991; c=relaxed/simple;
	bh=xypnlq/Lb7X6S2MnSwrGdh4sGeo6T/wA9KzyrMLgxbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+eoJzARub4BrY/i92RGBo+Ku3YT+AmnT0e/zm8pNijZIzZbKVGoj+qpPSEwitxwD8RaGbTDWSZMwui8y0Z5JISXP1OpGoWJLnAYXF4oIWYhyvDpE0+rYE2jsqArV++vjuVTpW/ET6Qo0RJ8F4XvoCCsaRH8FXJviTSP9rXr+aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 47208F43B1B; Wed, 28 Jan 2026 19:29:41 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] rust: nvmem: Add an abstraction for nvmem providers
Date: Wed, 28 Jan 2026 19:29:21 +0100
Message-ID: <20260128182925.13225-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128182925.13225-1-linkmauve@linkmauve.fr>
References: <20260128182925.13225-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is my very first Rust abstraction in the kernel, I took inspiration
from various other abstractions that had already been written.

I only implemented enough to rewrite a very simple driver I wrote in the
past, in order to test the API and make sure it’s at least as ergonomic
as the C version, without any unsafe at all.

I’m not completely happy about the API, especially the NvmemConfig type
has a bunch of setters but nothing forces you to use them correctly,
notably that .set_priv() has been called before .set().  Should I maybe
merge them into a single one which takes both arguments?  Or is it ok if
priv isn’t set?  I’m not sure in which case that could be useful, maybe
in C when using globals.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/nvmem.rs            | 155 ++++++++++++++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 rust/kernel/nvmem.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b42..522a76b2e294 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -65,6 +65,7 @@
 #include <linux/mdio.h>
 #include <linux/mm.h>
 #include <linux/miscdevice.h>
+#include <linux/nvmem-provider.h>
 #include <linux/of_device.h>
 #include <linux/pci.h>
 #include <linux/phy.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf120042..dd0ac968d05f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -115,6 +115,8 @@
 pub mod module_param;
 #[cfg(CONFIG_NET)]
 pub mod net;
+#[cfg(CONFIG_NVMEM)]
+pub mod nvmem;
 pub mod num;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
diff --git a/rust/kernel/nvmem.rs b/rust/kernel/nvmem.rs
new file mode 100644
index 000000000000..555ed260629c
--- /dev/null
+++ b/rust/kernel/nvmem.rs
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! nvmem framework provider.
+//!
+//! Copyright (C) 2026 Link Mauve <linkmauve@linkmauve.fr>
+
+use crate::build_error;
+use crate::device::Device;
+use crate::error::{from_result, VTABLE_DEFAULT_ERROR};
+use crate::prelude::*;
+use core::marker::PhantomData;
+use macros::vtable;
+
+/// The possible types for a nvmem provider.
+#[derive(Default)]
+#[repr(u32)]
+pub enum Type {
+    /// The type of memory is unknown.
+    #[default]
+    Unknown = bindings::nvmem_type_NVMEM_TYPE_UNKNOWN,
+
+    /// Electrically erasable programmable ROM.
+    Eeprom = bindings::nvmem_type_NVMEM_TYPE_EEPROM,
+
+    /// One-time programmable memory.
+    Otp = bindings::nvmem_type_NVMEM_TYPE_OTP,
+
+    /// This memory is backed by a battery.
+    BatteryBacked = bindings::nvmem_type_NVMEM_TYPE_BATTERY_BACKED,
+
+    /// Ferroelectric RAM.
+    Fram = bindings::nvmem_type_NVMEM_TYPE_FRAM,
+}
+
+/// nvmem configuration.
+///
+/// Rust abstraction for the C `struct nvmem_config`.
+#[derive(Default)]
+pub struct NvmemConfig<T: NvmemProvider>
+where
+    T: Default,
+{
+    inner: bindings::nvmem_config,
+    _p: PhantomData<T>,
+}
+
+impl<T: NvmemProvider + Default> NvmemConfig<T> {
+    /// NvmemConfig's read callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
+    extern "C" fn reg_read(
+        context: *mut c_void,
+        offset: u32,
+        val: *mut c_void,
+        bytes: usize,
+    ) -> i32 {
+        from_result(|| {
+            // SAFETY: context is a valid T::Priv as defined in Self::set_priv().
+            let context = unsafe { &*(context as *mut T::Priv) };
+            let val = val as *mut u8;
+            // SAFETY: val should be non-null, and allocated for bytes bytes.
+            let data = unsafe { core::slice::from_raw_parts_mut(val, bytes) };
+            T::read(context, offset, data).map(|()| 0)
+        })
+    }
+
+    /// NvmemConfig's write callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
+    extern "C" fn reg_write(
+        context: *mut c_void,
+        offset: u32,
+        // TODO: Change val from void* to const void* in the C API!
+        val: *mut c_void,
+        bytes: usize,
+    ) -> i32 {
+        from_result(|| {
+            // SAFETY: context is a valid T::Priv as defined in Self::set_priv().
+            let context = unsafe { &*(context as *mut T::Priv) };
+            let val = val as *mut u8 as *const u8;
+            // SAFETY: val should be non-null, and allocated for bytes bytes.
+            let data = unsafe { core::slice::from_raw_parts(val, bytes) };
+            T::write(context, offset, data).map(|()| 0)
+        })
+    }
+
+    /// User context passed to read/write callbacks.
+    pub fn set_priv(&mut self, priv_: &T::Priv) {
+        // FIXME: This list of as indicates some unsoundness in the types…
+        self.inner.priv_ = priv_ as *const T::Priv as *const c_void as *mut c_void;
+    }
+
+    /// Sets the configuration on the given device.
+    pub fn set(mut self, dev: &Device) {
+        self.inner.reg_read = Some(Self::reg_read);
+        self.inner.reg_write = Some(Self::reg_write);
+        // SAFETY: All arguments should be non-null and what the function expects.
+        unsafe { bindings::devm_nvmem_register(dev.as_raw(), &self.inner) };
+    }
+
+    /// Optional name.
+    pub fn set_name(&mut self, name: &CStr) {
+        // TODO: Why do we have to do this cast from i8 to u8?
+        self.inner.name = name.as_ptr() as *const _;
+    }
+
+    /// Type of the nvmem storage
+    pub fn set_type(&mut self, type_: Type) {
+        self.inner.type_ = type_ as u32;
+    }
+
+    /// Device is read-only.
+    pub fn set_read_only(&mut self, read_only: bool) {
+        self.inner.read_only = read_only;
+    }
+
+    /// Device is accessibly to root only.
+    pub fn set_root_only(&mut self, root_only: bool) {
+        self.inner.root_only = root_only;
+    }
+
+    /// Device size.
+    pub fn set_size(&mut self, size: i32) {
+        self.inner.size = size;
+    }
+
+    /// Minimum read/write access granularity.
+    pub fn set_word_size(&mut self, word_size: i32) {
+        self.inner.word_size = word_size;
+    }
+
+    /// Minimum read/write access stride.
+    pub fn set_stride(&mut self, stride: i32) {
+        self.inner.stride = stride;
+    }
+}
+
+/// Helper trait to define the callbacks of a nvmem provider.
+#[vtable]
+pub trait NvmemProvider {
+    /// The type passed into the context for read and write functions.
+    type Priv;
+
+    /// Callback to read data.
+    #[inline]
+    fn read(_context: &Self::Priv, _offset: u32, _data: &mut [u8]) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Callback to write data.
+    #[inline]
+    fn write(_context: &Self::Priv, _offset: u32, _data: &[u8]) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+}
-- 
2.52.0

