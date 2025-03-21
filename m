Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547802248BE
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742559030; cv=none; b=f5CPfkBykbcsyq1Zm5WHad1RiWN5e/8r310amXkNfC2HOWiepJgEXKUr+BaKvW3ezf3vIBTMvLkBmXFUEYGZWmfYxuHMYQXRqi9eC77p7K37wx8jDa+HU1ky5EAtTunYtpFtBB+SC0lwhpHOVXjPxC+6hjV0bGctX9C6Hvi9OzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742559030; c=relaxed/simple;
	bh=TulV6My3X/Pv7lQZ0jbzI/s+3T91OC+LBGsc12t3AUM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bdAK7y3KxSi+oNLVrm2N2+C5PmDQG93Drz+7gp3UJm19JPANTv/5xu/5tF8kxCbKkng2pN7IEZF1eGNhuVG7vv0c51s5WAeCQnkZFqFS+QYw3eqlzFT1zuh72f9I1knahFYMs+2OegcIS38TIpHxIVs0EiTLEce4q74fXOh8saE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cPgKZ/yE; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cPgKZ/yE"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3914bc0cc4aso955177f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742559026; x=1743163826; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQmdkift3Su0uIdxp4srCVh0Efk/lmcsN2cxpYCwzDI=;
        b=cPgKZ/yEL+fYdDaJgLLFj+a+5exQh2DIrspEzHjQt2tOtE2yRJ0q4bhhwGG/D+jKYE
         uIuRTfB53QIvCvGVlSpxjZ8Aim0UKw7VvWnrPTbSTbbgMBFE4jA8PAiSIpkJNisOKU4D
         Lzj8k6QQbGW8jnQsd7BDE1JT2yXIE/e4E+xOBXrzwl60jNiCnKVMyKAYJWmHxYOJne0m
         QAzzmHeJ9w9KI/YR046QbRV7924A/5Va6Tm0t4y8kZfGZMiHqlE6L4J1r1eXYzlNpLsV
         mdG0eNmkZSX6JFPvtiSnZxICWovKCsjFbOdDdzKs3g0bPPDYth2PFvUS+J0wAABcd6Mb
         XS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742559026; x=1743163826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQmdkift3Su0uIdxp4srCVh0Efk/lmcsN2cxpYCwzDI=;
        b=c0k5YSRnnCWYwrl2vkU65kornoyWMkaB9RpNfF9m9e5B19M/8ftS3uL5nM9z/QzUU7
         B1L9C3KWLDKwTYFThJn0RyQIVGRTNnufqSpWKr8DA+GJENGi1kFC0O//mDaFLtMQK18k
         EMG0kT2737rKx7wRRUl2dc08f+wXWpdbM3tDKpqh+2a1s2cT0FLLtIAUMfhm+e109NIm
         2so29ww1sfp8N6eNrbKXJYvLrx7dzOg3qCi4L/MN0llwZLdANE01kc+J/TN3qtiPActW
         8M3u1U/ZMsypif6/LBtpCSJmcbeHaWnsHpnO8dgClIVudU0r5hLxalFxqTwIK+ckqG9i
         vJGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8sYqGuUPHfeLU8nmeWDpqhRmuYBryEv4UD8Q1mKsuIVdkPz4/gJD1ejRPnl+1spBYbftt33APZtPhM/qtvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVnDxBektyT7PX4ruUwVgcruwzCOrpdJnZByh9Yrfz/kE8i+wD
	9sY46VnaqmZIxMtE+20fTYx7nyw8EShOVcOS5iL3vp0P8w90UVJ6zVSTy79F/6kMtj90+fjHIUb
	JxbxYFWp/KOFylA==
