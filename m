Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078769;
	b=ACR0o25mdkGJrgG/VekR+Kao43B3/Q700lUjUy1f0GL5DM5pZyApgeSzGPLyXmWzHWNj
	 QYfTaBCVGpaSttEYwrNo1ZqzB1Ypebek7VcURSLYtZT97TJQwrE4GpJHHD3alY8P8TMec
	 e6U4tnrAETbQ8NcctKp7VXp9zyk16CpvCc35CC7wrgp8A3qoN+xJ1rT9xwoeZLEW7vh6u
	 Bt+m6IFE71L2j+7cDXlofqBmp+mGfgAKD8FivoyKLXzVMILeOhrVxG+MljP1KgUtC/0ir
	 05c9L1fLYU5MJQrbCh6ESBSANxqo/+QRM+SosE98Pq+nhH6lY7E2Xgm3KT42jsi1PtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eTYRu2Y1roqXLFBUgarJRm+ifHHaPTOIT3dhmjarsSs=;
	b=Y62ahZL0rz+2B27+heN7w/f3M7ug/NbEIB6qyPkes1m151A7a4oemN7/RfBZqyG3elbI
	 c8wZQ5kfR+/SebdHDW/gc4m0aCQpQEdmO9YDc4EqP1/Zwf3alewnH2sxt2Ztc0oB1KWcO
	 reFvOREAmzNoWwDzWgBw+GmjrzEbpWbnYwOZZBIvDEW95xOvbALjDUMdLMD8rbofTAzuk
	 JcsHZVSBEnwTN4brxK1qENDiOs5qhCryOQhEcKe6sp+SZHHSbuBEFuEj+Ek7QPqHSwP1Y
	 OQ4HbbuCcGpmPw0FAhKMFMXzV5mgbponDhO4lpTl7zK9Kx82lIcY1rafVoRY9I161xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="H/C1bj0T";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9CC606A325
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9CC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H/C1bj0T
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so2005881a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078768; x=1793683568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTYRu2Y1roqXLFBUgarJRm+ifHHaPTOIT3dhmjarsSs=;
        b=H/C1bj0TDgjnC8GPypZRFILRml3B0fcwWkwh9HJFodsXetyf3QYY7hYT7aE3UAA7iH
         NpcUsHkwq5tIVfMeIWX8EyD97R+Y+2kdS8/H5ts2Nwni9FaM6t13N4vF5Q71VrQpe1TU
         RruVcKusMiOprAucGuOBbsLxXRA6UJNTTshPovKcdv6mSCJoaBL6wCYNDCK+8M+kBlo6
         OonCx4f10IXEP6oGydwdokS8NzrgyfXV4vAxG4qI/wF4YvmKv4S+kG6LTXDrETA8GoaA
         MiM4ZcKwxKhp3X8Ctc87Gh1q0gpk7+Qq392DuUEY1JGu+t9IRwGBfearOgXFpZ9WW2BC
         qJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078768; x=1793683568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTYRu2Y1roqXLFBUgarJRm+ifHHaPTOIT3dhmjarsSs=;
        b=IjhspAqosNBbHhLI7OH6Z+phy9HsW9ZMKpaaT4a6+S0Qh6ciwH4d3FtE1xOJEvYBPx
         BFt5OcM5uCvOKqKcT/S0Hb6XDGyTUcQAvIW26WzWMn2Lhd3ycnOR5CdKfPpWV2Pq68TD
         mp2hedIGncXID82R+XPc9wK43dYPMoizIA4k8tV4WYQBFR8xf8EQtv0oh4dIKKrkXAHY
         OyGk57BHezUsbJNfQACNzJotA7JbmUjqAhgiFnOr6Jb+/L3pGG6XuUSsf8xmMjSR0H78
         ST4/WQUboHZMXambsf9s+RAfjMzsjoasdaP57umbpXnlSI1ocVDrePfGsLemBOFi5zSy
         Dzug==
X-Forwarded-Encrypted: i=1; AKwUvBz1HbIKsazvByMYfrkjv5S5innAbUubl9oi3auaEfT7ZjRHn5cETGANwILg3rrSOzIgKkkXx9wgZZSUylNgLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOAYC75u/wK8h1tMChbxBOdm9QjtncrRrjr/rsxk+2xKlL7KY0
	+tK2wXakWbfUt7+UTISuW0uOph/JPDbhqrOt+w2FKmGgXwH9z1aDsKEe
X-Gm-Gg: AYBFou0Liqg2e/mLfsbWXPpsS56c4yGK4jWs+skH7RjYw8sdKQIBp0By9nSY0DBGMWO
	xGGtGVVT56iNERW0JniO1Ch1fMFNW2eKEvudNY8O1d1+DxKAj8/zPLpQ4UoiT9CsDZWE9p5QERG
	Oskf0h636MSw7yU7IyS2PXhk0bmUln6O308BJ0VQ0LCdxyPFWWPF0nUzBPmthcwgHEV9wPseS7B
	zLDjHZJue6CX/mbV9WpYz3qKdG+z81Rgcsr9Sc+cdEVRKMzv+y3KmPebff0EvuNwNiTBMVnqa9K
	zcpice+2rKVVZrWV7fk8/09rnBSgimgm5ExDNAXwMoqket8Z0L2NZkuwgUyJ1RtgOeEaHkAxBCE
	1s7XsN0MZIr4/+/Nu34qPdUGhISaV4R5JxA3sbK5qGf9yd6ZLnI0HeO/d7BAqCls+ntaHWiNIDf
	dgE0uUzkFjuGxXet4sLLmO6DE9OfTTET70qz2UpVAh/rOffUwQIVYbX77j/XaFkcqeQVupe5fl8
	1fHDQwf/e1zkegaLJtQBMD+vXk5Osm1yc06zESed78N4f7gdiz11+MXqFRipnttJ/4JWaOU8A==
