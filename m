Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707299;
	b=Jakv76r5apb9PUVBG4Zvoi5C0yDQRqPE6/0YMEaDyL9sCIQiAhsc2DKvv+XMJp4sHy3G
	 GdNuxT/YeLfPQ8c4LsHRgC/KNBEYuSQv7pDZeQOiyENUgIm+Xoo0mHTayL8PVCCnbAsB+
	 2r4Iwl7ec2L7Qae7QEocCFOaEDIsAKbI2sVKuEfl4P8+CXaRK0/eZkxxuvv8X2n3wRALR
	 XoznurGnOfj8iihP7z19Zr7fXC7ksj7ZTTSkiSxibJibzKs///R77sOZWhMhxs1jOJYPv
	 jxzwj/mVHutTM1SGBIFENhXWBjWTKe53HYUptzQXtq/H2wdD8wFWVzh+F4eZ2vBUKVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707299;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lpq1uSG4Hh1saPV4AcSosd4jRfnTqsw/hkNQqfopxkU=;
	b=XC2PtvTxVsSgpI6heywRhQhLNXzQvFO7JXWQgkdOQotDm+17CLTubzV0XwEhP8ALWsmW
	 t8/0EBOY/O7GJ+bReCv7rI+d04cU/FeBkynLFDvJ7IkIA8eva/w4IDPZNT7QDBFWOA/zc
	 QOu+dWv8km+ReDeVKdfiluCcdNI3PMrrm6tgnEtXbydv0q0xgMbaGnV3+IdgMST/q6rHP
	 rgs0qCElBynC1Q0WJr2W5oQSoJ6BpmXwW29JjhakIjS8UgHJ7/srFcgpvLxzo4r+Ks4Oz
	 aRGlvvLV3Ll7GxghHYf9bAKodumFFi8r22ixmDxwWZzkISEiuu+4fxPVy4BU2fXCXfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ez349+35;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D68A606A330;
	Thu, 26 Nov 2026 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ez349+35
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795707298;
	b=TzFC1gDuW3648YjYZzkRp8HkUQWDP5bKmgdZ+GS8Cw5kN4DlB7fdktzWqLZ+0lqH0rh8
	 fWsuaQAvxZxLHATtGuXzPU32bP1dw3uOTJ71cVMaZ5bS8QVSwhInt7c2o/y5N+emqqFQT
	 eKqVsfOsGzuU4bG/PN/tMnMfES2ahDC6IYsATo59HbXJQeyfLRmfUg472+U7OhKt3CQjl
	 k7qbVOAso1WkiteFVzx9iCHmPjGT1MzKPpLx46qYcJthJnBA82sz2xWwSzYPZ1cOt8EGq
	 8L7/NU7HV4X8bfmxNP3lkuptTUmHeMOdGYa3/i+v2Of17H6p135UszPUogUVUBuOMbA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795707298;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lpq1uSG4Hh1saPV4AcSosd4jRfnTqsw/hkNQqfopxkU=;
	b=MO/Rprm6MuRSs6hKH52+tQkDnJqbVnbCrb2cWlv8V5Lm7lqbnPu0cJH8/Q/zkKQYKq/4
	 rd+GQOOuMVGwry/Z5hHAJLmmGl7DrDsjGeNYN457h/ynd6LBGzC8GDI0xava8QONmZQD5
	 oXSdAAXgqK8BrB4VraJpgM6WPRS8/qWIApeTjWLj7+47MjNcnkyw/5E/xPtt+JaHgctGb
	 9LPC+6G3Fd5mB8ixHlYkOXTtA+J/q21vhFEE6iEAwddnhuCVc1I1TaBecxRtVPBPyJ/UZ
	 9049Jd6jpKALVzhBSZZhwan9IFveoVBaEnDpzCEc5i8glL64GdebScj8mH8Pe1BiD1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 405881F000D0;
	Thu, 26 Nov 2026 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707298;
	bh=lpq1uSG4Hh1saPV4AcSosd4jRfnTqsw/hkNQqfopxkU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Ez349+35Pgx1DWA5Vu0dS/MPE0xZ5Lhi3LtxSs3wp03acBG4CWK61oF3kNn+KOu9f
	 18ZQSNVZEIYcYFXNPhS/kSIoLYAfP5E/v0O/pttxey3OQqvQ4YzUemmBGRZPlmaRnD
	 WMKe57sCiubc3/nIaH+jXYaOq8fe07iHluIVwpVFaj0toxDqFPa+sp1cZNe/FhR/dv
	 ngUZpTTAm74wn4AoVEANbBUSI5OSQ41f3lwFWSmLOBIdulD9o5lq04kPXOBzRmzPKM
	 qhqoQfcr4gIToU8exrOHUaHs+gJcf2JnH3wWenh/vsJF8eJWH7N+pKYe3etHd4cJxY
	 L1WCEOvFH0jbg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C25804D585;
	Thu, 26 Nov 2026 15:34:50 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 23:34:25 +0800
