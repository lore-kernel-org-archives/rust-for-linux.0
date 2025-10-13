Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [178.154.239.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175A5262FCB
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359398; cv=none; b=W5giANkBPOF/FITDQHL9LSrynzmEl3+9UaUHoNrROaydqP7dD3Gi1feoii2C7koYEM8GYIaTlJFZWwjvHBEQv6D2WTQtIoxBX0LCV5qqbtXhxGr5brL3Au/mtBCgs/6uyPwoI3a37ptIUBdD9Vp5dXSzWCpp4+LCozNYOFyUO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359398; c=relaxed/simple;
	bh=6aoENgbXfJoP4GBX6P3WI+1hD3qsnBHxrqx/P1/Mcos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dEAX514V45fy1sKhjMDm7uLWO6oFF1FZ61ejXcobKDNM4wJFPglUULcqQRg7nFKmvdhiNRHfjT+VAZIeJd9Dx+gAkWX48I3gUCm4DMsaZBe2I/G8mkvwH5xV0gwLHpbFQKjw3iNYMJUvJEHWgmjPJoegTRguZsTeOQ7YoOcf1mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=dero2/Ap; arc=none smtp.client-ip=178.154.239.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="dero2/Ap"
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2f3c:0:640:7ca0:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id A68DA80670;
	Mon, 13 Oct 2025 15:43:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id efN1GCWLNW20-gK7InnmU;
	Mon, 13 Oct 2025 15:43:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760359382;
	bh=iLm17y7x5x2ZQsB7U3zDB5GxfliLJSqqOi0KZbzWW2M=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=dero2/Apnp/AP1IYZta9/1pbwqKCYelnow7221NfsnpUDyBYO1ikbsUQHGVhIbb8r
	 W/bJIzbGbcnTrDEyX1C01QJ11L1ysY5x0gJefTUQ129Q5h5/7+rxRdiwzeMinqMOpx
	 tUAYch1YhJiGB+J29/YfBTglKTcgo4PBHyBEK4Xc=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@gmail.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v3 2/2] rust: drop `error::to_result` and utilize `ToResult`
Date: Mon, 13 Oct 2025 15:41:39 +0300
Message-ID: <20251013124139.18809-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013124139.18809-1-work@onurozkan.dev>
References: <20251013124139.18809-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Current `to_result` helper takes a `c_int` and returns `Ok(())` on
success and this has some issues like:

    - Callers lose the original return value and often have to store
	it in a temporary variable before calling `to_result`.

    - It only supports `c_int`, which makes callers to unnecessarily
	cast when working with other types (e.g. `u16` in phy
	abstractions). We even have some places that ignore to use
	`to_result` helper because the input doesn't fit in `c_int`
	(see [1]).

[1]: https://lore.kernel.org/all/20250822080252.773d6f54@nimda.home/

This patch removes the `error::to_result` function and replaces it
with a more advanced helper, `ToResult` trait. This change brings
three main benefits:

    - A better calling convention. Instead of wrapping function calls
	with `to_result`, we can now call `.to_result()` directly as an
	extension function.

    - The returned value is preserved as an unsigned integer on success
	which was previously discarded by error::to_result.

    - It's no longer limited with a single input type. E.g., right now we
	can call to_result on isize without manually casting them into i32.

So that the code that previously looked like:

    let ret = unsafe { bindings::some_ffi_call() };
    to_result(ret).map(|()| SomeType::new(ret))

can now be written more directly as:

    unsafe { bindings::some_ffi_call() }.to_result()
	.map(SomeType::new)

Similarly, code such as:

    let res: isize = unsafe { bindings::some_ffi_call() };
    if res < 0 {
	    return Err(Error::from_errno(res as i32));
    }

can be done without manually casting into i32:

    unsafe { bindings::some_ffi_call() }.to_result()?;

This patch only fixes the callers that broke after changes on `to_result`.
I haven't included all the improvements made possible by the new design
since that could conflict with other ongoing patches [2]. Once this patch
is approved and applied, I am planning to follow up with creating a
"good first issue" on [3] for those additional changes.

