Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293EB334C35;
	Wed, 14 Jan 2026 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414856; cv=none; b=ZszX9Uy+tVE0GEjBXTdY05qN3AFFSek1FIqekwRotCyMl2N9/VszHQ8R5o6GUEwleJBy0sEdagkDuYXFpfE/HJMOrtQHMyjVQlF+lCkDsyoiFH/U7f5zj1G2O+/iv4yWMXu82BaObUxZ+zi7aQXb763dGetwpUwY0It3BNwSF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414856; c=relaxed/simple;
	bh=N29VLrs5JWWRZs0nN5HPuD0AAZOUUJHTX25VIPRCG+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UP41HgCQ4/YFoiDbcLAmo2GJ4PWE3pZi9ytdEK6JDaWaUYE2HcqnUACCPk4sWkeiBHO9wT2PiLm8dynsghwtw8d4qYSZt0A3uBsCm99hb16gb5xkNz7BZPnRmp3zO70Kp6/RuVVvbj7VN87KXqkrm9y76QUA350tWH7OxnCLlcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6qY8Wq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6qY8Wq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41041C19422;
	Wed, 14 Jan 2026 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414855;
	bh=N29VLrs5JWWRZs0nN5HPuD0AAZOUUJHTX25VIPRCG+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6qY8Wq1ukAuiPetT/Xti+R21nx8pDNFOe+B75QwKwByNaMRfVZ2PfhytESmL7d9n
	 IBwGOV+2k52U8CViMz+EgHIv9wfkB613nAObSXX9JuhKaQC7DrQUiP1l6dRGt2ox8U
	 h3a133DF4zFYNm73FWUKA1iOVr7m8dXhNacJAODJ6sBWymPOkytxvE5/jmCPMhIIW/
	 Z0ZmiNew5vEsTFKj4ylm/vgQl0TSYg6Nm/sIE34oHtWETA8TMnvoOashLwxMUzfqxR
	 VJ5qrItLp3zyWmLc4+btCiZHhIwYtCT9a7eET4wZ/b1wiJk22BtVorHXRtYSYyCKSR
	 oYcXlzTznBr8g==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/15] rust: init: use `#[default_error(err)]` for the initializer macros
Date: Wed, 14 Jan 2026 19:18:46 +0100
Message-ID: <20260114181934.1782470-12-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114181934.1782470-1-lossin@kernel.org>
References: <20260114181934.1782470-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initializer macros should use this attribute instead of manually parsing
the macro's input. This is because the syntax is now parsed using `syn`,
which permits more complex constructs to be parsed. In addition, this
ensures that the kernel's initializer marcos will have the exact same
syntax as the ones from pin-init.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: none
Changes in v2: none
---
 rust/kernel/init.rs | 40 ++++++++++++----------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 917f7ef001fd..7a0d4559d7b5 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -219,20 +219,12 @@ fn init<E>(init: impl Init<T, E>, flags: Flags) -> error::Result<Self>
 /// [`Error`]: crate::error::Error
 #[macro_export]
 macro_rules! try_init {
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }) => {
-        ::pin_init::init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? $crate::error::Error)
-    };
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }? $err:ty) => {
-        ::pin_init::init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? $err)
-    };
+    ($($args:tt)*) => {
+        ::pin_init::init!(
+            #[default_error($crate::error::Error)]
+            $($args)*
+        )
+    }
 }
 
 /// Construct an in-place, fallible pinned initializer for `struct`s.
@@ -279,18 +271,10 @@ macro_rules! try_init {
 /// [`Error`]: crate::error::Error
 #[macro_export]
 macro_rules! try_pin_init {
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }) => {
-        ::pin_init::pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? $crate::error::Error)
-    };
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }? $err:ty) => {
-        ::pin_init::pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? $err)
-    };
+    ($($args:tt)*) => {
+        ::pin_init::pin_init!(
+            #[default_error($crate::error::Error)]
+            $($args)*
+        )
+    }
 }
-- 
2.52.0

