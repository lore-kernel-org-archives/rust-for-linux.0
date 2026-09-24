Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459E6414416;
	Thu, 24 Sep 2026 17:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270583; cv=pass; b=s/QLMqritdXZSl3Z3ICJOG3wa+zXjVpjwRsmblwPSc0RrWgJEAu8rS0wLhIfytWk3CJYy39qhfLrru84yTp+wnW77io78vnZLneRVNYTqKUAzZqArIaXHD3AChyjnwHSS9dwAsO6AVu//K1GagaHarHIL3hp64kPsN5fivDKDBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270583; c=relaxed/simple;
	bh=4IpGCLzBqqgKAc92Vvr0KOvl5f94aMJcAYtiXtjkkq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HK7PA/oRKP36kRySYY64/xY/EbOghzGQ634F8MnXUF2q2TCuslysVfE1NSRnYVJ5d4D8DqVu18RLzk+BUMMMPgJ3blT+/+fotR73X4KcfyUQvfXzjNB/Zw2/d7FK65rjPxfpbGbBh38UG9ORO+HeJpcYohS9IoBylF7KaaWSxPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=cTki5H1R; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="cTki5H1R"
ARC-Seal: i=1; a=rsa-sha256; t=1790270561; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KyDWB7N83K+SZ6pCN9ev7ceZJOSEUabH243gkwGX2VZDgBsKGNrqLP9OnOGaPLWu4icWK5W7RoQOoguUVVz5fHVU3yMGR+fOo68gKoQHTxxuUBjJkZ8FAOCNiXuMq+GW61E1ETSTqd56Y4rhQLFKMdecqfZsRK73RjaNYfQXlOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790270561; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3vpKBefpdfMM933tI4Mp4EDb5uhHwL4UHyElDNy5WxE=; 
	b=EoAaEhdweeC+f/DkiatyLgkir66Wx2gcvb5AFT8FkzL0AxGT7WCMwCY65aJ/j4JwtGKozur6Rj67U/hn6Mq9D1PZg10WofMv8VzA4rnjukUYYa9ivOpqKf6Jkb7AY2wplDGrm6O0xYEzcPnSHM1TtAtWd0YLXJmVF84pknM3ooo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790270561;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=3vpKBefpdfMM933tI4Mp4EDb5uhHwL4UHyElDNy5WxE=;
	b=cTki5H1RVukbhWSGTG852PhekPW6H2/qt1g2WHan3CULKAC4DJgPP6163S4lzts4
	Mia3ZeoRhfYdbtBUBtAo/O2DWF/VHogTpIJbDp3Iuj5vpVqGmEK9Fcjg4wBzzjNEnBr
	2Tas+v/syT2UMkfGknG2vque8aKXP6awBd1mxyGI=
Received: by smtp.zohomail.com with SMTPS id 1790270560599699.7073183303963;
	Thu, 24 Sep 2026 10:22:40 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 24 Sep 2026 10:22:36 -0700
Subject: [PATCH v2] drm/tyr: safely write GpuInfo to userspace
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-gpu_info_intobytes-v2-1-1b05e33df8a4@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNUQqDMBBEryL73RSzalv96j2KFBM3umBdSaxUx
 Ls39QL9GXgD82aDQJ4pQJVs4GnhwDJGwFMCtm/GjhS3kQFTvKQlZsrkqpveTx6dxJjFrDMFZbH
 NC4dlVtgbxO3kyfHn8D7qyD2HWfx63Cz61/4zLlppZQzqa+ZKTVrfrQxDY8Q3ZysvqPd9/wL73
 RHKvgAAAA==
X-Change-ID: 20260923-b4-gpu_info_intobytes-c2d45f2935c8
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5249;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=4IpGCLzBqqgKAc92Vvr0KOvl5f94aMJcAYtiXtjkkq8=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFlbY+Ib20onBLqdqN8l6Vwow9uQtPdkikth3Da+MxZhv
 WdkWx93lLIwiHExyIopspy1N+oRr3pvpDv/fzPMHFYmkCEMXJwCMBGFCob/iWKPTshd32t1P6TP
 xmP/hsuL53VrquhbhlhXFvWvdd3kwfBP90bwDfG+CNEmw7jT6SleR1RX79Hp55qTVfJ5Zudnh1Q
 WAA==
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Tyr creates the struct drm_panthor_gpu_info from the Panthor UAPI
bindings. It initializes this struct by querying the gpu and then writes
the struct into userspace memory faithfully byte-by-byte.