[2]: https://lore.kernel.org/rust-for-linux/?q=to_result
[3]: https://github.com/Rust-for-Linux/linux

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/536374456
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/android/binder/rust_binder_main.rs |  3 +-
 rust/kernel/auxiliary.rs                   |  9 +--
 rust/kernel/block/mq/gen_disk.rs           | 12 ++--
 rust/kernel/block/mq/tag_set.rs            |  5 +-
 rust/kernel/clk.rs                         | 18 ++++--
 rust/kernel/configfs.rs                    |  9 +--
 rust/kernel/cpufreq.rs                     | 12 ++--
 rust/kernel/device/property.rs             | 12 ++--
 rust/kernel/devres.rs                      | 13 ++--
 rust/kernel/dma.rs                         | 18 ++++--
 rust/kernel/drm/driver.rs                  |  4 +-
 rust/kernel/drm/gem/mod.rs                 | 12 ++--
 rust/kernel/error.rs                       | 45 --------------
 rust/kernel/fs/file.rs                     |  4 +-
 rust/kernel/irq/request.rs                 | 10 +--
 rust/kernel/maple_tree.rs                  | 12 ++--
 rust/kernel/miscdevice.rs                  |  6 +-
 rust/kernel/mm/virt.rs                     |  6 +-
 rust/kernel/net/phy.rs                     | 43 +++++++++----
 rust/kernel/net/phy/reg.rs                 | 22 ++++---
 rust/kernel/opp.rs                         | 72 +++++++++++++---------
 rust/kernel/pci.rs                         | 13 ++--
 rust/kernel/platform.rs                    |  6 +-
 rust/kernel/regulator.rs                   | 32 +++++++---
 rust/kernel/scatterlist.rs                 | 13 ++--
 rust/kernel/security.rs                    | 23 ++++---
 rust/kernel/str.rs                         |  5 +-
 rust/kernel/uaccess.rs                     | 15 ++---
 rust/kernel/usb.rs                         |  9 +--
 29 files changed, 253 insertions(+), 210 deletions(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 6773b7c273ec..35c0d977ce4b 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -13,6 +13,7 @@
 
 use kernel::{
     bindings::{self, seq_file},
+    error::ToResult,
     fs::File,
     list::{ListArc, ListArcSafe, ListLinksSelfPtr, TryNewListArc},
     prelude::*,
@@ -291,7 +292,7 @@ fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
         BINDER_SHRINKER.register(kernel::c_str!("android-binder"))?;
 
         // SAFETY: The module is being loaded, so we can initialize binderfs.
-        unsafe { kernel::error::to_result(binderfs::init_rust_binderfs())? };
+        unsafe { binderfs::init_rust_binderfs().to_result()? };
 
         Ok(Self {})
     }
diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index e11848bbf206..503b2d66e503 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -8,7 +8,7 @@
     bindings, container_of, device,
     device_id::{RawDeviceId, RawDeviceIdIndex},
     driver,
-    error::{from_result, to_result, Result},
+    error::{from_result, Result, ToResult},
     prelude::*,
     types::Opaque,
     ThisModule,
@@ -40,9 +40,10 @@ unsafe fn register(
         }
 
         // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
-        to_result(unsafe {
-            bindings::__auxiliary_driver_register(adrv.get(), module.0, name.as_char_ptr())
-        })
+        unsafe { bindings::__auxiliary_driver_register(adrv.get(), module.0, name.as_char_ptr()) }
+            .to_result()?;
+
+        Ok(())
     }
 
     unsafe fn unregister(adrv: &Opaque<Self::RegType>) {
diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 1ce815c8cdab..d1ed213be00d 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -8,6 +8,7 @@
 use crate::{
     bindings,
     block::mq::{Operations, TagSet},
+    error::ToResult,
     error::{self, from_err_ptr, Result},
     fmt::{self, Write},
     prelude::*,
@@ -167,13 +168,10 @@ pub fn build<T: Operations>(
         // operation, so we will not race.
         unsafe { bindings::set_capacity(gendisk, self.capacity_sectors) };
 
-        crate::error::to_result(
-            // SAFETY: `gendisk` points to a valid and initialized instance of
-            // `struct gendisk`.
-            unsafe {
-                bindings::device_add_disk(core::ptr::null_mut(), gendisk, core::ptr::null_mut())
-            },
-        )?;
+        // SAFETY: `gendisk` points to a valid and initialized instance of
+        // `struct gendisk`.
+        unsafe { bindings::device_add_disk(core::ptr::null_mut(), gendisk, core::ptr::null_mut()) }
+            .to_result()?;
 
         recover_data.dismiss();
 
diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set.rs
index c3cf56d52bee..c8a11107aeec 100644
--- a/rust/kernel/block/mq/tag_set.rs
+++ b/rust/kernel/block/mq/tag_set.rs
@@ -9,7 +9,7 @@
 use crate::{
     bindings,
     block::mq::{operations::OperationsVTable, request::RequestDataWrapper, Operations},
-    error::{self, Result},
+    error::{self, Result, ToResult},
     prelude::try_pin_init,
     types::Opaque,
 };
@@ -65,7 +65,8 @@ pub fn new(
                 // SAFETY: we do not move out of `tag_set`.
                 let tag_set: &mut Opaque<_> = unsafe { Pin::get_unchecked_mut(tag_set) };
                 // SAFETY: `tag_set` is a reference to an initialized `blk_mq_tag_set`.
-                error::to_result( unsafe { bindings::blk_mq_alloc_tag_set(tag_set.get())})
+                unsafe { bindings::blk_mq_alloc_tag_set(tag_set.get())}.to_result()?;
+                Ok(())
             }),
             _p: PhantomData,
         })
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 1e6c8c42fb3a..8a0c1c96d428 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -81,7 +81,7 @@ mod common_clk {
     use super::Hertz;
     use crate::{
         device::Device,
-        error::{from_err_ptr, to_result, Result},
+        error::{from_err_ptr, Result, ToResult},
         prelude::*,
     };
 
@@ -161,7 +161,9 @@ pub fn as_raw(&self) -> *mut bindings::clk {
         pub fn enable(&self) -> Result {
             // SAFETY: By the type invariants, self.as_raw() is a valid argument for
             // [`clk_enable`].
-            to_result(unsafe { bindings::clk_enable(self.as_raw()) })
+            unsafe { bindings::clk_enable(self.as_raw()) }.to_result()?;
+
+            Ok(())
         }
 
         /// Disable the clock.
@@ -185,7 +187,9 @@ pub fn disable(&self) {
         pub fn prepare(&self) -> Result {
             // SAFETY: By the type invariants, self.as_raw() is a valid argument for
             // [`clk_prepare`].
-            to_result(unsafe { bindings::clk_prepare(self.as_raw()) })
+            unsafe { bindings::clk_prepare(self.as_raw()) }.to_result()?;
+
+            Ok(())
         }
 
         /// Unprepare the clock.
@@ -207,7 +211,9 @@ pub fn unprepare(&self) {
         pub fn prepare_enable(&self) -> Result {
             // SAFETY: By the type invariants, self.as_raw() is a valid argument for
             // [`clk_prepare_enable`].
-            to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) })
+            unsafe { bindings::clk_prepare_enable(self.as_raw()) }.to_result()?;
+
+            Ok(())
         }
 
         /// Disable and unprepare the clock.
@@ -241,7 +247,9 @@ pub fn rate(&self) -> Hertz {
         pub fn set_rate(&self, rate: Hertz) -> Result {
             // SAFETY: By the type invariants, self.as_raw() is a valid argument for
             // [`clk_set_rate`].
-            to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate.as_hz()) })
+            unsafe { bindings::clk_set_rate(self.as_raw(), rate.as_hz()) }.to_result()?;
+
+            Ok(())
         }
     }
 
diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 10f1547ca9f1..6f7ec22d8e59 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -112,6 +112,7 @@
 
 use crate::alloc::flags;
 use crate::container_of;
+use crate::error::ToResult;
 use crate::page::PAGE_SIZE;
 use crate::prelude::*;
 use crate::str::CString;
@@ -176,10 +177,10 @@ pub fn new(
             data <- data,
         })
         .pin_chain(|this| {
-            crate::error::to_result(
-                // SAFETY: We initialized `this.subsystem` according to C API contract above.
-                unsafe { bindings::configfs_register_subsystem(this.subsystem.get()) },
-            )
+            // SAFETY: We initialized `this.subsystem` according to C API contract above.
+            unsafe { bindings::configfs_register_subsystem(this.subsystem.get()) }.to_result()?;
+
+            Ok(())
         })
     }
 }
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 21b5b9b8acc1..c4601d8dccae 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -14,7 +14,7 @@
     cpumask,
     device::{Bound, Device},
     devres,
-    error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
+    error::{code::*, from_err_ptr, from_result, Result, ToResult, VTABLE_DEFAULT_ERROR},
     ffi::{c_char, c_ulong},
     prelude::*,
     types::ForeignOwnable,
@@ -157,7 +157,9 @@ pub fn as_raw(&self) -> *mut bindings::cpufreq_policy_data {
     #[inline]
     pub fn generic_verify(&self) -> Result {
         // SAFETY: By the type invariant, the pointer stored in `self` is valid.
-        to_result(unsafe { bindings::cpufreq_generic_frequency_table_verify(self.as_raw()) })
+        unsafe { bindings::cpufreq_generic_frequency_table_verify(self.as_raw()) }.to_result()?;
+
+        Ok(())
     }
 }
 
