Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A814F1D63E1
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729078484; cv=none; b=uc2oZmmoLqY7kQBEtZB+zu+yG7BeTCO3UAnuWO+VQN1vUuog1a03t/APicPDV4yNoP47BAkIJLflGz62On8e/O13WXGmn/YWCq4qS9UJBj/huvXGi7C7yPzyGTnOVd+kh1Ht7wswTjEfKkTf8BU4JGTfSGFmXspgD9e72Xz0BCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729078484; c=relaxed/simple;
	bh=FASyUf1saphfaZbw5HzqQHkzRL2v/xQtO8LX2AzMsdU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e+CyJc6+WE7loQeyKtpmRwRpz4Bu3YdvcRGxaOiLNdcGMY5+teFgjrioCfpT/dfSvvZXjSjiBqF6tKpAR5sJl+pAgeORCuFAB9AKVHA0DmC/ED35zHp9bOZ/CpTmzyliFuny3JWjFnQ3AxfvQnweAA/Ee5UGFjCHYzznwPzWXQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jXCKUER7; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jXCKUER7"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-690404fd230so119828527b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 04:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729078481; x=1729683281; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MALXvk2pH8I2k2u/nrpnO/yJTvhOpCgZg6TPQyQ9Tdg=;
        b=jXCKUER7sMuJpsjFPjGfNXpmnnilcD81k5aLo9hE1EU92QL7UPZkjlv+YSZgpY/XZL
         yaJr3a9TiGqYSEM5ECgOFMH/w0JxxxxwwwMcODJll1hytk4BLX0FRsHw4UlFxZxOmIoq
         qu3xygr+Gl7w4yCkADzIyrDkYXI63KIm+t4I2DtbdtBRhLYcoSdTn1nVO402rwYgmLI2
         9TJoy+3Rn446bXq2oCSznRrwcy4BvRXvJlWQSOZTAmwi0dFUeI+WxBXxdOC/paXaj4do
         VlgT+64KXsq0+26GG+wEQQZCNVw4drzyS81b3rhYhVPaBrkh3dtv4voWLxTVJDY8K40y
         E2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729078481; x=1729683281;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MALXvk2pH8I2k2u/nrpnO/yJTvhOpCgZg6TPQyQ9Tdg=;
        b=QD1FGnGUiuwKyobuoXTXjElPmOcGcC3I1tFc4UGh/CBEgNoPRRyje6Z6BcWQpz8f3u
         ESPm/PYaw+cWvGYzfYB3wa3shQ8VoCC51Xzpeio1ArNCLMtjt1uDJxHudiScKDS/eUI/
         wOdWfcwm9PDjLsDo/0/gz3/z3ZID0VN4qkqen49ExylloN3bs5Um1Xhz31Fo/nt1p3gK
         KXWgD2Lc8FWpzgFphEoCm94UuW2oUxP0sOGlgXDCHTYzEGA4Zt7G4mkVGX8H8vczQ1gj
         bKTy8gniypf2CFDg3Y/cq7vp94AAcxkPR942uqyCWloKX1Ig66+IRMJ8pUUCSZHpP8Ah
         NyWg==
X-Forwarded-Encrypted: i=1; AJvYcCW5VbJqs+iTE0+UFoXVsyGuGO2lVd2KmftrygwBaQGSXOcmT9F7i0JtGvV7eY9Jnc1ewDu/VaAC76Y7gR3TIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaohVbeT3RHAXGjpuEpbLrrRRR7ZReDmKtWyZLuzSCHCJ24k45
	MpMHyUAd3F7g7vvQRFctx+3qWKr4Xe6S/0aXe7GUvXa+D9jzHoszqrYh9733eusTYzB64tyeCJR
	bbraeH4h9EiSX9Q==
