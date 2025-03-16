Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A965C18BC06
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106036; cv=none; b=ThfEdHffUJ/oo7p8odb/3GOFwF68AO1oGEqxjP7tWqBgPVBKMsxgi+6CHLrywowhRyBwEWlvuo/CXe8lDC0WVQeC0UfdHaL5izhShxOHqjxClSQhHSE73+TXbz3gnI0fAtXa6yfsg677wPUQU5k5Emj9JCy9OrWndo4e3cOFNJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106036; c=relaxed/simple;
	bh=AOfQe8i4EZBpyQu5tG1C/TpZCMWdiMFt8bzjtPdEu7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR8RwaYiLkgVD3VDKzyPUTslWWRYGwzzAZkNzlmyHYSdhKJ5sdzZHU+fNZoxgyheNXE+HeQOVJ+iOhRLYpCuIk7ouOEB+wnwhzPooqJylbFYWkXerPcpGB8pZzVqOmWoeGSVOsKZiJab5DVO2FbDQ4tiDDEfvupxXJkj5vzebuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=FcJSRUaf; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="FcJSRUaf"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e60cab0f287so2514378276.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106033; x=1742710833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRx4xBTrB/yyQngCERc/V3g4ftfl32p6gXpKrtZEZAE=;
        b=FcJSRUafhUFPaq/1eJ84AmXUBBDMq/6pwcujIov99pvQ/cDOmzRjp/XyJvWbL0ioT4
         cvr7DAmZBLBebbbDzzZsTK5+WuoVhp5nWgNhK7sJDMdIoUkmUY6VmQouY1O26DgEV0wh
         j6cQpK5V0gHPhDezo4yFsnWOZX/1tf025JZNgWIJnHlqF+LWv7ESTimkmH8snGSX9gnK
         gRe46G7TJhyJuYHvdRXcdiRZpqSO+J9MSYLf8SgxleSG/hAHztK+naudsvbAEZFri8o5
         M0D8vZ2632w0lO8U69F4USyV8TMQJ/PKawEJzkia3d8BMfs3eIbaB4IOX8mNpWQ7vBy3
         kbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106033; x=1742710833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRx4xBTrB/yyQngCERc/V3g4ftfl32p6gXpKrtZEZAE=;
        b=cphpqmnZPFQbPUKSBVBvWwwGepI230F0uTSUODs03mLabmMet5H3br/qUg6FcG1Sb4
         WrXAFL+BQ9AHIEAGapxLQ3kAyRx+75CnWZAkhWpeXvvSPZommZ67bdegHs+bNPBN0K/y
         sLL0pTcIqGGAIDiTPPLuWrsHrYVyQ7sZ2JZSmf41QFXDa3clk53n0yuOmR+lXQLoaztZ
         BwoHbhXNLsfpbOhnR/3U+HuAaWK9dpFsG16Ajn+lQcmw4KLYXkh9kq2x3z/V78lTfDOD
         63/czCKiyFrqI5MqL37qX+Iqv6nZTflLtbeO6kMGjBnB2j+KtNqQelXcUMy7XWv4L1ba
         FEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNXxpcHOeHT6msUBEsl+RKIwtQ+5LDe4Cp6FZW+y1UYW1LzX/+3IIL7rsijMjPu6a03l3khCqbugNmzCqiRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzA3a4jAmAt9w2rHfe7X/WllQH494rbTJg5/Z8hrZZKPP+bfsy
	BaFUVGGze2TuSJ4GTgt26tbONd0xqZwDqj8FxboizvRI4H2bEN5ZrgUru/ulJSW3H9Sa8O5vPr5
	DR9/org==
X-Gm-Gg: ASbGncuJHs037tgSkRtC4v6rwrrZTHNWCJWK0XSZ0ep1454dn7ENjBa/zkY2YROXNsv
	OA794+9wmXBQ8UyNW4BFVH6FR3YstHY2+OyHSL28jn2gx59JFYLIBZCjF0/cF4GZlFXo0gEupm2
	wcO3ZkkXqOghwITes1IKR2GcowLlZy33DkBiifbT98q7GjivFB5Znz78tLVTimOXBQ53PzCGLHL
	+RLTZtsvvjze6Xl/G0c5uztsifgIsUYln/oOGbPbguRvGt22mDSBCTb81w1RHVvBJOvIdLnBW0p
	tS2OU0xybw6pw85AORQA3KAcqdKSmnHKN3rqAmeNeEgZwDWJ0yHvdNH3R390mlRRHlJD4nDFuaA
	rp5BWbkiEvQejRqXvOK+tjQ8oUHu+gSXAfegeBYGp
X-Google-Smtp-Source: AGHT+IGHODraP71cA0hWE9ecyV4Z+yF1rpkj3C/Ko/E/C+zVlNjjG+LzHjjw2vkdRuphFhU9CDeGow==
X-Received: by 2002:a05:6902:1ac9:b0:e5e:1062:bcd2 with SMTP id 3f1490d57ef6-e63f64dcc09mr11090915276.10.1742106033471;
        Sat, 15 Mar 2025 23:20:33 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:33 -0700 (PDT)
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
Subject: [PATCH v4 05/16] rust: faux: refactor to use `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:14 -0400
Message-ID: <20250316061429.817126-6-contact@antoniohickey.com>
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
 rust/kernel/faux.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 5acc0c02d451..11e56fcbb6ed 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -7,7 +7,7 @@
 //! C header: [`include/linux/device/faux.h`]
 
 use crate::{bindings, device, error::code::*, prelude::*};
-use core::ptr::{addr_of_mut, null, null_mut, NonNull};
+use core::ptr::{null, null_mut, NonNull};
 
 /// The registration of a faux device.
 ///
@@ -45,7 +45,7 @@ impl AsRef<device::Device> for Registration {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
         // a valid initialized `device`.
-        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
+        unsafe { device::Device::as_ref(&raw mut (*self.as_raw()).dev) }
     }
 }
 
-- 
2.48.1

