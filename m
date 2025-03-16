Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E018DB3E
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106038; cv=none; b=mfRQkhbihj0ESpcgKAcHDuSYaGyY1H6AQcv+cTtxeNS6snx7DTblcKOXb8uePOr3W56i2r85qw/N5uBHxHpJMd0xZvmmSX+ireSzlmmmpSB6VGGmTUE2TrkC1XMQ1zUJBH9sXfgebqvsyAMXpbNjFT2E3dskwqv7mXwuZRdyNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106038; c=relaxed/simple;
	bh=7xtq9V9ZKDfuDOMQ7bSuv/tuXVUycqrzxOpXl1DHs3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTMh/Zb3Nf97KIl3Pz65HRzbwh1TwgDq0WxHypJZbDHxSwDOH1NQN01WSr0YzCvMpSqrlQuJUbwO5TLCu4DVtg1380QvWb0A+2qB3i2j4lpvsoCSW5tOAabVllcabOGb2dgUgeth8ZZk0TZVw+UHsMvgERxtcjIz8lS/NDIWiBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=aQQX8LmP; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="aQQX8LmP"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e5ad75ca787so2890227276.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106035; x=1742710835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vynQu5oPfCf0AJPNbZKcC+xMNQVxNSFqPXWtVec+6Rw=;
        b=aQQX8LmP/sVikylVUV3ftYl4lOoI4/SPDBlL9G5tL6mGr85gzHIuOwbReHSvaPwuPP
         1CmOxrlzN3XG7q2A48+1eGIv9UWSQO8/8/H9al94ocpDF1fjMsjjCiJLHcN7j34fwOwE
         2HlEDYxm8cAYwLuT9LYdK7BnXoqKsCqi9aj7ucxh5mZeseH7kI+IvBkiTDfJKCApkYTE
         IhWwpQZJc4sm/iCZOxyTG+hzypJURdAGYUYolU3T3lbqf7akDnoXvETMYJbk8yHyg7yK
         krMAkcHzBCh2qbWQm4NSz+6cCPwuI3MW35z9fk5Osny4Ss3A+A5bLbg9pNRlmiTiIVln
         YIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106035; x=1742710835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vynQu5oPfCf0AJPNbZKcC+xMNQVxNSFqPXWtVec+6Rw=;
        b=rbWWaHT96rsdl6m3X0MyOb4SBlAYDpYb5+bAqCmSscUR9M1Kt2Et35TfcYlJdi/LLJ
         ZDy1VwvUfzRdJcUiWtdlNuFBrO00I3E4IBi9Zoy852IwXizS2vW5YmwWbUZV6B0OozvE
         TZMEtcBO/atqBoKUp/HygXdNEpuwBmocRVGv/YGGfwjPyUyOYb/LHMOcPf5VJSJhSWS3
         ZQ5P/DtPB50naDQIuhVlWUOwhkjxA4SaTSKK5QYsFz6PqpExZ8fePyZqar6WR2iWj6mu
         YVm8iX/eEM/B+XecEn5s4NBkXmCjFgGQMJqI4Mb/RSTiRBg/ILrCi9V9rh3NhlzSDEit
         DtQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWBu5Crfz6NkWUcFOp9lOXuQ1Yni81Fs6/dwPnpp+3ZJ7L1pePS6k6piB0rXI27+bjD7vb1EcFDLYkgY3s4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8QZtcUYiSItRKwEbjZztOBSs7GoTaC1Mw0GOudsgyR3zGX97
	+n2PvvLitaz1yAafH6mjkK7q460yGgraXa66pp5Mrjj6DYSobFTgu6rQqBpWpTA=
X-Gm-Gg: ASbGncs48PkBxXYchdMehWvsF/y7ORbFqxf+oz0MnJuOSZgOj256uDz60q6UZ9WD1j+
	XHQpg2ctvSJX3wOopXr7IWgyStlrT0cmbh6ULbBZMGanbDm+lo1wLMMY1paME9xjihq9b1Ml2L9
	TR/rSqiYj8aczXGeNusSrweInaAgo/9VfKy0C0WlPPv/4TPSR1YNvJk6ZPNPsCJ4qxdgQ8i86kJ
	JXoF152cqyplberSJW2Y+bioq7LWy10Z+5DQKkgyKh0SGiVD9UYT7movnRkBF0BLMWzVB4kd7zU
	zJYRAsSfDFKl90Et5lix8Oq1KC6IzFfCzKnX9RZf3+TURUX1f6loiM6M14EsdGufHDRI2QtdP+S
	PEFZze25Jz3YzxJ2WfnQadrtJHa9cAIysevFuMAho
X-Google-Smtp-Source: AGHT+IGRIHeKkrWlVqgNcR+eGlkpCtZNJD/G9CDzmL+wplncMLNFsUir2r5yjGcPNmlhwKfMKaw6og==
X-Received: by 2002:a05:6902:2184:b0:e5d:ffca:7062 with SMTP id 3f1490d57ef6-e63f883a78bmr9508330276.7.1742106035532;
        Sat, 15 Mar 2025 23:20:35 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:35 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/16] rust: platform: refactor to use `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:15 -0400
Message-ID: <20250316061429.817126-7-contact@antoniohickey.com>
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
 rust/kernel/platform.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 1297f5292ba9..344875ad7b82 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -14,8 +14,6 @@
     ThisModule,
 };
 
-use core::ptr::addr_of_mut;
-
 /// An adapter for the registration of platform drivers.
 pub struct Adapter<T: Driver>(T);
 
@@ -55,7 +53,7 @@ unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
 impl<T: Driver + 'static> Adapter<T> {
     extern "C" fn probe_callback(pdev: *mut bindings::platform_device) -> kernel::ffi::c_int {
         // SAFETY: The platform bus only ever calls the probe callback with a valid `pdev`.
-        let dev = unsafe { device::Device::get_device(addr_of_mut!((*pdev).dev)) };
+        let dev = unsafe { device::Device::get_device(&raw mut (*pdev).dev) };
         // SAFETY: `dev` is guaranteed to be embedded in a valid `struct platform_device` by the
         // call above.
         let mut pdev = unsafe { Device::from_dev(dev) };
-- 
2.48.1

