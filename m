Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9C033DEF2
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 04:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190484; cv=none; b=Rn2XZ8eDZ6I3YHOjTIH7ojN+SF4RdUjpxba38RsdIM6wt4Tpi/g/frZbHKTP8dUml/WiS7PnjysQaJUy9lCsyU5q41QekcjBJWBh3qdOoB6PaXtx4ACmepNg55WiMdswAkUjB/iKH2sF4ccvhWZxDh3VhD30AhlM1hm1ovCB+BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190484; c=relaxed/simple;
	bh=3DDgc9E3T5w7H5BqH+rbDntf6Ynlnwy66e8fFl2AwfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9WZRQm+G1JTiAxGpxK09vQPZyY/RaS/hiSTtGvd4MD7evotD9eOaMHTOlaI5o8Jsxq5q22DNppDotU3UVqlCrkrktPCJoj3G9n1kFScks7dEqr6+YeglTw1RgXKDq9AHUoaLL1AIcMHqtPzvW5pNRGsT5LFiDsE404mijZw+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAPJKmmJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAPJKmmJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so37167055ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 21:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782190482; x=1782795282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrlYzDYdfQ1qmAmV2oJ1Ki2GkYmBEgLaXt05toZCSIw=;
        b=ZAPJKmmJkl8m5Q+BbXoih1EICUIynoAODmSnn4RDAj+IaD70s9z9rhu+hQ7/LbCcIs
         e6FMNie7JZk+EutOD1G+iBDVp+oZX3H0GIEoWgu4hZ9VCa3WlF87WIgK386xB7+/2Jeo
         gSQoIitsdJnss9rthrlSmlXW3yxIwqef9e8M2UaKYdqALyr7165PXNaHq3mdKC6SLL+/
         Aj8Ef+GCqyO35BJCRewkNNQhzH4KbYif9KrfKFzrkL9G6Mnw+C7kkzSs7QO/HwwM6T4/
         Z1Q+w8ymR0rM4mUedAn/ceFxhb0hvp7C7hRDSeHyVwYHlXElZ/z4hgGFU9qQ+TVro2tX
         vISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782190482; x=1782795282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrlYzDYdfQ1qmAmV2oJ1Ki2GkYmBEgLaXt05toZCSIw=;
        b=si3WQQnj9PVV+scG+YBVgy5QuCcAJ/8yAW9EVtiO3AivioBLCqtgNLNa0YiWSBT9Rs
         C7cRBF91I9zJ9T7h9Wh9jMnRHlwkPu/63XeCUu8/ZodEEK9Ap+h7FVeTDWryMJ4Ob9h9
         AXYpkr9STkMFrlz4/jgAoStrOTqGgIrVF5eqsPg/kKuqCXQTbkcItmyTeo2rl0KjpECA
         1lACoV4E8e1nspWdTcbasV3elab4qqQfeL1rX5+2WopxSn/xfSe05lxJUKT49okM7DvY
         83uPMtximx14ZLt2pKKvtWKjFWLOeHaUGIg+GRNxfc0AlhtN9Sk4iVBWVvJpfQyLCCuP
         /QUg==
X-Forwarded-Encrypted: i=1; AHgh+Rrn0dSw2eMcXYTqU8FXlJwUfwJfCeRicG3MV55yfmRFWVjq7/HoPG+pDmf6UO8qIJi/h6zAYrgJUCmibRtLgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbSs3h32mwESvzvKNe+jk9uIA7OArU7COwJurGo9+Qwxjwpq7
	/JUuXU3cLLeYtPtaso8NnllTSX7LM8yr4ddAbzCPOHAHJcPMzp2+Epfc
X-Gm-Gg: AfdE7ckN6zWbLqeWigmhJcz6JzlCIOJMwdMl0/dnQghhYKxgbh8iZm7CP2TVepRBXre
	jepMDgX7crTF978OeI1Nh7rTAEZipEWU2ONFKBMGnD70Zl++FdPXfasR+c4GhcZMJIb1jG9FkJ0
	of6NQQmtVdjHRiTABvPK4jjvuHR6UkskTo0tYxj5E/Mt6p3FsQIam5GiJSXyaTIVIHT0SCmHbY0
	J9troYPTc1jXpl/zvaAFWEmLxXSI7L5LXXiUFwmkat2kBWy8GlKkbPz2PAOpfiIguFpCq6dFE6A
	OOHuynA+U6p5RUXhsMpZ57ckPoXONR3c2Ngq8I8trKvMirhESxKzI+1n77NAA8ZIyXkTC9L4RWI
	ZbN6eLYRD3RH3mg19Jj7sLdv7qRnYCPH+VNDDNWKi0hmiu0A+dpx1WJAwOcCAgSYV4kOs9ZHtzJ
	Kf45VcpGNIHNTjwsuC6PeahwsBh6h0lOFxH4jCVm7B
X-Received: by 2002:a17:903:22cb:b0:2c2:5446:30e8 with SMTP id d9443c01a7336-2c7c7693978mr14164845ad.18.1782190482455;
        Mon, 22 Jun 2026 21:54:42 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8cf0sm89734785ad.50.2026.06.22.21.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 21:54:42 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	djbw@kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan.Cameron@huawei.com
Cc: alistair23@gmail.com,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	tmgross@umich.edu
Subject: [PATCH v2 03/21] rust: validate: add `Validate` trait
Date: Tue, 23 Jun 2026 14:53:48 +1000
Message-ID: <20260623045406.2589547-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623045406.2589547-1-alistair.francis@wdc.com>
References: <20260623045406.2589547-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
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

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-4-lossin@kernel.org>
---
 rust/kernel/validate.rs | 70 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
index 2b28625c25ef..663681b633c8 100644
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
@@ -52,7 +55,7 @@
 /// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
 /// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
 /// derefs to `KVec<Untrusted<T>>`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
-/// totally opaque.
+/// totally opaque and one can only access its value by calling [`Untrusted::validate()`].
 ///
 /// # Usage in API Design
 ///
@@ -107,6 +110,30 @@ pub fn new(value: T) -> Self
     {
         Self(value)
     }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    pub fn validate<V: Validate<Self>>(self) -> Result<V, V::Err>
+    where
+        T: Sized,
+    {
+        V::validate(self.0)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    pub fn validate_ref<'a, V: Validate<&'a Self>>(&'a self) -> Result<V, V::Err> {
+        V::validate(&self.0)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    pub fn validate_mut<'a, V: Validate<&'a mut Self>>(&'a mut self) -> Result<V, V::Err> {
+        V::validate(&mut self.0)
+    }
 }
 
 impl<T> Deref for Untrusted<[T]> {
@@ -146,3 +173,44 @@ fn deref_mut(&mut self) -> &mut Self::Target {
         unsafe { &mut *ptr }
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
+pub trait Validate<Input: ValidateInput>: Sized {
+    /// Validation error.
+    type Err;
+
+    /// Validate the raw input.
+    fn validate(raw: Input::Inner) -> Result<Self, Self::Err>;
+}
-- 
2.54.0