@@ -520,7 +522,9 @@ pub fn set_suspend_freq(&mut self, freq: Hertz) -> &mut Self {
     #[inline]
     pub fn generic_suspend(&mut self) -> Result {
         // SAFETY: By the type invariant, the pointer stored in `self` is valid.
-        to_result(unsafe { bindings::cpufreq_generic_suspend(self.as_mut_ref()) })
+        unsafe { bindings::cpufreq_generic_suspend(self.as_mut_ref()) }.to_result()?;
+
+        Ok(())
     }
 
     /// Provides a wrapper to the generic get routine.
@@ -1038,7 +1042,7 @@ pub fn new() -> Result<Self> {
         let mut drv = KBox::new(UnsafeCell::new(Self::VTABLE), GFP_KERNEL)?;
 
         // SAFETY: `drv` is guaranteed to be valid for the lifetime of `Registration`.
-        to_result(unsafe { bindings::cpufreq_register_driver(drv.get_mut()) })?;
+        unsafe { bindings::cpufreq_register_driver(drv.get_mut()) }.to_result()?;
 
         Ok(Self(drv, PhantomData))
     }
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 3a332a8c53a9..446d6680e82c 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -10,7 +10,7 @@
 use crate::{
     alloc::KVec,
     bindings,
-    error::{to_result, Result},
+    error::{Result, ToResult},
     fmt,
     prelude::*,
     str::{CStr, CString},
@@ -122,7 +122,7 @@ pub fn property_match_string(&self, name: &CStr, match_str: &CStr) -> Result<usi
                 match_str.as_char_ptr(),
             )
         };
-        to_result(ret)?;
+        ret.to_result()?;
         Ok(ret as usize)
     }
 
@@ -290,7 +290,7 @@ pub fn property_get_reference_args(
                 &mut out_args.0,
             )
         };
-        to_result(ret)?;
+        ret.to_result()?;
 
         Ok(out_args)
     }
@@ -452,7 +452,7 @@ fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self> {
         let ret = unsafe {
             bindings::fwnode_property_read_string(fwnode.as_raw(), name.as_char_ptr(), pstr.cast())
         };
-        to_result(ret)?;
+        ret.to_result()?;
 
         // SAFETY:
         // - `pstr` is a valid pointer to a NUL-terminated C string.
@@ -514,7 +514,7 @@ fn read_array_from_fwnode_property<'a>(
                         out.len(),
                     )
                 };
-                to_result(ret)?;
+                ret.to_result()?;
                 // SAFETY: Transmuting from `&'a mut [MaybeUninit<Self>]` to
                 // `&'a mut [Self]` is sound, because the previous call to a
                 // `fwnode_property_read_*_array` function (which didn't fail)
@@ -536,7 +536,7 @@ fn read_array_len_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<u
                         0,
                     )
                 };
-                to_result(ret)?;
+                ret.to_result()?;
                 Ok(ret as usize)
             }
         }
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 10a6a1789854..f0420111ad7f 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -9,7 +9,7 @@
     alloc::Flags,
     bindings,
     device::{Bound, Device},
-    error::{to_result, Error, Result},
+    error::{Error, Result, ToResult},
     ffi::c_void,
     prelude::*,
     revocable::{Revocable, RevocableGuard},
@@ -157,9 +157,9 @@ pub fn new<'a, E>(
                 // - `devm_add_action()` is guaranteed not to call `callback` until `this` has been
                 //    properly initialized, because we require `dev` (i.e. the *bound* device) to
                 //    live at least as long as the returned `impl PinInit<Self, Error>`.
-                to_result(unsafe {
+                unsafe {
                     bindings::devm_add_action(dev.as_raw(), Some(*callback), inner.cast())
-                }).inspect_err(|_| {
+                }.to_result().inspect_err(|_| {
                     let inner = Opaque::cast_into(inner);
 
                     // SAFETY: `inner` is a valid pointer to an `Inner<T>` and valid for both reads
@@ -321,11 +321,14 @@ fn register_foreign<P>(dev: &Device<Bound>, data: P) -> Result
     // SAFETY:
     // - `dev.as_raw()` is a pointer to a valid and bound device.
     // - `ptr` is a valid pointer the `ForeignOwnable` devres takes ownership of.
-    to_result(unsafe {
+    unsafe {
         // `devm_add_action_or_reset()` also calls `callback` on failure, such that the
         // `ForeignOwnable` is released eventually.
         bindings::devm_add_action_or_reset(dev.as_raw(), Some(callback::<P>), ptr.cast())
-    })
+    }
+    .to_result()?;
+
+    Ok(())
 }
 
 /// Encapsulate `data` in a [`KBox`] and [`Drop::drop`] `data` once `dev` is unbound.
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 4e0af3e1a3b9..3ba68123f948 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -7,7 +7,7 @@
 use crate::{
     bindings, build_assert, device,
     device::{Bound, Core},
-    error::{to_result, Result},
+    error::{Result, ToResult},
     prelude::*,
     sync::aref::ARef,
     transmute::{AsBytes, FromBytes},
@@ -43,7 +43,9 @@ unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
         // - The safety requirement of this function guarantees that there are no concurrent calls
         //   to DMA allocation and mapping primitives using this mask.
-        to_result(unsafe { bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) })
+        unsafe { bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) }.to_result()?;
+
+        Ok(())
     }
 
     /// Set up the device's DMA coherent addressing capabilities.
@@ -60,7 +62,10 @@ unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
         // - The safety requirement of this function guarantees that there are no concurrent calls
         //   to DMA allocation and mapping primitives using this mask.
-        to_result(unsafe { bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value()) })
+        unsafe { bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value()) }
+            .to_result()?;
+
+        Ok(())
     }
 
     /// Set up the device's DMA addressing capabilities.
@@ -79,9 +84,10 @@ unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
         // - The safety requirement of this function guarantees that there are no concurrent calls
         //   to DMA allocation and mapping primitives using this mask.
-        to_result(unsafe {
-            bindings::dma_set_mask_and_coherent(self.as_ref().as_raw(), mask.value())
-        })
+        unsafe { bindings::dma_set_mask_and_coherent(self.as_ref().as_raw(), mask.value()) }
+            .to_result()?;
+
+        Ok(())
     }
 }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f30ee4c6245c..abc8ec2f8ae5 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -6,7 +6,7 @@
 
 use crate::{
     bindings, device, devres, drm,
-    error::{to_result, Result},
+    error::{Result, ToResult},
     prelude::*,
     sync::aref::ARef,
 };
@@ -124,7 +124,7 @@ impl<T: Driver> Registration<T> {
     /// Creates a new [`Registration`] and registers it.
     fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
         // SAFETY: `drm.as_raw()` is valid by the invariants of `drm::Device`.
-        to_result(unsafe { bindings::drm_dev_register(drm.as_raw(), flags) })?;
+        unsafe { bindings::drm_dev_register(drm.as_raw(), flags) }.to_result()?;
 
         Ok(Self(drm.into()))
     }
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 30c853988b94..654dcf3a4b03 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -8,7 +8,7 @@
     alloc::flags::*,
     bindings, drm,
     drm::driver::{AllocImpl, AllocOps},
-    error::{to_result, Result},
+    error::{Result, ToResult},
     prelude::*,
     sync::aref::{ARef, AlwaysRefCounted},
     types::Opaque,
@@ -136,9 +136,11 @@ fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
     {
         let mut handle: u32 = 0;
         // SAFETY: The arguments are all valid per the type invariants.
-        to_result(unsafe {
+        unsafe {
             bindings::drm_gem_handle_create(file.as_raw().cast(), self.as_raw(), &mut handle)
-        })?;
+        }
+        .to_result()?;
+
         Ok(handle)
     }
 
