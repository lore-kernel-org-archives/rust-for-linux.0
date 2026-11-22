Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795321727;
	b=Rb72LwH+2wNUrpBu2PLmoLka5+664/jk6UjnxypIJACNYcJ22d/1MZ3yzZTzolNZD7Ha
	 J9/aRWPsGUuaIeAorJw6ZKniXXS1ILfoQV19SAH1UO1WoqI6kp44yUf/DZZg74K+EVs1Z
	 WDNDwdrHeje2iU21g8My+mc5rHQO4BevpJT1u5L3v8FlXM/fJHVvTfqOleGgaaLoXg60t
	 aDh5zu6W8wfaoQvFGN9zKV01yZdUG9jIudIXwIcj7iIUqyDDeTL+QIX2AWV8eU0bHF+B/
	 23JdGYPV1DvSqSLtx5DkYWoTEm+wTNjSXegS5kVZImk1Gpr2GLcJox2rnIfskkaflbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321727;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=y2qxE36zRL/+keonplCFJrbzI2/JvjqxX0EKnczf5J0=;
	b=AgNtuptJLlOU3Iez50uWSfxjdLH33fcP+zTEiCbV15uIx0mZQVgEQWpkZBYigD56OuAw
	 Sh++0guxghvKUvop2tAP7MmEF34IZ4m4FVhSUrWLVf7qSqdYEUj9a3HyD09ce02i5Dqdw
	 TnkrwpmCeQcm4G52qjNMi6M/WUZvC0tGOMbzNw6Ic+eld/BFrLYG0kPcYB3htH4rE28it
	 X45MY/KN5LcOeE3IhWF8k/zRBLp+KoNuQ9zx0/ROJJvKjwn45JTc5dk7ksK0Zeo7Ag57M
	 LRZhVmBsNSRV67i2LfwjZnnqiHLTN6JPoTP4WvU94BFel6AQ6bsFKLQFvGwrs+O0BfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGXXVPgi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E80606A320;
	Sun, 22 Nov 2026 04:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGXXVPgi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795321726;
	b=GhTozJET0cHV5tzA1fYjX2GjB2THG+8/qp71b8hYnBC2Di+wvYNEC/7vrVSpebZGMhaD
	 Mby/Bid6GGDUg1JBdmZyq/wjYWeg0Hb2rjiEdF4SxJM6Dfq/Qz6FHPb/yGIXP2picUcCg
	 +v4bOaxZgUjieRsgn/Drba6srlREZB9WiSMTvqViU2+stl4Js5+KmDBtkY9ZRaUwJl2TL
	 tbs3vn6NToCbOy9nRDhaD4j5j6aO7SD4Vc4SQyyK0fMCQqXbPwZweWm8T63NXg/mU6Vgf
	 WKg/CeX+9kuNeCYJqDB+F4Fw9s9BNu/lHo+b24J8KgPx5Fibj/zfz4X+e92MjQcaKiw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795321726;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=y2qxE36zRL/+keonplCFJrbzI2/JvjqxX0EKnczf5J0=;
	b=K4ZAmGOLpTZaHGGhlaX+0xrLKUSXUPQ3Nd4PbSHHXZT4NgTCjvv790603rRYlYePziDF
	 ZMdCc7q5I3zoL3H6E9Myijkq9EQMNDEjX3X3iDBv0KJ1X+xxKejMGjfwU5n+m3ccpCmlK
	 Wd8frxgjgirb0t5s2W7DzYeR2XOX91rWA1pTym7m1oduM4FdPVn/7IDQvS3ahIXf+nqah
	 zDZQcA2XzblvK403hT5VUJlchXRGBW625LyrR6hgtMy/vlHiPkxZh5e+gEjNMLNXS9OtQ
	 1jR1UvxNdUktUY7hKVJklMvxqa2UyAuI+MfNpB+gYkhBpB7OQlTPIK2jjHyUGYos9ag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31DC31F000CA;
	Sun, 22 Nov 2026 04:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795321726;
	bh=y2qxE36zRL/+keonplCFJrbzI2/JvjqxX0EKnczf5J0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=cGXXVPgiBqFN3DqSYiAuGc2A9MPIDTTnR24PDQ1kiwY8JyaBwatPblQQ8tw04OIv0
	 jvIT4eZZIituy0MGlP90+xCi8LBeRyAmLdMfzJpiitW0p7RmQzEbb1yXUDlCQ6e2T6
	 t5xQZICNMg/hUFY337pL8fQyMDKn9aboG47OeuI9auAaNcpT9yq2lYoqWyoN2jP+7H
	 g4LJS1MO++xejGa9vTc47rdqqvF+A2bzOrQgdqiU+Q4kZ8h+NqfH66HeBo6Zl4yAp4
	 mGC+/Mv2nY7SZyQnkIb6GTK5BD1rnyCmZgLjtFHd8INdRD2xFKZJOBrYTQS04cW4yj
	 MloBJQN/oHTvg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BA75A4BEAC;
	Sun, 22 Nov 2026 04:28:44 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:28:37 +0800