Currently, the struct drm_panthor_gpu_info does not have any implicit
padding, but if implicit padding were added in the future Rust does not
guarantee that it would be initialized. Then when Tyr writes the struct
back to userspace it could expose uninitialized kernel memory.

Tyr implements the unsafe trait AsBytes for GpuInfo whereby the developer
guarantees that struct drm_panthor_gpu_info does not include implicit
padding, pointers, or interior mutability. This allows Tyr to safely copy
the struct into userspace memory. However, relying on the unsafe trait
AsBytes is fragile because if the Panthor UAPI changes, the SAFETY
guarantees may no longer be accurate.

Instead, use the derive macro `zerocopy_derive::most_traits` for struct
drm_panthor_gpu_info. This macro will attempt to implement the zerocopy
traits for struct drm_panthor_gpu_info. If the Panthor UAPI changes so
that the traits IntoBytes or Immutable can no longer be implemented, Tyr
will no longer compile.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- use zerocopy_derive::most_traits
- Link to v1: https://lore.kernel.org/r/20260923-b4-gpu_info_intobytes-v1-1-bb2173f91e11@collabora.com
---
 drivers/gpu/drm/tyr/file.rs |  2 +-
 drivers/gpu/drm/tyr/gpu.rs  | 12 ------------
 rust/Makefile               | 12 +++++++++---
 rust/bindgen_parameters     |  3 +++
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 9f60a90d4948..ceadde976502 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -54,7 +54,7 @@ pub(crate) fn dev_query(
                     )
                     .writer();
 
-                    writer.write(&reg_data.gpu_info)?;
+                    writer.write_slice(reg_data.gpu_info.as_bytes())?;
 
                     Ok(0)
                 }
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index e1b04a0c5159..fde5bd0f87a1 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -16,7 +16,6 @@
     },
     prelude::*,
     time::Delta,
-    transmute::AsBytes,
     uapi, //
 };
 
@@ -134,17 +133,6 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
-// SAFETY: `GpuInfo`'s invariant guarantees that it is the same type that is
-// already exposed to userspace by the C driver. This implies that it fulfills
-// the requirements for `AsBytes`.
-//
-// This means:
-//
-// - No implicit padding,
-// - No kernel pointers,
-// - No interior mutability.
-unsafe impl AsBytes for GpuInfo {}
-
 struct GpuModels {
     name: &'static str,
     arch_major: u32,
diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d984..bf02a1efd6f3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -365,8 +365,11 @@ rusttestlib-bindings: private rustc_target_flags = --extern ffi --extern pin_ini
 rusttestlib-bindings: $(src)/bindings/lib.rs rusttestlib-ffi rusttestlib-pin_init FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-uapi: private rustc_target_flags = --extern ffi --extern pin_init
-rusttestlib-uapi: $(src)/uapi/lib.rs rusttestlib-ffi rusttestlib-pin_init FORCE
+rusttestlib-uapi: private rustc_target_flags = --extern ffi --extern pin_init \
+	--extern zerocopy=$(objtree)/$(obj)/test/libzerocopy.rlib \
+	--extern zerocopy_derive=$(objtree)/$(obj)/test/$(libzerocopy_derive_name)
+rusttestlib-uapi: $(src)/uapi/lib.rs rusttestlib-ffi rusttestlib-pin_init \
+	rusttestlib-zerocopy rusttestlib-zerocopy_derive FORCE
 	+$(call if_changed,rustc_test_library)
 
 quiet_cmd_rustdoc_test = RUSTDOC T $<
@@ -782,11 +785,14 @@ $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
-$(obj)/uapi.o: private rustc_target_flags = --extern ffi --extern pin_init
+$(obj)/uapi.o: private rustc_target_flags = --extern ffi --extern pin_init \
+	--extern zerocopy --extern zerocopy_derive
 $(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/ffi.o \
     $(obj)/pin_init.o \
+    $(obj)/zerocopy.o \
+    $(obj)/$(libzerocopy_derive_name) \
     $(obj)/uapi/uapi_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 8402b0c93545..332bc8d6a9f7 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -71,3 +71,6 @@
 # Structs should implement `Zeroable` when all of their fields do.
 --with-derive-custom-struct .*=MaybeZeroable
 --with-derive-custom-union .*=MaybeZeroable
+
+# `drm_panthor_gpu_info` is copied byte-for-byte to userspace.
+--with-derive-custom-struct '^drm_panthor_gpu_info$'=zerocopy_derive::most_traits

---
base-commit: 896ed083362758b33c49a1b5e5a3423c5814d87e
change-id: 20260923-b4-gpu_info_intobytes-c2d45f2935c8

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

