Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BB7279DC3
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 03:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793424; cv=none; b=bTi/GfZiyLZU7lGLwC0zoNJtQXiz7Pryw7KNewBK3bVKzpJe7TCz1s5XghuTjxwcpzG9xSjR/FidQEd5J+NhcpSih+Do8JA3vARzYnJiu46FsU/B/IWsTQbe5QOaWcNcIzmVAImZyfhmKafapc11wRFLWhjbhaiwsegzQQapxSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793424; c=relaxed/simple;
	bh=p1A8Te1RPUWbwVh+tShhJ5amkqG4iB8fDoz5k5VUpzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNnkyW2f4pg5+5BfmtIwbvxq8gkysSI6+Kh/QdwCX3BkfCQsJ124NNy0MIU/kRy0kF4XI6bhoAZqX9mZOJ7Wiq/61tjDUecMS1KnsUPCiOpLvUbLVaaOAQWdx7weAjzz273egs30qn4yDITqcVnlxhKwZ93ugqT0DePMzsGxnV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1510201b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793421; x=1769398221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JM3VaSKg2rx2jID4q0/vD419WM2W5Z/ODXDOwurMT0=;
        b=dMfFyPyiZ/Cwx8DLMgo0nEmNsq/fQDxU5zrts/Eosm3DrlwhlheLm9+ae8VYUt4cWG
         zPwIYU/pExav48AOHJnxnNo4Qx6PB2smYQB/qXEEJIrCzHwH2gQlJ9Buau9WMysnm2q5
         +mgyL4GVTA7zzQCJSTh6us+qROkNfNK9wnicdx9pvjmx+Kx2ZCPGhSQkeYH7c2U1ArcK
         BixvXW0Z8imgxD+cB3Lk5rogVXLIWYvP+m9XR8AJ1Bg9qel7dnEuSTxAXVGV0SP5yX9d
         Sr9k5VN8zqVVb1Wa9x6KPcFnR7/ecHgzjqf6alZm3V0MCDA6cO+cv67nyvR0nLVFQjRP
         u1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXRd3ojSjgDrzKIRHtDa84hc1dnPwhAotfOrdkvI6knqPsyw0bZfZ9+21U/gD5PP6ojFPVGfHbTs/agf9E0KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7TsP4jnFlPs/1Ppc033InJL2mHXUO7cKcJh+n+98VPM3878Uw
	3tBfUmJlqkHi2+GW0RS6LNsRhWCNt1c3dg9l+DYdhYwke2uQjp5cgwZ5
X-Gm-Gg: AY/fxX6OP+B7h/vRsfcByINH64RbhkPoFY5eVNafkyN+MLWz25dmWnHiDIjreNfaSa4
	8/hFomNRmorEdGG1ho8qJUQjcboDns1rMS3a213Gqox0rEhXCAgfoIG4xYjhTV4zEor86oe41VA
	NA8UGSWymyV3YUDWkJoOR7SaTJjMQHjsUmySsGlLX12TYmN32DzOMSh6P//72jbKVk+AJObFIw5
	2R2GYq2uu1t1JG/OwjHR8fiVnTbcL6bU/MGbQ2Hvhi+KIMKSh41KIxTMkJ8U1KL3DOyejm0vI1C
	y8fVNFTuP2sJUpritzo3N7tREHb7Hf4shdPpW9LFU8NHN/4tQAyB9SqfHFzPCU491P15k1idWnR
	lvfmvnkzC8wkFaU1EdOia4qeL0SnT7T3uCky+mrR2WLiCExsHzzN4aTWENcJycyxKYaFAmp58Ht
	HUyhVcwbs4jn3aVGgsw6l4o5Qu5Z4trQqdI0IqAeyZKa/X
X-Received: by 2002:a05:6a21:33a6:b0:347:6c59:c728 with SMTP id adf61e73a8af0-38e00bbfd3amr9598349637.8.1768793421077;
        Sun, 18 Jan 2026 19:30:21 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527313c2a9sm7656972a91.17.2026.01.18.19.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:20 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v9 1/4] rust: fmt: add Pointer trait for foreign type formatting
Date: Mon, 19 Jan 2026 11:30:03 +0800
Message-ID: <20260119033006.1453006-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033006.1453006-1-sunke@kylinos.cn>
References: <20260119033006.1453006-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Pointer trait similar to Display trait to allow implementing
pointer formatting for foreign types. This provides the foundation
for safe pointer formatting in the kernel.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 49 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..059c26dfcfa21 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -27,8 +27,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     };
 }
 
-use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
@@ -90,3 +90,48 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
     {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
 );
+
+/// A copy of [`core::fmt::Pointer`] that allows us to implement it for
+/// foreign types.
+///
+/// Types should implement this trait rather than [`core::fmt::Pointer`].
+/// Together with the [`Adapter`] type and [`fmt!`] macro, it allows for
+/// formatting foreign types (e.g. types from core) which do not implement
+/// [`core::fmt::Pointer`] directly.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+pub trait Pointer {
+    /// Same as [`core::fmt::Pointer::fmt`].
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
+}
+
+impl<T: ?Sized + Pointer> Pointer for &T {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(*self, f)
+    }
+}
+
+impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(t) = self;
+        Pointer::fmt(t, f)
+    }
+}
+
+/// Macro to implement `core::fmt::Pointer` bridge for types that already
+/// implement `Pointer`. This creates a bridge from `core::fmt::Pointer`
+/// to `Pointer`.
+#[allow(unused_macros)]
+macro_rules! impl_pointer_forward {
+    ($(
+        $( { $($generics:tt)* } )? $ty:ty $( { where $($where:tt)* } )?
+    ),* $(,)?) => {
+        $(
+            impl$($($generics)*)? core::fmt::Pointer for $ty $(where $($where)*)? {
+                fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                    <Self as Pointer>::fmt(self, f)
+                }
+            }
+        )*
+    };
+}
-- 
2.43.0

