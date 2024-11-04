Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959D518622
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 18:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730746352; cv=none; b=tE7HHEdR+RIL6LYi+c5k1gcjWgmNzY7aIMwo+DcQZn79MWNSdteE7ieSOCImsOhdqOjgMtnsgu+spy/2gHMJCdsvhfNF9KR3rbicvd8AWQOYSRZEVll8rSXGn2FyPcL9Mu+3KmITsfnDySdK9VeAu7sMk0L4j/2ZZF4Z90duWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730746352; c=relaxed/simple;
	bh=qbwKTwSv7Je4zcchgOjGr+03qw6xwc1hbCSe9S4CZQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eQrwFwXYzhgx2Ur9GGlzq0w6HhzcDNSd7iC121pZiqHis7/bxx60I/8k5U0eS0N9vq7nNg3bUdEaaALOHNlPx0/CKgYCUuNQjy4+5zl6WfRY7QokAULPnDtwZJtBqLnpkQMETLCInCeh/iqBGiJaPugjlM0KmDW0mBl38c8avzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=gs4Dpadm; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="gs4Dpadm"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so1110491a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 10:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1730746349; x=1731351149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jj73W7L6Lxdeb5OW2HZUTx3jNfZe6GKRUpYgEeeMV3A=;
        b=gs4DpadmSmgx5ZoXvIkykeDv9F4okVnz7dCncPCW+VyS8PsvU8y8LqhdmoHhod1/1e
         OI9CZZ9jFh1FzugRFHGwI1yGQmL6G74LE5g8WMWXPzCpwnygfUy668TBK2R1UwUEAKFC
         gd0OYSfRyfQI+bdoYWZn0gCsfEhKOuZ7N2C3sbF1skJ7XcmEL+80ArEkSjxlINo0tenk
         my3hc0tbhTOBxJHtOlhioawz6c2vvCPLez87uU03FjTDzhg6Uh0je2FsW5Te+8x93ICI
         oTYDGH7o53tKM2+I4YyB3roiapwMkrboADVyYap61m8NnlWlXIvLb5CMiOSn74lW5A5C
         flHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730746349; x=1731351149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj73W7L6Lxdeb5OW2HZUTx3jNfZe6GKRUpYgEeeMV3A=;
        b=K/V4otlVnU9+Kiedx6uIfwuf9JbFutb468ZLgSSM+Zy4LBs32fvolEwn8BSAemejUy
         pbrawwQrUf0M0HBptJEa7jCiYfYFT9Eh+UEupHhEkkqjIdHlHYxZ1AZcoTkb/vNtZTA4
         dobG7TFRtPO6LuG5MTzQ194+DRz6QEoRmDIBfkzYGIOcK5B/q2BM3kR5mWaVaBFzYGwg
         ObsDdTC7FTJaQKMDpeMUSi0sLObalUhogTszGOVIa0w8vwLBM2givU10JkkuNXzk2tAo
         7ZiWcBF6mu+zQDHdPErtpK06nj/MngPbtfW/OCN0KWKByGdY7+y7weUnGnWPlCdCVfD7
         iDGw==
X-Forwarded-Encrypted: i=1; AJvYcCXMW96X/T5RvurQl+JRGRZJgDnpw3VGSDxSiD+eUi+Csrize4LEe8lQ3fgCLN7imWjwlNXkwRDpNPFBv6+ypA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNG8Xxu7TgRkaCSPsvw7DYwFYfKpat68KghFjY3VGLhFov1Agh
	+FFrWBB+KFqtlWDXekA6pf+juczN0wXLS/Q23YWcd/GbpU/NWNZ5HSU0+Xqu5nM=
X-Google-Smtp-Source: AGHT+IEptgPQf7qdaXg4w6W5CvyO+Zr0DrkdbM/cZm7hkzJEZ3U66nbrU/N/W8+PzWG0oTu3lnvwug==
X-Received: by 2002:a17:906:6a12:b0:a9a:1778:7024 with SMTP id a640c23a62f3a-a9e65576989mr1515789766b.20.1730746348662;
        Mon, 04 Nov 2024 10:52:28 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17cf805sm16659766b.120.2024.11.04.10.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:52:28 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH] rust: error: make `from_errno` use `try_from_errno`
Date: Mon,  4 Nov 2024 19:51:35 +0100
Message-ID: <20241104185135.18974-1-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks to this simplification we are able to remove
another redundant `unsafe`.

Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/error.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 7cd3bbab52f2..2339b1fc7353 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -101,19 +101,16 @@ impl Error {
     /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
     /// be returned in such a case.
     pub fn from_errno(errno: core::ffi::c_int) -> Error {
-        if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
+        if let Some(error) = Self::try_from_errno(errno) {
+            error
+        } else {
             // TODO: Make it a `WARN_ONCE` once available.
             crate::pr_warn!(
                 "attempted to create `Error` with out of range `errno`: {}",
                 errno
             );
-            return code::EINVAL;
+            code::EINVAL
         }
-
-        // INVARIANT: The check above ensures the type invariant
-        // will hold.
-        // SAFETY: `errno` is checked above to be in a valid range.
-        unsafe { Error::from_errno_unchecked(errno) }
     }
 
     /// Creates an [`Error`] from a kernel error code.
-- 
2.47.0

