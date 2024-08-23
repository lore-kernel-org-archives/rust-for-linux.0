Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539DA381BD
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 05:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724389479; cv=none; b=j6mcAUlr5jUY4r/SIKIdVaCov6RFhXZ0IUKIgasxrqjCYEpOZk5GsTBtrHHLDJHu1Syol1DC1Qy7Zfw08P6Me5ECz29FNmNAUIyEWFFsATPxL6oqWEAxTUwDKfz3HJ+GmrL0PV3G1aGZzOmxiA2wk3wNDe8jo4FC9YRMxVtJxCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724389479; c=relaxed/simple;
	bh=ozpSBrlSzFPUapKkATnxVNapdrBlVLs2JlI+ORE63fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oftyk/nLp2L2//l7AYlngtdfwrLVvv5LtmmUEB9uHFRUBlmOEE8LX5Mnpmxaw1CK29kmWIBw9r+yCXt0wk+mtjB8Eplmyb58mxlyQNdFx6Z70tq7JimPnHbKDA0rxb7aRGZHvhnkHFjiJ3uscfRi1FWVxtlptidDklNOrizGGrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFaygAEZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFaygAEZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-714263cb074so1328034b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 22:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724389477; x=1724994277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9itzE0Lo3t/iBWVV6Si4AFelQ+ha4HiI9wwn4s0NRf4=;
        b=PFaygAEZraEN3UjAAWKUUosPAJ7tuIvIxfUq+HInXf5DpwtQOa0OV23HR/ncNz2rur
         lu93H2yFLK5MZVGRq4dAdBLzrRrmM2rpI3EVZWXEpe54/wiZGxuhkUwAWMQ9c7+hb4k6
         9FFNlagjt744z6FsLPgDeFu2LLuTknv9d78e7ODaCHv2F5CdHNNuMksiefBncmUrXhcw
         9JlN4IRJ+Ae+O5cdDhg8ISB5hVGEJBJzGAoPNpE35FMEBIrod0RTv4xAs6QaQH0Wy/tC
         Xjab1mP2oSxoHkosGQE5lKZECKKIslptd2cMZvoTvnCLwoQHe8C4c6PBTBqrZ8BgFIg9
         BKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724389477; x=1724994277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9itzE0Lo3t/iBWVV6Si4AFelQ+ha4HiI9wwn4s0NRf4=;
        b=ss3oDovFQrkU76peeqMdXWsfZydkxI3TQDpEE+sHTPQZMQznB3Ecx93JDcWcRofIj6
         xXzBa0s5p837Vo6YRaIEXa3XMHCpCpluT3rHXPbJicJFzpawL7kJiKstj/j6S90UmjO/
         j8rnA/EbKdZQDTM4k7JrDYULxSYoKzIVhZMvGCSPDOMSw4udfniiMM4/wes5+0t8umgl
         WarJWoE9DVDpmf8AHqkdoa/DBnrD6CqS5NbLXPmclMwCXlPn22VlR7QhgoxcqUWVJ7ZO
         aDAfDlu1Stxy20fxEUcVbouBoFb3Bsh0BKF5FU2mJI5utOKmGBEl8yf2zv5e0YIEZoMB
         41qg==
X-Gm-Message-State: AOJu0Yy5cp/TwI4l3aso71UTcr3Sqh7zd6SKCsPcm2c067LNE8WCTr5n
	h40BGrTUCu6qyNd01gH0eqpSrY/b8VQSe2KS+xo9fxj/cHDT1wnS
X-Google-Smtp-Source: AGHT+IEPxdHcwKuCBVXOTRjH0+XquMSEX+kQSnZcTX+/7bbcPPaOSbhPe+bm3s+0ajfI8xNkN6k+NQ==
X-Received: by 2002:a05:6a00:21c9:b0:714:1a7c:b727 with SMTP id d2e1a72fcca58-71445d0251fmr1263357b3a.8.1724389477451;
        Thu, 22 Aug 2024 22:04:37 -0700 (PDT)
Received: from athanor.hsd1.or.comcast.net ([2601:1c2:1c7f:c1a0::25ec])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342750a0sm2266291b3a.95.2024.08.22.22.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 22:04:37 -0700 (PDT)
From: Jubilee Young <workingjubilee@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org,
	Jubilee Young <workingjubilee@gmail.com>
Subject: [PATCH] rust: Eschew `Box<MaybeUninit<T>>::write`
Date: Thu, 22 Aug 2024 22:03:59 -0700
Message-ID: <20240823050359.1737893-1-workingjubilee@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

T-libs-api has consensus for stabilizing some of `feature(new_uninit)`,
but not for `Box<MaybeUninit<T>>::write`. Instead, we can use
`MaybeUninit<T>::write`, so Rust for Linux can drop the feature after
stabilization. That will happen after merging, as the FCP has completed:
https://github.com/rust-lang/rust/issues/63291#issuecomment-2183022955

This is required before stabilization because remaining-unstable API
will be divided into new features. This code doesn't know about those
yet. It can't: they haven't landed, as the relevant PR is blocked on
rustc's CI testing Rust-for-Linux without this patch.
 
Signed-off-by: Jubilee Young <workingjubilee@gmail.com>
---
 rust/kernel/alloc/box_ext.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
index b68ade26a42d..6179d893ff3a 100644
--- a/rust/kernel/alloc/box_ext.rs
+++ b/rust/kernel/alloc/box_ext.rs
@@ -37,8 +37,10 @@ pub trait BoxExt<T>: Sized {
 
 impl<T> BoxExt<T> for Box<T> {
     fn new(x: T, flags: Flags) -> Result<Self, AllocError> {
-        let b = <Self as BoxExt<_>>::new_uninit(flags)?;
-        Ok(Box::write(b, x))
+        let mut b = <Self as BoxExt<_>>::new_uninit(flags)?;
+        b.write(x);
+        // SAFETY: We just wrote to it.
+        Ok(unsafe { b.assume_init() })
     }
 
     #[cfg(any(test, testlib))]
-- 
2.45.2

