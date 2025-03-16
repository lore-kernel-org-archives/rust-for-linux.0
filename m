Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B2191499
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106042; cv=none; b=cbUeEqe+VsyHGtLtdh9Kdd825uEmia6kKUja421LcPuWPNP623W1/RVbmjWyMdKUjJbPRBMv9sKdXfBGNNBuemHC2+Nf0p7QincfRwhlrm2Dw/KT9TFVjeF6ObvC2Len554jII73c/alfKpzYd+U4XCnsXZFSn/fdNIu/0uje0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106042; c=relaxed/simple;
	bh=YC0aFKOl5srVCaDj9HbucZ/4B5f/InwUtG32FScc5k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihjjSRc2KbgBxpp7jjZ3KgFQrLBKTkR+FmmhFuVjaBK3OUuuFmUQU8ZV+6gpgjck6moCdbBRvpq0EiXtEfPqY92INxiNM/D8tLFFfCw/cFx+EK4/vJg8JYog2VqXXMWqM9wzryut66RF9in0x/XmaGgFfpol8xuh6sW145CjEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=Idlh1j9U; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="Idlh1j9U"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e6412063976so408158276.2
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106040; x=1742710840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI9KVcwdadVIoPwUOMUiJkuxM0R26yz4AdH6Inso0Ms=;
        b=Idlh1j9UM2XFdknrrX9CJyCGNPmZDFjHoEvystlHzOJiE9N8vVqu9y1RQ+bgyWtYDE
         h4O4KDp7ltAPDxN6GIzatSOppsK7q9SuURvzfrY8MOhjh3D8XCmRT5dBWlgkvHiYy1gm
         4pjlyZMRfpvDZ08yNgZlIsqlNKboiOvEgFFG4UqLqK61AADtFQj7slzqCNWJWCVxO+ad
         ko7sntgy5yjIKmWbusoGzC6eI8NfhOne3GBTp8oCsKaPAs6DrbQ8fVXahj0wCyrj7keB
         WCC8KzAi7EkxH1VFhOsiAUvn7Ujm75w+2AwlQLOKnMUaOnjj6RxyYtj8MGinfvlWFjsy
         2mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106040; x=1742710840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MI9KVcwdadVIoPwUOMUiJkuxM0R26yz4AdH6Inso0Ms=;
        b=JO1LqnsRwIZgx85VP0fpsKJeuSp/G2KyW175zWwFQTpdGA+s+xx2nLSjYDw82VOSsO
         okGoSdyaU2AHcGAWJ9EebLDL0jZ/hc+CS3wgR2JFiarxpeSf3MPUHWOienSyPLSxnpSp
         aVaIOOPYWKzMn3E/2Si8URtb4gSsuV8ioJxsH0MfkuAvXIpwh9s+ba6Z3ivtgOHB27ud
         MUmak/81ut6z89doELh8x6E3nK0Pc8+O09Rl1US3FXeYy/A2EGtPYx7hcpoMeHBtiFgL
         xSrXMSf8aFotzs745vHxbAHODyjw5ZEXVk8MbYv7O3+uS7DfDQIawamXnAqqv9clpDFY
         o7FA==
X-Forwarded-Encrypted: i=1; AJvYcCVbnco3+YSNo9HqdrgpPmAGApH+fObelYr6pWTNpcbW53yEHb+7Phzf8+WEk45F3c/VF+DYGvtcYxd28gsuqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+jbN1xVpGv5ldafTUYkubLiKBeAW0FqA7Nil5sJBRSjINutbj
	Wpq2qCsfS/y5MsAx7GPxAS7qwFuMyJo6mXXSSne+ue6AqjOd1E8cJC4Wk36aanA=
X-Gm-Gg: ASbGncssKtB5GaZqB6xQBMMTcuMzfQMYXJ84nX6YhU8FzXxAIkK8dxKNIXYAsbR5n2h
	AVWoNpq0uIwLxM9qfPYgiAs9zHvEpIM1nin+Qh2X1trmURdglawLJaEXH4Hx9tWpXJOSjY5JR/X
	ZWRmou1nrVhgw3jdRAXKWn/EFtj4kBXSqKAoLMoQ+H6ie+7DyEf9H2G87MKY7wzJCtqHqne4F97
	1CTOBlyZlu+9yWT1XJni6Qr0ZCXbZZ6Fa05D0Ar1H+yKrK6QTqYZB9eB4KfyKOgwsZPWGWdKehw
	zIxvZvYSf3vKRseaxDFwgAZqjG5Bp/NF+98FSE9N+kBmDGRGLbbkKEG3089g49fNa79uha6VpQZ
	em+Mw8cRrIYslrIPy7cWs71636I6WEI1njp/CMB2k
X-Google-Smtp-Source: AGHT+IFAFL4Jrh9Si4Gax3r4dtRoG0FBSmnCiBh0EFTCVqOTSuBu2GcZmIpzrGnEwTgp1XUPTU94PQ==
X-Received: by 2002:a05:6902:2186:b0:e60:9b80:1f82 with SMTP id 3f1490d57ef6-e63f64d1799mr10862158276.8.1742106039894;
        Sat, 15 Mar 2025 23:20:39 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:39 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/16] rust: kunit: refactor to use `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:17 -0400
Message-ID: <20250316061429.817126-9-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316061429.817126-1-contact@antoniohickey.com>
References: <20250316061429.817126-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/kunit.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 824da0e9738a..a17ef3b2e860 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -128,9 +128,9 @@ unsafe impl Sync for UnaryAssert {}
             unsafe {
                 $crate::bindings::__kunit_do_failed_assertion(
                     kunit_test,
-                    core::ptr::addr_of!(LOCATION.0),
+                    &raw const LOCATION.0,
                     $crate::bindings::kunit_assert_type_KUNIT_ASSERTION,
-                    core::ptr::addr_of!(ASSERTION.0.assert),
+                    &raw const ASSERTION.0.assert,
                     Some($crate::bindings::kunit_unary_assert_format),
                     core::ptr::null(),
                 );
-- 
2.48.1

