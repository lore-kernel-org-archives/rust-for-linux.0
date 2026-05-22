Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460847DD7C;
	Fri, 22 May 2026 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470001; cv=none; b=gOqPPkc3FqCvYEZ21eHJ2v9T5tyNWaX7KfRIh8+MLKkeRtZGhOR0DBFp/UxHpOKkpEkhJ70rq8E+Jkg6+ju4OAk9dUgQCfBA13qf78u/MK8/fFrXVQ1KGRJngh372LWMoKSsfZRp6XgHzRhuPUe+5Mn8PCmwPazZ1abcF6L1U98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470001; c=relaxed/simple;
	bh=tZVFcJ0SDOSpha47vLT8wPnQbq4+EpWGnED1uar/t70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6msee9N/FLKo0UmjYumDERiFGpW7lhXU76RjZUVLMAo4j4/DG2qEsM81Bj3yhDdddz9vedwt0yjjs8D2z7x8TPEvDpsNw1LAW1AnXqoQrPxyZXCpzqNueSIcNdu49fz+XreAZWo1qhOucEF5oWSomdSYSdwqf5o8Mlz+NTLcto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IneIh/eR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IneIh/eR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1613F1F000E9;
	Fri, 22 May 2026 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779470000;
	bh=17FQYeo9EnNLOAsRTJ8Zra7Gt9u+o1SjdNCJpNuLEaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IneIh/eRTaZmumwyglUXJKF0MCSkAb/6/pWgx5XKgy64qZoVwJ56oH9bYUhxlOeCQ
	 YJ9yOk6bY6zveSEoUDjh99BjhTfOFk7fA08ax+kEK3dlhcKrCkPE2GAlY8d2eG3YUw
	 iGpLLyrvnrGR7hFXQRrGuqP6Ohp/Gdaf2hguvYR2TY41JHCMi1nPGDh8MElwCYL6m/
	 ohN/l34Q6UpFGpgl+JyWGKrCTKf/AoZy0Y2dJ+DCHtpu9kmHgFILInLRcXEhNm0lUf
	 8jxPZK2SPA56NIreKKVhj+7CmKtt7Gp0meeSgxoZ4PhRRX+9r2JtbEWCimkDjAIDv7
	 Yb4xpdghf7gEA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 22 May 2026 19:12:51 +0200
Subject: [PATCH 6/6] rust: binder: enable `clippy::cast_lossless`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-binder-strict-provenance-v1-6-3d6e9406e864@kernel.org>
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
In-Reply-To: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977; i=tamird@kernel.org;
 h=from:subject:message-id; bh=tZVFcJ0SDOSpha47vLT8wPnQbq4+EpWGnED1uar/t70=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFkCfdNT5j763nvJNHjR6mpDO6WpOUm9or1r3zSUfF1Tc
 /4Cq3lix0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKn22crwz9bgvOZ0OfvlVmK9CZvEGm9aiYfIvtU47yCyjuNNiEthKcM/jYuL627
 yPph0szzq7AvW1ZHPv1m2bP+/+RiHj7ua4O7NzAA=
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
index 3a22260eb9b4..fc69826d4be6 100644
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

