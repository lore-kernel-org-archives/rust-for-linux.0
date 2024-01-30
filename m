Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD836137
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 02:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706582333; cv=none; b=u8dPYhM5rrG2wgFc4KjnzFY5Vnu8R0KiOISzcGynLG62GIoKuGXO/EW2K/XjUJrlXtmBh0qiqeUwWy3Yu9OF90N9Z6UJoCHuh/0Pi8+0d/iVt347TBG5oUbIZwzYWC1itASh67jHOWIXKW5+y0UZRK9mseUxcOlEJL16Nk8DZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706582333; c=relaxed/simple;
	bh=8NFkxLjfDsMYKBVX/2CVn4EMmha53R183167AkLrZ2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m3ssu0UVFbBPYk7yIyqj3wQs9xUQPX0E8fX0nyjriX9MQdohXTdD3bPOBCAmlMXV9SFL03voJCNe5J6dTM5VLJhkoBgSAN6qCBR2vK0n1kBCohpj6YmNe2oyBiiKQudzEbidn4h+YgDMGEZMYlVktMCU+SMMeoIP19FZLEQzkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gfp40Lb0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gfp40Lb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706582329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Da1Kai79LDMmtf1ru1K3D52dA9E7Gwnh/kl6V6/IJ3k=;
	b=gfp40Lb05EWoptY4+ueKl5aYlcnCMymohMK+ObMM9gHRXAUjkwggZ9sYIyxbkB1wfPy9DI
	TZTqDOIncHCQR8Ja5xVhe2TFETuZK0lVBI3xxAGOATM8WW74peoIEiPqYwPwzAB3yP339E
	IK55mYWIx/GejjfSSl/akZ7niujUJD8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-fXSSLTN_N5-sfwqN8vDOAQ-1; Mon, 29 Jan 2024 21:38:48 -0500
X-MC-Unique: fXSSLTN_N5-sfwqN8vDOAQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3158fbb375so175141866b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 18:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706582327; x=1707187127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da1Kai79LDMmtf1ru1K3D52dA9E7Gwnh/kl6V6/IJ3k=;
        b=v4uzL4yPDhAyCEAt3K3iS1KY5V7jz4J8FzHjCq6kKnelOntS0GU+O/T2nNe/mUiwsw
         F0+5l2VQO0FO5VfoFBB0t7fopeBBvHMMFwhUJvJEOGQ4EA5mHLyzuUJssmi+ZDrU/lmo
         e7Kq8Y/4kWFOgNDQJl09F9PrZ67FptqpX4WWAJ77rtJUg9cuHDkQqwelX+Stjc+4WDdw
         9HkMtS6I3NpA13ZLKXE65ou6fXb9MPSYK8W6kEQ8PNq2UrALFhBHHZxdzRvUvKq7bOir
         A5kQcuH7LSzPM83edhmDUZ8NdjPFnYf0H7/szcq0i1LmDxs5Lf7R2rqwqMIQGj5IX5P6
         ix9Q==
X-Gm-Message-State: AOJu0YxUJW0yUsRjy5HMZ7pugEAXnX/V3ELzhAaOOHJnK5bCThUgRjfJ
	kQW+8uGX/Q8f+AcRP75G+6Y8pDUctBQOXGHmObCPLMjU6SRUBe6ko+iuSeOpj4DCcXg9FX+Phqy
	kv58w+kpFr/k7szowb9WhZQTQkRzsPYUQJGGy3QIPxc0qOJcbqWXQswgljs2rsdkK
X-Received: by 2002:a17:906:81d5:b0:a31:49a1:4d5e with SMTP id e21-20020a17090681d500b00a3149a14d5emr5643889ejx.24.1706582327379;
        Mon, 29 Jan 2024 18:38:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV3Puy+toKVntNBLPCBVKA8P9s0vfikb8UxH9LYr4Idft4CPH4iGMWXhgCD6yu6FxA1NsNvA==
