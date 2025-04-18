Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3315021421F
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940560; cv=none; b=BxthdRpbZBodRHbotZ32BmPAvgstfvESdeGfL6T2Iqjv1sBW4PP6eeFxlsvW5sgZvQS3AAdc8RnRJGWUJhmay5jagz5IXuXlvsVZmQL/D7T6M0g0/6vbGgRmBzKtxjoZM1uMBuYQZjekM1fgpPXGLpyjeATqrUDaTQ3Zw8+h7gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940560; c=relaxed/simple;
	bh=LFMQ+L94zjYiQUw6a1CKQk3d4BxJvPyZVxXJ/gsuLJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLPB5w/1MZPzYiki0hLB4gPrsg3U1WlFq6Oh96ypjfWolarVdkVDaLeRGrv6AE8skCQ3raZayeWKobTYlaEKRQhPKCmQN3QWQ+zPHmWxgn48hmPawmXCnqSMqxLjaZ4pyGRFIsQK8Whwmv+PSIjn/Xfa+D6sSadA3V6VwOTkgho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=yoUtw0aZ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="yoUtw0aZ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ef60e500d7so12234347b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940556; x=1745545356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AI1pnhwmE+8xokIyOzrC/UhLGaF117Y++3PU7pcVmz4=;
        b=yoUtw0aZQGEeg6U++Ax2CrViqTr8jZpgAYzput8aUMEJfbj36UI4pvXkJabtDfCFmG
         CQSX5Nrf4Wktq4W/2IQz0x7JfJRvl923tBulRpnviphcLCXfv9JQB72MyVi4n0kwq4q7
         SfqKWIsl8aqwo3R6MVR+MtJWDNxoojpaQwPHufBY8LZlivKv/+c3GjJK1g0aZn7zppJU
         e9hms0W7uKC6ZzDvtNYFK5YBG2sDJ9XYEZ3QAs364k/X7bd6LK/cs91RS/75/HEPv0Jv
         I9wcfa/vhBfDb/yf3qauHB3SjHApIusEapdkK6Yid6WeYcTgIGoP04CFfdqisC2YH3Vb
         HjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940556; x=1745545356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AI1pnhwmE+8xokIyOzrC/UhLGaF117Y++3PU7pcVmz4=;
        b=eTEXHdCbClNKCcKfYvjQDDG1QGQ5WjDkp8Qy8HK9wwiW/j2CxNdfP4P/1X7TPBnCmA
         ebIElz3DmeQcleHA46MfG9e49eXVMal5GOjMZwY/vAOqFXHeFbiZhjK6anMuoNMgHLB3
         8ykEjG4SdvW87919hT3qLBM25l8OsXcFrDqymmSVJ+39fOiCNhcDv9dlkWiDxchKCc9y
         1Zrz5hpsGvSJoRbsEY6Tv5/+/qaw2DMnY13+F+0npSW3JXpAKgwnbG3YHQPt7BUAZVJR
         z8D0WKyrIgveJvm+oK97hm80wzrkaPsspvGuQVkiuaP3oCXWNGPvyMmTrWHg19HGR7z3
         5mUw==
X-Forwarded-Encrypted: i=1; AJvYcCWKCUeiUhfjKVP+MzsOAB63VO/Cy7qP4aDENI0C87R48cAcHOSFrS8G5O+xFdgBDAivwzzzua4LqjC1U49iSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywud7ga23ZGP1zrfWq5KqGv4RgCgA5pAcBvOe8sGjGiA0yGQtN3
	Q/mo6q5dVNBtb4VdvKvZCz83+NZwpaxYw1nd4Fig45K/lX+xquxL1YxBgf+Im3M=
X-Gm-Gg: ASbGncvyu41hw11cjjkIlPa2Q/MHWSSLp3XpBr2c/qKKSbYd9MdInF5p/aXCi1jGa/W
	qwa+64rQS2s02jiNqlyKmX39nz6mk/MkK1Nk1HcLM/oNKZBAv+2T1NjOQx3mmjuo61eJT+pObS/
	qDmXHyYB80N8k9cb//dtT0qMRrTyeUg5Amb1+qRcJR1CiZde2RWVF6wHv1tsbX8QazhINE3redO
	SoCHlILBiJVwwgOAcRsPLRafJGjiEiTQxHhfXRxg0FPvKSnnFCA2nYB33LdZCB4k8Wh+H1/RTEz
	168/UMo6EK5Mowv658ZGJFCug0Md9zt5l9+tbsN+4I7N3iUFGFr1aftp5HccSvR3+QnfR4Xk4Gl
	v4OdP4R3TXi0jg6DOH7/HKBAV/+wIBmZqPKab
X-Google-Smtp-Source: AGHT+IE5l+Ui/cDtgXp8hu7x1ECrYQ0A04JvbNLyVuB84n6vD9fpD7okMJpooYtF+P7zid0UiyG09Q==
X-Received: by 2002:a05:690c:480c:b0:6ef:94db:b208 with SMTP id 00721157ae682-706ccde3c6cmr14428537b3.24.1744940556102;
        Thu, 17 Apr 2025 18:42:36 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:35 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/18] rust: time: hrtimer: refactor to use `&raw const`
Date: Thu, 17 Apr 2025 21:41:34 -0400
Message-ID: <20250418014143.888022-14-contact@antoniohickey.com>
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

Replacing all occurrences of `addr_of!(place)` with
`&raw const place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const` is similar to `&` making
it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/time/hrtimer.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index ce53f8579d18..d91d2a655baf 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -132,7 +132,7 @@ unsafe fn raw_get(this: *const Self) -> *mut bindings::hrtimer {
         // SAFETY: The field projection to `timer` does not go out of bounds,
         // because the caller of this function promises that `this` points to an
         // allocation of at least the size of `Self`.
-        unsafe { Opaque::raw_get(core::ptr::addr_of!((*this).timer)) }
+        unsafe { Opaque::raw_get(&raw const (*this).timer) }
     }
 
     /// Cancel an initialized and potentially running timer.
@@ -494,7 +494,7 @@ unsafe fn raw_get_timer(
                 this: *const Self,
             ) -> *const $crate::time::hrtimer::HrTimer<$timer_type> {
                 // SAFETY: The caller promises that the pointer is not dangling.
-                unsafe { ::core::ptr::addr_of!((*this).$field) }
+                unsafe { &raw const (*this).$field }
             }
 
             #[inline]
-- 
2.48.1