@@ -173,7 +175,7 @@ fn lookup_handle<D, F>(file: &drm::File<F>, handle: u32) -> Result<ARef<Self>>
     /// Creates an mmap offset to map the object from userspace.
     fn create_mmap_offset(&self) -> Result<u64> {
         // SAFETY: The arguments are valid per the type invariant.
-        to_result(unsafe { bindings::drm_gem_create_mmap_offset(self.as_raw()) })?;
+        unsafe { bindings::drm_gem_create_mmap_offset(self.as_raw()) }.to_result()?;
 
         // SAFETY: The arguments are valid per the type invariant.
         Ok(unsafe { bindings::drm_vma_node_offset_addr(&raw mut (*self.as_raw()).vma_node) })
@@ -233,7 +235,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
         unsafe { (*obj.as_raw()).funcs = &Self::OBJECT_FUNCS };
 
         // SAFETY: The arguments are all valid per the type invariants.
-        to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) })?;
+        unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) }.to_result()?;
 
         // SAFETY: We never move out of `Self`.
         let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(obj) });
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index dc566b0cef13..7bc6004dfdbe 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -466,51 +466,6 @@ fn to_result(self) -> Result<Self::Unsigned> {
     }
 }
 
-/// Converts an integer as returned by a C kernel function to a [`Result`].
-///
-/// If the integer is negative, an [`Err`] with an [`Error`] as given by [`Error::from_errno`] is
-/// returned. This means the integer must be `>= -MAX_ERRNO`.
-///
-/// Otherwise, it returns [`Ok`].
-///
-/// It is a bug to pass an out-of-range negative integer. `Err(EINVAL)` is returned in such a case.
-///
-/// # Examples
-///
-/// This function may be used to easily perform early returns with the [`?`] operator when working
-/// with C APIs within Rust abstractions:
-///
-/// ```
-/// # use kernel::error::to_result;
-/// # mod bindings {
-/// #     #![expect(clippy::missing_safety_doc)]
-/// #     use kernel::prelude::*;
-/// #     pub(super) unsafe fn f1() -> c_int { 0 }
-/// #     pub(super) unsafe fn f2() -> c_int { EINVAL.to_errno() }
-/// # }
-/// fn f() -> Result {
-///     // SAFETY: ...
-///     to_result(unsafe { bindings::f1() })?;
-///
-///     // SAFETY: ...
-///     to_result(unsafe { bindings::f2() })?;
-///
-///     // ...
-///
-///     Ok(())
-/// }
-/// # assert_eq!(f(), Err(EINVAL));
-/// ```
-///
-/// [`?`]: https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator
-pub fn to_result(err: crate::ffi::c_int) -> Result {
-    if err < 0 {
-        Err(Error::from_errno(err))
-    } else {
-        Ok(())
-    }
-}
-
 /// Transform a kernel "error pointer" to a normal pointer.
 ///
 /// Some kernel C API functions return an "error pointer" which optionally
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index cf06e73a6da0..e07c587e896e 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -10,7 +10,7 @@
 use crate::{
     bindings,
     cred::Credential,
-    error::{code::*, to_result, Error, Result},
+    error::{code::*, Error, Result, ToResult},
     fmt,
     sync::aref::{ARef, AlwaysRefCounted},
     types::{NotThreadSafe, Opaque},
@@ -400,7 +400,7 @@ impl FileDescriptorReservation {
     pub fn get_unused_fd_flags(flags: u32) -> Result<Self> {
         // SAFETY: FFI call, there are no safety requirements on `flags`.
         let fd: i32 = unsafe { bindings::get_unused_fd_flags(flags) };
-        to_result(fd)?;
+        fd.to_result()?;
 
         Ok(Self {
             fd: fd as u32,
diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index b150563fdef8..fa98c9d49174 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -10,7 +10,7 @@
 use crate::alloc::Allocator;
 use crate::device::{Bound, Device};
 use crate::devres::Devres;
-use crate::error::to_result;
+use crate::error::ToResult;
 use crate::irq::flags::Flags;
 use crate::prelude::*;
 use crate::str::CStr;
@@ -219,7 +219,7 @@ pub fn new<'a>(
                         // - When request_irq is called, everything that handle_irq_callback will
                         //   touch has already been initialized, so it's safe for the callback to
                         //   be called immediately.
-                        to_result(unsafe {
+                        unsafe {
                             bindings::request_irq(
                                 request.irq,
                                 Some(handle_irq_callback::<T>),
@@ -227,7 +227,7 @@ pub fn new<'a>(
                                 name.as_char_ptr(),
                                 this.as_ptr().cast::<c_void>(),
                             )
-                        })?;
+                        }.to_result()?;
                         request.irq
                     }
                 })
@@ -437,7 +437,7 @@ pub fn new<'a>(
                         // - When request_threaded_irq is called, everything that the two callbacks
                         //   will touch has already been initialized, so it's safe for the
                         //   callbacks to be called immediately.
-                        to_result(unsafe {
+                        unsafe {
                             bindings::request_threaded_irq(
                                 request.irq,
                                 Some(handle_threaded_irq_callback::<T>),
@@ -446,7 +446,7 @@ pub fn new<'a>(
                                 name.as_char_ptr(),
                                 this.as_ptr().cast::<c_void>(),
                             )
-                        })?;
+                        }.to_result()?;
                         request.irq
                     }
                 })
diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
index e72eec56bf57..1a98be20b86d 100644
--- a/rust/kernel/maple_tree.rs
+++ b/rust/kernel/maple_tree.rs
@@ -14,7 +14,7 @@
 
 use kernel::{
     alloc::Flags,
-    error::to_result,
+    error::ToResult,
     prelude::*,
     types::{ForeignOwnable, Opaque},
 };
@@ -180,9 +180,10 @@ pub fn insert_range<R>(&self, range: R, value: T, gfp: Flags) -> Result<(), Inse
         let ptr = T::into_foreign(value);
 
         // SAFETY: The tree is valid, and we are passing a pointer to an owned instance of `T`.
