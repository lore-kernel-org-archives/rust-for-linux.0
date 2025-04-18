Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8471EF091
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940544; cv=none; b=jn2vUAO01sId3iNnvwI3QBr3maey5wUISR4sfAmzm7u2iC7LFh1rq+SvgW6ZkS2jgoQXMx2xpbYNvcDCJ81bv/mneAQCqfXE2IgmrZwywBQoJ8JY/eSH4vZf9oH19xqhFF1RicmqJmztW94HHiDAU7oBSL0cUPOZcb1wHBuDKTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940544; c=relaxed/simple;
	bh=tMcIRwiOND2LkFh2ta+lL6MRxkp883Z5u7gsfs1JO5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVjzgRRkyGrC0T4uAQF0bX+mskj9Dd+3lxWpijQddHDSfLM2hLcTt6lMSnkLZQD/Z7TOyFVr0P/8aduK+8ayhHpXuvMn8g9XaG/to5wOqX7s+pC4O5p1re7UoIZDnFxTkhsdCuz8EZNnEd/goiVj9ExGsN0u/ziOaycfEDMZWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=Rv9a8fo0; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="Rv9a8fo0"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e637edaa652so1199670276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940542; x=1745545342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhrJCHjOUAPpl8pOKLpx97O3fapOOv9377RmQCvweOo=;
        b=Rv9a8fo08tVACpRDd331s7f4rx32nZXqWJozG7lnl5bvwJYOZGn/6Z7eENfCA9a4Sl
         TIQ0PDPWBfdVbAzqvpMdTKH2SHQ5+d4rhaEoCxuI9k1TmSUIOCZ5FcocZpZ7Xv7EYqO7
         u+p1oxBrabrycG30JQjFxCre4t1uwYR1vxC05ZRA4MrKw1u9SFr5tGlOzfyyVTmtqc7c
         anaLvbCH/8pOODLTc4Xbhdz1mvMCPFmoiTZq08v6H/jNs0AdSTI9qLP9P6iFxTvPUXmQ
         oJd+IMNCCZlqySZTBW6MFkPwD6Wbl2nWPZXOUunJIWkcXpIiLPziC0gb0mxolwENtCdf
         ADQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940542; x=1745545342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhrJCHjOUAPpl8pOKLpx97O3fapOOv9377RmQCvweOo=;
        b=PgdTxawYXJih4orNs+1+q94gFvhVsgppCw+v50q3qZKowZDMqZGOVmJUjObFP8oBd0
         ot3RC1B9AJsjaGG9/o+p+kFpbDOwI2une2t1eXf4K55Ebx8C2BIdKMVCDepNBqXXFCuP
         IcJZU/kz/alsk8nG7zvTiy0mRdMZs5Z49S/FyKxHaFTJCcknZy10erP5Xy4MfYdISt9D
         4mCUtn/mQCh7Hdz7Zw6nGIwod1Dkhi4BU2wCXHHnhIEdyEjnRXhLvs+oOzUwUhcAKlXW
         HeczVy3HiQSO1QmzcDnu/9Zv+Tvcks70axlS/wlSoIHjAkJd8aWSUS6nPVGkPmGcnjSA
         gcHw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Za4MjbRMYFs3iTSBNcyF9s4LF7MfVEr/Sy4RgyR76UWiPx+/Ro6zf9HXsCpnesGhzG/I6ew2M1rR9wspcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3In9hc4pvbeqbtJYQOG59epAb30J9GSWixwBn85FyDfEt5eJu
	FbOP+P014rh5AZuEXceC3n2OA/esxuHGYDLMqE28G5xJgNdhxPw3HHaYl5mzl74=
X-Gm-Gg: ASbGncvJsjrkx4W+qb+gYjKi+iKyDNfyq88tftXJDNL0s3F6QTAiYm2YIAugQe93OOa
	JZXLDatPWWT61wWMSW0Zd+x33m21IUGpLm0+9MRy1UGdd3zPaxqj96y6anHn4zkdUxnKbQq5lRe
	eUETsiPKN3HpDfsQ27DXpbSHeKY2dhVR02OmhTn6kn/GEMYkbIUNO/e/30oafwV5wR+gcqVnSjL
	jWC1Emo2aLT+vrA6+VdX23X3azyup3qyhzokGX7Pt3lzsQS2Ni1fWU0G9TDu6u9+wqCLjt48GyW
	NJ5bWuO5hqkXTNq0GAvdH4sV7u2XdNq/G/28zNMwPPcQbZVFH4cOeM1hlHZlMypFJpPbBiVlzCI
	ZfRKiqED5sQHOf+nhsbBbwu5RhyMCgGnQOQ1f
X-Google-Smtp-Source: AGHT+IFJ7xF+dYjlJXmNKGmA+1knxcpHOEgB8ON1tlYplySG+tkiaUTxJnupU3OtBJxR+cTdYbbaqA==
X-Received: by 2002:a05:6902:1b09:b0:e60:8a06:1ddd with SMTP id 3f1490d57ef6-e7297e9a9afmr1489461276.36.1744940542126;
        Thu, 17 Apr 2025 18:42:22 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:21 -0700 (PDT)
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
Subject: [PATCH v6 07/18] rust: workqueue: replace `raw_get` with pointer cast
Date: Thu, 17 Apr 2025 21:41:28 -0400
Message-ID: <20250418014143.888022-8-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that `Work` is initialized via `pin-init`, the `work` field
is always used. This allows us to replace the use of unsafe
`Opaque::raw_get` with direct pointer casting.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/all/20250316061429.817126-1-contact@antoniohickey.com/T/#mc7a4757e8c132f84228b728c7d123d73841501d6
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/workqueue.rs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 3a8e05ac6bd5..c5f09b0682bb 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -399,12 +399,8 @@ pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit
     /// need not be initialized.)
     #[inline]
     pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
-        // SAFETY: The caller promises that the pointer is aligned and not dangling.
-        //
-        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use
-        // `&raw const (*ptr).work` so that the compiler does not complain that the
-        // `work` field is unused.
-        unsafe { Opaque::raw_get(&raw const (*ptr).work) }
+        // CAST: `Work` is transparent to `bindings::work_struct`.
+        ptr.cast_mut().cast()
     }
 }
 
-- 
2.48.1

