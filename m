Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA20F32A3FE;
	Wed,  3 Dec 2025 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781449; cv=none; b=hooeXd8Q/lnRf7VdMCiw1RP/oXmTHAhka46eiYqA8ZDrAWBM15kd9TMqp6ir4TGNOGfSOWmUJEyXwCw5CpJvw9Thr2DFB8jD9brTYXfimCW6R5SPK3th04C1cLWHAlPCVbNSlW8aGaZKlN+UxngyCxY9SxRg2Ok5nOtKADQUsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781449; c=relaxed/simple;
	bh=FSBOtt+lXXXUfqXeM3BowTBWH4K1Fp2uGZ+g9nw83Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ie2sZV/UbAz7SJiQ/3Q+PLkh0Yp/cYVAWqsoqaXJcVpHDmBNdGU7ScBuzJGyE+eTr32MlB6sAgIQb+zhSRLiJs+tapIZ4hI07ci5SDTqdDgVcJe6jHi/zmhA2mREO2tyd9+Dph3/i5tQ9qFRadJAIJjZjjXDjFu1lVk6bMOXgmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0/oxxEf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0/oxxEf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AD22C4CEF5;
	Wed,  3 Dec 2025 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764781449;
	bh=FSBOtt+lXXXUfqXeM3BowTBWH4K1Fp2uGZ+g9nw83Lw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=t0/oxxEfo77yDZiUNjkxgaQzcd81zYAUnmBNLKeptCDbmGGlcbS/F3jqKd9XsQRNP
	 2uz0JUhQAhEmC53GKqDR39OHgq7aqHMfvfiodTLYh/J16d5VlapD9ItX1Y8+kqtmQm
	 Jn8dczyoBNcAeBkiRNRUVl+G3Iv9O0ElWjVRJBjA+rfC0dHE3+ua1CkxNmYZ3/Kw78
	 Bf79X80Emvtc9hn5f7wrxjrYBZeNwhK3iApIvi3T2X9xcNAed08ntmaF9/djzILRyH
	 NMl+V+wHX5JUZEtpTxc1Oel6a8imXZFiuw8LpCncifVHQwIriKOg7N9RnaSqa+2VpH
	 HqWbPmkm41T0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5187DD15DAD;
	Wed,  3 Dec 2025 17:04:09 +0000 (UTC)
From: Moritz Zielke via B4 Relay <devnull+moritz.zielke.gmail.com@kernel.org>
Date: Wed, 03 Dec 2025 18:03:26 +0100
Subject: [PATCH] rust: io: convert ResourceSize to newtype
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-res-size-newtype-v1-1-22ed0b8a7a18@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF1tMGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNj3aLUYt3izKpU3bzU8pLKglRds7RUQxODpGQDA2MLJaC2gqLUtMw
 KsJHRsbW1AEJBicRiAAAA
X-Change-ID: 20251203-res-size-newtype-6fe140bc0038
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Moritz Zielke <moritz.zielke@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764781437; l=3636;
 i=moritz.zielke@gmail.com; s=20251030; h=from:subject:message-id;
 bh=5TmYhrgh6SV5dKVgNEgNSkZcUX+Zbc71raKvBWcrl+U=;
 b=q54C1dhu/J84OMY9kchh8i60QvcahqNvAWPY54/1lDdLZ/+MIIHD8+9DGbfn8iF6oftY9OhFY
 /ICpuULcbqWDiJS4XI2AaAiU1GjJOhpew4F2+zT1a+eBCZPr0n5KwtL
X-Developer-Key: i=moritz.zielke@gmail.com; a=ed25519;
 pk=TFwYpZ0YPwD8idGzvlafpvAW4DDA0FrkMEjcfZVXkN0=
X-Endpoint-Received: by B4 Relay for moritz.zielke@gmail.com/20251030 with
 auth_id=558
X-Original-From: Moritz Zielke <moritz.zielke@gmail.com>
Reply-To: moritz.zielke@gmail.com

From: Moritz Zielke <moritz.zielke@gmail.com>

Makes ResourceSize a newtype wrapper around the type for which it
previously was an alias. This should help prevent mistakes by
restricting what operations are possible with ResourceSize.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1203
Signed-off-by: Moritz Zielke <moritz.zielke@gmail.com>
---
I think with [1] the prerequisites for making ResourceSize a newtype
have been applied to the driver-core-testing branch of driver-core.
So I developed this patch against driver-core-testing. 

[1] https://lore.kernel.org/lkml/DE0C1KA14PDQ.Q2CJDDTQPWOK@kernel.org/
---
 rust/kernel/io.rs          | 38 ++++++++++++++++++++++++++++++++++++--
 rust/kernel/io/resource.rs |  6 +++---
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 98e8b84e68d1..490f60680090 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -4,6 +4,8 @@
 //!
 //! C header: [`include/asm-generic/io.h`](srctree/include/asm-generic/io.h)
 
+use core::num::TryFromIntError;
+
 use crate::{
     bindings,
     prelude::*, //
@@ -23,9 +25,41 @@
 
 /// Resource Size type.
 ///
-/// This is a type alias to either `u32` or `u64` depending on the config option
+/// This is a transparent wrapper around either `u32` or `u64` depending on the config option
 /// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit architectures.
-pub type ResourceSize = bindings::resource_size_t;
+#[repr(transparent)]
+#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Default)]
+pub struct ResourceSize(bindings::phys_addr_t);
+
+impl From<ffi::c_uint> for ResourceSize {
+    #[inline]
+    fn from(value: ffi::c_uint) -> Self {
+        Self(value.into())
+    }
+}
+
+impl From<bindings::resource_size_t> for ResourceSize {
+    #[inline]
+    fn from(value: bindings::resource_size_t) -> Self {
+        Self(value.into())
+    }
+}
+
+impl TryFrom<ResourceSize> for usize {
+    type Error = TryFromIntError;
+
+    #[inline]
+    fn try_from(value: ResourceSize) -> Result<Self, Self::Error> {
+        usize::try_from(value.0)
+    }
+}
+
+impl From<ResourceSize> for bindings::resource_size_t {
+    #[inline]
+    fn from(value: ResourceSize) -> Self {
+        value.0
+    }
+}
 
 /// Raw representation of an MMIO region.
 ///
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 56cfde97ce87..841bb00b8418 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -58,7 +58,7 @@ fn drop(&mut self) {
         };
 
         // SAFETY: Safe as per the invariant of `Region`.
-        unsafe { release_fn(start, size) };
+        unsafe { release_fn(start, size.into()) };
     }
 }
 
@@ -114,7 +114,7 @@ pub fn request_region(
             bindings::__request_region(
                 self.0.get(),
                 start,
-                size,
+                size.into(),
                 name.as_char_ptr(),
                 flags.0 as c_int,
             )
@@ -130,7 +130,7 @@ pub fn request_region(
     pub fn size(&self) -> ResourceSize {
         let inner = self.0.get();
         // SAFETY: Safe as per the invariants of `Resource`.
-        unsafe { bindings::resource_size(inner) }
+        unsafe { bindings::resource_size(inner) }.into()
     }
 
     /// Returns the start address of the resource.

---
base-commit: 473b9f331718267815649cd93801da832200db71
change-id: 20251203-res-size-newtype-6fe140bc0038

Best regards,
-- 
Moritz Zielke <moritz.zielke@gmail.com>