Subject: [PATCH v2] rust: dmi: add basic DMI matching abstraction
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-rust-dmi-v2-1-33064f0bb005@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNyw6CMBBFf4XM2hpm0oi48j8Mi9oOMEYeaaHRE
 P5dijEuT3LuuQsE9sIBLtkCnqMEGfoN6JCBbU3fsBK3MVBOJ0RC5ecwKdeJsrp0lGt0BRNs+ui
 5lteeulVfDvP9wXZK+2S0EqbBv/eviMn7ZemfjahQaWO51LqszwVdm87I82iHDqp1XT+Hmq6Us
 gAAAA==
X-Change-ID: 20261121-rust-dmi-c49d2041d7e2
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jean Delvare <jdelvare@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Nick Dowsett <nick42d@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795707290; l=6766;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=PHA4hFS0TxWtGH5FH/R7CIpkKuwRvGsZ6jlswAdUqbk=;
 b=lgllVIb+vyficilne4+Wiqes9M39bYbGnXWP0vUuxzSr6W0SztFaAolF1P+4Q6SzhVGsIGTsV
 F7gzbkpZO6+Aa2f9Dv68g7y9eNyWy9GDIQFmO1/JmoNbCF5JqfA285v
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

Exposes `linux/dmi.h` to bindgen, adds MAINTAINERS entry and adds an MVP
of `kernel::dmi` module.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
This abstraction is used by:
https://lore.kernel.org/all/20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com/

This patch adds an initial Rust abstraction for DMI, exposing
`get_system_info()`.
---
Changes in v2:
- Small improvements - formatting and comments (Miguel)
  - `get_system_info()` has been marked unsafe to avoid an unnecessary
    soundness hole (Miguel). The safety requirement is easy to prove, so
    in my opinion this is sufficient for an MVP. This could potentially be
    upgraded to a safe function at a later stage with a C change.
  - Added `#[inline]` to small helper (Sashiko).
  - Resolved invalid enum variant (Sashiko) and renamed to better reflect
    the available variants.
- Link to v1: https://patch.msgid.link/20261122-rust-dmi-v1-1-4ace9449f872@gmail.com
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/dmi.rs              | 99 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 102 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b8..92a227e2345e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7977,6 +7977,7 @@ F:	Documentation/ABI/testing/sysfs-firmware-dmi-tables
 F:	drivers/firmware/dmi-id.c
 F:	drivers/firmware/dmi_scan.c
 F:	include/linux/dmi.h
+F:	rust/kernel/dmi.rs
 
 DOCUMENTATION
 M:	Jonathan Corbet <corbet@lwn.net>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..ed4ce2ca351d 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -56,6 +56,7 @@
 #include <linux/dma-fence.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-resv.h>
