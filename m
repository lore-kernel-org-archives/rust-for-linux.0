Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427501D5163
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730807312; cv=none; b=A+Lm1iVekuSUSbdQBSVeC9mfveUeLvUW6qx8qA3yBJeYKjjn6sAaZQ6bbhA3LwxdH4MpRhB8DUCYXHYWU64FyFXViK61DpcXvECOFjy0OCnoLxF4j7uzHcDTD2r5zs2mPhiHHK660Nh9YFO+cjm1sAKLzZB2EIJ8D7118jJK7I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730807312; c=relaxed/simple;
	bh=kTzrXyK+q0nIy3CtzNgD2A9syNb9bg6p4TOp56DCZ90=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QEcyca2MJLud9lOXycQJh8dc7RrJi7ghNwjThliYx+v20Q2t+Su2BoiDjdMc75X0vWVQEwHBpdNJOeyArzqSr99zzNN5H7D+ZgoqdXkHo43LxL1yZVUozba3wLEihdc2XidX8lst11TdRko5oJ4xS7W5MwEqLM9IwiM9495+NkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDaqWLYL; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDaqWLYL"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7181caa08a3so2701834a34.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 03:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730807310; x=1731412110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SecfUxJzpSgrR1LBeqsG9VWt1xerf11jI4WolwIZk4U=;
        b=cDaqWLYLAONtOwVBTrmqnOufUIHgQiWSwErmyRpNOvWxZEW+Fcvyqm+1wIw4CAeI+/
         j/aDJ+SCY4Hns19daE2D6nlTRtWTUaj59bUoE8wJ2fz/gkQlgUtfL2XnqiO/9dYjRfI1
         t/wLUAu2yOJ8dspOD7j3NRBsZpe84AxV/UAPeCFJnEVvbPMmbxll/h+2sWejluek1Rk1
         ++waGlFcZAKVQ6sTAejrMTrhdnDVkoVStuy7hpnES+mQLHTXDG0kZQWCSkGNZZVl9NGU
         +lSJBfO5CRgUs4vORUNC0tKp8hwxe+azMR0xLBh6yuCys4AnZp9oec1ALlh5BYZm+tn+
         ZiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730807310; x=1731412110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SecfUxJzpSgrR1LBeqsG9VWt1xerf11jI4WolwIZk4U=;
        b=EOgnwH3VtXDenYKo8UyxpA0hTSpOcRAq+eJUbK86zoMhey6MpFYvdPhELnB0yjHmVX
         l5AXdFJZb1BTl0AXIGQZRHjuL15ObPYh+fXsUudsGL5mn3VYXs9r8JurNnx9Eng7G+40
         gypiFLAzvGQtne4uyTXpds2ly0h5jWOu6izZ01ntDlGfdUSyV4nAzvU/bhiIw3uFxn5l
         2rYbZTt+EHDM/rFpWtG8x7hqq+GlAojkahxj9wwPoh/OL1Yx+ldFsfyV2CL3yP6fMXdw
         OspcbCGpKn6RkuzP+XXuKx1dcMZKXMLEiQDMrMVyhOgK2GxPthKjXpkTGygUklrdaC/V
         g93w==
X-Gm-Message-State: AOJu0YxYF2zciw7zdtI6C/rhimAgp75UKqH3xE+olhKKEkXOgz0ETEhq
	ExTIHdNd1ikMz/fOhr+qRmyFyPWh4ZCdEFE9LEm8hOv1Y5/42Y55huJC6g==
X-Google-Smtp-Source: AGHT+IF6PNfEY7qCQnTdut2Hs6HK5gActXbHmv/vk9AajX0aeamxeEtZsB2+n8eY3EE7lPb2MQ5EMg==
X-Received: by 2002:a05:6870:b246:b0:261:211:9d0d with SMTP id 586e51a60fabf-29051de3435mr31111025fac.40.1730807310093;
        Tue, 05 Nov 2024 03:48:30 -0800 (PST)
Received: from pop-os.. ([187.106.38.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c4a0bsm9312748b3a.118.2024.11.05.03.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 03:48:29 -0800 (PST)
From: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Daniel Sedlak <daniel@sedlak.dev>,
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] rust-next: make from_errno use try_from_errno
Date: Tue,  5 Nov 2024 08:48:19 -0300
Message-Id: <20241105114819.14051-1-guilhermev2huehue@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modified the from_errno function to use try_from_errno to reduce code duplication while still maintaning all existing behavior and error handling and also reduces unsafe code.

Co-developed-by: Daniel Sedlak <daniel@sedlak.dev>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1125
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
