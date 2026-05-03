Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528B34846A
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777828484; cv=none; b=gBoGWm0NDeySFVZ8iqDcHgJE66T0FvnA1N88x87nYSl8UZI/v/1YYVas+xejpeO+ejebNgMssHs04RMbw3mEeOHdAipJdsLlTN1Vw3bm040b4VGyXQ20rEYiR/UHomANE01xNM67vWb+xhvekZS9T37TtVxR1itIuRW+nYwA6ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777828484; c=relaxed/simple;
	bh=tt4grDoBvMrEF7yzofX0or4CRlzRgZF6uCIitrQowKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RlDSWivHu+VFEBuuKV+UGZJUWTBFigVouovWc7TBsLivl48UDvzAZT7kusunpeJ8h37GiIq/Rl3yp+j0YqTeSkmGnDYjP++zycDAHcJlXNj4H8u+HECghYtQnUcnBYdJekt9IfvK4ubBMEVqfvKLx/OLtxAcBlAxPsBSkWvTEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAFIfSQw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAFIfSQw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36525730172so726041a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 03 May 2026 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777828481; x=1778433281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uuwdaXnXwhmjY74E/KqwIa62pTOOtHee6TZaGFXH7LQ=;
        b=iAFIfSQwbHCKMbjL6l5rRMgEtKF+fpXNdTI9GTeavLGBoR3yRhuEznHaD7qVUwIJY+
         wbb5F7QKqdlDyoXU2dmxxKRqDETOf98PMMXqv61v3X+zVJHJ33ky3sxaMT8bSaqbBS2c
         q+n37eqitcf8q4rVYKO+/3gPNcpCxkahb2zYx7tBExV3usY1yo699JbcDrkZMO6Up9I5
         HIBx1veiePEPSFm7N1L8if1vyqVOsxdM/ed7wuvVq2kueXhHcOOgMFJG1QngZAg/FwjP
         uxAAVk13ZGF5I0n1YEJKOul1AcX8rIdK4g9kzrMfBIQYZTN3E8NXwpYorcyNA3IngMCr
         V0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777828481; x=1778433281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuwdaXnXwhmjY74E/KqwIa62pTOOtHee6TZaGFXH7LQ=;
        b=W9PpZvPropUqRIciX0FdxdeNWIcWtXSusQyRV5ksJnQJOemFc6A9pkpqCYCX1kEtyq
         MWf3ffvbiIjB/5IL9BAqzWPgAYFxqlobdJN4xuI8qTDK8p5h/3cd0AZ/O6HACqbD7NXq
         RWbNd0WOHfJww2JfiNkkXidYCIYgTtMiEwJp+9Ii109RP12XcPPWYjJ5ixSytguiBKD6
         pqN4J0yePv9IxExyL5SYY2IXrjCVdXLXMnNZ2+zMJdKY5O7Tm0kaxAaw6UwDVyPXG1Ke
         Ad4LIs+QCeo68Ti3u1gqLY9zYegdoNeTS+ixo+IexgGvU7SiZXXsCQEIK1zavUF/1GBu
         U07A==
X-Gm-Message-State: AOJu0Yx0xw6RX1RAS9vYflbO1ewbRZgZwc0swrA/eQ5ZR4n4yy19LMdj
	ne7TFK9Tnmx/+LD/TH+CRspnPzWGLYDTePPffvvFc6uQ8+tIco3GCsX2
X-Gm-Gg: AeBDiet8gQX9aspQGVTaE0EgzYBAuzPfMuTdhHU06VygH6YhCANfcO7pcOuBo58Ah9z
	MoxjRHDjo/L77PNcutlR1T0YpyxKGM2+GEUQ8hpYc6aQZ7cQZvY10Mkxat/fAUhno310AP/1+1Y
	mWguzZGDDUHg9OyexrUVE/nRyiTJ8EljQA7zXI3zZybhLpVJaTdXbiBkQn8hcK8Ux7cS1ANs0ME
	aEJDsU+9COQiH4Ycikc10o7JZxfBFsvgSqAbYrNAYeH6d4bG2LbzZXrFrewXIgXXBH3JSuZ+rM7
	HEYpGIbtghLl4+c5puNM9T4bWVPUxgjwyuyfR7Xe3jSgwDIjkDM7nVH+yJBPwVtXaLrqSSo8E2R
	mwEcsmq0dVGwEe5nUe5s2gDUALqxmitka1PTsXSRemN3Frd3zdBYJv7/7kIJn761f+6HKZoM3iG
	ttUUlk0fd9wDy9rqu+FvVsY/wTSRdiQ2p++PT4QzGWbAOAVDp0DS0=
X-Received: by 2002:a17:90a:15d0:b0:365:46aa:e68c with SMTP id 98e67ed59e1d1-36546aaebffmr582175a91.15.1777828481171;
        Sun, 03 May 2026 10:14:41 -0700 (PDT)
Received: from crewmobile-Dell-G15-5520.. ([2409:40d7:e:c40c:91b5:56f4:f96:9be6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f4858842sm3177775a91.9.2026.05.03.10.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:14:40 -0700 (PDT)
From: Arnav Sharma <arnav4324@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Sharma <arnav4324@gmail.com>
Subject: [PATCH v3] rust: error: implement Display for Error
Date: Sun,  3 May 2026 22:44:32 +0530
Message-ID: <20260503171432.7846-1-arnav4324@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the fmt::Display trait for the kernel Error type.

While the existing Debug implementation already outputs the error name
(e.g., 'EPERM'), implementing Display allows errors to be formatted using
the standard '{}' display marker. This provides a more idiomatic Rust API
and allows Error to be used seamlessly with macros that expect the
Display trait.

Signed-off-by: Arnav Sharma <arnav4324@gmail.com>
---
Changes in v3:
- Fixed doctest to prevent panics when CONFIG_SYMBOLIC_ERRNAME is disabled.
- Corrected commit message regarding the output of the existing Debug implementation.
- Retained `write!` for the fallback error case. Applying `f.pad()` to dynamically 
  generated text requires memory allocation, which is unsafe in error formatting paths.

 rust/kernel/error.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 05cf869ac090..4ab7d7d8ccad 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -216,6 +216,28 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
+impl fmt::Display for Error {
+    /// Displays the error name if available, otherwise the numeric error code.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::prelude::*;
+    /// let err = EPERM;
+    /// // Formats to "EPERM" or "Unknown error 1" depending on CONFIG_SYMBOLIC_ERRNAME.
+    /// let _ = fmt!("{err}");
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
 impl From<AllocError> for Error {
     #[inline]
     fn from(_: AllocError) -> Error {
-- 
2.43.0