+#include <linux/dmi.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/fdtable.h>
diff --git a/rust/kernel/dmi.rs b/rust/kernel/dmi.rs
new file mode 100644
index 000000000000..07334df7b43d
--- /dev/null
+++ b/rust/kernel/dmi.rs
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for DMI (Desktop Management Interface).
+//!
+//! C header: [`include/linux/dmi.h`](srctree/include/linux/dmi.h)
+
+use crate::{
+    bindings,
+    prelude::*, //
+};
+
+/// Corresponds to each DMI identifier type from [`enum dmi_field`] that is valid to
+/// pass to [`dmi_get_system_info`].
+///
+/// # Invariants
+///
+/// - Each variant must be a valid variant of [`enum dmi_field`] with value less than
+///   `DMI_STRING_MAX`.
+///
+/// [`enum dmi_field`]: srctree/include/linux/device-id/dmi.h
+/// [`dmi_get_system_info`]: srctree/include/linux/dmi.h
+#[repr(u32)]
+#[derive(Clone, Copy, Debug, PartialEq, Eq)]
+#[expect(missing_docs, reason = "C version of these consts are undocumented")]
+// NOTE: `DMI_NONE` is intentionally excluded here, as it's a sentinel value
+// that is not useful to pass to the Rust version of `dmi_get_system_info` (always
+// returns null).
+pub enum SystemInfoField {
+    BiosVendor = bindings::dmi_field_DMI_BIOS_VENDOR,
+    BiosVersion = bindings::dmi_field_DMI_BIOS_VERSION,
+    BiosDate = bindings::dmi_field_DMI_BIOS_DATE,
+    BiosRelease = bindings::dmi_field_DMI_BIOS_RELEASE,
+    EcFirmwareRelease = bindings::dmi_field_DMI_EC_FIRMWARE_RELEASE,
+    SysVendor = bindings::dmi_field_DMI_SYS_VENDOR,
+    ProductName = bindings::dmi_field_DMI_PRODUCT_NAME,
+    ProductVersion = bindings::dmi_field_DMI_PRODUCT_VERSION,
+    ProductSerial = bindings::dmi_field_DMI_PRODUCT_SERIAL,
+    ProductUuid = bindings::dmi_field_DMI_PRODUCT_UUID,
+    ProductSku = bindings::dmi_field_DMI_PRODUCT_SKU,
+    ProductFamily = bindings::dmi_field_DMI_PRODUCT_FAMILY,
+    BoardVendor = bindings::dmi_field_DMI_BOARD_VENDOR,
+    BoardName = bindings::dmi_field_DMI_BOARD_NAME,
+    BoardVersion = bindings::dmi_field_DMI_BOARD_VERSION,
+    BoardSerial = bindings::dmi_field_DMI_BOARD_SERIAL,
+    BoardAssetTag = bindings::dmi_field_DMI_BOARD_ASSET_TAG,
+    ChassisVendor = bindings::dmi_field_DMI_CHASSIS_VENDOR,
+    ChassisType = bindings::dmi_field_DMI_CHASSIS_TYPE,
+    ChassisVersion = bindings::dmi_field_DMI_CHASSIS_VERSION,
+    ChassisSerial = bindings::dmi_field_DMI_CHASSIS_SERIAL,
+    ChassisAssetTag = bindings::dmi_field_DMI_CHASSIS_ASSET_TAG,
+}
+
+/// Returns the DMI string for `field`, or [`None`] if unavailable or `CONFIG_DMI` is disabled.
+///
+/// # Safety
+///
+/// This function must be called no earlier than driver / module initialisation.
+///
+/// # Examples
+///
+/// To meet the safety requirement, assume that this example occurs inside driver code e.g.
+/// a `probe` step.
+/// ```
+/// # use kernel::dmi::{
+/// #     self,
+/// #     SystemInfoField, //
+/// # };
+/// // SAFETY: This function is running during driver initialisation.
+/// let maybe_vendor = unsafe { dmi::get_system_info(SystemInfoField::SysVendor) };
+/// if let Some(vendor) = maybe_vendor {
+///     pr_debug!("Vendor string is {vendor}");
+/// }
+/// ```
+pub unsafe fn get_system_info(field: SystemInfoField) -> Option<&'static CStr> {
+    #[cfg(CONFIG_DMI)]
+    {
+        // SAFETY:
+        // - `field` is a valid variant of `enum dmi_field` to pass to `dmi_get_system_info`.
+        // - `dmi_get_system_info` is safe to call after DMI has been set up during init.
+        //   This occurs during `setup_arch` on x86/loongarch/mips and `core_initcall`
+        //   on arm64/riscv - before driver / module code is run at `device_initcall` level.
+        let ptr = unsafe { bindings::dmi_get_system_info(field as c_int) };
+        if ptr.is_null() {
+            return None;
+        }
+
+        // SAFETY:
+        // - `ptr` was returned by `dmi_get_system_info` which returns a C string that lives
+        //   for the life of the kernel, or, a null pointer.
+        // - `ptr` was confirmed above to be non-null.
+        Some(unsafe { CStr::from_char_ptr(ptr) })
+    }
+    #[cfg(not(CONFIG_DMI))]
+    {
+        // Squash `unused_variables` error.
+        let _ = field;
+        None
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1ab41129d557..22f10c5d97e8 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -69,6 +69,7 @@
 pub mod dma;
 #[cfg(CONFIG_DMA_SHARED_BUFFER)]
 pub mod dma_buf;
+pub mod dmi;
 pub mod driver;
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;

---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261121-rust-dmi-c49d2041d7e2

Best regards,
--  
Nick Dowsett <nick42d@gmail.com>


