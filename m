Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB315367F5B
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Mar 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774714408; cv=none; b=QyTkCEEdaKFswjG4yVXrRr9CEAqojVXtorNA8HV2JJtlCBIK3d5DRcqb5jzif3lAJ6Fn0XNMwo8/YJ8B4lEHNNUhPLSuzFYTScMQbYj3vvwLowMSkxYrI6S+6xwMHpNYEF6ZGXkuDnBrWK03zN/cKzvrR68Gg7DGcdAsqobevZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774714408; c=relaxed/simple;
	bh=UUp6HpiqnhyGzgFfoW66fRufCkMQ007KgA1gYRPuMCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzq3Yat/duTV7CUoRm90Kh1kHVuJYHyoTsvcLlZX2Skft9gkh2AIPkslaZUoH7PTsZ04Fq417f/rLvyZn5HV+nQmclYKHBlTkGV+IfkOc4EQchkvuHqH7LQCFA96dQyOyEP0RP0QXAnugZNCdIrrH1mk6qmIcEzJdSWxYXT8VbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIIwJqlW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIIwJqlW"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso2757107e87.0
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Mar 2026 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774714405; x=1775319205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ92tsR8jP1KCH0j1udmYpZfa186JNZsN5/B/7c+PMA=;
        b=eIIwJqlWiH+wPHN6qETAG0pt7bR0tGSSh0gigaYYvqoGkl0f5/EO1jJs9hmF3cydoc
         It38u74PbYpPBC/UhVvmp+7nYQ4hp7OJd9yDX/T1bIBXUZogy1hI73hf7Q9opCU+djbf
         Bv7I3o9bFezJaKCBMeFI+8FmNVCun52Ynyad6YyxBw0KIwtQ7Hj3oqEc8O7hYFCZfVDx
         kGBru4qIZ3EENfd1pT13BzbxC8zr46KSEZY0C2MGrP9RGHIQ3uu7WGYbD4Rgd0Ke/T6f
         vPakFHbKupIddCRqTLEDw/DCHw4tKaXyZh8zUYc8Pkb14NQQGk4C/tnqUxZYQgr+008R
         aUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774714405; x=1775319205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ92tsR8jP1KCH0j1udmYpZfa186JNZsN5/B/7c+PMA=;
        b=Bm4gp0CFh1530eN29cDI+FfHrf0pxSu11p0Bdsy1zh5A7eqvA1nvrhZT0st9wH3wMP
         X0gUGxBHWsOXEurbqcajx/6sO4y6ZMspp98CsChsHzQFdGURmFn3D9E071XJyVhzokC3
         58u2/MXZSvH5DW2ADUBWxq5atIbItBEZrgJvtxFWHPGYZ5xlh4cLdafoxw1gbxKIY2eX
         JsmTVLfjbASbKEbDRJ9T7DVxrRQLJzILm5IlIljjqlFZrGN2k+EYZkZdckro+fSpXiXG
         o1Ys+DlP4hAHLPICjEVrNvMtdRm12l8RR19sgfhHQdMKx1qbqihuakEy7x3uWsU6GUAb
         rs+g==
X-Forwarded-Encrypted: i=1; AJvYcCUnYRHOk14x+JJhIs4URzS7LjyA2S9z202GOUQ3SJBUEcMhdN3G2PH59z647JSmraXpvu02DYiOn9JXaF+46w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRIIVrflDmRFkFFvlwPG8a8w0PwlDvfN0PoQMfF5+/njfQmtx3
	S36/ARwImEG2y9EFY+54h0oX4gymZQLd+5EVFxIV8ESmNYjSR5VxoskXEtQO4/M=
X-Gm-Gg: ATEYQzxqfP/Cftve7+JfwRTnqrVcQjiQ4KvckoCMDgBbGrPbCyxBgDrxFEOBRscdN1A
	JIhRut1nvzl9AdA1S6CML1r2fhqjO1byxC9N1afzGjCo+GUqmX8TrGBYLUkR6PxddKa91JxeZZE
	CpOOXZEnLnpnO7mGZ69tqRnjURqrdalzU7ws1bOy5IYTPReRbfH1PlbhkKCccxfBJfj3BWXgYZX
	FObHqde65gPernxMwfWrl9P5hWTVmbpKeZzLjEO3BFeEjIlXwK06w60VyIRX6+NK8AIP81fHri6
	j6QwjZQHNPAimeXqsc3KT917h4/LSH6J0BnwPkmRfjjB9dE1RT4RNadZx31rrt0a4rX0UXIJqfp
	JqBZAsc0SaghQZ3TKKXHWZZSs79sNJ3lOOoS9d9d6ltc3Mq3UU067+Rm1ZlI4AHELsZAzU6alJe
	BsCxHfOUqgVODpmotKwziNXyrtMvs=