X-Google-Smtp-Source: AGHT+IH8Dfv+WZcG9sSAF+pG+9WzdD7a2AlCaDbBDGJDmMjPJZo+A4V8E4Z1Q47z5HJ0WzxWWDOCbn14ESFYpmM=
X-Received: from wmbfl10.prod.google.com ([2002:a05:600c:b8a:b0:43c:f122:1874])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2cd:b0:391:412b:e22b with SMTP id ffacd0b85a97d-3997f903a95mr3381007f8f.18.1742559026780;
 Fri, 21 Mar 2025 05:10:26 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:09:57 +0000
In-Reply-To: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=TulV6My3X/Pv7lQZ0jbzI/s+3T91OC+LBGsc12t3AUM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn3VcmhoW3khohXPFzA6QonRmk0NHq6nP8ON96Q
 kADkcTEEZWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ91XJgAKCRAEWL7uWMY5
 RtpSD/9+sKJQlgNeJ9Yp5YwX7uyovPbbm1lkOL8QzsWVlezWA8jAxhtPtrhySh6VSLkTd+4DQbt
 g2NspHynxWyiV+O8KMNRjccfXs/dA3XDIJPQ0cjPjfSM2MfsHi36xiaWXf2uljpaArxkVp44SI6
 eWS2dBoSi9m+P8084KZ+yQQ/HOxa1GpLjM+PiAJttvJXGNSKHDBIn7aRUB6T8mRVpeWo7cu0ZCp
 XQsYIlVks9/IENzEbY4qfxYAXlSudkTZYMt2nc6SS5K+qtTAJFm8F+/iB+KZ2RC26ojhoxP5kqW
 I/dBiWCVIxo6aUlkl4CWjx0ehgu8lWUs/GsXhyMWqcl3sSeImVYowwtVI/t5b/vlSdELcSBb1Ma
 s7UfU0TCy2f2SQk7SJpWTzu9+HzqulXefre8HnaF3EmOlk57Zc2nw0d/UF0AC2F+DDdAAeRnRup
 a5Nxl6VsfU+0jvP2GrSl8yML002eiTssCYEFX5UgTnEh+mAWoUmTTEbvt3UgiMyJXMO3Dx9t9EF
 4FnUWAvMQSXFT5CkJXDOwoxjuEBPsLmZthLtUoh1FTV+5pjlMJ1XeqIyEludXxjEgcnM2GJQtA+
 cTSepSzyyb2EEKmVsraebFeoQhw6hHSiSR4nBPHFo/1poMsa6aIHTMVBjCKA+ZPZhl3l06lTGx1 jupHjO3Ezqb7Hfw==
X-Mailer: b4 0.14.2
Message-ID: <20250321-vec-methods-v2-2-6d9c8a4634cb@google.com>
Subject: [PATCH v2 2/7] rust: alloc: add Vec::pop
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This introduces a basic method that our custom Vec is missing. I expect
that it will be used in many places, but at the time of writing, Rust
Binder has six calls to Vec::pop.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 95e752ed27395fce72d372976b74fb1b0e957194..e42c5c40c992c796409505da70975f970524fc24 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -302,6 +302,35 @@ pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         Ok(())
     }
 
+    /// Removes the last element from a vector and returns it, or `None` if it is empty.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::new();
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 2]);
+    ///
+    /// assert_eq!(v.pop(), Some(2));
+    /// assert_eq!(v.pop(), Some(1));
+    /// assert_eq!(v.pop(), None);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn pop(&mut self) -> Option<T> {
+        let len_sub_1 = self.len.checked_sub(1)?;
+
+        // SAFETY: If the first `len` elements are valid, then the first `len - 1` elements are
+        // valid.
+        self.set_len(len_sub_1);
+
+        // This invalidates a value in this vector's allocation, but the Vec invariants do not
+        // require it to be valid because `self.len <= len_sub_1`.
+        // SAFETY: Since `len_sub_1` is less than the value `self.len` had at the beginning of
+        // `pop`, this index holds a valid value.
+        Some(unsafe { self.as_mut_ptr().add(len_sub_1).read() })
+    }
+
     /// Creates a new [`Vec`] instance with at least the given capacity.
     ///
     /// # Examples

-- 
2.49.0.395.g12beb8f557-goog

