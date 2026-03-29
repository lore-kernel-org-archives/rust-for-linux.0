Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB31EF09B
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781134; cv=none; b=rjOVlPT3Q8zsGgi/gpRy4s8+oRZ8avALhsiwE9Fc67yCWV31rzuYaIS6Q0eYmkgq9Ej0iV1K2q7spiDpmhoEtUV1LvEkAv9uLzEQOv47H+UKgzIBi/ZaIzw9dp1ile6rA9c3MiLcyTwaqEyvXImhaoOpJCA1nGOBoMwpxQOu+3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781134; c=relaxed/simple;
	bh=byZn94NxoaGSGigXnG3B+BNbKvcykYDcIYUg8s93bqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=piOaNHitVCAYPt0Irwl5dLkLwl24zzBuHaP1TIuQxggcy1rla+VlA/97dc/fSDe5Qufx7fANlIOpyM21nUL8ZUN4hDxK7yBmg5d9e2Qfq78/UaDqDfMmRxIPqs+LHRJtFP9gTHKBODgbLmx7eP6P7KXMEUrbGPj4CYtwk5oMVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G28QXw/X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G28QXw/X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso35011895e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 03:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774781130; x=1775385930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUtx9MBrKKdVVK4+rruGEsG6IE+IP4DvHcD7OpZeCTQ=;
        b=G28QXw/XBYoUhb8YhtiwcLBvgL+jF11OWdM7dsOfMNz5E8HNvKNEM2g1JCt4+dnoaI
         5+XU9ofzHf9wUjBGXO+zFhRJKbVUCIiGRzhC5BozPGtlCqsvN+AzHr55aOvytHQKJRNN
         u2tduL0gORjn1Ho2cqIeQ5MoVxhZA3lQR77820KbBOqmqbyGhibEVO6/DHi8kbMkLJ9R
         x8lqhNgC5l/00OuYcrSOg1zeezrBD29Z1nMwHqxFAXx4AeifUBx7iaHZO4dwnzHbQGzY
         DnEUyXF0mD0aOzopSxzD4CITpiBweHzexNe/l42ahKS+aKGUz2yqpA6zdBBBhp66Aupn
         pvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781130; x=1775385930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUtx9MBrKKdVVK4+rruGEsG6IE+IP4DvHcD7OpZeCTQ=;
        b=Fvfv0K+Sb+368rCdM6oU/V4uZZ36XSYaaHRy/RRkFY8neKvy3r9akg6KnP+qfRwAk5
         qzs9p8TivmTPO5C3EwdVDDYy+lYmrY0gHaLkKvyUWIJqTHTxZH0lf/q+JsW9+1VA+lpq
         lmul79gTQp1sXKjG/dd2rvZh6KJ13dE3N2OB8rR2Vw/TR435BcA4YpPLIq56dU+lQ1ui
         xUuXG2o65kh066vEuwIurW4N36uNBCtrWwC72RyJbhaI8aJGCwSAhreglj3t/VB8z82L
         MVwfor4wgQbCVwpa1OdwBaPdJFlDGc1B/b9h2LAcvIeoj8BOYoGaYkJoCkZ+4XSZMZFq
         nrzw==
X-Forwarded-Encrypted: i=1; AJvYcCX5CZoj0wwU98SWuj73LSO1dwlKQlGGXt1Y85scbDtjH//eDZWR+Rm0xXfTOemcP8XhkKX6slLZWyy0o1YGwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPcGyrvGrHlKYC/8VaCQhyk3C32BSrgBbVqaA8fbsYur9g751O
	pt15stsrID2JT7Y45k6GoWgdOTalEv5sgSAHxVRzFODL/kG2d0AypWU=
X-Gm-Gg: ATEYQzzoSJ9zkMs78zuEmryhILvDn8/knWz6VqvdsGtm8Nnk6JNAnasJ7Slqw41sqDI
	X1Vt7sHNex6R8bgbrN5N+TpNW9LQ4ftWjTPUp8BdR6Lg5Zw4R3xDRgHsNa+eN3GktpwDmdhbK1u
	w02VzJwzUfROL934tTzFcYhTqanOL7CK0ksz5LrB+DOMup86oLQRrfZ1cSYdKKL1R8zuOXy7VeQ
	P/UiyAO/f5HstISw9CP0P6yVvDMhsrMBEnXr3uUda9E6aQXMzv2DXbasp5QqkoSrHUV5pjxDGgl
	474b+k/2T6boBXs+4O2q2L+7c2rk+4EsNBNcfuRRkafkq4Q3TWu3P+AY9OiHMH7zUMZxkk8CDxO
	1oQMHpdF2c8iIDGagjG+6NMu0FLzZ1AVJAQx9h3mXse4OQQLEAF508CTPVbFMWpDqbBOSo8ys1k
	Nw4fr4wc29b0bAN6TJzFqrgZp9m8g=
X-Received: by 2002:a05:600c:c081:b0:485:4453:401d with SMTP id 5b1f17b1804b1-48727d5a269mr108675325e9.2.1774781129463;
        Sun, 29 Mar 2026 03:45:29 -0700 (PDT)
Received: from panzer.local ([188.246.34.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21ebef9sm11269286f8f.13.2026.03.29.03.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:45:28 -0700 (PDT)
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
Subject: [PATCH v2] rust: error: clarify that `from_err_ptr` can return `Ok(NULL)`
Date: Sun, 29 Mar 2026 12:41:10 +0200
Message-ID: <20260329104319.131057-1-adzicmirko97@gmail.com>
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
v1 -> v2:
    - Move the doctest code outside of functions so that it actually
      gets executed.
    - Instead of asserting a magic pointer value that comes from a
      hidden module, simply assert it isn't null.

v1: https://lore.kernel.org/all/20260328114005.125617-1-adzicmirko97@gmail.com/

 rust/kernel/error.rs | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 935787c2a91c..e3e8ff775e0d 100644
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
@@ -466,6 +469,35 @@ pub fn to_result(err: crate::ffi::c_int) -> Result {
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
+/// // SAFETY: ...
+/// let einval_err = from_err_ptr(unsafe { bindings::einval_err_ptr() });
+/// assert_eq!(einval_err, Err(EINVAL));
+///
+/// // SAFETY: ...
+/// let null_ok = from_err_ptr(unsafe { bindings::null_ptr() });
+/// assert_eq!(null_ok, Ok(core::ptr::null_mut()));
+///
+/// // SAFETY: ...
+/// let non_null = from_err_ptr(unsafe { bindings::non_null_ptr() }).unwrap();
+/// assert_ne!(non_null, core::ptr::null_mut());
+/// ```
 pub fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
     // CAST: Casting a pointer to `*const crate::ffi::c_void` is always valid.
     let const_ptr: *const crate::ffi::c_void = ptr.cast();
-- 
2.53.0