-        let res = to_result(unsafe {
+        let res = unsafe {
             bindings::mtree_insert_range(self.tree.get(), first, last, ptr, gfp.as_raw())
-        });
+        }
+        .to_result();
 
         if let Err(err) = res {
             // SAFETY: As `mtree_insert_range` failed, it is safe to take back ownership.
@@ -449,7 +450,7 @@ pub fn alloc_range<R>(
         let mut index = 0;
 
         // SAFETY: The tree is valid, and we are passing a pointer to an owned instance of `T`.
-        let res = to_result(unsafe {
+        let res = unsafe {
             bindings::mtree_alloc_range(
                 self.tree.tree.get(),
                 &mut index,
@@ -459,7 +460,8 @@ pub fn alloc_range<R>(
                 max,
                 gfp.as_raw(),
             )
-        });
+        }
+        .to_result();
 
         if let Err(err) = res {
             // SAFETY: As `mtree_alloc_range` failed, it is safe to take back ownership.
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index d698cddcb4a5..202ffe2e5161 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -11,7 +11,7 @@
 use crate::{
     bindings,
     device::Device,
-    error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
+    error::{Error, Result, ToResult, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
     fs::{File, Kiocb},
     iov::{IovIterDest, IovIterSource},
@@ -80,7 +80,9 @@ pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
                 // the destructor of this type deallocates the memory.
                 // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
                 // misc device.
-                to_result(unsafe { bindings::misc_register(slot) })
+                unsafe { bindings::misc_register(slot) }.to_result()?;
+
+                Ok::<(), Error>(())
             }),
             _t: PhantomData,
         })
diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index a1bfa4e19293..385188c2d816 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -16,7 +16,7 @@
 
 use crate::{
     bindings,
-    error::{code::EINVAL, to_result, Result},
+    error::{code::EINVAL, Result, ToResult},
     mm::MmWithUser,
     page::Page,
     types::Opaque,
@@ -194,7 +194,9 @@ pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> &'a Self {
     pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
         // SAFETY: By the type invariant of `Self` caller has read access and has verified that
         // `VM_MIXEDMAP` is set. By invariant on `Page` the page has order 0.
-        to_result(unsafe { bindings::vm_insert_page(self.as_ptr(), address, page.as_ptr()) })
+        unsafe { bindings::vm_insert_page(self.as_ptr(), address, page.as_ptr()) }.to_result()?;
+
+        Ok(())
     }
 }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index bf6272d87a7b..d73fb725884e 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -195,9 +195,9 @@ pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        let ret = unsafe { bindings::phy_read_paged(phydev, page.into(), regnum.into()) };
-
-        to_result(ret).map(|()| ret as u16)
+        unsafe { bindings::phy_read_paged(phydev, page.into(), regnum.into()) }
+            .to_result()
+            .map(|v| v as u16)
     }
 
     /// Resolves the advertisements into PHY settings.
@@ -213,7 +213,9 @@ pub fn genphy_soft_reset(&mut self) -> Result {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_soft_reset(phydev) })
+        unsafe { bindings::genphy_soft_reset(phydev) }.to_result()?;
+
+        Ok(())
     }
 
     /// Initializes the PHY.
@@ -221,7 +223,9 @@ pub fn init_hw(&mut self) -> Result {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        to_result(unsafe { bindings::phy_init_hw(phydev) })
+        unsafe { bindings::phy_init_hw(phydev) }.to_result()?;
+
+        Ok(())
     }
 
     /// Starts auto-negotiation.
@@ -229,7 +233,9 @@ pub fn start_aneg(&mut self) -> Result {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        to_result(unsafe { bindings::_phy_start_aneg(phydev) })
+        unsafe { bindings::_phy_start_aneg(phydev) }.to_result()?;
+
+        Ok(())
     }
 
     /// Resumes the PHY via `BMCR_PDOWN` bit.
@@ -237,7 +243,9 @@ pub fn genphy_resume(&mut self) -> Result {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_resume(phydev) })
+        unsafe { bindings::genphy_resume(phydev) }.to_result()?;
+
+        Ok(())
     }
 
     /// Suspends the PHY via `BMCR_PDOWN` bit.
@@ -245,7 +253,9 @@ pub fn genphy_suspend(&mut self) -> Result {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_suspend(phydev) })
+        unsafe { bindings::genphy_suspend(phydev) }.to_result()?;
+
+        Ok(())
     }
 
     /// Checks the link status and updates current link state.
@@ -258,7 +268,9 @@ pub fn genphy_update_link(&mut self) -> Result {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_update_link(phydev) })
+        unsafe { bindings::genphy_update_link(phydev) }.to_result()?;
+
+        Ok(())
     }
 
     /// Reads link partner ability.
@@ -266,7 +278,9 @@ pub fn genphy_read_lpa(&mut self) -> Result {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_read_lpa(phydev) })
+        unsafe { bindings::genphy_read_lpa(phydev) }.to_result()?;
+
+        Ok(())
     }
 
     /// Reads PHY abilities.
@@ -274,7 +288,9 @@ pub fn genphy_read_abilities(&mut self) -> Result {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_read_abilities(phydev) })
+        unsafe { bindings::genphy_read_abilities(phydev) }.to_result()?;
+
+        Ok(())
     }
 }
 
@@ -658,9 +674,10 @@ pub fn register(
         // SAFETY: The type invariants of [`DriverVTable`] ensure that all elements of
         // the `drivers` slice are initialized properly. `drivers` will not be moved.
         // So it's just an FFI call.
-        to_result(unsafe {
+        unsafe {
             bindings::phy_drivers_register(drivers[0].0.get(), drivers.len().try_into()?, module.0)
-        })?;
+        }
+        .to_result()?;
         // INVARIANT: The `drivers` slice is successfully registered to the kernel via `phy_drivers_register`.
         Ok(Registration { drivers })
     }
diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
index a7db0064cb7d..7ac1a23c0fa8 100644
--- a/rust/kernel/net/phy/reg.rs
+++ b/rust/kernel/net/phy/reg.rs
@@ -110,7 +110,7 @@ fn read(&self, dev: &mut Device) -> Result<u16> {
         let ret = unsafe {
             bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into())
         };
-        to_result(ret)?;
+        ret.to_result()?;
         Ok(ret as u16)
     }
 
@@ -119,9 +119,12 @@ fn write(&self, dev: &mut Device, val: u16) -> Result {
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
         // `phydev`.
-        to_result(unsafe {
+        unsafe {
             bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into(), val)
-        })
+        }
+        .to_result()?;
+
+        Ok(())
     }
 
     fn read_status(dev: &mut Device) -> Result<u16> {
@@ -129,7 +132,7 @@ fn read_status(dev: &mut Device) -> Result<u16> {
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
         let ret = unsafe { bindings::genphy_read_status(phydev) };
-        to_result(ret)?;
+        ret.to_result()?;
         Ok(ret as u16)
     }
 }
@@ -200,7 +203,7 @@ fn read(&self, dev: &mut Device) -> Result<u16> {
         // So it's just an FFI call.
         let ret =
             unsafe { bindings::phy_read_mmd(phydev, self.devad.0.into(), self.regnum.into()) };
-        to_result(ret)?;
+        ret.to_result()?;
         Ok(ret as u16)
     }
 
@@ -208,9 +211,10 @@ fn write(&self, dev: &mut Device, val: u16) -> Result {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call.
-        to_result(unsafe {
-            bindings::phy_write_mmd(phydev, self.devad.0.into(), self.regnum.into(), val)
-        })
+        unsafe { bindings::phy_write_mmd(phydev, self.devad.0.into(), self.regnum.into(), val) }
+            .to_result()?;
+
+        Ok(())
     }
 
     fn read_status(dev: &mut Device) -> Result<u16> {
@@ -218,7 +222,7 @@ fn read_status(dev: &mut Device) -> Result<u16> {
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
         // So it's just an FFI call.
         let ret = unsafe { bindings::genphy_c45_read_status(phydev) };
-        to_result(ret)?;
+        ret.to_result()?;
         Ok(ret as u16)
     }
 }
diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 2c763fa9276d..4307c6624a4d 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -12,7 +12,7 @@
     clk::Hertz,
     cpumask::{Cpumask, CpumaskVar},
     device::Device,
