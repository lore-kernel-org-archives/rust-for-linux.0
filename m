Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13F1482CF5;
	Thu,  8 Jan 2026 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880407; cv=none; b=aWhjdve3he8g7eaxlsdjvHXQj+2HZK+xTJXuHK1PCFKMOTrWu2sUPFzF+Gx/rchEa7rP8mM85cw3Qif5IyycXSqa5O0LzF2z4gGL7lImHe3iCd1DcFlAJDK//JEWegOB+6e8Ifn3Vljdc+mCEx3OmBAUtMfRW9XTV9nR8FGrgqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880407; c=relaxed/simple;
	bh=lc42Fme75A/GIA7rI+FlJKMf8vj8Rw5uU2GNuIL1LqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4KtPZ/gEJGS0rM+D5plVUchDGFvM/HFPcbfA7tw4c8YEkVlN19S8GKroxASdAt9kPAA8veuhjOBwQ7Or5E/3mAUjjHpYmeqH2ytCAOJ6KOdM5e99I6ATTf82/xLRGxrNEwZW3fGCBWXiFTB5ZapO6b8hkF19ixsiNxtJx54oX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=castQypT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="castQypT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E566DC116C6;
	Thu,  8 Jan 2026 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880407;
	bh=lc42Fme75A/GIA7rI+FlJKMf8vj8Rw5uU2GNuIL1LqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=castQypToVBzrpo61++J5lIEotHIFazoCG+gKb6mhZE0IZgBky48yRDBZICHGE3yj
	 bqpLYBEgulTye/ycEYRiubpXEhdP9DBBFEenvUtzP0Xt7pAj3SP7foz2CawnIVLZmA
	 TRWzlAVhVlh5d6nVofWbpduKirgdp+Q2rWSCqc7D2cA05vTHFdLFyZOkaTek+1FV89
	 sU9qqgelfeGd66XL9WG21m1JjXMpv+WcPj+reOva5gDKD8iYiQIFMpaUyBOy6phcJN
	 f0vrUz+DC2M1sRERnt7qkjvr5LupiMGdizPr9PlIumA7XliFjLUCxq20uSnbi3SYCI
	 lzt0bw42ZzTdg==
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
Subject: [PATCH 10/12] rust: init: use `#[default_error(err)]` for the initializer macros
Date: Thu,  8 Jan 2026 14:50:48 +0100
Message-ID: <20260108135127.3153925-11-lossin@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260108135127.3153925-1-lossin@kernel.org>
References: <20260108135127.3153925-1-lossin@kernel.org>
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

Signed-off-by: Benno Lossin <lossin@kernel.org>
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
2.51.2

