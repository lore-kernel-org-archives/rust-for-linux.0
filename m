Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D839656E
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777824380; cv=none; b=NbFzKZOv3Ikl9lFBROORoH/CBxF1g68+q2CU7/GSNHyjlvRXmZg9z2Brz3qWCnrlRtOZsZ6lWZK1Jufd/W4DY37GOm78NJnd7sf+s+B+hP/zlEpwy//mpAUVw4rRO6orBFZ74+rTNFm4pPp7b5aWyGZ5jWwTltyqq0du8YWp+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777824380; c=relaxed/simple;
	bh=SMl3eAm07Ime46SBvrt7gdHa1Bo6x/GCvKmgyXZwkwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaV0Eakq7FItwMT1JXJeL1xRhIoF7m+3tqnG3j+vNxMf1lq6OnHRt2nC3T8XUFZkvB5lHzsZb8BdFLskhsiGr6FiiEZpk3u9Dd6klqmRSIPD3oI2xGO6lZpEr6D4AxL22ThoN1i7m8Gw5gcn4RbrUhzvKL0EldpceYwJ8QLS9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHVkj+Kd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHVkj+Kd"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3654ebfd57cso22237a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 03 May 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777824378; x=1778429178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdx5oBv4v023zE1PghukVZYtoUnqRi2HHulg5TcW1xM=;
        b=DHVkj+Kd6Lfz++0L1ad+1hlStuXiEaihJlM0LICCKQ4kgBXeruL6bGmgkRLNyNjc6o
         UIR1GqiboCSiCAuReXIYc+MB+KfdMEU3ZEp/OABYmUeNOLuwNJHEdXd94mdAcgNPnjnS
         zPDb5Zk8YlBZAxXG4S3eIvbq5iIalXYB5AYVROjJGazsrJojgat/d7Zvwdv1AyLy5UAY
         T8Ta0tZqee9Y1CrcYZnwG6DeNoI4lwBxhRuz/60H5NCpxZVgL5XHqrGLflkAMI6dyZyW
         UF4GCl2uY+99ZMX8FTZPkQa9jucPejG2QZSD4Qan/oGPoDtRQSyIvvMO54YcyXTTuuzi
         ff2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777824378; x=1778429178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdx5oBv4v023zE1PghukVZYtoUnqRi2HHulg5TcW1xM=;
        b=XCKATTCHTAm+eSMuTYPg92cQPHeD/cxxnR8A3AOxeQ00bToSN6699738lIQWvvQTgS
         HopKfS1iBYxErEA3FMGM9weZlbi0rNX1M/H4akMAYc6mSEbyDa7p2kCpgpYCd01K6l3y
         KO0nHsEAMrXGMKpExeXeCaSHbAT2xmHk+I1kFqGfUHiZhJYtqEH93W8l0OoDgXyDVlXN
         bmyg5K5otZfDus8WuA7eBK702Gg9N7wLGZ8P/F0MaqCAdM4hXmhLauNAa8x0DXn9ZlJ5
         ESsUlcIIfgir9WgoJNsU+K386ofzwxQ+FNmr7iivNfRw8r/xLGkPdPztUzqmlVqpV6OD
         Um7w==
X-Gm-Message-State: AOJu0YwzlHWvflFTjPlSCn/pzc/diyzq3Nra+aANnKsM86yaW0cDkL6k
	1glsEKEPn4OaPeS75rr6MenKEo3WjM0sfs7NVi0bRH6qtu/nirOeIvHphPa1wMLj
X-Gm-Gg: AeBDies/zhVYS2cdKDzWimiCJddCUOKUF8nJL98eGLX2DwJ1ZrEXl2OGo6KI0wnwq/K
	DFEfiR2Ly/MiqVSi90Mpb1bLttX+omWVaM9+Dm/uXT+s9bZu4+7NflE7MKYt7i6feKYvli1rAm3
	sl1yZ0Y+pmaNekdqqrApzYsjTz18a/rhHK7S0BYKg53jMAI6+L14vUQlJq1fo78DmdG3H7/6U5o
	leTvbG3tOIhSB/003TqIEyBBsu3kVQcWy4COZZzcjqgnrKtr+rZhSzjRaxjHjnZLKVlYA6u4hmD
	jP1wWyJxHTdu1LAy2AQBrgC3XeKuO9Tn6bAZEpByPCWfw/+IfjZO9Opsv43Fn4o8Qja2iG3Cg91
	N+erQVcAPzKjHyqFX2yCyHgHOHCACa8Ttk9Hx/zvSylbAQtwXgQJwrC98qakIJaef2ryOOItrzI
	6rD1F8DFHQYi/yQUGbddB5Sy4r7D+RrKBiGRJYtcYl6WCYIwihkykpQMC9YCTibYg=
X-Received: by 2002:a17:902:ce05:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2b9f2808c9dmr63827135ad.23.1777824378046;
        Sun, 03 May 2026 09:06:18 -0700 (PDT)
Received: from crewmobile-Dell-G15-5520.. ([2409:40d7:e:c40c:33c3:4ace:eabf:e5ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba0551185bsm36569085ad.71.2026.05.03.09.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:06:17 -0700 (PDT)
From: Arnav Sharma <arnav4324@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Sharma <arnav4324@gmail.com>
Subject: [PATCH v2] rust: error: implement Display for Error
Date: Sun,  3 May 2026 21:36:10 +0530
Message-ID: <20260503160610.8431-1-arnav4324@gmail.com>
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
index 05cf869ac090..d1b48a4ebd90 100644
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
+            Some(name) => f.pad(unsafe {
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

