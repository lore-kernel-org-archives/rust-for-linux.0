Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DCF1CACD0
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 20:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730750470; cv=none; b=I7VdRGD0KozdnwWOVig3TuvVylncjNFhZSm/w/T7NwlnsvWF5Ee6XrP4k0ybGvORz+5X85tkfQ318dgbUetGkhqAnAgZZEYcY/xkG+7D+CzzMJsKYnVRYaNVeo/asWeIjM/sESrT3JUcczLIH3ZsZOZzJgVbzyMEGxdM1P8x82M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730750470; c=relaxed/simple;
	bh=Fl/KeUzwHauEGQFaocBbFkQCQIyXFmdARVPEmr7CgN0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qeYfNR1bze72sxFgZPsbLqTVwZPlQqNHr9VdmsGiJ/UEFPMaUysGYs2BnYFZ+vW7hcydT4/bbMjZ+4tTFJDiYB8KKCXMqBh61g+LsFweHXBxETPfFYgH8KpRLhKn8rZWHpVGJC9M5vhIDmMlM8DBUYZcf+tu0l7tBDd0txuxoUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPIlmh/W; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPIlmh/W"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20ca1b6a80aso47258075ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 12:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730750468; x=1731355268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrJmUTTDqbxIfWzAs9Kp6Dewke7F9OaUzl7jERdPupU=;
        b=aPIlmh/Wf90Jqu1dT/bcHlk/66pSkgSjGYXTawF2/ILFT7QIXQ8PX9YTE6DMH2Ak0+
         zRMFHyiIIsO8Jv2qr37Oi4g61HVBupPZkzyGqHO6nrYGYBDx99AWJAHCg00Arsf30mhj
         Ss31fedmpZoUB8e7Sg5omQAlDzVo0FkSipGywPJDtLcxeRCKllSLmZAJHbYmQad8zRSe
         5JHaM7qmup8HBUNzpIPWeI64SjedzGP8jXSCvawMGEK+9SMfMnFhq4omtdlfUptnoDpC
         8qd9LB3s3Wo043ewPYSC63uTR0W6B9cxVRmmh0O3AT7z6hsayZfIsFfa2mF05VHvH0W8
         iX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730750468; x=1731355268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrJmUTTDqbxIfWzAs9Kp6Dewke7F9OaUzl7jERdPupU=;
        b=JiKE8Hn2+6yc8jqseA7MQ1oc7ywvfYsyuLPwNUzszuMBOdtiv6p5tdZcKF+zdaD91K
         3xO2cP7klS+ydCzric69g7z0ludgXuXHYlzzQRMg6cJrRjR9e8kwDa53p5iYNl4xBjqW
         1K8sLrn3U3Qe7iK0JkZreO2qPciBRjWotvUpjnAZa2gRl5tT58XHX9ZO9W+9hvkDpWz0
         tAas3S7MBsYRu7o+N/0CLLcjuvKa91O4ZnqlGc8BCBJTa1wE6Q6vjcywQl3niM79WCy+
         iUvE8BXdNaJhpvRE+k5rSysit0xCN6juyoj1v72LPRbumT2CCGTJMszZ5NDqRG4w4Jph
         N4kA==
X-Gm-Message-State: AOJu0YzvFJhmPQ0ploEe29o19uP4ZgCYapAAnW/ouN4jraLQxhyeyGbz
	EacOyGEIIrqcU5Pf9tRJ9UO5LrCaVQ9xrgzIuy1WJOCyWqbQnZQ6LT+bUA==
X-Google-Smtp-Source: AGHT+IE4wTGwfjugjJLMBXjtfdAIXXFyr40fkvJsA2Dg20lQnSmGovofuDRayFiKu7eDjbdy1Q753Q==
X-Received: by 2002:a17:90b:4fd1:b0:2e2:a8dd:9bb5 with SMTP id 98e67ed59e1d1-2e94c2aef84mr18448801a91.12.1730750467784;
        Mon, 04 Nov 2024 12:01:07 -0800 (PST)
Received: from pop-os.. ([187.106.38.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da98448sm9072700a91.6.2024.11.04.12.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 12:01:07 -0800 (PST)
From: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Subject: [PATCH] rust-next: make from_errno use try_from_errno
Date: Mon,  4 Nov 2024 17:00:13 -0300
Message-Id: <20241104200014.12996-1-guilhermev2huehue@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make from_errno use try_from_errno (available in rust-next).  

This also allows to remove unsafe code and a comment or two too.
 this project or the open source license(s) involved.

Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
---
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 7cd3bbab52f2..077f95cbb6ae 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -101,19 +101,17 @@ impl Error {
     /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
     /// be returned in such a case.
     pub fn from_errno(errno: core::ffi::c_int) -> Error {
-        if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
-            // TODO: Make it a `WARN_ONCE` once available.
-            crate::pr_warn!(
-                "attempted to create `Error` with out of range `errno`: {}",
-                errno
-            );
-            return code::EINVAL;
+        match Error::try_from_errno(errno) {
+            Some(error) => error,
+            None => {
+                // TODO: Make it a `WARN_ONCE` once available.
+                crate::pr_warn!(
+                    "attempted to create `Error` with out of range `errno`: {}",
+                    errno
+                );
+                code::EINVAL
+            }
         }
-
-        // INVARIANT: The check above ensures the type invariant
-        // will hold.
-        // SAFETY: `errno` is checked above to be in a valid range.
-        unsafe { Error::from_errno_unchecked(errno) }
     }
