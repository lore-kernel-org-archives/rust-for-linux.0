Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D4E17A586
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774103687; cv=none; b=ABUp4ZlZg+0j/LceMrDREjiLpBN2I9/Jjk/G/5gdezC0L1n3gwK3OLz2VQvQkezzAkP+qry/KWMQMqwZh+NHOmH+U4jdUqY7LUo9D11TVMkOGVxIsbzLwdiexHx/iPfbEyMIcqRc6nHxZdyWppfSf2xmEMhvGssh9apL3d6I3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774103687; c=relaxed/simple;
	bh=jg3J/QbnOeA8e8Lkzp57SJ3jUfyIegtFeaJ8WstOylU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2fy8wv1zdsk81PM8xkfk7q2X7szNm5UQVAp8iWWh8r1SoQCImXd8oozKCLC5oezfVBWob+mSxrEdQvoSshzIwvyk/uWs0ok6EtlZTh0XraiEIUBQUQfns5KDjdEAjqiJ8jVVO2n3fqjam7PMrpHMmw7NNlPj/PPPiAeRGp0Hpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSMO/BUM; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSMO/BUM"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82985f42664so1918833b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774103685; x=1774708485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjK3Ei6VCai7bQqO8E9VEEw85prRc4SetFe1e4pxmFU=;
        b=eSMO/BUMsHaLXgSMVp528C6NA+jqhUg5HEdUjD1F7HM1wvoRprdoZJL8wy0YsIehBv
         ylfzaNbyxdqM6Iy1ysU7N1l7VKJ0PqQthaJgLu4D3u/cYsD4wk82Ln06rhfvfKVVTyWq
         L0jhMT3m7+sDld1jtDnPfTI/7rOXnAVgmVF0FaPg6r1jS2ImcqSBilcsLsnWaPOrat9p
         DH9qgHjuOKbTmNucSkbPiHWfKS4H1cylald0MCzPTB7z4W66UBqrba+22F1Z/R5LrOOm
         OKMhIuY+4pycqn4v4s32lm46gGaVeOFLjaYas9mIe674XNzsQWP0+1/U3mo0yqEi4Zoo
         20kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774103685; x=1774708485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjK3Ei6VCai7bQqO8E9VEEw85prRc4SetFe1e4pxmFU=;
        b=EDLzU5G50l5H59+o2bR2Ic+v7kHN3bjkMYTbVTUH/p1GRoQSfIkQp69xUpFpJUHVLb
         upcTs8YzFAscxK60TaxY62tI5Gm/HO9H11N+lnemeYyw6gWr8arkLMsSsD7IRZl01sbb
         BYtPid+e8YL24xNtEn+aBBc/qGt6NzMvjRAeEXAmFVceh4t4ue1ow0jmJGu89NkbRy7f
         YF+DtQDjtKmtJLeOLkdWZgGv71NzWv2nG4FuRbKikeCWWzslfFaSOnOCRyOQWoy2hVKE
         8Uqjqs/IY3PDQIdtudEaEh4jog7kp+36VnPXgBCtfzRKtUbKwwQRbWHuTFxk29mfYRF/
         cHsw==
X-Forwarded-Encrypted: i=1; AJvYcCU59yLpqI1SKHZl0iwEiAfIjI6EOTt5cjKFN8U6eh5PFsazlLZEnuSPA2oH7DVJJgVrnW/k6aLTeNnMtmiVhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrz43FjEcZwFYL7jvhIr1bgoHGW60GJe6G6UiFKlOgAAk6XxX4
	REj5gP58xQ8XwEkOxmwvJhEgvr4AsqQ7TZUzCAoUyEKjO/B4w5J+ydRaZdH/3Vpm
X-Gm-Gg: ATEYQzwHlH+Neknt1GGEMp8/UkvjPoGCx8eyPkv1jT3v0gHnzoR/5GZ+rKTWuJ7KQxU
	bmVrGduc0vCfn2BHQGOCOKgLVrYMjUzbyppLFtGxJoyAVw3EW1S3QHU6j7hCrX9nFwQuzNpIEOH
	mEwXrNLrdD9vGEG4QjeA4nBXiIuOsb4dhY3udqzExDOdsfK/P24MBd4haxhJ+ipyWcW0eHuvA18
	m2yCCdg5A45sg/PiIqn9zkGvCupZRQWvfrUbSr5QbeVpMjQeMInkiK5PAhzUh5wgSoUewlzkNRK
	oxkNMp864QaYWzbyhu6KD3hdTpO/7R9UVsjc6Q7qEQ6A/DP6jXtsx3+FG9Rz752K0fIoYZt/win
	nbmoOkaTLOggUEIOnMhbVlfTYBcQrJF/JOHRV4sS0i34KiVIMaT53SKG9dsOsHeA+dwObzOnMJD
	HmhrIvo6fubsWkwvxk0aLSHsjwZSJSUKx7B/GJ09lb114C1U+6rdwWSnP27X6kDK04MFDzKQ==
X-Received: by 2002:a05:6a00:27a5:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82a8c346e32mr5536160b3a.30.1774103684919;
        Sat, 21 Mar 2026 07:34:44 -0700 (PDT)
Received: from albab.. ([114.130.187.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0354baefsm4805972b3a.0.2026.03.21.07.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 07:34:44 -0700 (PDT)
From: Albab Hasan <albabhasan276@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Albab Hasan <albabhasan276@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: print: add SAFETY comments to unsafe blocks
Date: Sat, 21 Mar 2026 20:33:57 +0600
Message-ID: <20260321143406.67066-1-albabhasan276@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the placeholder // SAFETY: TODO. comments with proper safety
descriptions for the two unsafe blocks in rust_fmt_argument and
call_printk.

For rust_fmt_argument the ptr parameter is provided by the %pA
format specifier handler in vsprintf that guarantees it points to a
valid properly aligned fmt::Arguments<'_> value. since
fmt::Arguments implements Copy the dereference is a bitwise
copy with no side effects.

For call_printk the safety depends on the functions documented
preconditions the format string is one of the fixed compile time
constants from format_strings and the module name is null terminated.
the arguments match the format specifiers (%s for module name %pA
for the fmt::Arguments pointer).

Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
---
 rust/kernel/print.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..8e1029b0a0b4 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -29,7 +29,9 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: `ptr` is provided by the `%pA` format specifier in `vsprintf` which guarantees
+    // that it points to a valid, properly aligned `fmt::Arguments<'_>` value for the lifetime
+    // of this function call.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -109,7 +111,10 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: `format_string` is one of the fixed `format_strings::*` constants, which are
+    // valid null-terminated C format strings. `module_name` is guaranteed by the caller to be
+    // null-terminated. `&args` points to a valid `fmt::Arguments` on the stack, passed as
+    // `%pA` which `_printk` will forward to `rust_fmt_argument` for rendering.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.43.0