X-Google-Smtp-Source: AGHT+IGfRBqsOD2gGU0Q/tMktiVo9//GJQ0UbhR+dW9OD/x0wD05SndfGUmQvGwGLXuBq1JNpcneuDfyEmwqT64=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a5b:546:0:b0:e28:f19d:ed4d with SMTP id
 3f1490d57ef6-e297856f63fmr2163276.6.1729078481439; Wed, 16 Oct 2024 04:34:41
 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:34:25 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMCkD2cC/22MywrDIBAAfyXsuRZX8qKn/kfJwehqFtIYtEhL8
 N9rc+5xBmYOSBSZEtyaAyJlThy2CurSgFn05kmwrQxKqhYldmLX1emV/SYG6pxuzdDhTFCDPZL j9zl7TJUXTq8QP+c748/+3WQUKPrRzXace4vS3H0IfqWrCU+YSilfqC4cwaUAAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=FASyUf1saphfaZbw5HzqQHkzRL2v/xQtO8LX2AzMsdU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnD6TDRlj6OCtorsbkl4Zx1Ncki8FT20tIyymhr
 t0bMM3J99OJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZw+kwwAKCRAEWL7uWMY5
 RjzsD/9MGtoHTc3tWy/FcEwTs19PhkvgcFc4rA9v2okPpqYrHx+wNdDavdQuuxysi7X/oi/Kw9N
 Tah4eilyoGLrxKSzQ+/kA3p9haCeodxjLtzf7sK8JVhpq7Pwd0Aa5cGv4kvFch3Zu9y9Q7etpOg
 8sqgNXLswBGwFZoYaYOup1erzww1h6uajLSoaYK4zVQxXow240EKaqLgZIrgIBIBe7/fUg1U0xq
 4iYCczcu+kPnoomPiT6lCCYUedEUa+lQejHmXcVE+Qc5J+cAKk0wcz2y5/VjXG4l0UaaEGKyG5D
 LXHYh+ZBb22eQSRWsKXAkvI7X4z9LP8RqzcQxEqrsJPFcLqePfJ6yDLg9H8GCy/F8VSgHLoK+Ru
 bSSNENSd6kBEyNyXWPlRQIxByzx3QOhc/KYExoIa1WSG4GhIyCBns120U5GC2waj675Jj9XDqYw
 v6TGLRbTcfyoSf5XwFdhYC0Fbk4lBYOv806NoFhWYPwPlzKKth9xC+pwSo5ZEpLcCi+GoxSfjMY
 GX1Wg4+7p1ma+0dTDAjA2Dz0zhjOihmF4ye/AOyaSBSIFLfD6R8VzLTw3MqKza8z6Y3PfQYhWcw
 iOYVnvJgZeFgpe96jDP/4sPiga272g0ey+Ep4swWlbrd/glIXe70FCOYeHP87BXOnRAvAASAjiR NC+MM5j4FhDPoEA==
X-Mailer: b4 0.13.0
Message-ID: <20241016-page-align-v2-1-e0afe85fc4b4@google.com>
Subject: [PATCH v2] rust: page: add Rust version of PAGE_ALIGN
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is a useful for helper for working with indices into buffers that
consist of several pages. I forgot to include it when I added PAGE_SIZE
and PAGE_MASK for the same purpose in commit fc6e66f4696b ("rust: add
abstraction for `struct page`").

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Make the function const.
- Address integer overflow in docs.
- Link to v1: https://lore.kernel.org/r/20241015-page-align-v1-1-68fbd8b6d10c@google.com
---
 rust/kernel/page.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 208a006d587c..9ef01929e7d0 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -20,6 +20,15 @@
 /// A bitmask that gives the page containing a given address.
 pub const PAGE_MASK: usize = !(PAGE_SIZE - 1);
 
+/// Round up the given number to the next multiple of `PAGE_SIZE`.
+///
+/// It is incorrect to pass an address where the next multiple of `PAGE_SIZE` doesn't fit in a
+/// `usize`.
+pub const fn page_align(addr: usize) -> usize {
+    // Brackets around PAGE_SIZE-1 to avoid triggering overflow sanitizers in the wrong cases.
+    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
+}
+
 /// A pointer to a page that owns the page allocation.
 ///
 /// # Invariants

---
base-commit: 8d8f785ceb21b9a0de11e05b811cc52d6fa79318
change-id: 20241015-page-align-7e5fa4c751be

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