-    error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
+    error::{code::*, from_err_ptr, from_result, Result, ToResult, VTABLE_DEFAULT_ERROR},
     ffi::c_ulong,
     prelude::*,
     str::CString,
@@ -42,9 +42,8 @@ pub(crate) fn new(table: &Table) -> Result<Self> {
 
             // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
             // requirements.
-            to_result(unsafe {
-                bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr)
-            })?;
+            unsafe { bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr) }
+                .to_result()?;
 
             Ok(Self {
                 dev: table.dev.clone(),
@@ -182,7 +181,7 @@ impl Token {
     fn new(dev: &ARef<Device>, mut data: Data) -> Result<Self> {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe { bindings::dev_pm_opp_add_dynamic(dev.as_raw(), &mut data.0) })?;
+        unsafe { bindings::dev_pm_opp_add_dynamic(dev.as_raw(), &mut data.0) }.to_result()?;
         Ok(Self {
             dev: dev.clone(),
             freq: data.freq(),
@@ -500,9 +499,9 @@ pub fn set(self, dev: &Device) -> Result<ConfigToken> {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements. The OPP core guarantees not to access fields of [`Config`] after this call
         // and so we don't need to save a copy of them for future use.
-        let ret = unsafe { bindings::dev_pm_opp_set_config(dev.as_raw(), &mut config) };
-
-        to_result(ret).map(|()| ConfigToken(ret))
+        unsafe { bindings::dev_pm_opp_set_config(dev.as_raw(), &mut config) }
+            .to_result()
+            .map(|v| ConfigToken(v as i32))
     }
 
     /// Config's clk callback.
@@ -660,7 +659,7 @@ pub fn from_of(dev: &ARef<Device>, index: i32) -> Result<Self> {
         //
         // INVARIANT: The reference-count is incremented by the C code and is decremented when
         // [`Table`] goes out of scope.
-        to_result(unsafe { bindings::dev_pm_opp_of_add_table_indexed(dev.as_raw(), index) })?;
+        unsafe { bindings::dev_pm_opp_of_add_table_indexed(dev.as_raw(), index) }.to_result()?;
 
         // Get the newly created [`Table`].
         let mut table = Self::from_dev(dev)?;
@@ -688,7 +687,7 @@ pub fn from_of_cpumask(dev: &Device, cpumask: &mut Cpumask) -> Result<Self> {
         //
         // INVARIANT: The reference-count is incremented by the C code and is decremented when
         // [`Table`] goes out of scope.
-        to_result(unsafe { bindings::dev_pm_opp_of_cpumask_add_table(cpumask.as_raw()) })?;
+        unsafe { bindings::dev_pm_opp_of_cpumask_add_table(cpumask.as_raw()) }.to_result()?;
 
         // Fetch the newly created table.
         let mut table = Self::from_dev(dev)?;
@@ -710,9 +709,7 @@ fn remove_of_cpumask(&self, cpumask: &Cpumask) {
     pub fn opp_count(&self) -> Result<u32> {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        let ret = unsafe { bindings::dev_pm_opp_get_opp_count(self.dev.as_raw()) };
-
-        to_result(ret).map(|()| ret as u32)
+        unsafe { bindings::dev_pm_opp_get_opp_count(self.dev.as_raw()) }.to_result()
     }
 
     /// Returns max clock latency (in nanoseconds) of the [`OPP`]s in the [`Table`].
@@ -752,7 +749,9 @@ pub fn suspend_freq(&self) -> Hertz {
     pub fn sync_regulators(&self) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe { bindings::dev_pm_opp_sync_regulators(self.dev.as_raw()) })
+        unsafe { bindings::dev_pm_opp_sync_regulators(self.dev.as_raw()) }.to_result()?;
+
+        Ok(())
     }
 
     /// Gets sharing CPUs.
@@ -760,16 +759,18 @@ pub fn sync_regulators(&self) -> Result {
     pub fn sharing_cpus(dev: &Device, cpumask: &mut Cpumask) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe { bindings::dev_pm_opp_get_sharing_cpus(dev.as_raw(), cpumask.as_raw()) })
+        unsafe { bindings::dev_pm_opp_get_sharing_cpus(dev.as_raw(), cpumask.as_raw()) }
+            .to_result()?;
+
+        Ok(())
     }
 
     /// Sets sharing CPUs.
     pub fn set_sharing_cpus(&mut self, cpumask: &mut Cpumask) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe {
-            bindings::dev_pm_opp_set_sharing_cpus(self.dev.as_raw(), cpumask.as_raw())
-        })?;
+        unsafe { bindings::dev_pm_opp_set_sharing_cpus(self.dev.as_raw(), cpumask.as_raw()) }
+            .to_result()?;
 
         if let Some(mask) = self.cpus.as_mut() {
             // Update the cpumask as this will be used while removing the table.
@@ -785,9 +786,10 @@ pub fn set_sharing_cpus(&mut self, cpumask: &mut Cpumask) -> Result {
     pub fn of_sharing_cpus(dev: &Device, cpumask: &mut Cpumask) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe {
-            bindings::dev_pm_opp_of_get_sharing_cpus(dev.as_raw(), cpumask.as_raw())
-        })
+        unsafe { bindings::dev_pm_opp_of_get_sharing_cpus(dev.as_raw(), cpumask.as_raw()) }
+            .to_result()?;
+
+        Ok(())
     }
 
     /// Updates the voltage value for an [`OPP`].
@@ -801,7 +803,7 @@ pub fn adjust_voltage(
     ) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe {
+        unsafe {
             bindings::dev_pm_opp_adjust_voltage(
                 self.dev.as_raw(),
                 freq.into(),
@@ -809,7 +811,10 @@ pub fn adjust_voltage(
                 volt_min.into(),
                 volt_max.into(),
             )
-        })
+        }
+        .to_result()?;
+
+        Ok(())
     }
 
     /// Creates [`FreqTable`] from [`Table`].
@@ -824,7 +829,9 @@ pub fn cpufreq_table(&mut self) -> Result<FreqTable> {
     pub fn set_rate(&self, freq: Hertz) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe { bindings::dev_pm_opp_set_rate(self.dev.as_raw(), freq.into()) })
+        unsafe { bindings::dev_pm_opp_set_rate(self.dev.as_raw(), freq.into()) }.to_result()?;
+
+        Ok(())
     }
 
     /// Configures device with [`OPP`].
@@ -832,7 +839,9 @@ pub fn set_rate(&self, freq: Hertz) -> Result {
     pub fn set_opp(&self, opp: &OPP) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe { bindings::dev_pm_opp_set_opp(self.dev.as_raw(), opp.as_raw()) })
+        unsafe { bindings::dev_pm_opp_set_opp(self.dev.as_raw(), opp.as_raw()) }.to_result()?;
+
+        Ok(())
     }
 
     /// Finds [`OPP`] based on frequency.
@@ -936,7 +945,9 @@ pub fn opp_from_bw(&self, mut bw: u32, index: i32, stype: SearchType) -> Result<
     pub fn enable_opp(&self, freq: Hertz) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe { bindings::dev_pm_opp_enable(self.dev.as_raw(), freq.into()) })
+        unsafe { bindings::dev_pm_opp_enable(self.dev.as_raw(), freq.into()) }.to_result()?;
+
+        Ok(())
     }
 
     /// Disables the [`OPP`].
