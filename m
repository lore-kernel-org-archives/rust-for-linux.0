Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267281A01DD
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521854; cv=none; b=ZXmSfcQRSFjWwdHC/CNeUV8EX3f6aygoCu6oVr+AaDoPJSkij0+Fh1Ot/rg2D+pGIkVTQe1WE6WhOTPoFMADw7rxgl3cCExOKyBQYhAL/buCoGrg1WhJ5mdJXJHcPvkEG/QXYa8+Pa9ccelSMA2sYLEgRmcZDvZJtQTKbJwRQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521854; c=relaxed/simple;
	bh=ID0Qx6uRzSyI8UsaeoYmy2XJrp5e9gV6+IqUHy60mS4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=f3I0m/DPLYn8F0lZfuMw/JLkOPoYHfWirj7OhArQdqLXjuzLl8kD81AvGDt85Edb5h/hInQRwu3JnthfY/NpSzQbqnUKjJUluitdDPTk3hO4nxFSvbgPTIkCU54Wd3SP+8tlY/JxeZNlA7SAJ7IMpx1Zscg0RAr0G0A3vZalGSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JxgeDikD; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JxgeDikD"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-42807a05413so42805505e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722521851; x=1723126651; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ynun/9esMkpMY1yT6dQ8xYC+qNYLWr5FedQ41e+8p/c=;
        b=JxgeDikDcV3MjWPzgDlOh8zXUZKrQgLNS/QzEPXAIa5hK8qekUmskP0f/5fMj4I1Vc
         wz/9yTgYf+RLPgYFcgKNiy8QKRmuc5eST5xmMHSnON6Bi/bZDX3ZeWx7MEVEj4bCbccZ
         X0KYVT+2P0R6hgWAKQtS+Db485PlD90ZGGiFZ9ypGREH4v0qgN5FABGE6Yuevdo5d0Jy
         aHOymECY3VRGW7w5sAHN6UTlGTRGzgF+HWIYpD4ima4B9w+2y03D0KCkgpnpvx9fluRV
         txxUxR7Jb0UjYQsm4kvM8YS0dgAIspiF8r+jcAnPNH3eiR0YnzQENBimqB0TWDeeCx99
         HugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722521851; x=1723126651;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ynun/9esMkpMY1yT6dQ8xYC+qNYLWr5FedQ41e+8p/c=;
        b=Km1TlmU27gIfJWipPI2CQntjICuIHISWxazTLQCsnk7wk23U3/CKHe8qRCbgfHSD9d
         3a2fKoWWgcPlbKaUyMuUjA3g85oqiW5Sq+JOPgqgqzkH5ex2BXVS+h/fy+B9bBuwNXjL
         gUppk1biDfP0rGo6v8sX8hjRCJlen4w4zbtJGKjx7fLq9oi1KdJJIvwKls4iN01NBOtz
         4GMwrykU4jXbwUuFLjYfTBS1dSJFx62CgN0xQkznQXsnjjwNLEQcMJjCz2brxnHm5vM8
         kFNuHgerYJx2RskSoVMWfpX5y/4mzlPbPdiV4tiasOUnNTsrxBe3ZoDrTVXrX2P+tbtm
         k2pg==
X-Forwarded-Encrypted: i=1; AJvYcCXbFpfdvhKvd8oT+JvDP4YzkHnWXHmVc1EU01PSy6PMzRC8Lii4PVI9Ix0ka1oCXzUs0DVlszayGQQ6fZZleA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/Z9HubBx4P4Khq3GLe05X4nfD6OFWBvMjJehO4AHTPxvsJIj
	U+c7UaTNv/ITfcpJtcobKsDuw/UI7UMGhda/yg+dXzfEEMX1upxRb/nlNpOueAu8ZibThwsGONa
	hfQAZ3HDBjGJ3hA==
X-Google-Smtp-Source: AGHT+IFYistYzzBiqlOSKkYa0nYm53OYLyi0A+CJ5VrdEt5X8xh184vfBqg88znekblK4l13TL3Q2DEQnqlE6k0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:adf:f94c:0:b0:367:60dc:9ec4 with SMTP id
 ffacd0b85a97d-36baaf121a8mr3721f8f.6.1722521851106; Thu, 01 Aug 2024 07:17:31
 -0700 (PDT)
