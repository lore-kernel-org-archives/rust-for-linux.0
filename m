Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792540109;
	b=KoJiupe2qOSk1kHAI7lmaUJjbKfLqZReNKrh7MPx8/OOLmYpGuIQ2IGAmAvLuw3zObMR
	 NIKIHUsTFB+pH1CfRVPilJmGe5a55NJT1Tu+c7sFdAbAmC0NvvmgRVOmDMTGfylJXp1Ad
	 LsTikze7t+0d4rb0WtN4l0PhjbcFXI2szT8y9+2AG7vARZRSe6JQEvt+tHFaqHXcbaqYY
	 F3NqFrg+AMrEeB8Z0U+9U+ayBulTeuCaU/WCQjhsYmWqSyPCW+O7IWmpaHxrl7FUnulpk
	 Azqy3e1FaL/OxBHrEusbJuKbxO9eRzuXG8uzKjU8pLdlg5/MY4phDITwb9OO49MFvBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540109;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Y3euU5lvZoQ58G5VFsrqML3ySI+R6MEg86QCILKiCf4=;
	b=oiFxQ1Xzji0gOkAhrU9J9xvrC/eb5k9hm8kfwzTfPw80Tfit8M0YSwAkooUcRl4z/S3T
	 4G9NJfrs6aJoZDuUghJaiyNmgy9u2yrFE6kFGLb5xmNJUOfzhtESaeiChT2er16iVOHmd
	 zW53A5W/XAIVR/xQr+AlckTOi86BIVuWJOTpnUNoUXPA1LKVZ4WxILXErT8V17FfkPuqx
	 0N2uz8I6I80deBXzqqfksc9L6N7CUFERkWP+OQWT2uPmKWSbFnOtYvRs2FEoQ6vkBRCYl
	 R/D7wj3k2Gwr44/oSHi7ibHpERa4emhgwP1AeTM2GpUNi1aTE83Ti+HRPg/iIUjn78g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=VPXTVWqb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83511606A32D;
	Tue, 20 Oct 2026 23:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83511606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=VPXTVWqb
ARC-Seal: i=1; a=rsa-sha256; t=1792540074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C7N0qSZBMpKQFxl1d9lLEWd/Eu3NUFCkqmHVNoXI9SvHn72rHn5DRhcvTIKSwM/rLQL7jxK7+lFQnrt8MwRe3YCr1D8Oe0GrCj4yD82MSCYO20Aij4qN4mTKvLmoluZNs0ilNPXVVGl5dXpWpcxc9vJPyBLbeAN/IIG5yUETiwI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792540074; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y3euU5lvZoQ58G5VFsrqML3ySI+R6MEg86QCILKiCf4=; 
	b=b8cCm7xE+xBpLzK6eFRHQggofWEDe4oOnQIcrU+cqkZMfrivpzFB5Qho4XE6wlrqpIyFZP7bSwPrbz3sOvaNnaR74fzpPezUMcPWl47/4UCZejuf55jce2NzijokGp1j9t0FsU7iJRxUYeUL/gIZo8vrabrZbtMQNgmRoNV1XHU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792540074;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Y3euU5lvZoQ58G5VFsrqML3ySI+R6MEg86QCILKiCf4=;
	b=VPXTVWqbqbrvC0QY4ppz4KcQOKSSrhY0Rg/6dui6obMdgbwT80j/rdvKZbfhF/Rs
	1KOjCb4fZ5f+wiQ6bYTRtlR3+xVLqtQxJGMwKvjawP4uWlM3s90BGh1hDCRnT1Xm/Eh
	g6hOzIEeB0lP+J6R18FY285VlwTNoUq41RqmCdRU=
Received: by smtp.zohomail.com with SMTPS id 1792540073415811.4147686419311;
	Tue, 20 Oct 2026 16:47:53 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Tue, 20 Oct 2026 16:47:49 -0700
Subject: [PATCH v5 2/2] drm/tyr: safely write GpuInfo to userspace
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-b4-gpu_info_intobytes-v5-2-3e0c7c93223c@collabora.com>
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
In-Reply-To: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jesung Yang <y.j3ms.n@gmail.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3858;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=jHt5n4OxIIvHa/bhabpFaWH4LXJkUWkJCQeUhXT1zt0=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFnX/y49vNNgyaZlh9pS/F8dmHalebnaToHJYR9+NG/Nz
 s0Rvi21sqOUhUGMi0FWTJHlrL1Rj3jVeyPd+f+bYeawMoEMYeDiFICJOAUw/I/dsHAhy1Wx2Eef
 ym/o3bVf13XTx2uN0G/FR+sX3G9ke2fL8M9o2QanqOBJX5Y2XrjGOOXqz7THp+Q40xRmm/y/Npu
 Jz4kXAA==
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

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/file.rs |  2 +-
 drivers/gpu/drm/tyr/gpu.rs  | 19 ++-----------------
 rust/bindgen_parameters     |  3 +++
 3 files changed, 6 insertions(+), 18 deletions(-)

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
index e1b04a0c5159..820de9d60c19 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -16,9 +16,9 @@
     },
     prelude::*,
     time::Delta,
-    transmute::AsBytes,
     uapi, //
 };
+use zerocopy_derive::Immutable;
 
 use crate::{
     driver::IoMem,
@@ -30,12 +30,8 @@
 
 /// Struct containing information that can be queried by userspace. This is read from
 /// the GPU's registers.
-///
-/// # Invariants
-///
-/// - The layout of this struct is identical to the C `struct drm_panthor_gpu_info`.
 #[repr(transparent)]
-#[derive(Clone, Copy)]
+#[derive(Clone, Copy, IntoBytes, Immutable)]
 pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
 
 impl GpuInfo {
@@ -134,17 +130,6 @@ fn deref_mut(&mut self) -> &mut Self::Target {
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

-- 
2.56.0

