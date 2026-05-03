Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19B219303
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777821440; cv=none; b=DQ9g19JxhPhM28wNVlvE31vpgLlKHRElh3wAmk9I8ZRh5YNIOThGmO0DogYgXnn/IEpnpk6PbfwJjdxyBP8601F1v+T7iksbjGiBlnLxQzpEbL6B9HuvWRcNO8zCFCbzAdFs3Qy2/a/V5FkYrIkC6V0ddpyVkhTSv2AwOJsrX38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777821440; c=relaxed/simple;
	bh=LZI0jQq1N8UGTjd1BjSQ4WvOjNUHUalOZeaxkEfH9VA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZ0sskVqn+FcTF6hCDtd+z+5dBcclygO26/qgrL6zdZyVVRi6QBD22Bu7sCoXXOo+bHlMw8Ju8vf51ui+TJp4RseZUtbXOXoVLs6wMyiRBLb7vUSP2R+7xMCmMt0BIkwUmvnIqMoOJ3TGvbz41APyjdundUsQqpl1BC5AC0a2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc1x9WR1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc1x9WR1"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8893bff3so1539420b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 03 May 2026 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777821438; x=1778426238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETXYuNQamoYCjCGsQiZmhWWNm8oXqGJiz2bukvEMo8Q=;
        b=fc1x9WR1uvZPRX+EyvU46LNHyfID//3xvVnzc4vTbun4kKtSud1UJUqWnByYiajum5
         aUI8R/sX6OUHF5nc/YF6WdCsVkmv8Vsht9NDu2mmTajFM/Dpzc3x1aaQFiW0u3R8o7Dl
         T+CRfqBytndv7YbE1xmwzf9Z60GTuAzilGQG3RFaLj7K4JZF3Y3Gfx9mZWNqG8SQRsOI
         0YJj5FSmoMrmVu+BxGzXFEgjhnQrnjIO427uU3o6EWAnyp28sTJrxDMu5PvuZP9NvUBX
         emCn44gzISe7YYQ8XZhg8sjBtl2ucTkY3KVc6Tj4okjZ+UCQJiCsZvA4I8LGJDn8feI/
         xVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777821438; x=1778426238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETXYuNQamoYCjCGsQiZmhWWNm8oXqGJiz2bukvEMo8Q=;
        b=h0DeX77Wk6rw4fCZYUYlj3ScDd0f+qwJASWer4Bt34iTkuu3bhpW65qP3d6MwFnYH9
         3nv85o77SH3ZSv1GvDYh/ijHc/APgc/qBl+pLyd6IGy9ghwDGVvVI3+5xQWqPYtXRZeL
         9hzaAA2BiYM+H/KcaL5Lt7C6D18WHe3pICtVvzijjsNJYJGoujn2kvrhgrbJWObLkday
         md1ISK6/wwOVAapkrNJyr89XRNtv1IQqGepYGZ+5o71T+4MxzukUhQm7TWDDFs3RBus7
         4RsKLaPQhMj82PixSItGKr4jnPjixbIEeUZtk+Tjddlf3C03bz6kTYeus0IQWY55kMZx
         BxiQ==
X-Gm-Message-State: AOJu0YzLhfrPGJV/VGYrBxSbh2w1PrR/+yER9FJqEir/FaP0drTEGQv7
	XMgE+joeGzzRdc0Pq7wa/Psq0I+wJwXZ5696Z+XL9wKt0t0x+7H47fVN
X-Gm-Gg: AeBDiesnx9Yud1Ic2QGPXztelPzBodAy6Wk9QLrvbT/svEar6+yuO2aWK5hMtEPVdxw
	8dgQM3aMCsxwFd6g6H9/EwLYx3ZK99g9GhoXW3ygwyxVxKDei6xH6/1MYQ72hzayq3yWV/I7WrG
	NQL9t/xSQtLFMlLjqg00gQeF6LDQIA22U5vPARu0uIXiAN7dQ/U/2MsOR8a/RTjv46/CQQ7jqSv
	sFTmv7+1E2NwMRyjIrPUZm4frElf5cBOBuH/sz/7s8fsWumUEdBJIWk30NZApE6K5t9j0aEyOnE
	jXXfWCVdWz9p1C5LkW8aIznJ8nigBtEPUKeIuPDectDBM0s1KoC62C9cMplVsKZPvIohJYgp6Xx
	at4ToehFpDvcOuCeyJIHR5fnMxsPHEKlI1dA9kX5Q+BXSXOukeWFfcc7fyEX/aqDpRqxYqrlSLS
	1GZZe9wRvsK/L2eXf7Ae7j5WR5G0dSB+T15z9KQk/+Ox1tDJBXPpxW
X-Received: by 2002:a05:6a21:4ec4:20b0:3a2:d68d:9e78 with SMTP id adf61e73a8af0-3a7f1a31ec4mr4576938637.4.1777821437738;
        Sun, 03 May 2026 08:17:17 -0700 (PDT)
Received: from crewmobile-Dell-G15-5520.. ([2409:40d7:e:c40c:9413:b194:9c5e:9abd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbb05798sm7174101a12.0.2026.05.03.08.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 08:17:17 -0700 (PDT)
From: Arnav Sharma <arnav4324@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Sharma <arnav4324@gmail.com>
Subject: [PATCH] rust: error: implement Display for Error
Date: Sun,  3 May 2026 20:47:08 +0530
Message-ID: <20260503151708.26199-1-arnav4324@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the fmt::Display trait for the kernel Error type. Unlike
the existing Debug implementation which outputs 'EPERM()', Display
produces cleaner user-facing output like 'EPERM', which is the
idiomatic Rust way to present errors.

This enables using {e} instead of {e:?} in format strings throughout
the kernel's Rust code.

Signed-off-by: Arnav Sharma <arnav4324@gmail.com>
---
 rust/kernel/error.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 05cf869ac090..87ea3ce2d269 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -216,6 +216,31 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
+impl fmt::Display for Error {
+    /// Displays the error name if available, otherwise the numeric error code.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::prelude::*;
+    /// # use kernel::str::CString;
+    /// let err = EPERM;
+    /// let s = CString::try_from_fmt(fmt!("{err}"))?;
+    /// assert_eq!(s.to_bytes(), "EPERM".as_bytes());
+    /// # Ok::<(), Error>(())
+    /// ```
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self.name() {
+            // Print out the numeric error code if no name can be found.
+            None => write!(f, "Unknown error {}", -self.0.get()),
+            // SAFETY: These strings are ASCII-only.
+            Some(name) => f.write_str(unsafe {
+                core::str::from_utf8_unchecked(name.to_bytes())
+            }),
+        }
+    }
+}
+
 impl From<AllocError> for Error {
     #[inline]
     fn from(_: AllocError) -> Error {
-- 
2.43.0

