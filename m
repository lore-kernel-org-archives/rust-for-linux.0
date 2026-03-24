Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBC130ACE6
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382573; cv=none; b=bBpDSqayLJEWl/wVXgah5ZsHsrOuR+nUb1xHu+5uFDEyO+qOqSvKS0VKfZ+vVXnDlh/Fvg8Sng8vnhAbNwdiBVGcU3jQn5wpj144XtS28iL33g4aLsmlzaHu/bVnmYn2HNzDbY+MXbtFXJitA6iTJxXrHfC/xxpkopG+rQdSOxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382573; c=relaxed/simple;
	bh=fFN7lYugJ/QOgXO5yWuBBN6eYrZehQy1s12OfSqPlJs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I0biCw6yrzGA75rxAHCtsZSTXNDRg4lAUAB/3RS8JFDPYdVEpQ/DNXvh9YuvvdgvQSD/l0+dX7qOlwefaf96CigZfOigcnIffq+mFC6L+9A4EajB1dEkii5lJk08JRZAaGQ4mWJJLASDyiwvFAnIZ6E9MDZaHWgbyy5JdyEQcw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=elo8UTSF; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="elo8UTSF"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43b4e102d77so3536287f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774382570; x=1774987370; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Bwpp1ufcceKLHFlGDegFIy1xoIkwFlNP/wIyy6koCQ=;
        b=elo8UTSFqb7Ho59kZoWDJQNqlbVAY4eVvsomjzFVZWroxsPNmyr0O6EzTtczJ5dy69
         VBnjMHzZ6EKk8CXh8w5BENt/+Vt5HxL0Wz9oFCjHMHFN+PTBiuIgG2QKSBOc49ILZdfc
         KQxsUvoJTsWVGx8fWRujOsywa0geufc4XK/xKu/uiPuHkL8/rIVWcMNoWYI6gu7fTRz7
         5kySQnps3VDm42ePasYANwxoz6AxpX+EamwXGd+KwT72mxHOFmYrKARMok14wd1UzWx6
         d9LyD8kGpxd0EQWXYCh5T1/61rTIOhjVnPb5A54x/FeWKUVFpBljwGkIaFnMWF/tUuct
         +Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382570; x=1774987370;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Bwpp1ufcceKLHFlGDegFIy1xoIkwFlNP/wIyy6koCQ=;
        b=g5I/JnWAUep1ADfdkdTFPRqQ6pSxSrCguSkrLgLxP3wrYRY/46ataCszGh+sUYIf/c
         deylG0aMc5ctXbJxDqmNpMIuWBGgU0I0q5wDFlxSO+dJ3LwvM/gTrb8mR3IZlbbV1zly
         SHyzpKSwym/eyVdOvLXuNwa/ib70R4yy/u0X+YtDjgHWNSQvm40575XG1gCS8mjqs/1l
         URxVoK6CuozDOYDi/tfAcxPj+IQYYTb3r9aCJXANpMHd4BZNT/dqlS00Sz2tpBkaqgpA
         LJlCDzl2tvmlKb4ryTqtm4ptcj4uYn6VOtp6sW8nHpn6UAkM/M55MzqfIDi3Bomr4Mv1
         etQw==
X-Gm-Message-State: AOJu0Yz14yhONOl6HT6LcOTI4OUqd4RgzFsdUgB7gVh1cdkFgvBv5dgg
	PE95IirIcfVhgCWhFPLu33BxIKB1+I38zsV6ES5TphmvCcGeR2zQwOD23rfsy/+KA0gKmf117BV
	8JKsT6jDh56jbkRF74Q==
X-Received: from wmtf12.prod.google.com ([2002:a05:600c:8b4c:b0:485:34c3:177])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b12:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-48715fc3286mr16459705e9.1.1774382569992;
 Tue, 24 Mar 2026 13:02:49 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:02:38 +0000