@@ -944,7 +955,9 @@ pub fn enable_opp(&self, freq: Hertz) -> Result {
     pub fn disable_opp(&self, freq: Hertz) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe { bindings::dev_pm_opp_disable(self.dev.as_raw(), freq.into()) })
+        unsafe { bindings::dev_pm_opp_disable(self.dev.as_raw(), freq.into()) }.to_result()?;
+
+        Ok(())
     }
 
     /// Registers with the Energy model.
@@ -952,9 +965,8 @@ pub fn disable_opp(&self, freq: Hertz) -> Result {
     pub fn of_register_em(&mut self, cpumask: &mut Cpumask) -> Result {
         // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
         // requirements.
-        to_result(unsafe {
-            bindings::dev_pm_opp_of_register_em(self.dev.as_raw(), cpumask.as_raw())
-        })?;
+        unsafe { bindings::dev_pm_opp_of_register_em(self.dev.as_raw(), cpumask.as_raw()) }
+            .to_result()?;
 
         self.em = true;
         Ok(())
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 7fcc5f6022c1..c586d440d1ca 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -9,7 +9,7 @@
     device_id::{RawDeviceId, RawDeviceIdIndex},
     devres::Devres,
     driver,
-    error::{from_result, to_result, Result},
+    error::{from_result, Result, ToResult},
     io::{Io, IoRaw},
     irq::{self, IrqRequest},
     str::CStr,
@@ -50,9 +50,10 @@ unsafe fn register(
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
-        to_result(unsafe {
-            bindings::__pci_register_driver(pdrv.get(), module.0, name.as_char_ptr())
-        })
+        unsafe { bindings::__pci_register_driver(pdrv.get(), module.0, name.as_char_ptr()) }
+            .to_result()?;
+
+        Ok(())
     }
 
     unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
@@ -582,7 +583,9 @@ impl Device<device::Core> {
     /// Enable memory resources for this device.
     pub fn enable_device_mem(&self) -> Result {
         // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
-        to_result(unsafe { bindings::pci_enable_device_mem(self.as_raw()) })
+        unsafe { bindings::pci_enable_device_mem(self.as_raw()) }.to_result()?;
+
+        Ok(())
     }
 
     /// Enable bus-mastering for this device.
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 7205fe3416d3..add57d03fc0b 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -8,7 +8,7 @@
     acpi, bindings, container_of,
     device::{self, Bound},
     driver,
-    error::{from_result, to_result, Result},
+    error::{from_result, Result, ToResult},
     io::{mem::IoRequest, Resource},
     irq::{self, IrqRequest},
     of,
@@ -55,7 +55,9 @@ unsafe fn register(
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
-        to_result(unsafe { bindings::__platform_driver_register(pdrv.get(), module.0) })
+        unsafe { bindings::__platform_driver_register(pdrv.get(), module.0) }.to_result()?;
+
+        Ok(())
     }
 
     unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index b55a201e5029..40c6b4f8dcf5 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -19,7 +19,7 @@
 use crate::{
     bindings,
     device::{Bound, Device},
-    error::{from_err_ptr, to_result, Result},
+    error::{from_err_ptr, Result, ToResult},
     prelude::*,
 };
 
@@ -84,7 +84,9 @@ pub struct Error<State: RegulatorState> {
 pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
     // SAFETY: `dev` is a valid and bound device, while `name` is a valid C
     // string.
-    to_result(unsafe { bindings::devm_regulator_get_enable(dev.as_raw(), name.as_ptr()) })
+    unsafe { bindings::devm_regulator_get_enable(dev.as_raw(), name.as_ptr()) }.to_result()?;
+
+    Ok(())
 }
 
 /// Same as [`devm_enable`], but calls `devm_regulator_get_enable_optional`
@@ -102,7 +104,10 @@ pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
 pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
     // SAFETY: `dev` is a valid and bound device, while `name` is a valid C
     // string.
-    to_result(unsafe { bindings::devm_regulator_get_enable_optional(dev.as_raw(), name.as_ptr()) })
+    unsafe { bindings::devm_regulator_get_enable_optional(dev.as_raw(), name.as_ptr()) }
+        .to_result()?;
+
+    Ok(())
 }
 
 /// A `struct regulator` abstraction.
@@ -248,21 +253,24 @@ impl<T: RegulatorState> Regulator<T> {
     /// This can be used to ensure that the device powers up cleanly.
     pub fn set_voltage(&self, min_voltage: Voltage, max_voltage: Voltage) -> Result {
         // SAFETY: Safe as per the type invariants of `Regulator`.
-        to_result(unsafe {
+        unsafe {
             bindings::regulator_set_voltage(
                 self.inner.as_ptr(),
                 min_voltage.as_microvolts(),
                 max_voltage.as_microvolts(),
             )
-        })
+        }
+        .to_result()?;
+
+        Ok(())
     }
 
     /// Gets the current voltage of the regulator.
     pub fn get_voltage(&self) -> Result<Voltage> {
         // SAFETY: Safe as per the type invariants of `Regulator`.
-        let voltage = unsafe { bindings::regulator_get_voltage(self.inner.as_ptr()) };
-
-        to_result(voltage).map(|()| Voltage::from_microvolts(voltage))
+        unsafe { bindings::regulator_get_voltage(self.inner.as_ptr()) }
+            .to_result()
+            .map(|v| Voltage::from_microvolts(v as i32))
     }
 
     fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
@@ -282,12 +290,16 @@ fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
 
     fn enable_internal(&self) -> Result {
         // SAFETY: Safe as per the type invariants of `Regulator`.
-        to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr()) })
+        unsafe { bindings::regulator_enable(self.inner.as_ptr()) }.to_result()?;
+
+        Ok(())
     }
 
     fn disable_internal(&self) -> Result {
         // SAFETY: Safe as per the type invariants of `Regulator`.
-        to_result(unsafe { bindings::regulator_disable(self.inner.as_ptr()) })
+        unsafe { bindings::regulator_disable(self.inner.as_ptr()) }.to_result()?;
+
+        Ok(())
     }
 }
 
diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index 9709dff60b5a..35f0920e052a 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -34,7 +34,8 @@
     bindings,
     device::{Bound, Device},
     devres::Devres,
-    dma, error,
+    dma,
+    error::ToResult,
     io::resource::ResourceSize,
     page,
     prelude::*,
