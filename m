Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A03B47D7
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044943; cv=none; b=na6MLJGcn47v1NrvWkc4u9yWozdI3cEatsbJLSacPejQ2qim3ceaeM9qpGVgYxKikXEtoI6eUMxpfJb1CJapWpGpWJCuhX1z1rkcG6MvmWnp1Z0uGiggjA9/xc+l7vFzOEN8Gn26F39vEsh7J0BUhEC1HnuCc7O1fmE3OEeKC3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044943; c=relaxed/simple;
	bh=ti4tWn2kN4PSb0X1ALMBWcYxq+pb2DAYrWu953FJHt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PLDd6gCPBh9j2JLxPZcYSTwYRw4fOUp8mLhTEFwiLJ6Q9Oce2Bqo41bECAbkf4POGHbqS7VtKniBhVFA6PcSsHRd4tT2Xc0ZLTEyzbv5HR8oU7rN6ps+CsR+mXlNSg0RS0LM8AdmVxu+kqbgPeCL5YGiWXdl6DMJeERgwhrslj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddJ+NHow; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddJ+NHow"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso7381650a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780044938; x=1780649738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JB/AJdGnqIf/Ml4hT7r5UXyiGQNpweafn+GD5Bd5gsc=;
        b=ddJ+NHowfSY8xcq+kq8k9FpWLlUyHIx3xKw+gsNp8l1kY9eMiRXBBnVKP9Fo9bhL+l
         CTnUU2cmkTnv/3bzph/I+f1NAWVXJslzUeAzmlvmZ/WHWlPfHNO6VwSLQ8CC8SLjEIfC
         H+RePQKLa1QUGOEMhjSOB1nRSk/Gjc+ceGcLsvMmSjGqCiAuyAhxBIy1sXwYVLo82ke3
         9x2Qs0BEIyNcBP55zJprfGSvgDUcI+Ay/yOfTAq2TRQeK35eUjj0bzaFW4fNmubceUUv
         +oNtrM3Xyn1IMK67i6MWGep3ZRCnqZ//Mkv8c8A+3/5muxmTM1HwrTSdOJ0jRwW7IatQ
         mxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044938; x=1780649738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB/AJdGnqIf/Ml4hT7r5UXyiGQNpweafn+GD5Bd5gsc=;
        b=nWuRUvgUr6kgWGYTmjGtfXDga2OnSVvnU1fpWAzN4Kl8B5WbL1txfW6KEC/dzJi1C2
         ugylmJ38Q0Uutxn28ddTKA41lrHYecGMkpaHzFKrgvoM0C7SHX5sVwdg8iZf/8hh9hTh
         aooXTyL7/74Vyxhn+aUsCit/3ATuyT07KaA1TwyS5pQhMjPChtUKBr53P9FvDv8hyhPx
         Br2hDRyixdo+rZuZetST3XY4nACUDHAT8kGLyg/MSqBDoVOJNTPCmP3akHM5N1Si0d++
         0q9xtn4kgFM6AlOZm9q8fOixsgqe3OMSvh5g4sf2VjHL3QP5KK30Xlj4JXImCQwDqkJz
         4Zug==
X-Forwarded-Encrypted: i=1; AFNElJ92BzMR8rkkpEK/D+scsq/AS4pBa0Wbgt3RXewcG/hfme8NbZJYOpb0G0nxVsTtTepLh5nMxpqIrEcZgOu5Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0y5DLwqQRorSDFSm4K3O7NWEwuuS/PiAJBEcmWVOj4uJKUx1L
	MEjpt+CW+Bn3xc9aQiCIegryBVQ7bbR6cXyEMOn+SBdEDlK9BHH5Vwgu
X-Gm-Gg: Acq92OF7ut+zYoQaoh34y1rEFLWRyL6opsTB88N54BS1b6CAfE0kDGG/IFGcr4ljar/
	xZEiEG0IdV0yMM8LcrRTX6t9Wc0lEcWMrWj4Cjjl3QsXEBoobFr+R+BHJvyEKcKQzR1OpJfpQh0
	9fz1P1YJBXD0VD7Uz3NpCRVmP/YnntcWGxLOl0AgZzSHm5TfzO/m+CiDcEoMZ09Z4Mo0UkYJLH1
	KQj4xgQrp6xzwhy1KpRzcqAwi4ZfzyH4nufqijcuLSMX+U+PKBZ3R7uPGr5L2pAXGAGNfrrifkX
	N1MyYrdwFr9fT9hUZaKqrSTasn2qmodZgoixD+YlicVf1b1dIPup/7m8iWOOhI1uF40nYkvfuS8
	AF4l6Zj8fosHUuLwQTVzzwre7Vie1GifQc0dvphULynZBME3+geRRosesOATvoeQf04b4V0rLGA
	8QLlDndo1NyOH5ZoRdLtTu4zmQFeeHm+XeJYEO0MYCtjtJmzV0RnhpeszStJhEwxuXg/Bsuohb0
	HD2/zQ=
X-Received: by 2002:a17:903:4765:b0:2bf:2243:d4ee with SMTP id d9443c01a7336-2bf2243d83dmr26285365ad.18.1780044938035;
        Fri, 29 May 2026 01:55:38 -0700 (PDT)
Received: from ubuntu (softbank060152129044.bbtec.net. [60.152.129.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e7019sm12732315ad.11.2026.05.29.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:55:37 -0700 (PDT)
From: Nakamura Shuta <nakamura.shuta@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nakamura Shuta <nakamura.shuta@gmail.com>
Subject: [PATCH] rust: page: mark Page::nid as inline
Date: Fri, 29 May 2026 17:53:16 +0900
Message-ID: <20260529085316.27432-1-nakamura.shuta@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building the kernel, the following Rust symbol is generated:

  $ nm vmlinux | grep ' _R'.*Page | rustfilt
  <kernel::page::Page>::nid

`Page::nid` is a trivial wrapper around the C function `page_to_nid`.
It does not make sense to go through a trivial wrapper for this function,
so mark it inline.

This follows commit 878620c5a93a ("rust: page: optimize rust symbol
generation for Page"), which did the same for `alloc_page` and `drop`.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>
---
 rust/kernel/page.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index adecb200c654..764bb5acc90a 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -193,6 +193,7 @@ pub fn as_ptr(&self) -> *mut bindings::page {
     }
 
     /// Get the node id containing this page.
+    #[inline]
     pub fn nid(&self) -> i32 {
         // SAFETY: Always safe to call with a valid page.
         unsafe { bindings::page_to_nid(self.as_ptr()) }

base-commit: 72d33b8bfeacbfdccf2cda4650e8e002def036f8
-- 
2.51.0

