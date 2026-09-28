Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87802877DE
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557924; cv=none; b=nOHtZImCkjgssY7eAg/PM/p1kvF/5pCaVBl5QOjRAoXfSfpTQSADsyuV6rKWEMLK3TnzngQ773i4hdWja/M61eu7Ary8TTgzWmPulUJ0GCg/Kubaqq7u3YnDl18Wzplm2qngGI1l+U02resnRhn4rrCB0Lw2VZbHhLy0m6p4u5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557924; c=relaxed/simple;
	bh=/+92BewPm2fGZCajyZra46g01btF0erQbcx/NoXKKcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxofAbJEYpdRKvmdQsCVPL4w30O2iRwQWxPARqk4nmDYUy9l/nSAlOEIvjKH0fxysdKiOm2q1BSKqEikzjGDRjQB93icHiZLkPwkC5D+Smw0J2n5aH8X+wSebDPFezkjjPXBhg7x318RrMFdZEzjFk0Rq7A5iV/cCtK6hAGZ5vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4JhFYdW; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4JhFYdW"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so997383a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557922; x=1791162722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUOMnpk1nr1JpJWRK47H9T9y8g0Y/F8pq/bIGmc3L5k=;
        b=D4JhFYdWNqqzn5IOprsUqeNeUZelkUxVp12hkHA1mwPPA9AW6mb8RQ0LO9owX2CnQY
         KRSHYwdigvf3wFS3jaS9tXCXZzLi+FZaJ0JtJVCxTmzjzuURmiqMvPEikZ130uZoKSAZ
         jULcDlftfyYKJmVgOPtN5Nmx+HIFNpKkP2cOT9sZQ8vYvxZsbBeWRVDB9Q+rhm51G0KW
         qmvSChV8cMkVYcMmFrqo9NqTh1f+wRNqrSkSxZiQdZqYCJpb/LKh4Q3GfM+ILWngwadV
         FrSn+hDImA4Adt5lcw0v+VjQdHrBH6r2w6fOoWWkiTB/B51rirtx9iCPElrBISpp9FIr
         vJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557922; x=1791162722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUOMnpk1nr1JpJWRK47H9T9y8g0Y/F8pq/bIGmc3L5k=;
        b=K56XEZdBQp8NDoRKU2pYmIKtI9HE39mnV3jWfZZZpNQ0CFoOUYcdRgsY3m45MVyOyb
         BrfATD8FCFmRB1MSGt7lI/jE3o8t4lxLGRHNSQq8+4O464i5ABbBtNlBP79TsKpI185I
         Trz6VJEsLs+vk8UkTkTD8pvcJIFrD77KHtVqO64hnp6WAYmd6M4PPVYunMqfA6WsPRhp
         e7X34NmtDpryEZ49y+Agz+X5X2Wa8RZycBvroTvXwn5gjKdcYidEYDlN9ILEtcvLGivG
         g9QEAAlHZKqL8mJpMnlf1oO1q6iSOsEV1AS1ZB5JGFrC6wcyckK4oC3yohAu2vTHNHMI
         BDzg==
X-Forwarded-Encrypted: i=1; AKwUvBypAV36z33ijDg8TI4r49XVOo030GOBy7KrqcbQgseXlrX6EuHnX265MPx1ax3bpEx8wErqFiEIzLQfDPLOuw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKIOSnrDri3C2XWPXhIgv00Ma4pcqfhWK1+icDvA1jybwaRJBSr
	SGIsIKu5t1Usow/x/z0bChBFKWcCHpEv2rxsc8Zyh8N229FTt3ioorIL
X-Gm-Gg: AYBFou16rICiussW1iqnTHed5WLlgpIokd/DbDS0+pG1ELrqq4SLlaCBnRXdk6RqABq
	OpJ6srC/3QjfIxYPt45EWoBIi2Hlx/5Y/wFPZbVFuCFQ4oomdexUg0kWJqAksw56d7dhZIdLUIE
	2oAmfpajF1e+GecBdF3yxTQWma/Ds2/6QZJz0PFxecxIjiOTdC+lDkKJDDj+ZVnXwy+eLGLI88l
	INVu7keRM9x8qdDDcvru173h+E9/3xYW8uStodHl4UfDu0QDeAcL6bdLGnt4zm9IKe63KjcYXFh
	JIapoIB8MUaYJWoRgVLi+YuDIo832E8MBRur7oKLKwh6Qp8GEvqTG/anhFS2X28Qisi8AKesmSA
	k68r+3XYpDBz7loc8tWdcMOJxi2D69wGXEvlDIiB26+rpBmz0cGhwG2e+If96Yimh7CqnA+A2lY
	7SoUy1C4KWFwCBw2GTVFoHx2q3H0WTsTkKVK2S4uLU2Mw77bp3/jNXzRaETjLlqZXS4L0dx6slD
	2JXozkOknejc9a3
X-Received: by 2002:a17:90a:516:b0:3a0:b243:3e85 with SMTP id 98e67ed59e1d1-3a0b24344f8mr4081530a91.34.1790557921984;
        Sun, 27 Sep 2026 18:12:01 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10425773a91.13.2026.09.27.18.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:12:01 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: lukas@wunner.de,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	Jonathan.Cameron@huawei.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	alistair@alistair23.me,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: wilfred.mallawa@wdc.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	alex.gaynor@gmail.com,
	alistair23@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	gary@garyguo.net,
	ojeda@kernel.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 04/22] rust: validate: add `Validate` trait
Date: Mon, 28 Sep 2026 11:11:05 +1000
Message-ID: <20260928011123.450800-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928011123.450800-1-alistair.francis@wdc.com>
References: <20260928011123.450800-1-alistair.francis@wdc.com>
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

The `Validate::validate()` function allows additional context to be
passed, which can be used as part of the validation process. For example
comparing data against already negotiated information.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-4-lossin@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/validate.rs | 84 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
index ca2e5abda3e2..991eda67a50f 100644
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
 /// derefs to `[Untrusted<T>]`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
-/// totally opaque.
+/// totally opaque and one can only access its value by calling [`Untrusted::validate()`].
 ///
 /// # Usage in API Design
 ///
@@ -108,6 +111,39 @@ pub fn new(value: T) -> Self
     {
         Self(value)
     }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate<'c, V: Validate<'c, Self>>(self, context: V::Context) -> Result<V, V::Err>
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
+    pub fn validate_ref<'a, 'c, V: Validate<'c, &'a Self>>(
+        &'a self,
+        context: V::Context,
+    ) -> Result<V, V::Err> {
+        V::validate(&self.0, context)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate_mut<'a, 'c, V: Validate<'c, &'a mut Self>>(
+        &'a mut self,
+        context: V::Context,
+    ) -> Result<V, V::Err> {
+        V::validate(&mut self.0, context)
+    }
 }
 
 impl<T> Deref for Untrusted<[T]> {
@@ -145,3 +181,49 @@ fn deref_mut(&mut self) -> &mut Self::Target {
         unsafe { cast_slice_mut(self.0.as_mut_slice()) }
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
+pub trait Validate<'c, Input: ValidateInput>: Sized {
+    /// Validation error.
+    type Err;
+
+    /// Additional context passed to [`Validate::validate`].
+    ///
+    /// The `'c` lifetime is the lifetime of the borrowed context (`&'c Foo`).
+    type Context;
+
+    /// Validate the raw input.
+    fn validate(raw: Input::Inner, context: Self::Context) -> Result<Self, Self::Err>;
+}
-- 
2.55.0