X-Received: by 2002:a17:906:81d5:b0:a31:49a1:4d5e with SMTP id e21-20020a17090681d500b00a3149a14d5emr5643876ejx.24.1706582327099;
        Mon, 29 Jan 2024 18:38:47 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id fj18-20020a1709069c9200b00a3496fa1f7fsm4591092ejc.91.2024.01.29.18.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 18:38:46 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2] rust: str: add {make,to}_{upper,lower}case() to CString
Date: Tue, 30 Jan 2024 03:35:39 +0100
Message-ID: <20240130023843.11512-1-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add functions to convert a CString to upper- / lowercase, either
in-place or by creating a copy of the original CString.

Naming followes the one from the Rust stdlib, where functions starting
with 'to' create a copy and functions starting with 'make' perform an
in-place conversion.

This is required by the Nova project (GSP only Rust successor of
Nouveau) to convert stringified enum values (representing different GPU
chipsets) to strings in order to generate the corresponding firmware
paths. See also [1].

[1] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/String.20manipulation.20in.20kernel.20Rust

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
Changes in V2:
  - expand commit message mentioning the use case
  - expand function doc comments to match the ones from Rust's stdlib
  - rename to_* to make_* and add the actual to_* implementations
---
 rust/kernel/str.rs | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 7d848b83add4..758bb70d98e9 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -581,6 +581,66 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
         // exist in the buffer.
         Ok(Self { buf })
     }
+
+    /// Converts this CString to its ASCII lower case equivalent in-place.
+    ///
+    /// ASCII letters 'A' to 'Z' are mapped to 'a' to 'z',
+    /// but non-ASCII letters are unchanged.
+    ///
+    /// To return a new lowercased value without modifying the existing one, use
+    /// [`to_ascii_lowercase()`].
+    ///
+    /// [`to_ascii_lowercase()`]: #method.to_ascii_lowercase
+    pub fn make_ascii_lowercase(&mut self) {
+        self.buf.make_ascii_lowercase();
+    }
+
+    /// Converts this CString to its ASCII upper case equivalent in-place.
+    ///
+    /// ASCII letters 'a' to 'z' are mapped to 'A' to 'Z',
+    /// but non-ASCII letters are unchanged.
+    ///
+    /// To return a new uppercased value without modifying the existing one, use
+    /// [`to_ascii_uppercase()`].
+    ///
+    /// [`to_ascii_uppercase()`]: #method.to_ascii_uppercase
+    pub fn make_ascii_uppercase(&mut self) {
+        self.buf.make_ascii_uppercase();
+    }
+
+    /// Returns a copy of this CString where each character is mapped to its
+    /// ASCII lower case equivalent.
+    ///
+    /// ASCII letters 'A' to 'Z' are mapped to 'a' to 'z',
+    /// but non-ASCII letters are unchanged.
+    ///
+    /// To lowercase the value in-place, use [`make_ascii_lowercase`].
+    ///
+    /// [`make_ascii_lowercase`]: str::make_ascii_lowercase
+    pub fn to_ascii_lowercase(&self) -> Result<CString, AllocError> {
+        let mut s = (*self).to_cstring()?;
+
+        s.make_ascii_lowercase();
+
+        return Ok(s);
+    }
+
+    /// Returns a copy of this CString where each character is mapped to its
+    /// ASCII upper case equivalent.
+    ///
+    /// ASCII letters 'a' to 'z' are mapped to 'A' to 'Z',
+    /// but non-ASCII letters are unchanged.
+    ///
+    /// To uppercase the value in-place, use [`make_ascii_uppercase`].
+    ///
+    /// [`make_ascii_uppercase`]: str::make_ascii_uppercase
+    pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
+        let mut s = (*self).to_cstring()?;
+
+        s.make_ascii_uppercase();
+
+        return Ok(s);
+    }
 }
 
 impl Deref for CString {

base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
-- 
2.43.0