Subject: [PATCH] rust: dmi: add basic DMI matching abstraction
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
Message-Id: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHNsyk4hbkQN2B6P8tIOU3LvF4
 VPv912g7IUVyugCz4eoLHMAxhHYoZl7NuKCgRLKEAmN33UzbhJj08JRkqLLmSDkq+dOzu+qqn/
 r3o5st3cP9/0AnUtalWwAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795321724; l=5742;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=9G3/E9jT/UzLfTWZvVpYFROflcNVLqmMfVcVZgIE+t4=;
 b=y7Th2tkxpzNZlf21IfTlLTq4qnP59QU26spqGBOPw0MAWYHz/D+kBJ4NKvrtAWKt35frxfM33
 4Daz5oQmO/KAHJrND5Z3UX1nQGhpy3ZQYD60ymYLfrrRdKkFgkuAtYM
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
This patch adds an initial Rust abstraction for DMI, exposing
`dmi::Field` and `get_system_info()`.

It is intended as a minimal prerequisite for the `clevo-laptop` Rust
platform driver (submitted separately), which needs to check
`dmi::Field::BoardName`.

Review note for RFL reviewers:
`dmi::get_system_info` is currently marked safe under the assumption that
Rust code is always called after DMI is initialised. Would be keen to
have this validated. Alternatively I think a minimal patch to C could
actually make this safe earlier if required.
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/dmi.rs              | 82 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 85 insertions(+)

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
index 000000000000..410a1a84ce08
--- /dev/null
+++ b/rust/kernel/dmi.rs
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for DMI (Desktop Management Interface).
+//!
+//! C header: [`include/linux/dmi.h`](srctree/include/linux/device-id/dmi.h)
+
+use crate::{
+    bindings,
+    prelude::*, //
+};
+
+/// Corresponds to each DMI identifier type from [`enum dmi_field`].
+///
+/// # Invariant
+///
+/// Each variant must correspond to a valid [`enum dmi_field`] variant.
+///
+/// [`enum dmi_field`]: srctree/include/linux/device-id/dmi.h
+#[repr(u32)]
+#[derive(Clone, Copy, Debug, PartialEq, Eq)]
+#[expect(missing_docs, reason = "C version of these consts are undocumented")]
+pub enum Field {
+    None = bindings::dmi_field_DMI_NONE,
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
+    OemString = bindings::dmi_field_DMI_OEM_STRING,
+}
+
+/// Returns the DMI string for `field`, or [`None`] if unavailable or `CONFIG_DMI` is disabled.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::dmi::{self, Field};
+/// if let Some(vendor) = dmi::get_system_info(Field::SysVendor) {
+///     pr_debug!("Vendor string is {vendor}");
+/// }
+/// ```
+pub fn get_system_info(field: Field) -> Option<&'static CStr> {
+    // NOTE: This can be upgraded to cfg-select post Rust 1.95.
+    #[cfg(CONFIG_DMI)]
+    {
+        // SAFETY:
+        // - `field` is a valid variant of `enum dmi_field`.
+        // - `dmi_get_system_info` is safe to call after DMI has been set up during init.
+        //   This occurs during `setup_arch` on x86/loongarch/mips and `core_initcall`
+        //   on arm64/riscv - before any Rust code is run.
+        let ptr = unsafe { bindings::dmi_get_system_info(field as c_int) };
+        if ptr.is_null() {
+            return None;
+        }
+        // SAFETY: If non-null, `dmi_get_system_info` returns a C string that
+        // lives for the life of the kernel.
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