@@ -208,9 +209,8 @@ unsafe fn new(
         // - `dev.as_raw()` is a valid pointer to a `struct device`, which is guaranteed to be
         //   bound to a driver for the duration of this call.
         // - `sgt` is a valid pointer to a `struct sg_table`.
-        error::to_result(unsafe {
-            bindings::dma_map_sgtable(dev.as_raw(), sgt.as_ptr(), dir.into(), 0)
-        })?;
+        unsafe { bindings::dma_map_sgtable(dev.as_raw(), sgt.as_ptr(), dir.into(), 0) }
+            .to_result()?;
 
         // INVARIANT: By the safety requirements of this function it is guaranteed that `sgt` is
         // valid for the entire lifetime of this object instance.
@@ -273,7 +273,7 @@ unsafe fn new(
         // SAFETY:
         // - `sgt.get()` is a valid pointer to uninitialized memory.
         // - As by the check above, `pages` is not empty.
-        error::to_result(unsafe {
+        unsafe {
             bindings::sg_alloc_table_from_pages_segment(
                 sgt.get(),
                 pages.as_mut_ptr(),
@@ -283,7 +283,8 @@ unsafe fn new(
                 max_segment,
                 flags.as_raw(),
             )
-        })?;
+        }
+        .to_result()?;
 
         Ok(Self(sgt))
     }
diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
index 9d271695265f..63f3d091eea5 100644
--- a/rust/kernel/security.rs
+++ b/rust/kernel/security.rs
@@ -9,7 +9,7 @@
 use crate::{
     bindings,
     cred::Credential,
-    error::{to_result, Result},
+    error::{Result, ToResult},
     fs::File,
 };
 
@@ -18,7 +18,9 @@
 #[inline]
 pub fn binder_set_context_mgr(mgr: &Credential) -> Result {
     // SAFETY: `mrg.0` is valid because the shared reference guarantees a nonzero refcount.
-    to_result(unsafe { bindings::security_binder_set_context_mgr(mgr.as_ptr()) })
+    unsafe { bindings::security_binder_set_context_mgr(mgr.as_ptr()) }.to_result()?;
+
+    Ok(())
 }
 
 /// Calls the security modules to determine if binder transactions are allowed from task `from` to
@@ -26,7 +28,9 @@ pub fn binder_set_context_mgr(mgr: &Credential) -> Result {
 #[inline]
 pub fn binder_transaction(from: &Credential, to: &Credential) -> Result {
     // SAFETY: `from` and `to` are valid because the shared references guarantee nonzero refcounts.
-    to_result(unsafe { bindings::security_binder_transaction(from.as_ptr(), to.as_ptr()) })
+    unsafe { bindings::security_binder_transaction(from.as_ptr(), to.as_ptr()) }.to_result()?;
+
+    Ok(())
 }
 
 /// Calls the security modules to determine if task `from` is allowed to send binder objects
@@ -34,7 +38,9 @@ pub fn binder_transaction(from: &Credential, to: &Credential) -> Result {
 #[inline]
 pub fn binder_transfer_binder(from: &Credential, to: &Credential) -> Result {
     // SAFETY: `from` and `to` are valid because the shared references guarantee nonzero refcounts.
-    to_result(unsafe { bindings::security_binder_transfer_binder(from.as_ptr(), to.as_ptr()) })
+    unsafe { bindings::security_binder_transfer_binder(from.as_ptr(), to.as_ptr()) }.to_result()?;
+
+    Ok(())
 }
 
 /// Calls the security modules to determine if task `from` is allowed to send the given file to
@@ -43,9 +49,10 @@ pub fn binder_transfer_binder(from: &Credential, to: &Credential) -> Result {
 pub fn binder_transfer_file(from: &Credential, to: &Credential, file: &File) -> Result {
     // SAFETY: `from`, `to` and `file` are valid because the shared references guarantee nonzero
     // refcounts.
-    to_result(unsafe {
-        bindings::security_binder_transfer_file(from.as_ptr(), to.as_ptr(), file.as_ptr())
-    })
+    unsafe { bindings::security_binder_transfer_file(from.as_ptr(), to.as_ptr(), file.as_ptr()) }
+        .to_result()?;
+
+    Ok(())
 }
 
 /// A security context string.
@@ -66,7 +73,7 @@ pub fn from_secid(secid: u32) -> Result<Self> {
         let mut ctx: bindings::lsm_context = unsafe { core::mem::zeroed() };
 
         // SAFETY: Just a C FFI call. The pointer is valid for writes.
-        to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut ctx) })?;
+        unsafe { bindings::security_secid_to_secctx(secid, &mut ctx) }.to_result()?;
 
         // INVARIANT: If the above call did not fail, then we have a valid security context.
         Ok(Self { ctx })
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 5c74e5f77601..97c51fe9a1f0 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -4,7 +4,7 @@
 
 use crate::{
     alloc::{flags::*, AllocError, KVec},
-    error::{to_result, Result},
+    error::{Result, ToResult},
     fmt::{self, Write},
     prelude::*,
 };
@@ -929,7 +929,8 @@ unsafe fn kstrtobool_raw(string: *const u8) -> Result<bool> {
     // SAFETY:
     // - By function safety requirement, `string` is a valid null-terminated string.
     // - `result` is a valid `bool` that we own.
-    to_result(unsafe { bindings::kstrtobool(string, &mut result) })?;
+    unsafe { bindings::kstrtobool(string, &mut result) }.to_result()?;
+
     Ok(result)
 }
 
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index a8fb4764185a..57d562a8ed62 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -7,7 +7,7 @@
 use crate::{
     alloc::{Allocator, Flags},
     bindings,
-    error::Result,
+    error::{Result, ToResult},
     ffi::{c_char, c_void},
     prelude::*,
     transmute::{AsBytes, FromBytes},
@@ -483,26 +483,23 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
 /// initialized and non-zero. Furthermore, if `len < dst.len()`, then `dst[len]` is a NUL byte.
 #[inline]
 fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {
-    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
-    let len = dst.len() as isize;
+    let len = dst.len();
 
     // SAFETY: `dst` is valid for writing `dst.len()` bytes.
     let res = unsafe {
         bindings::strncpy_from_user(
             dst.as_mut_ptr().cast::<c_char>(),
             src.as_const_ptr().cast::<c_char>(),
-            len,
+            // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
+            len as isize,
         )
-    };
-
-    if res < 0 {
-        return Err(Error::from_errno(res as i32));
     }
+    .to_result()?;
 
     #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
     assert!(res <= len);
 
     // GUARANTEES: `strncpy_from_user` was successful, so `dst` has contents in accordance with the
     // guarantees of this function.
-    Ok(res as usize)
+    Ok(res)
 }
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 14ddb711bab3..a3cb9c9db5b5 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -9,7 +9,7 @@
     bindings, device,
     device_id::{RawDeviceId, RawDeviceIdIndex},
     driver,
-    error::{from_result, to_result, Result},
+    error::{from_result, Result, ToResult},
     prelude::*,
     str::CStr,
     types::{AlwaysRefCounted, Opaque},
@@ -39,9 +39,10 @@ unsafe fn register(
         }
 
         // SAFETY: `udrv` is guaranteed to be a valid `RegType`.
-        to_result(unsafe {
-            bindings::usb_register_driver(udrv.get(), module.0, name.as_char_ptr())
-        })
+        unsafe { bindings::usb_register_driver(udrv.get(), module.0, name.as_char_ptr()) }
+            .to_result()?;
+
+        Ok(())
     }
 
     unsafe fn unregister(udrv: &Opaque<Self::RegType>) {
-- 
2.51.0

