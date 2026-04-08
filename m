Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C62F4A18
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679004; cv=none; b=aj5clwsg0Jy7b8D/KWfkAmJios5Pi6rdP5yBMMxgtg6DyZF/P+JCMnHWm8G1tZq8nm9R5aHbP6xDLrukfgM9CiLa3IQ4uDAFndhxnsPx2T45dmQQgE7cmtD4BsRSMZ14fSq7MBvy93vitffjOWVwUnU9HC4bz7GlFnbCu1mvReU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679004; c=relaxed/simple;
	bh=9ZayO0Os6B3uVdwtFtK43Rcp2eSqPW9ZaMNoyrY+gKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqzxA7zrWzswyHQJ0x5L+EoLx7Zn+diwrl7WKm0pkvobpOvHWDhBQ9n1PCs9wxjHR7g2NmGhjR9PSsRz5zHA0OWVQ5mrEf9WcpH7qATlkNjcCyoi/2bE0X9ciVr1zHGBuolN3pRXSQVo8xaKAPld94YoOLnqPUbgK8zAravNzck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSIdUrWU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSIdUrWU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so767155e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775679001; x=1776283801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A10jT5nFIVtQZOyY/swyTbMMXrCD8+pLyIvSjBDicJg=;
        b=NSIdUrWU29vYnk98PfpyrraClyFrwAYy0ZhaBUpxAQDAQsGE2YvgzSTa03JVOTMFaa
         IcRKK19RYQrdfNahloN3kzdKBNYES+Q8KiGiumECuYo87j7vXMe1CZ9X1H5E5nFXEpDU
         1f2t1V/x8g1i1/+aZ5WImgTqaHeZED/rCa0Ketpr1IGomAeOpAdTGrIG7l1fkI7UUQCo
         VLwlA/LfG6bSElQfU/iiQlWB8dLVtkxVTvs7EAZNnGy4FKHL3SiOaAnN4pJ0jVqnvAJx
         fOiFYt3sGWwvWQmDaxi1pvzCYesBpSm4EKTK2v8t9Vx6qKWBfL599gpfj4+DAy2Zkhfv
         UNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775679001; x=1776283801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A10jT5nFIVtQZOyY/swyTbMMXrCD8+pLyIvSjBDicJg=;
        b=K4lhk4WfmLkJKXnasoYEZ2kR7+QRiSXF5uCLu9w9CQZKSrWpg4/cET4Ryi6S6p4U86
         CCX3Gwn2+z4s6mH/DYa/daSjx2xJIBIfcE4lOOBTXaobnSEcDBGNZKDbhfgZFQJBRtQL
         IGFIzQLtNU1cmoAt9Qg/Bip8AVPa1LnetpucmBGa/wOC0o/yf0Ek75/XqXy+tl9rlAM3
         QhEVUPCn2ECW2mehaC/FTSX4a426S3JdMmG8sd8LA6UV03S96xhWy9TLPlyxS6+miMly
         gZaRWBBIwtGrePoesB05H1nVy8paEuroUHD+tBmbBZd3QeY0aLAI332MPrArs0WuXaI5
         fWwQ==
X-Gm-Message-State: AOJu0YzXhWyXyv+OP+vLHGO9rvnZsqKDCoVDdqIoxPe8admo9Qvcy8Uo
	ZHklLA06ZlwHgGcjUt8bdOmrloFSf3UIS+ra7GcI1wF4oLknxFWegY9P
X-Gm-Gg: AeBDievIRQVlU2XSzSBpvyachrgACV+fR/zfyeUQBvvNpdJ5gcojakJNjt//6LTv81I
	mzXE30gtxG6fkFwBuLv8uqA98kssXcg30r4iqvfTRo8auRCgjfZ9RUJhmNbMdTETF4oUP7lHher
	7uLKYmsnDG+l89aNqoA4JYT5rHDZNPBEl/q3Om4QwvhachcqEaPpViQMXXfPMGcgqwG38JhYi2V
	GocPhxsHPYQukj8+yCM9NCmS0BHZJ+rJ0lxrKYJtLQLGg2TQV7J7QfMfCaTQe5aBxDm0CFTDOLj
	CEmcYSf1CBfkpiwb5FPLru/PQGXAF0HRvWehlIWM4KBecs9M7mWjvIo7359ju4L9j8hKpsK31sb
	Jj1Em0zeB/g3llcB7pNMZHD4reuwL88gJPWqpuvyl6sCDzowgHeoFP2OGFU3UC1VxbFAcbBNsy8
	8suWSafmMa2Z49CSKueTP9alq1PpPDk/yr+euyFium
X-Received: by 2002:a05:600c:8591:b0:488:ab5b:d711 with SMTP id 5b1f17b1804b1-488ccfe6a5amr11030235e9.23.1775679000962;
        Wed, 08 Apr 2026 13:10:00 -0700 (PDT)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd1bb778sm15940165e9.7.2026.04.08.13.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:10:00 -0700 (PDT)
From: CastilloDel <delcastillodelarosadaniel@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	CastilloDel <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH] rust: macros: Replace match + panic in const context with const expect
Date: Wed,  8 Apr 2026 22:09:39 +0200
Message-ID: <20260408200949.99059-1-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces an instance of match + panic with const expect,
which is now usable in const contexts after the MSRV was was updated to
1.85.0 (it was available since Rust 1.83.0).

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/Rust-for-Linux/linux/issues/1229

---

I searched for other appearances, but couldn't find any. There is a
similar one in the `c_str!` macro in `rust/kernel/str.rs`, but it would
need `Result::expect` (or `Result::ok`) to be const. The original issue
will probably have to wait for those to be fully resolved.
---
 rust/kernel/error.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index decceb6ae855..2ef5226f3913 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -25,10 +25,8 @@ macro_rules! declare_err {
             #[doc = $doc]
             )*
             pub const $err: super::Error =
-                match super::Error::try_from_errno(-(crate::bindings::$err as i32)) {
-                    Some(err) => err,
-                    None => panic!("Invalid errno in `declare_err!`"),
-                };
+                super::Error::try_from_errno(-(crate::bindings::$err as i32))
+                    .expect("Invalid errno in `declare_err!`");
         };
     }
 
-- 
2.53.0

