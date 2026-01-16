Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2190F3624A6;
	Fri, 16 Jan 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561014; cv=none; b=dPK6vCRuNFUgPddR0O6VqHxYwj/6rNMPrjBxTZ/Um8nYRV5YlErbFLFNB1hPmf1MpJAodWztgTVaPtKGwZeReLcSN+iFTxyF2lwr7Vn2myE0JVZoxGbeVvtqe1+kWfjdkfh4I+IKLf9ACAmED7Huho12FOtULY7ZgEGwJg+TriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561014; c=relaxed/simple;
	bh=Y7i76KqVvN6l6Mxe4wX5BLAhY5LdtCKrn3IlV+9eqGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+fnOKSLWkfybG0GA8w+nvq3qnXvmmRdpj/04XuWYuIe0XC3+rLFqwfdDE4uR89z2FTRnbGOoDU0H3g5bxsSL9DJQUFKnux6UXNeZr1pZ3xpYoo1WDiCG0+bHtWM/z4YkFdFOpHp6cKwe5MDebtAKa+qKbyA+bD5hk3ZK9iKjmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjih0Eyj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjih0Eyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509A1C116C6;
	Fri, 16 Jan 2026 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768561013;
	bh=Y7i76KqVvN6l6Mxe4wX5BLAhY5LdtCKrn3IlV+9eqGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kjih0EyjyfvyKD5Vp2RT9pk05Iv/wqy3OlUQcaVeHnaTK37irtJndKqKwAdGHzaaH
	 bhvuSwZm/a3TrXpG5p3YiFM4Nbf/7MwLqDIVH/fDmsGotzGbuUW6qMiHSCuVUMEKur
	 wwLk9iyautTnIF5/aNNGQzl5LMINc2VCY29IY+h9BUntzMopigcvMJuHslcUOfGQRk
	 PwusTiCwbFn7c6Iw1UzUzD5KZW8HU5ebxbYiAbiO6Yq+tE6LqgiQyxl1WyoHRqu+rw
	 GxbBIDe6bAwEbW8nyprX/cno+Y7g20SjGoqYZSMlNOOl+bwh7bk+HeGT+fvyE80vHp
	 AiEWkxjEikEvA==
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
Subject: [PATCH v4 11/15] rust: init: use `#[default_error(err)]` for the initializer macros
Date: Fri, 16 Jan 2026 11:54:26 +0100
Message-ID: <20260116105514.3794384-12-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116105514.3794384-1-lossin@kernel.org>
References: <20260116105514.3794384-1-lossin@kernel.org>
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
Changes in v4: none
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

