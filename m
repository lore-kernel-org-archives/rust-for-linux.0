Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B08421F1E;
	Tue, 26 May 2026 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820766; cv=none; b=DtQoqFw99ey2fEoB7dSrX64rnGnkSp93z4qNiRoDzzxLPewAQhx+JVybJnYL5mdnblHPddJ6frC7JKkGoQfD/dHomO5rDfohNQZ0tY/iIch0qKVJLHtGlTZVWaS55CAxavO89kk0p0o+H5Eag1ddGlmbPe+X/kUPuieQkQVyiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820766; c=relaxed/simple;
	bh=kUy0AxwEksMj1GYxf8Qm6ShYGRejtRREh+yzuoHwPCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXR22tebG2K1uXFZE9Fn3QLzKv3Gc+yWNSM74L4DJfZ1G/209/6H5+iu9mR5ELyLI0Mw/WS4YvXFyhsU4gYuBtTa6KTqfigG4144BIPF3YxdKRE7jPrjn7lTfJWARKNXDSk3vBQGn3uqAAYMR2BhgvSPDrh9F1KgJZB0IKwMGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnWjmxTy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnWjmxTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9587E1F00A3E;
	Tue, 26 May 2026 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820763;
	bh=d164e65OFZzsXJRq3eFPhB3ObQzve80zcS4YF1dzDmo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EnWjmxTy6Rv6cxNISWwlTzoSsVPX/qNr3K26uEN0yGrnjpj7uMDUTDmJQlbSSGMHX
	 wEBYpg9sTJoFGQbwuPdQSEq0Fr/X/aK1oAk7UcZ7MJFz/Gshy2n8pKPl1++7CqP1mp
	 ra5vEdXEhP+wcZDqM25BWGEMTpJK9r/vVMw5WJFGLDlilIDP1hQS2rs4Hsxd094hN7
	 87I2VIHz3Xc/i+MvVAOmH5NN/hcqY5WSgCcgULgEZOZYIPO7zMc76H/jd8fEsc275d
	 ad3WSTyGpL6d5Y+/S+98C/z3K8OqelJ0im0IiFtRWyMu8N9nDL4uUJX0fQLlP2vvoP
	 hg4KVAHv8LAfQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 14:39:11 -0400
Subject: [PATCH v2 5/5] rust: binder: enable `clippy::cast_lossless`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-binder-strict-provenance-v2-5-a41d89c29bc5@kernel.org>
References: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
In-Reply-To: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3051; i=tamird@kernel.org;
 h=from:subject:message-id; bh=kUy0AxwEksMj1GYxf8Qm6ShYGRejtRREh+yzuoHwPCI=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiLy6oOefnVp4VMRGRmXPio7PJvPyZiwr3HHhzVEhq/
 8lJ4pNmdkxkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjq7L0Mfzjqyn4f27WucvuEU5qWa5dNnlPrGBL3QPWEti37pJ98rfUMf8W7fqx
 dftLj3amD7n+M1rjPKf+rX9kQxivVbfL3g+jvFg4A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:

> Rust's `as` keyword will perform many kinds of conversions, including
> silently lossy conversions. Conversion functions such as `i32::from`
> will only perform lossless conversions. Using the conversion functions
> prevents conversions from becoming silently lossy if the input types
> ever change, and makes it clear for people reading the code that the
> conversion is lossless.

While this does not eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize. It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint in the Binder Rust driver -- no functional
change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless [1]
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Assisted-by: Codex:gpt-5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/freeze.rs           | 2 +-
 drivers/android/binder/process.rs          | 6 +++---
 drivers/android/binder/rust_binder_main.rs | 1 -
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 53b60035639a..2178258772e5 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -127,7 +127,7 @@ fn do_work(
             }
 
             let mut state_info = BinderFrozenStateInfo::default();
-            state_info.is_frozen = is_frozen as u32;
+            state_info.is_frozen = u32::from(is_frozen);
             state_info.cookie = freeze.cookie.0;
             freeze.is_pending = true;
             freeze.last_is_frozen = Some(is_frozen);
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 935f04eb2981..71c631105344 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1521,9 +1521,9 @@ fn get_frozen_status(data: UserSlice) -> Result {
                 found = true;
                 let inner = proc.inner.lock();
                 let txns_pending = inner.txns_pending_locked();
-                info.async_recv |= inner.async_recv as u32;
-                info.sync_recv |= inner.sync_recv as u32;
-                info.sync_recv |= (txns_pending as u32) << 1;
+                info.async_recv |= u32::from(inner.async_recv);
+                info.sync_recv |= u32::from(inner.sync_recv);
+                info.sync_recv |= u32::from(txns_pending) << 1;
             }
         });
     }
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 2c10a8cd3d88..432390aab25b 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -6,7 +6,6 @@
 
 #![crate_name = "rust_binder"]
 #![recursion_limit = "256"]
-#![allow(clippy::cast_lossless)]
 
 use kernel::{
     bindings::{self, seq_file},

-- 
2.54.0