X-Received: by 2002:a05:600c:83c4:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-48727d87b56mr93791335e9.11.1774698050877;
        Sat, 28 Mar 2026 04:40:50 -0700 (PDT)
Received: from panzer.local ([188.246.34.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872716799dsm33619125e9.25.2026.03.28.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 04:40:50 -0700 (PDT)
From: Mirko Adzic <adzicmirko97@gmail.com>
To: adzicmirko97@gmail.com,
	ojeda@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	daniel.almeida@collabora.com,
	khali@linux-fr.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	alistair.francis@wdc.com,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: error: clarify that `from_err_ptr` can return `Ok(NULL)`
Date: Sat, 28 Mar 2026 12:39:28 +0100
Message-ID: <20260328114005.125617-1-adzicmirko97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the doc comment of `from_err_ptr` by explicitly stating that it
will return `Ok(NULL)` when passed a null pointer, as it isn't an error
value.

Add a doctest case that tests the behavior described above, as well as
other scenarios (non-null/non-error pointer, error value).

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/20260322193830.89324-1-ojeda@kernel.org/
Link: https://github.com/Rust-for-Linux/linux/issues/1231
Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>
---
 rust/kernel/error.rs | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 935787c2a91c..9a4388c74f43 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -452,6 +452,9 @@ pub fn to_result(err: crate::ffi::c_int) -> Result {
 /// for errors. This function performs the check and converts the "error pointer"
 /// to a normal pointer in an idiomatic fashion.
 ///
+/// Note that a `NULL` pointer is not considered an error pointer, and is returned
+/// as-is, wrapped in `Ok`.
+///
 /// # Examples
 ///
 /// ```ignore
@@ -466,6 +469,41 @@ pub fn to_result(err: crate::ffi::c_int) -> Result {
 ///     from_err_ptr(unsafe { bindings::devm_platform_ioremap_resource(pdev.to_ptr(), index) })
 /// }
 /// ```
+///
+/// ```
+/// # use kernel::error::from_err_ptr;
+/// # mod bindings {
+/// #     use kernel::prelude::*;
+/// #     pub(super) unsafe fn einval_err_ptr() -> *mut kernel::ffi::c_void {
+/// #         let einval = -(kernel::bindings::EINVAL as isize);
+/// #         // SAFETY: `einval` is a valid error.
+/// #         unsafe { kernel::bindings::ERR_PTR(einval) }
+/// #     }
+/// #     pub(super) unsafe fn null_ptr() -> *mut kernel::ffi::c_void {
+/// #         core::ptr::null_mut()
+/// #     }
+/// #     pub(super) unsafe fn non_null_ptr() -> *mut kernel::ffi::c_void {
+/// #         0x1234 as *mut kernel::ffi::c_void
+/// #     }
+/// # }
+/// fn einval_err_ptr() {
+///     // SAFETY: ...
+///     let result = from_err_ptr(unsafe { bindings::einval_err_ptr() });
+///     assert_eq!(result, Err(EINVAL));
+/// }
+///
+/// fn null_ptr() {
+///     // SAFETY: ...
+///     let result = from_err_ptr(unsafe { bindings::null_ptr() });
+///     assert_eq!(result, Ok(core::ptr::null_mut()));
+/// }
+///
+/// fn non_null_ptr() {
+///     // SAFETY: ...
+///     let result = from_err_ptr(unsafe { bindings::non_null_ptr() });
+///     assert_eq!(result, Ok(0x1234 as *mut kernel::ffi::c_void));
+/// }
+/// ```
 pub fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
     // CAST: Casting a pointer to `*const crate::ffi::c_void` is always valid.
     let const_ptr: *const crate::ffi::c_void = ptr.cast();
-- 
2.53.0