Date: Thu, 01 Aug 2024 14:16:58 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANmYq2YC/x2MQQqAIBAAvyJ7bsE1A+kr0UFqrb1oaFQQ/j3pO
 AwzLxTOwgVG9ULmS4qk2IA6Bcvu48Yoa2Mw2ljtNKHPHFDimTD7G1kP5Kgna02A1hzNyvP/prn WD1oDLpdfAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ID0Qx6uRzSyI8UsaeoYmy2XJrp5e9gV6+IqUHy60mS4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmq5jbS9XRmDtCPIqKt7kx+xjarhEoljVV9c9NJ
 njTES9cf8yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZquY2wAKCRAEWL7uWMY5
 RsXJD/4r5p3+lIot9ySgE2l9bT3+7XuhGerH2vR8VvQU5fL8jskbwn0iJ+dcStD0SAK65X19jPC
 1fpvXM2B/DOxv9LOcTc9ayu+wP45ylBscOxDcZFCJrRlJe+1YGEvO1z0glfAZbBTD3kVBlG0Yhp
 s1WgAoUrSVAgYnH3bKiIDvWVbyxOaExUEwQKSxQ4E+X5rMtZH17PlKZOXxw2UQmKkq18BQh0dOz
 MIeItxMGjXURVZpxgjFmnG29jLbpvmt15wSv2ID0pagx7jqEuh5moEPY2b/Y2SHToMnrEdeyGE4
 D3gbgJxeIcF5uWiVGt7bhqMwguUqSJcdx0rcsB9p2rk6sOfzOB9K6rksmS+LZIc5+Fg+PJDZLAZ
 kLsGyhOD23gzqPLocpQ07AzyJyEGLPQwzmxhEgRp9w2//vUDf9o3x7gt5B+7XiXWJuxT7EJGi/w
 pnc777bHfmVw7RGa2Fq+7DVhBkxv64A615I0mNhd8qd5swZY3vDv052gFRRmqugWo/6i+6HqvSz
 pNKTF4cZr2GcedLAOTmBLQPY5ng0E8xNUe7kVX8NMWWltq+ai8EM0N1YwJwc8yrMWXXkW26OZOV
 2rlLhTwx9C3cKWB/kpLIRYwsjHJ8qW6fj43AP1OfWNzZOE1munALcK7blaVXF/UsU+vNlH+fLlc mTzyuyh/hKi8UjQ==
X-Mailer: b4 0.13.0
Message-ID: <20240801-aref-into-raw-v1-1-33401e2fbac8@google.com>
Subject: [PATCH] rust: add `ARef::into_raw`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Add a method for `ARef` that is analogous to `Arc::into_raw`. It is the
inverse operation of `ARef::from_raw`, and allows you to convert the
`ARef` back into a raw pointer while retaining ownership of the
refcount.

This new function will be used by [1] for converting the type in an
`ARef` using `ARef::from_raw(ARef::into_raw(me).cast())`. The author has
also needed the same function for other use-cases in the past, but [1]
is the first to go upstream.

Link: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@google.com [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This change was previously included in
https://lore.kernel.org/all/20240801-vma-v3-1-db6c1c0afda9@google.com/
but is being split out in its own commit at Danilo's suggestion.
---
 rust/kernel/types.rs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index bd189d646adb..83f20f589ef6 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -7,7 +7,7 @@
 use core::{
     cell::UnsafeCell,
     marker::{PhantomData, PhantomPinned},
-    mem::MaybeUninit,
+    mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},
     ptr::NonNull,
 };
@@ -366,6 +366,14 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
             _p: PhantomData,
         }
     }
+
+    /// Consumes the `ARef`, returning a raw pointer.
+    ///
+    /// This function does not change the refcount. After calling this function, the caller is
+    /// responsible for the refcount previously managed by the `ARef`.
+    pub fn into_raw(me: Self) -> NonNull<T> {
+        ManuallyDrop::new(me).ptr
+    }
 }
 
 impl<T: AlwaysRefCounted> Clone for ARef<T> {

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240801-aref-into-raw-e0518131442f

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

