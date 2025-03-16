Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB518D65C
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106059; cv=none; b=cSYnTZwiMsJTideb6citx2qdZH79Z62PDDf2pWDeBwnRugNYSS4rIThn17SiMLe5TYfpogFe4dVImhBn4th4cDEIbQ+py9R/Dg9BzowuqBUJxPReLH0t5bTXqdCXxAtpsE00i0zOm5c7FNH7Hr+RlySaZMuTTHnUIP0Kpos5cJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106059; c=relaxed/simple;
	bh=6kUxBrQxMex82Dfiy9yN8C7YKntSC4CHpsJlbHDXZ/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8q5lGBwpsVgnFcVPfhua0IJmj8Hk59poNrnJYh36XhvYpQs2TtKDVNEYKEGGq/uWE7ynS3Zo+WgoqGQEBdiVhiEcpLB9xtdBBpoy2VjRpJGMgBP+xkDIYCDaDJbip/O+wn5Vvccv1uXMipl9J0F2N96sW8TbvCsGt+O15XyQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=rsamJEkT; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="rsamJEkT"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e589c258663so2979222276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106056; x=1742710856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skUHTWyrumrekrxW/UyrijXP0S3ug25d6RXYwbstcOI=;
        b=rsamJEkT8ezTH6UKn+fvnD1oQ+QlbzcEeoJls6jvdTdUx8j/yKDJ8k1GWu4BZClWps
         BqD/T5Mf/OmluFBttl/YYN2PmXV+zujQN8ZVGhH9NxEyjCyWIkvwzaC/lV1zoutxHSis
         8fStBgMIyUtSv3Vm6yak72+DjjD1yxAhsvOmBZh44qlaZ8bUJXzKEEbX23YpiLSayJA7
         H0L8Mdkcr8ueyJK1f05cFMEyEDBmOfDfAfOFqDN0yl6ba4vVohLGSnHhqfuBBvVkiQgP
         WzpEHewxtbJD97APsDvWkiMMax9G96RA35hctV49XlGcJnH05ZpDwKtpziN4rL0k1gL+
         7QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106056; x=1742710856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skUHTWyrumrekrxW/UyrijXP0S3ug25d6RXYwbstcOI=;
        b=c8jj33T9BpdhcMkUlZO26JIPhSSNv7jpgbPl6IwMHFUEHqu60az8KT27fqnCzHfi86
         jS0YOQRlfQq17ZQWI5zEuKT7hQsdRMPClnOZxDAEZGa5De4paNE0H5DvAhse8wo09EzB
         gA8EHqyRzMuHzBbZNBnkiyczrrQR8DOmK6iwirc1mzeP6KUwRhZUlYLQQmLw9QdT25Xf
         BzZ7b6JBh7txaK1Twa9U1Sc6pGNlbVGuMO0ApfbMZFrxJ11ewH+2ChCYgJTpEq6KsIzs
         df5mIF2Y1+WTJIbZix/NDV3AGjpJbBR76YduiBP2obUNUgLHBYZyrvcEdSebn6uYUp16
         DdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjlqoWa9FIDb9gzVUaZVcMCWit6TOBZdDxk7GvVC3yAXE1NA3LCMctllZfi700kxJadfCyBAkXbsMpyhbYwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVlqrrg7gjAXHMbnolOLRHx5Y+B8wDspDpSyikzb0KeCP5fSQM
	xCEHbIDC0iayPCC7CKUOnOE0iPqN63d63IvfuguCaTKRIjFTS/NsSk8SbPrWsrD98Jn8QkKhqI9
	d1PxNJw==
X-Gm-Gg: ASbGnctLO7yxIPAf4LTmXpaM3fDmXypJMVbbUX73e0cI6KVqvNYrTB1Dr6CR46BCm4y
	w04uEzKkMc15ynPuZg6DU6jWEjc20y183NDHxKB31FjlNgjZuJZ7LhB/yupZhyEkT7g+qAF8D96
	JsqdRWKGi6sTS/lrpsXGR3ihh1G6DYulIyWXIh5WkJkQXTtUzCyIsZFyi6wtDNQ12F7RbDGaQus
	8NEEFJbAnyazPY35G9khc2UwOASiBl6RBiB0453843fJqMOywZ6acTwe2CcEcxoYLNWSwyIqWzf
	Lga5sJT7nHN1CRnLUy+cDjAYNAXMEdWvK5JPHoWrg+wpWAAEZRa2L9xlDVRhKFl+EhpPieR1dH4
	55Q38+WP38F5XwqM/e118qn6osj8pAQ==
X-Google-Smtp-Source: AGHT+IFIA9jJmbRoN7Y4Lg46r7JSKPu6MnbK12bWhd74PXynRk8+s6RQ3a5OoitFk1+oG0NyrHvHGQ==
X-Received: by 2002:a05:6902:2292:b0:e5d:e3b1:4868 with SMTP id 3f1490d57ef6-e63f65c360bmr9498636276.37.1742106056331;
        Sat, 15 Mar 2025 23:20:56 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:55 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
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
Subject: [PATCH v4 16/16] rust: clippy: disable `addr_of[_mut]!` macros
Date: Sun, 16 Mar 2025 02:14:25 -0400
Message-ID: <20250316061429.817126-17-contact@antoniohickey.com>
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

With the `raw_ref_op` feature enabled we no longer want to
allow use of `addr_of!` and `addr_of_mut!` macros.

We instead want to use `&raw` and `&raw mut` to get raw
pointers to a place.

Note that this lint isn't currently reliable, but we enable
it nevertheless because:
1. Document that one shouldn't use the `addr_of[_mut]!` macros.
2. When the lint becomes useful we will already have it enabled.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Link: https://github.com/rust-lang/rust-clippy/issues/11431
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 .clippy.toml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.clippy.toml b/.clippy.toml
index 815c94732ed7..95c73959f039 100644
--- a/.clippy.toml
+++ b/.clippy.toml
@@ -8,4 +8,8 @@ disallowed-macros = [
     # The `clippy::dbg_macro` lint only works with `std::dbg!`, thus we simulate
     # it here, see: https://github.com/rust-lang/rust-clippy/issues/11303.
     { path = "kernel::dbg", reason = "the `dbg!` macro is intended as a debugging tool" },
+    # With `raw_ref_op` feature enabled we no longer want to allow use of `addr_of!`
+    # and `addr_of_mut!` macros, but instead use `&raw` or `&raw mut`.
+    { path = "core::ptr::addr_of_mut", reason = "use `&raw mut` instead `addr_of_mut!`" },
+    { path = "core::ptr::addr_of", reason = "use `&raw` instead `addr_of!`" },
 ]
-- 
2.48.1

