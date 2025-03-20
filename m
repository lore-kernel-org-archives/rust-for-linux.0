Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175111E572F
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436553; cv=none; b=rWTO9auDr2yCn4zu9VPfBic+5ewfhWa4VnPLkFmMOIT5fpLGUmxi2NEe75uVWEts1Ld082FSiU2AzHD0AmxEsTyA7jwdgWVP66dRTIs7V+I5t6K98WRM19dPMWMULbwKDXB59f8Tj41QtejXyCQA7xNjtDqBdO+VFPDrXJn+Ncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436553; c=relaxed/simple;
	bh=Or6Oia0V60k1legDs9xJo9SzVaQNUCuV82n0fmSpftI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGdqKpH2hgCdVLVhIOposC7HxR8Vt2nrMNCpBUBnxQJuc6VI2MFQ3Kyz1kYuiuAb4Pl/y1Xd5FcnkG+jqCKJC0LmKYWcDztzGHsRhDWGXQN2SDNXg1PJZae7CwsCCD3ATEnyQ7ud3RUzG+NBD5udZ3/VLSGkBNzUCBuilQlC3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=mSfCmUSq; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="mSfCmUSq"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e60b75f8723so187115276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436551; x=1743041351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ty32uzhHiEBtLktT6ubZPRwrYT53NX4ATvYCjW9fL0=;
        b=mSfCmUSqGpex0CePfV1exkOUcxe8oggZL4B+bEjXBhT5R60WcWyQqKABWEf9rdJJY8
         NAQRbGBby9nf3mVZ3pHe0gCniCWnVyEYHWNOQ2PprsBHH54phwB1frtaNAA3QY20x0qB
         /HdhKrMmX4TenOP/AfxyXLbnDqR2KdQAgkxhNJMQPK2cDpM88UgVa5rLN32bP6UCdPId
         MlBlxCmuhil6tUke8aXiWNgrUsG77jnp3UKdeM3Fet/DZRScWW+90xmp9xhRrvx0y1uc
         4eQCqzDSv5bCPCQfH9Xx1V3vSy7667TFIlF8I5dklS0lFx/QeNT+5kI3u/GZLEulOj6x
         deBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436551; x=1743041351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ty32uzhHiEBtLktT6ubZPRwrYT53NX4ATvYCjW9fL0=;
        b=PjKeOANjhLPoVkhPYMjEVOH246iXnqaYIecASNXLq2AtjMqc/wrBbpEFwykMm3N1T9
         ZOWJTXAwzfvhXgvNlMaP3juR4yuqqs53ewNtB/Yg0M9axZ4JLp/4IxnKCkQZ8hOGA1eC
         IEcteS62CKk+V1tar2+c+quXErcIZ+Ke+n3WRfVfYd1LAo8sV3qK6JQ6o3LYsbH8D0mv
         rszQOrEZxLF4w3fSvx5lFliDPGyV7HDy1RY9JT6Ih7K24lrlZ9n6SjuCWbPXbygh1nqC
         3WGbGPidPXG75SdmP8bIpg1Uj+PYAzUEk5HB9WmKC0ZN7ltVwHpxEBurBE7G/wIfvvRI
         KdMA==
X-Forwarded-Encrypted: i=1; AJvYcCUM8u0Vh1Pa6l3d6Tymou7TFvIrThQ7C+WExgZwaIaSegIMfMMhI+W7e2Fb0sqsBUnPLkU3f8q96p9K72JzGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRayP9IA4bm9S+IeOyReM/jrUQFTdRexL6ARGO7p+kLXOEZM9v
	ia7UStwE1sB9lInHj/cHNKvHTrwIngAam5IQVXeBTP0oxbYK7xPjlW6btnKGydc=
X-Gm-Gg: ASbGncsb6icvfH1cfD2RM5dqJXqzy37xjR/pjJYg7t0rypXLM57ybSKh6KfR9fzdkjk
	1P0qCtryVFpU6ZMIzsUbhtoy0aFl5OCKTrJmEgAYO9TyesXrlnGe8DL1Slk0ZzAmulVdPccKxOU
	tfJ6tsHm7YXxQoB4E9i9lKipZRBXxzDcQZXnY6rwg3tK8sHsxVJdcPHE8+GVg6YTLImpKWP46fe
	SmEDlZ2bCfWoZApIoEP0Wt7GeVT4/7502fvscmHhchELRElv9toCFd27EySDdYo23cvKOreAcUT
	ij7qwCPqoiwzl1ivpTt5oZy6TkyLODs/wNyJeD+ItBWbzVEjVLcfs+qHP/Yn0J++FMbxie5kzvx
	Gh1JE+NESiGr3hXkWETKJXGv/wSL0ug==
X-Google-Smtp-Source: AGHT+IGr6ekwGvrKq0PfUiPlCZm9disnjUfBs3tMkHfcJsGG/xk58LhvIK57Tr2cgBQ49oejUbUucQ==
X-Received: by 2002:a05:690c:4988:b0:6fb:9663:a5f with SMTP id 00721157ae682-7009c15b36fmr68845797b3.38.1742436551176;
        Wed, 19 Mar 2025 19:09:11 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:09:10 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/17] rust: sync: arc: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:32 -0400
Message-ID: <20250320020740.1631171-14-contact@antoniohickey.com>
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

Replacing all occurrences of `addr_of!(place)` with
`&raw const place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const` is similar to `&` making
it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/sync/arc.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3cefda7a4372..81d8b0f84957 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -243,7 +243,7 @@ pub fn into_raw(self) -> *const T {
         let ptr = self.ptr.as_ptr();
         core::mem::forget(self);
         // SAFETY: The pointer is valid.
-        unsafe { core::ptr::addr_of!((*ptr).data) }
+        unsafe { &raw const (*ptr).data }
     }
 
     /// Recreates an [`Arc`] instance previously deconstructed via [`Arc::into_raw`].

