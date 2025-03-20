Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7CE1EDA3A
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436561; cv=none; b=C7Jph6yyBdiUgjvS05BhzvglKoaNqySjrtg7+o8kv6GWSqEj1th+QY5osLOp5RP5KnvStEoAwznNHEbQYskusdLARssLfQRs3Is0F9/9NS0+fYqp6ovKp08u8H1unJPr06iOicq05TyBr7Js3hE2KdOZNfYO0ymKfYvjBAw5k/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436561; c=relaxed/simple;
	bh=ccxg1rSgzzghOVz+XAsY+n/ViHFUNsOJayH2bWRfmec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3XaZSZLUjJ9kbAxu8R82ZYL3urotZNh8/C0M8qRKC8bgDpoUGSpv2UW0gUrn2D6FEMWN6rlzGB6YFs7G/5POIOvNn3Hx2hSb83pTi1/GxkumA10JMdKrbGr4fCGZ8EozmhqgnXSfq7BZ6w/sUYmPuCouO/CgZpGMHENYdL/6MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=rILsLC/P; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="rILsLC/P"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ff07872097so2438897b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436559; x=1743041359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH7pN2HHzqaHv/+RURjN1vt61BNgNWW8J1587fmHapM=;
        b=rILsLC/P8OFesqmdPys9UE52UMUXakmEh9/y6GFIzfNZNlYWSvtIi8OVmhXwGFQxfd
         sEfCq0OGDF3ZJyJ3FDqbN3FAF9z29XJzBhkxq8mTLKoMhEaX1BvZmj0h9HkBE8WMO+4I
         36+Rh4PttgIVenMM0wILnBzL44RhnRyYgrLhBQqMZVds9fcdwsseDLdApZMCIkR7itU/
         ed9rock7WjcD9ORmHvtyzEE1kRWHVBw/+1zpYpGtZJhU9LqgSF38TQMBzdnZPrObSVhc
         +Tq3+/+Jxw4GgYY+cbGsbMdFYSXejlrZNnN9BnDy/aIISDwXvo+HSTDQCjzpz34UsGBy
         pakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436559; x=1743041359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zH7pN2HHzqaHv/+RURjN1vt61BNgNWW8J1587fmHapM=;
        b=TbsYGkX3Pi64UPpv37DujDrV98dw9djEtPT0LHJUlfJeDDoyoiFDtR1oh1oOv7Bn79
         sHGzX+Jxg0WyeWgopDu99MNhE9iqUDx5/usYAYUmBWuJzkzQ9GBp0jUXhtuavMrcuGsj
         KyCF4xup16qCiKzCvuV6nCT0F26p7vAUgLGTujALqsCIcf1tPyZ63xsYHwt64K+MaFfV
         0TTtvYVuTE38KMhGo/1A20Ow+cMTj+iiRoxgSCp8uJzzzzZho2FdbXLQw3kua9G1qcNM
         sLU6SOcqzD1nCDurVKILXh8o4o8fAv9IpTcp4QoqYE1jr/M0/8tbxrZPcqWF0nH2HMHJ
         fKgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF3o/QzDqFda1KeH829MS8CLQ7qeuXuxrEMT4CIAPZ5xURy8Alne+zQ+JAJCoekW9SSsfVxxp5Q7tJnncVTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCftmrU/D+kYZsEAjulr29DzhP+bKnAC/PqMbKR6i/tYRLgVkg
	vuBh6G6sSd4plDf/vF0i6mg3UhLv7b5v54PvHKGBDReEzQSW7OZMPz+pirYbpD0=
X-Gm-Gg: ASbGncuf8zEjZB860pw/ut6be/+amT8Aa6vdzZcR2pmPxHjDxSNXvuyjyaoVFDRT5zA
	HiLYLoMAv6rjElxOJZpKuS+RVuGniZJA+EvbFReGqUp+YG7VftcnQFOHRuPNRpHVFRVG+o8lYkT
	AtTOTeW6ZvLX4Cbr6uVkdL75wUfaMVhU6GQU8ouhUW9Hxg6i6InYUHzpQrOOyuephO01/G6pvA+
	1hTtEaoBkZDv1a2d4B8MN/snXc0kx59kUkqlEIkIdmtyM3hrSdSsYTvYtfXL471YrcE2ktHMvoC
	8pUytk+0/xnP9SveVbSWHeQ4pq8t/q+8XioxQEbl6D5HpCUbRwMjYI7sXCAB4bTdn57dsHn7nOv
	1ZGPleEknRTWm20L05Mjvv5MQkiGPSA==
X-Google-Smtp-Source: AGHT+IEW5G+pDsiPRKkgTvD8Zo00R32kyaBsI8eJPeORLUzbOvUl0Vn9XDX1yfKHznCnzVzUBF0jUg==
X-Received: by 2002:a05:690c:498d:b0:6fe:b109:6965 with SMTP id 00721157ae682-7009c157709mr77798037b3.35.1742436559191;
        Wed, 19 Mar 2025 19:09:19 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:09:18 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/17] rust: block: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:35 -0400
Message-ID: <20250320020740.1631171-17-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of_mut!(place)` with
`&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/block/mq/request.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index 7943f43b9575..4a5b7ec914ef 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -12,7 +12,7 @@
 };
 use core::{
     marker::PhantomData,
-    ptr::{addr_of_mut, NonNull},
+    ptr::NonNull,
     sync::atomic::{AtomicU64, Ordering},
 };
 
@@ -187,7 +187,7 @@ pub(crate) fn refcount(&self) -> &AtomicU64 {
     pub(crate) unsafe fn refcount_ptr(this: *mut Self) -> *mut AtomicU64 {
         // SAFETY: Because of the safety requirements of this function, the
         // field projection is safe.
-        unsafe { addr_of_mut!((*this).refcount) }
+        unsafe { &raw mut (*this).refcount }
     }
 }
 