In-Reply-To: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fFN7lYugJ/QOgXO5yWuBBN6eYrZehQy1s12OfSqPlJs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpwu3jLX17ugD1zE0Q7MbvgEEf8tsq/mb0xZ0J0
 AJYF2+uOR2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacLt4wAKCRAEWL7uWMY5
 Rq5iEACy0yQ/9DHDVHZypadhpRQLSdfzjU4/rBZzVPrdhQklr7fPTyH7BnqgukTCKJ4LoQN2Wzo
 z4P9mdvgfaepsWcIo8jmQBKEuxCj/y46bZHvxHHId6osa5tarFT6o8k9g/C6WqFu8Y6ZkatCOtW
 aW+j9dfIhaxqJZnhe9Z9EqFbsu/uBRIe9uUVP8lFuLNvuLuht7BZRYhT5Lwi6vGcoXIKcRENOXU
 j/P/GS0q3Js+K8Yuq0ikGuIt5FV+UkxbYnNbTaMOLeSJPt7jDdVGXEXC5uEboBa1YYsAMj5TmvP
 Uv9XrrZVs8ZVR1Qi5Mm3Bpykgh48CpkAbMt4epi0puirH/LZENvmAjUZnQQaaVkTvel+bBXNLj9
 DWrp84QfK6OnCw7SzGfYzfyp21SELHebWpy5guaRTzsAigbm4VJm4buW88I0cWaSMkeFAWLmC0l
 MrtcrCGxxutuATrbx7TPNDDsQGk51EqjwVfU6eko0ayTgAsUuome1WfyJMrtg6p0smpp2XRrqHt
 vhqPYyILosVSJ9aQEXlRikal1NE4vTHNVd78oxsEw+OxGTQQ+sLh/sJXQpQjSBhKgBiJ4WXK2DN
 TcIc+4+umtNmlQPAF66zToUAp5Hx46qq4GAP/tft4GtwDuyP+d/b/prDEFQbHmkpU0Vg0qLEeTt sYLKxhaykIbnroA==
X-Mailer: b4 0.14.3
Message-ID: <20260324-close-fd-check-current-v3-4-b94274bedac7@google.com>
Subject: [PATCH v3 4/4] rust_binder: check current before closing fds
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"

This list gets populated once the transaction is delivered to the target
process, at which point it's not touched again except in BC_FREE_BUFFER
and process exit, so if the list has been populated then this code
should not run in the context of the wrong userspace process.

However, why tempt fate? The function itself can run in the context of
both the sender and receiver, and if someone can engineer a scenario
where it runs in the sender and this list is non-empty (or future Rust
Binder changes make such a scenario possible), then that'd be a problem
because we'd be closing random unrelated fds in the wrong process.

Note that on process exit, the == comparison may actually fail because
it's called from a kthread. The fd closing code is a no-op on kthreads,
so there is no actual behavior different though.

Suggested-by: Jann Horn <jannh@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/allocation.rs | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 7f65a9c3a0e5..691e4af5c1d0 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -260,19 +260,22 @@ fn drop(&mut self) {
                 }
             }
 
-            for &fd in &info.file_list.close_on_free {
-                let closer = match DeferredFdCloser::new(GFP_KERNEL) {
-                    Ok(closer) => closer,
-                    Err(kernel::alloc::AllocError) => {
-                        // Ignore allocation failures.
-                        break;
-                    }
-                };
-
-                // Here, we ignore errors. The operation can fail if the fd is not valid, or if the
-                // method is called from a kthread. However, this is always called from a syscall,
-                // so the latter case cannot happen, and we don't care about the first case.
-                let _ = closer.close_fd(fd);
+            if self.process.task == kernel::current!().group_leader() {
+                for &fd in &info.file_list.close_on_free {
+                    let closer = match DeferredFdCloser::new(GFP_KERNEL) {
+                        Ok(closer) => closer,
+                        Err(kernel::alloc::AllocError) => {
+                            // Ignore allocation failures.
+                            break;
+                        }
+                    };
+
+                    // Here, we ignore errors. The operation can fail if the fd is not valid, or if
+                    // the method is called from a kthread. However, this is always called from a
+                    // syscall, so the latter case cannot happen, and we don't care about the first
+                    // case.
+                    let _ = closer.close_fd(fd);
+                }
             }
 
             if info.clear_on_free {

-- 
2.53.0.1018.g2bb0e51243-goog

