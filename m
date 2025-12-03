Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF042E6106;
	Wed,  3 Dec 2025 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800887; cv=none; b=kNhY3TLvbIClO+FiFyTZEMNnpZmfNEMSR4SkC7Vdr4SN+mnTmeDsnF4DiR2VyuYVnpQvl21McLJrmuipw+MZ7WzOTKck10AbSbg3ReqCnzdJWl+92G5j9XV+lIgg6LPUCd+N2fgw7nQpEe7K1V3y99YxPrTP6majzMeLipiq3MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800887; c=relaxed/simple;
	bh=FiVEAF/tWJvB6+o0z58DaKdND505fxL1cM+NJxp039c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmceqtGZtFa/+lrYzBGemYKvsmA6dadXvS8uSEKaeiFLYmL2WQGjARNR+uFYWdhrfrgBerjndP3aWqD5Qs/MAFHSG2HkVC+HuFI1g1fC0sUihUSErEuOkQw+x46hxJDU/YJxrc45f+8Hceui0Jbt3xk0yhc0BwLndPQdV4jftPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtAD2I/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtAD2I/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D86C4CEF5;
	Wed,  3 Dec 2025 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800883;
	bh=FiVEAF/tWJvB6+o0z58DaKdND505fxL1cM+NJxp039c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DtAD2I/A1S7nSAuVdd5a+6uv3vWMDq+Z1dLNAB0mfeRX7Ik8ri2M49CNcybOLl84m
	 admqzifAnI5b/qMnyjbQPmjwHhBRMnqseEG8aQ4eBk/3gLPSfsa+5OC2QrNoU0MwSA
	 fmVirfpHqVDQlZpMOLqc/cYf2FJTiWxZcC/CS2sRNfbEBK9+QJV4KUARcpjyAgABLg
	 8191xgQMaXpO9tuNzDlfk5UuTPsnx+R3CpD2KhX0hmfEHOUFQ8guNd8DtaEXz0ZbE1
	 yRyykncA9SVVqJGNCRJKHZs2jjaGlPDUMTn0seqpTh6zuWk9MRqVqUuk0Qm7x6ejEY
	 DSiFRFIDDTWUQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:31 +0100
Subject: [PATCH 01/10] rust: xarray: minor formatting fixes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-1-9e5ffd5e3cf0@kernel.org>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=FiVEAF/tWJvB6+o0z58DaKdND505fxL1cM+NJxp039c=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkqh9Qpuw/Hh7FSu8B885HJUpBKwpyq25WAy
 2o4r3+P5Z+JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5KgAKCRDhuBo+eShj
 d46kD/wJ74iqA5i0KeniV0//o+V0vmg9FJr47Y8djZL5Zrcq9XsI0wtjuD+BwLVTka9+xGmyN0K
 jK342I5LUI1+rpTO37rl1migYscEg7Tv3XEwkx8UB2JjPWrP98LjlrohtiwGNF5CEaawSo4Q+US
 gYlw5/eJ5J6xH+40dxIo0j+XCLZGs5jq7Ab2OLXqwKSsNNGa+W1UROuWSF9J+eceWvN/dsRZ3fx
 wrgMU1GYtOcdi1YeLmF2mkYbnjqPHKd2J7mXqRhdJ1NPyXg9Vlu6dr1u36ku8oKI3cUPzJVXS0Y
 CBIKs73qcnIh+TNupyL/wVKKQjSxSkMJwNdNgDBrnd2ZzqlyAnnGoDniQI7bMBkejDdnHRUERpD
 rP/3exluW3cmXGltiS3PM5PSRecFrECCnIBr7PmnVJshtLLNPY+tMGh9pbcmuUjZvOuitOy8bof
 mN5Ju+qOHp7vhjjDrzG+TqYYLoLfwAXNh4QbC3Qu9DAJX6hLXk3VDuyXM+8skYGlkXU2USrCfWT
 IGup8frhlLbJ9WP0JmmnOeKum5VsY+marOXGfjIRyT1FxBvmn5SRRAkwHwS5NlK2boWjjY26AAL
 DfwJbo+N4ZCd/Mg71oBfh7qj/5BhE0akp8mBOGQFiRLj0MhAUHDOcW/BO1M6lnrjOVEYNlmRKFm
 Ckt6iWVPF6BW3Zg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Fix formatting in xarray module to comply with kernel coding
guidelines:

- Update use clauses to use vertical layout with each import on its
  own line.
- Add trailing empty comments to preserve formatting and prevent
  rustfmt from collapsing imports.
- Break long assert_eq! statement in documentation across multiple
  lines for better readability.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index a49d6db288458..88625c9abf4ef 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -4,14 +4,33 @@
 //!
 //! C header: [`include/linux/xarray.h`](srctree/include/linux/xarray.h)
 
-use crate::{
-    alloc, bindings, build_assert,
-    error::{Error, Result},
+use core::{
+    iter,
+    marker::PhantomData,
+    pin::Pin,
+    ptr::NonNull, //
+};
+use kernel::{
+    alloc,
+    bindings,
+    build_assert, //
+    error::{
+        Error,
+        Result, //
+    },
     ffi::c_void,
-    types::{ForeignOwnable, NotThreadSafe, Opaque},
+    types::{
+        ForeignOwnable,
+        NotThreadSafe,
+        Opaque, //
+    },
+};
+use pin_init::{
+    pin_data,
+    pin_init,
+    pinned_drop,
+    PinInit, //
 };
-use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
-use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
 
 /// An array which efficiently maps sparse integer indices to owned objects.
 ///
@@ -44,7 +63,10 @@
 /// *guard.get_mut(0).unwrap() = 0xffff;
 /// assert_eq!(guard.get(0).copied(), Some(0xffff));
 ///
-/// assert_eq!(guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(), Some(0xffff));
+/// assert_eq!(
+///     guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(),
+///     Some(0xffff)
+/// );
 /// assert_eq!(guard.get(0).copied(), Some(0xbeef));
 ///
 /// guard.remove(0);

-- 
2.51.2


