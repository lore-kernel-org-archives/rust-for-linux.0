Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795826298;
	b=cYCaMVmKMIt4MapFBpI9JM/WST5d9yVoceMAbe0KyTGowexXHgXceNvL3/J0KXd3WoP/
	 bUkXvyOk3+RbndJl5iGjSM1VYJTtCMohNyxmp0Hzyntrr1arV3A9/F82gOFf5Vxz8lF7e
	 svqB2GGDHCu6fTgXNo7nXTUxQbdrZuPbnZmcNJ3re8X6bKD5Z+TTg9j1WGL+3+Yb6zxEX
	 cn9oQJvnKLsvZQq/8gOJtqoqPkgzVaHH9UF6KOIF82G/Z/hB47P08ei9c2/ONMUx/RCJN
	 G1JP5fuHxBjWVv6/aH0R+ENwTuA1H2UE6RkFsoZFvfa01/mfxif13BotPutiJKPb/Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826298;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ek2owsm1hPTfmp9+hCgvPVnydZGOuK6cRdHmzl/xGqU=;
	b=XxprUecL9WLt2bAutj4/4I1gZY97kOlsYm1KR5/u56fSbTgj3WJIcFF6QpP/9TbBPEN8
	 B9y7IEEJUYx1p7XuyCSL0IqKYMhEITIweHayoh6egcvedPq3fky6ie5VzmZnIHYurqvPP
	 AfgNyAhaHTgJzL0o01zBRo/QoMjTDLINEBApH5+PuC0WWYllSZwCKUs33HCYFNTLitnI+
	 LsGETi2XRKCmFUJEyfj7N441pITa+W4aKOHyklfKNGQ4ceOnVFWM/jMV7fgGupu8joZ67
	 tl2/mtyUZCkWp9r41wkNoLCWUlldb134iKk0wZfrpMCj0JS8aDvh5FmCI8mhq+9ioYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Oltl/y4X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DF606A31C;
	Sat, 28 Nov 2026 00:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oltl/y4X
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795826298;
	b=axVK626JFd1te7h4CQsjupn/BsbzD3jB/G7GbIulrXbuOeG7bsODYKKIJ4978QEyb8DT
	 JwhNTFBGp6mqjGfFbocUMUlZl22zEsOU2h1yKlyH3xRoOQpkPXB3Ie7UZsT3p6qwwH3d4
	 cEOmrwd9cvNRQ9UBKLSe0/WwISzTJhAjRX0WxEdRs77RDi2YYa6XzONlHVPznzVB71JbL
	 LXqclIG8Gg0y4ZbsZUDB4Q+qi2juLYq+yixsVygXWPcMWRd4UqUpXo8GhQf3TXVLDNR0e
	 gkFLURApTm3XS/XIGeIikndVbqNvtKjxMimmNkV4VPvqczwWdi7sSfhqREFN/B91kqg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795826298;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ek2owsm1hPTfmp9+hCgvPVnydZGOuK6cRdHmzl/xGqU=;
	b=p7krNcGxujpFuSTM8yRzhnG69EGyEFXsJoSHxFnIcVelL6VfQV6JBa5mbEEEUkQPVpRw
	 axSbWO18NQW5dHgCYvPOy06kS0w7CeehrNsTlueyfk+qLHU2wQo8jNrieTuDtHLq6eZSo
	 7/LeGBiHG4ClTBSk8m0xmnf4yvroWLLuZfSSdtwegFqLMnZnA1boXxQwtnb8UvvZbY8yz
	 +soaUM+/5Lv4y5uLOJ59Skzg0wgajfP5KVuGaDzj1VWJ8WRBFiJteEf1mABo1GRqUSmlQ
	 pYKbveGBhHlSBagNiF8UKsflCMwN4CGtT4S+WEzMphZLRflPCjIpE21DeJMovkCEHlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C37A1F000C1;
	Sat, 28 Nov 2026 00:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795826298;
	bh=ek2owsm1hPTfmp9+hCgvPVnydZGOuK6cRdHmzl/xGqU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Oltl/y4X1QPrqXnTsCV0GvCiU8Ox8v2g3SRR6b7BJD/whbgUsXE1AmPfZxRg6ZTZj
	 bS1g/vU3zQ2drLShlk+SF+Z+iwsQeih9W+Wee0eMW8X+MIBMdOXf54MQUrIIYo5vEc
	 lzZDbYtnBMEhCLajYsx62W+TVKkEEqs6iuQFqBb8rR9Wwght0BeZG5sI/zQlEUuARa
	 qx2QvarjJZC0ELG7WRJSVfRjw25f682UccTRiLDkG/477UQp9Je641CiEkgirQID94
	 gdQevCWK3m+Zf9vqrcWGaL04RIofULNtKU6S8aY7s3elQrRnQWt64KI0q0Eu8zpEzk
	 W6YdEthYhZ4jw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E8EB54DEB9;
	Sat, 28 Nov 2026 00:38:15 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 08:38:10 +0800
Subject: [PATCH v3] rust: dmi: add basic DMI matching abstraction
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
Message-Id: <20261128-rust-dmi-v3-1-3905388166a4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NwQ6CMBAFf4X0bE27VBBO/ofxAO0CawRMC42G8
 O+2GCPHSd7MW5hDS+hYmSzMoidH4xAgPSRMd9XQIicTmIGATEqQ3M5u4qYnrlVhQChpcgQW5k+
 LDb221PX2ZTfXd9RT9OOiIzeN9r19eRl3vyz8s15yyVWlsVCqaM45XNq+osdRjz2LWQ97MduJE
 MQ0FZlqRF0LcdqL67p+AMbxH8vrAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795826295; l=6949;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=zws8GwuHEucDf45kI2mJj1xeGJSpqHdicjxl1BHesq4=;
 b=T2IwiVT8c5eDQUhjWIJsPUU2F6VaNnUlRHqLyyy9KH9T+jOE0bq01i81QgK8O2IlTSaSkxjk3
 Y575gZ7VAOqBoIi6K9l1QBQjVxCoPDe73En0+vqZ97B3lqScJUlY5WY
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
Changes in v3:
- Actually add `#[inline]` this time.
- Rebase onto v7.4-rc4
- Link to v2: https://patch.msgid.link/20261126-rust-dmi-v2-1-33064f0bb005@gmail.com

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
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/dmi.rs              | 100 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 4 files changed, 103 insertions(+)

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
index 000000000000..a8c33c414a76
--- /dev/null
+++ b/rust/kernel/dmi.rs
@@ -0,0 +1,100 @@
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
+#[inline]
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
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261121-rust-dmi-c49d2041d7e2

Best regards,
--  
Nick Dowsett <nick42d@gmail.com>


