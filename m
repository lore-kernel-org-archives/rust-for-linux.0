Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4E0274B5C
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775240351; cv=none; b=Mql+w7RnHCKRU8IANp9MtkgeokzWDKXTVLyjjrla30EUJVjxY9nFPRt6bAmTB0LOeQWuPsJlF1gY13y9iZLgSMOgxZKvTKIxtcaLpLafQkho6dkJGw8K+bWf7nLP+dXz8RwMiGxWExiuV+/JL3TdJcf4xkEHDpmOdx/osNAe3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775240351; c=relaxed/simple;
	bh=DMGcPcUBwjNRDhEevINgkIw7BW2A4126aabjvfS7NV8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Qoc8nj/5dBXRokgfualinpajMd323dFI7X7LQ+f20ex0lAUCd/Vx8sA5r6qsnS00cSRgQydISRh0wjbb7kh3RfHTYAUYuviWrd8zVg887kaP/oxtootWdPZmR3rmrwZ/nI9ic2IBQt3a6wjZ5Oq9Nxav3HkQRSq8H2XGXM6siIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VVJ6jJT2; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VVJ6jJT2"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12bf921cf49so1834411c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775240349; x=1775845149; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OHzTfqMcnozilQQl2jvVwHFhGHS85GHD6bWcBYmuU+Q=;
        b=VVJ6jJT2clb7HrZ5v/+o9LVLc1gEbfcMR0NTzYvUnvogHaxsIG2mB1aRop4lVmvmW3
         NNoAO/wAIVOK2OE7LrCs+N6Xvg/Po/I/Eo9LU/3t42ufl2rjvH9PV3JGUXTKNPcgPxCd
         rUmaJIjc/FwlrDTLNaDXcDvkjyjy2Me68wKLtwPKE3UZ8WyWTJXTbCK96zBDaTbJyng8
         czBmmTuJjknP++zwHN2RzUL7BjiDNjiNlb0tGXZ1aKdC2ObucOwl5byzwZDX1EX5BLb8
         0xfIpcx0xI4hmyTzjLXQWcRuDYtKEvghlnRT6lo8pmmomhXK8UEkMzzRb7lMLnSyHfX2
         cbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775240349; x=1775845149;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHzTfqMcnozilQQl2jvVwHFhGHS85GHD6bWcBYmuU+Q=;
        b=fDA9C5kKdbqEJfUKhWIfdRbN7b8+frl6paVHMzzflq/NnnS5XtYdvL6h87NWAiOXU0
         pCTK+duXsGrSb2X7D4Ri1etwV9PoPLuiYJcYlaGO63iy82k+9KrZyLzo25AyXe6Pa0e8
         Hh7AUHkUz7va/grgIWLTpZoSoverOQ6VJLj+BkTUvgp+41XLZZhFDh+dTh40ayX+B1P3
         7hzFYlAD9fhjYPhjp+Cej7mnA6vsPe47D9xfF603eo5/zrWcmLc8g08VkeiXvgU+DSRA
         hJZTNAYeucYzzFmg98HK9Oh/oqBVsGlKbT35o0izcesUxTnCEHFYwl5DzQopOc6gg7j+
         jlmg==
X-Forwarded-Encrypted: i=1; AJvYcCU++i0ReRGfT5gNGCr1bPRfyBjWHRHwCjvXzaOhhxmqL7zf382/drCnieiVG9443OLyUaZ6kuuCNPSU17gVWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr0Kwn0VmHOctB5rmdZ02yOY9ZJrPyvi2Vt401TvQdlLtYzrfr
	3pfKwcFCLyBS3dZ35aAox6P5cR6j2zJ88am1IMwcnP6LlY74Upe6k8Nv2igcWGJfbB4+sRDZp6z
	xpsxIWoL0KA==
X-Received: from dlbsw11.prod.google.com ([2002:a05:7022:3a8b:b0:128:d5fb:9499])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:221c:b0:12b:ebc9:2464
 with SMTP id a92af1059eb24-12bfb7458e5mr1690497c88.22.1775240348597; Fri, 03
 Apr 2026 11:19:08 -0700 (PDT)
Date: Fri, 03 Apr 2026 18:18:58 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJEE0GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3Zz85OyM/JwU3aSkZCNjSwtzS5NkAyWg8oKi1LTMCrBR0bG1tQB Y9d27WgAAAA==
X-Change-Id: 20260403-lockhold-bbc2398794c0
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775240347; l=2084;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=DMGcPcUBwjNRDhEevINgkIw7BW2A4126aabjvfS7NV8=; b=pNsDaw12iMsw0R5VBlKL/q3u1AdTkf6FlbaTXIIv5ZxbIqL4kiBGPgejWrNZDA5v+55k2TRtd
 K60uCFhWZQaDS2A4RmaecgHJyoKbCGJEd5cok/x/Ys36X4zSNr/4ruH
X-Mailer: b4 0.14.2
Message-ID: <20260403-lockhold-v1-1-c332b56cd8ae@google.com>
Subject: [PATCH] rust_binder: Avoid holding lock when dropping delivered_death
From: Matthew Maurer <mmaurer@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Matt Gilbride <mattgilbride@google.com>, Paul Moore <paul@paul-moore.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, David Stevens <stevensd@google.com>, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

In 6c37bebd8c926, we switched to looping over the list and dropping each
individual node, ostensibly without the lock held in the loop body.

If the kernel were using Rust Edition 2024, the comment would be
accurate, and the lock would not be held across the drop. However, the
kernel is currently using 2021, so tail expression lifetime extension
results in the lock being held across the drop. Explicitly binding the
expression result to a variable makes the lockguard no longer part of a
tail expression, causing the lock to be dropped before entering the loop
body.

This was detected via `CONFIG_PROVE_LOCKING` identifying an invalid wait
context at the drop site.

Reported-by: David Stevens <stevensd@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
---
 drivers/android/binder/process.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index f06498129aa9765ecbe7a34af36074f15b7490f1..9812c52dc16ee52044dbaf86e30a0a3861effefb 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1402,7 +1402,12 @@ fn deferred_release(self: Arc<Self>) {
         // Clear delivered_deaths list.
         //
         // Scope ensures that MutexGuard is dropped while executing the body.
-        while let Some(delivered_death) = { self.inner.lock().delivered_deaths.pop_front() } {
+        while let Some(delivered_death) = {
+            // Explicitly bind to avoid tail expression lifetime extension of the lockguard
+            // Can be removed when the kernel moves to edition 2024
+            let maybe_death = self.inner.lock().delivered_deaths.pop_front();
+            maybe_death
+        } {
             drop(delivered_death);
         }
 

---
base-commit: d8a9a4b11a137909e306e50346148fc5c3b63f9d
change-id: 20260403-lockhold-bbc2398794c0

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