X-Received: by 2002:a17:90b:1407:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3adeb4c27b0mr4785981a91.23.1793078768021;
        Mon, 26 Oct 2026 22:26:08 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:07 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 03/23] rust: validate: add `Validate` trait
Date: Tue, 27 Oct 2026 15:25:16 +1000
Message-ID: <20261027052536.1722081-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benno Lossin <benno.lossin@proton.me>

Introduce the `Validate<Input>` trait and functions to validate
`Untrusted<T>` using said trait. This allows one to access the inner
value of `Untrusted<T>` via `validate{,_ref,_mut}` functions which
subsequently delegate the validation to user-implemented `Validate`
trait.

The `Validate` trait is the only entry point for validation code, making
it easy to spot where data is being validated.

The reason for restricting the types that can be inputs to
`Validate::validate` is to be able to have the `validate...` functions
on `Untrusted`. This is also the reason for the suggestions in the
`Usage in API Design` section in the commit that introduced
`Untrusted<T>`.

The `Validate::validate()` function allows additional context to be
passed, which can be used as part of the validation process. For example
comparing data against already negotiated information.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-4-lossin@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/validate.rs | 85 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
index 3c1fe37624573..3d1c4107fa8fe 100644
--- a/rust/kernel/validate.rs
+++ b/rust/kernel/validate.rs
@@ -11,6 +11,9 @@
 //! APIs that write back into userspace usually allow writing untrusted bytes directly, allowing
 //! direct copying of untrusted user data back into userspace without validation.
 //!
+//! The only way to access untrusted data is to [`Validate::validate`] it. This is facilitated by
+//! the [`Validate`] trait.
+//!
 //! # Rationale
 //!
 //! When reading data from an untrusted source, it must be validated before it can be used for
@@ -56,7 +59,7 @@
 /// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
 /// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
 /// derefs to `[Untrusted<T>]`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
-/// totally opaque.
+/// totally opaque and one can only access its value by calling [`Untrusted::validate()`].
 ///
 /// # Usage in API Design
 ///
@@ -119,6 +122,42 @@ pub fn new(value: T) -> Self
     {
         Self::from(value)
     }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate<'c, Context, V: Validate<'c, Self, Context>>(
+        self,
+        context: Context,
+    ) -> Result<V, V::Err>
+    where
+        T: Sized,
+    {
+        V::validate(self.0, context)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate_ref<'a, 'c, Context, V: Validate<'c, &'a Self, Context>>(
+        &'a self,
+        context: Context,
+    ) -> Result<V, V::Err> {
+        V::validate(&self.0, context)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate_mut<'a, 'c, Context, V: Validate<'c, &'a mut Self, Context>>(
+        &'a mut self,
+        context: Context,
+    ) -> Result<V, V::Err> {
+        V::validate(&mut self.0, context)
+    }
 }
 
 impl<T> Untrusted<T> {
@@ -190,3 +229,47 @@ fn deref_mut(&mut self) -> &mut Self::Target {
         Untrusted::from_mut_slice(self.0.as_mut_slice())
     }
 }
+
+/// Marks valid input for the [`Validate`] trait.
+pub trait ValidateInput: private::Sealed {
+    /// Type of the inner data.
+    type Inner: ?Sized;
+}
+
+impl<T: ?Sized> ValidateInput for Untrusted<T> {
+    type Inner = T;
+}
+
+impl<'a, T: ?Sized> ValidateInput for &'a Untrusted<T> {
+    type Inner = &'a T;
+}
+
+impl<'a, T: ?Sized> ValidateInput for &'a mut Untrusted<T> {
+    type Inner = &'a mut T;
+}
+
+mod private {
+    use super::Untrusted;
+
+    pub trait Sealed {}
+
+    impl<T: ?Sized> Sealed for Untrusted<T> {}
+    impl<'a, T: ?Sized> Sealed for &'a Untrusted<T> {}
+    impl<'a, T: ?Sized> Sealed for &'a mut Untrusted<T> {}
+}
+
+/// Validate [`Untrusted`] data.
+///
+/// Care must be taken when implementing this trait, as unprotected access to unvalidated data is
+/// given to the [`Validate::validate`] function. The implementer must ensure that the data is only
+/// used for logic after successful validation.
+pub trait Validate<'c, Input: ValidateInput, Context>: Sized {
+    /// Validation error.
+    type Err;
+
+    /// Validate the raw input.
+    ///
+    /// `Context` is additional context needed for validation. The `'c` lifetime is the lifetime of
+    /// the borrowed context (`&'c Foo`).
+    fn validate(raw: Input::Inner, context: Context) -> Result<Self, Self::Err>;
+}
-- 
2.56.0

