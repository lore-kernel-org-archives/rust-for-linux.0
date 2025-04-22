Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E22202F93
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315560; cv=none; b=OhFZyN3M0VpqB6QGlj/U81UnT9rdYNSf1pXw26HcrGa4QK7alQOIrYtui4+gpw+92owDcUP/ozBFg+5sGQjC0nDWceiehi1SPB0lUFCDwrjJo4Yq2y8etzptXsx9psw3yKyThd6tkmT5a6ik8CodVooB3sTq7+34iduqg5YvP5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315560; c=relaxed/simple;
	bh=r/AIeXn4zZXcrGMzPV/Q2i0OF1Q5m8H0R/fE8eZv6Bk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W9+pOJHtuUlIR4yekpQ3UVrQOGaq4/btZpN/MuTw/KRTfGBgVu4H+dDmDoLOb3mPth59FIHMl4/6plPUBlYF+uWrkodtef6ola29dhWBGaKXTvlIRUg409ttc9hDEgSZ6fh0bvqGDGrYPimq2fsorJaYyV7Jf897205WobRZ8eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J/BOk7jf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J/BOk7jf"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-440667e7f92so22089655e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 02:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315557; x=1745920357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKNE245in3PIS3GuY7V2mOKGSA2rzg5/+glyiQQpl2k=;
        b=J/BOk7jfgzClxDACUcfRpH23yqXtrleUitGEy8J8sLoT94JIL994hTn1jYwa9YDD/H
         HgiGUHg3O0a7DLGEpktft6gUKbDvVOrtd3lpFvfeZ64du2eSMKmxYhvIEGx/bMZ0FRX4
         AsN4JB3eEMwlyCEWg/zdUrtkbImbDrXdOHZoqbXR5axVkZ7dRtcx6lm9CbpJPRvmb7LT
         vsDm/v2KHzU58Dugk57nw3zlO+OB4sP47RTq6B/cVedkjsXfqJESQpBKyXsiGr5slcJ7
         WPHtjHidyhOA2MpV5W4qumL608WatlmEFzMVku180m5nRXYdZMN6wCV0/6ukOaIJATxi
         uJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315557; x=1745920357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKNE245in3PIS3GuY7V2mOKGSA2rzg5/+glyiQQpl2k=;
        b=w5BXHmcJOyJ4jUKE27K2yvfcOut7MFeFbyd8eKSUep54eV4iSVq1CskBv2Seau8Y8W
         nhW+ExaTa6tf8RBNRYCpGMiqxzWri8ER8iTC0I8bFnKKSxaEtU15YbXm8NI1xZLTpDFO
         VwYo9eWSFiDsMW+BkzG8LnH/yqecdIACwxvwDoXvd8cAO5FtwIS1Pxsj6vLqZOjJc0Wg
         CxmF4L9PkuffNSfhpNyZdHaDP2kHeM6BGdfUPsU7UNBzsSYg8P64r6ZB7PcZ46S8+t94
         2KrTR3++eDYfJfZV574cbl1vYTywRjsTsN6LOTsvW7PgggI5J6KB2QI/O9CUefWNwPnN
         hxsA==
X-Forwarded-Encrypted: i=1; AJvYcCUznhPOf+xpzlIl9LF/lCq0d+uumYu+w0Xkb+/0o6dWkFhrwGMwe5tjntvj7IJSmnbRe3Qm581B34YhIvC3iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztEqW5u3BD+Nkd4M0RaVGtzuE4AUnnKJ6PpdyfvUxSVjnSHJnK
	pIaS/bIKCn/vdw6rkl0HV61bA0Y30cktwFKTEjyaGt0Qpdu3KAnwGyb8wDv6iku9F1Rsk8fxE2U
	tIXl7oOS22srJeg==
X-Google-Smtp-Source: AGHT+IEOvPPwDs26K+TVBf3QaYIWrPHfsDsCWs9nC56jmnEiIk5mdJSQ4vTL4uHRTMDIN7Qzb1NmINrUM8IWHig=
X-Received: from wmqe15.prod.google.com ([2002:a05:600c:4e4f:b0:43d:1f28:b8bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f8f:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-4406ac10ddcmr113156465e9.27.1745315557236;
 Tue, 22 Apr 2025 02:52:37 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:16 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=r/AIeXn4zZXcrGMzPV/Q2i0OF1Q5m8H0R/fE8eZv6Bk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bf8gjPFVfFWw2aVpXym4NSNHFohVgwUhLD/
 U8fjnXKX0CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm3wAKCRAEWL7uWMY5
 RqOhEACxUGJNC7vVTyh4bmreZsz1j86f9xlUu6mPiFu7HtCToRZyqlAgDmeJ8KGnTcAu1d9AloX
 PEjN4o/M/XkMICYIgfWpbmAgRxV8BWb1c3PL9y8RuX1TmFF+uJIWbjW2sbFGVkbwSWo0z82nhk0
 S1rcLLsokVlO1Zz+WWQ9I94T5M110/kB+iq24sMTZItiayoY+Bmm6IEtXx3FLPSpgO7KEGC1gwh
 DmyrCD/kaH1KoCUas/YTgii6slLoiTLLw2FNo/2z7J+jygSGeDLdXQGCof8W3jP2ED8EHh51ykc
 g7PSoUCn6dgtcf9oacNV+JFhuHF0j4m/jSKhmOh77UFcmcgwj2lSMbJm2XLnkj9eICA25iRcEjf
 Ans/fE520O/CnOTIQX9/wo6Cw1EJ5YltvQmt8usB/bEtDJ36U1Jm61/IUW0cwDdZ9c5VEZB04zj
 rpn2TtVfqYSFSGIJ+MdG/LJHY9BHG4qOFRMNINkJvPhZHJQgooX95eko30LX/GKINkHG4ddfozL
 r2afFE1sv8uDTY+seg3yo4nmvauCymNgKpxlvOG2m7nVBg63hqU1Tn5Th3+22teIEzVSnJpyMe1
 7Jn0OU281oZu5sgvT100UyumXWq7l6JLfB3/YIGccQ1UqtPfVfiSfTmtH9CTlOozpHmD6Gn8m1t fN9BCRAf5xQ8ZGw==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-1-deff5eea568a@google.com>
Subject: [PATCH v3 1/7] rust: alloc: add Vec::clear
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="utf-8"

Our custom Vec type is missing the stdlib method `clear`, thus add it.
It will be used in the miscdevice sample.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 5798e2c890a2140a12303706578ffa2a85423167..412a2fe3ce79a0681175bf358e8e0f628e77e875 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -413,6 +413,26 @@ pub fn into_raw_parts(self) -> (*mut T, usize, usize) {
         (ptr, len, capacity)
     }
 
+    /// Clears the vector, removing all values.
+    ///
+    /// Note that this method has no effect on the allocated capacity
+    /// of the vector.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    ///
+    /// v.clear();
+    ///
+    /// assert!(v.is_empty());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn clear(&mut self) {
+        self.truncate(0);
+    }
+
     /// Ensures that the capacity exceeds the length by at least `additional` elements.
     ///
     /// # Examples

-- 
2.49.0.805.g082f7c87e0-goog

