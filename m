Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284350;
	b=DnrOjx4BL9wuqLlEbZ7iGSqDEHZViY9Wbe/1Madf4/uDM2cKBHU4VSPDxl03wyw33+CK
	 yC2GZVChh6cbDwLL0kpr6G9cwjxBeaegfyt0GHvZa7RC49D6oO1T1Srq4DWzExNEtwFej
	 3z5MgZgwxpAJEZhBQ08/1rbNgtNP/MrV7TcyLZk+dTZN2fqnjZ1Jf4XuVU6b/d4ZTVVz1
	 QHXVy8nM8e3AZJ+kWWPRB0aMgqmrE2+0I7GbnHAM77Aim78thR2HOTI1jpzUqNCPbZ0DD
	 fKT83O9YNbzH7FJpqTLYB2gOVFR4v8rbb0nOA1x6D6Q81n9hwcHFxiFMprTc4rnL7uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j2kMsOhp92fCLsO0obs3IL9PPq/SCiWUbTQc+uhZCXU=;
	b=C0pswbKjQg2gIRPHj/Vg1xWfqw0dRA9cXZIXsj+EiARtPCVO1ph1QAAXyij07HD/2CdF
	 sxVSRIyELnNu5eacBA/ecqOjBW9kuOzeMiTTfnncfsOjS4dFyTSJQzTMzWaKHI7Cx1S/I
	 tHy5c4sdhfy0ZfMnHpsbzK+NzJ/ifjhXbuiKcmEv7woaVfVevWgkJyhJwnK322I2yeseJ
	 tMXVtG8xyZrtoCfA9QrHUemJ1hpch5wPyDnstCYJ8u5ps8jvT3Kq/DK3St+4vrufWPB8N
	 RAISpqldLPmP2NT0c1KoHLvCBUAU7yhN6ocynC8VE2nDl+blui/ew0bj+tKJdPtnIqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJ8PRqK+;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A529606A336
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A529606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJ8PRqK+
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so2880103c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284349; x=1794889149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2kMsOhp92fCLsO0obs3IL9PPq/SCiWUbTQc+uhZCXU=;
        b=iJ8PRqK+HdX5GWTx2chepwBxt7/0tmVLfODoxHuSSvkvErARbTnFSrboU1gt4eRf8a
         URhuGXpPqS4psk94/0pfgXITuI+/k4KzwyLSiTf63mqrDIAVpkRJRLBSrV/hp/8LQ9tC
         iWRGLNGircSUyiX0MmkrXkICnQpIoZg4ZaJmKXUL+vkoW4tOXcoPDLyKcasvnXEqenw1
         kQud+2iBP4Y4qrhVLIrh017JolN5D2lhp9YVS+FbC5FchrGR2IFOghtO1Jrc55kIqi/P
         Q89o021dj8UypN+i4BRWBlVAdohSH5uFGN7FJUZXFIpHcaP7m8EE0b6QzPTHKjPcMewV
         XUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284349; x=1794889149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2kMsOhp92fCLsO0obs3IL9PPq/SCiWUbTQc+uhZCXU=;
        b=sNmshqo1jsgFf/9Vci9VIY+eDNkMPi3cXAxo263/0owEZ+/yDriG3lR9aeTDxryOJH
         zrhKGkmG12J0WWpyRHdGOcbrRY+vA4SDDokKC59w2uQDG8JD3BAtgnGBhsrCfQdMWeu+
         W0ZYmYOTOyrcG/qV+tVD9y9EsTa4SOLhnkw5XOupzt1wIoNO6lmJJSX58kkDYWQM/S/8
         oeFG5OQKIJ4xm8Nrerm5tyiZmY1uIy50+5SyTGJhCXJWyKiIpjxk0dlj8rO1sIt24par
         iVpaLJ3XxG+XtWYvZk0fvbREj3K9JXqcGd2K/av55ywZMEDxpMhhjrz/4zJFnc49PI24
         U4pQ==
X-Forwarded-Encrypted: i=1; AL+hErFb77EYfh4Gg4Wn5lYTvTzmIPR8BNCOiHUnK7aBMbjxOyAlEQMOJId/QVShIBRz1iovFUhTVebugRqZRXwf6g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/gEO6qwuCfxtEJx5c47UoHPrislkO5aFx/+rIiv/62qXAsGLJy
	dg9FhIPzpAJdJi97D7xX5jebPpl1HNOQPPeyTZ4BEckX5VLTKXunFXv8
X-Gm-Gg: AYBFou2yOqmszZxzDGpYaAipXrITDH74TzF0T+fr7vl9eOXEz2TeKZE0SmEzLPtEuzg
	yKktnGG9VNOH4YR9wRjqbp6tKiCDSGLkVcOJ6XxPGSMgWqlQoNb3c4bhCorlF/nyND1MOwmLzjN
	uaAyXlhe0TzwRfRQ4Cg/EDQUzrg3Ch6Cix2RUNltVO+PWNSGU1XUtRK0fXG1h4en/ArCSRBVBft
	+/fc1cb8V9BmzsDF1sODMsYaQFE4jhl4xnn+IJvUSEVv/rikHqaP6rWHByeXpVv7RnWIi/QKC/W
	bDg1+u6K2QNPPSLcQIWhU/urecYktMjL7Qj7x44tU2dpTBaNOCUO4pxjeOpgFfjK7PDZjtUQ3lO
	9m080L4GU4OjXgdfF/f6a5Jk3bzE+EadxK0Z0B3C+DzhLG63YQLySoTF0vl1aUdpFYIGLAxhNhh
	oyu3P+W/ORpikG3LzVbZFkQQTzRdkQWY8r2Mn72sjh382bpz823pAwCdoyEl4WVciS8nHCgwFS8
	9QCs7FpyEO+GxpEN6Y/SjglOiy/fzix5twZfcn+MQSh9sIuXx6FaZCwfnhqHcZHqlv49ctnFX0f
	xtBLmQl+kqo73k22ITZpF9GxvFr5vu+gcbiiu7n3rdtxCKQ=
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr2240260c88.41.1794284349175;
        Mon, 09 Nov 2026 20:19:09 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:08 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 03/25] rust: validate: add `Validate` trait
Date: Tue, 10 Nov 2026 14:18:10 +1000
Message-ID: <20261110041832.1730924-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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
index 5926d0697d3ff..3f5fed5eef219 100644
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
@@ -53,7 +56,7 @@
 /// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
 /// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
 /// derefs to `[Untrusted<T>]`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
-/// totally opaque.
+/// totally opaque and one can only access its value by calling [`Untrusted::validate()`].
 ///
 /// # Usage in API Design
 ///
@@ -116,6 +119,42 @@ pub fn new(value: T) -> Self
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
@@ -196,3 +235,47 @@ pub fn from_trusted(value: Self) -> Vec<Untrusted<T>, A> {
         unsafe { Vec::from_raw_parts(ptr.cast::<Untrusted<T>>(), length, capacity) }
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

