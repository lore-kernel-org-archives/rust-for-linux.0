Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E81925B8
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106044; cv=none; b=HD1xd0sYZ6D72jHlBqXEPj4UM456t92MRGUNXBDl2Bc/E2JPbMtz3NFylG8qfA3/tdF8qmCEIup188a+1Eudw4CirGNpEeQzSawR9LQ/2OLnKcVbzE8Eorz/X2xuSqci1dHDXe17KgYut4vB4EG4TAVFczM6UEYc4zhPoSrnTNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106044; c=relaxed/simple;
	bh=XCSzRJywT32yxpHIyrYVntKwh0imphgB2BPgf7j6hI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldSkM/jqfXyI2qq10DYXXwt6qk86bOOnlIN0xIEKlQeMRONOGC016xhyHr532rYnV+tSMGGdkobFETaRto8DzFQJWGPOaPoFhxpnRokEOueB6sWGaMNP+U9KuLkvMJ/vmHe55gZyy9RmAPqy9OVna1ibUANE1QGmfcSfVYW2eqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=AXVBV/+e; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="AXVBV/+e"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e64165ae78cso350717276.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106042; x=1742710842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWYRKcbhjlGMpfeggQ1yU9E4tWuRPqqSollkL7BQFqQ=;
        b=AXVBV/+eX7ya1BWhLt4BgZtLJyQZXZ6ahByDx/tHX4kxdMuCYKkCniR7Ll2eje3UxA
         2Gl3M2iuqyeHfutTb+507VoFMHjQeVryMzxnB0f59ERbt0lyIHtVrQxCYOek9J9iTAif
         /LEgs7uVI483nmSBFTGVewYpvb+1p31CM0FqOOH3wDX4A7R5lGBM+JTOwggTyGapNXsm
         e/dVfPmunGvAYyRwwFJrg/m3govpRwFPz76i8znboKS5ux5rAJhDTH3ukrO2t1UW+d4b
         /AICybTTh3vAasyKSqQCbe0TldcyqzAlNx8UKdCSeInEA1/15LUXeakXhYTiR6I+LVsf
         63Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106042; x=1742710842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWYRKcbhjlGMpfeggQ1yU9E4tWuRPqqSollkL7BQFqQ=;
        b=k8rOGTHjEZQNaiqMV2n+lSCyzFloDmC6Ks/NJ1ZIbLoRA62PjLEgKgCcvvz/Yb0pZu
         apOE4chsU9oi6KlgER/urrq86fjxCrIzlEgGh/DcAI4gFSVfROwhapunfNl5inN5rd4r
         PBnj2KxD4AppNyNnkVVYpHYW8PNKpMuwD5XtBbsKH3NY/cYvQZP5bYK4dYmhX26p94I2
         NGllc6Ht42ZNSGaVWtDPtd3CH8cjRk5trAbCyOG0O8OLd4bAHKiPWQZO3fwOjZNbiI45
         RSsYwYsXa5UzSNxwFoTEuK1E4HAGsL3oRhaJeCxx6zILCN6MB3E1KRRdqZYr5sxDwL1x
         KO5w==
X-Forwarded-Encrypted: i=1; AJvYcCWCFOAQGPhppo+rpMetcqyrDF2ZhCr4vacXzkcDtxASaFg9hlD/HmoZ2zebGnLJ0Xb/EFyQ+v5g/ThnlxL+oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiliRhK6dmFWDzKBCTPzN1xHeIPTohT9Mowb1GwfUcfAN/zAyN
	Dv03LV+SrfS4UMOeqQnggz+j7aKUiw8SYrs2qSvIMns1nR9UevREA2taHRCWHrQ=
X-Gm-Gg: ASbGncthh0byB8crPGtsMq6mryMXgUTugUOSolcutHa08ij7HjL3ByXnBHX0cO82tnb
	blnsglEqcfTp5M4jyzfqM59/nLh/urGWR5HD8ZRl1WJ3pygGeUUM5d9cJOxxv4Mwma0sSLT3HpJ
	Ne0UY1Yr5YFdrzFq0t6vdIrTs3/CV6Ow/jguOrHvx/QXjKiy4e0Duh0gaXv2/TpcJm8116k+p9H
	s//TZtK40psPne3V37stbbclAK2P0Itq+QdyC+/s32U/EvO6yF810SxwqooDwh70A0qswjPX1UX
	XOebwbMG9kOd5DzG8yoGe6EIyy2XzaA/LpLT49+0v7gHp91JbEkSNnRi4U9qHjoJ5VcoHhzETs9
	vAHWZ+oNTlvZGmIHyOTtRkFlvsuehDWIKT4gs8Myh
X-Google-Smtp-Source: AGHT+IFSOVWHkQwNGF06bPHR8xq+yt83PSSunblkIlhWeO8z0Q9hc3KIYwU6WSarQaKOAT4nlhwC0w==
X-Received: by 2002:a05:6902:27c7:b0:e63:44b8:8b62 with SMTP id 3f1490d57ef6-e63f65a8215mr10324365276.33.1742106042038;
        Sat, 15 Mar 2025 23:20:42 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:41 -0700 (PDT)
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
Subject: [PATCH v4 09/16] rust: workqueue: refactor to use `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:18 -0400
Message-ID: <20250316061429.817126-10-contact@antoniohickey.com>
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
 rust/kernel/workqueue.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 0cd100d2aefb..4e27df324d26 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -401,9 +401,10 @@ pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self
     pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // SAFETY: The caller promises that the pointer is aligned and not dangling.
         //
-        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use `addr_of!` so that
-        // the compiler does not complain that the `work` field is unused.
-        unsafe { Opaque::raw_get(core::ptr::addr_of!((*ptr).work)) }
+        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use
+        // `&raw const (*ptr).work` so that the compiler does not complain that the
+        // `work` field is unused.
+        unsafe { Opaque::raw_get(&raw const (*ptr).work) }
     }
 }
 
@@ -510,7 +511,7 @@ macro_rules! impl_has_work {
             unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crate::workqueue::Work<$work_type $(, $id)?> {
                 // SAFETY: The caller promises that the pointer is not dangling.
                 unsafe {
-                    ::core::ptr::addr_of_mut!((*ptr).$field)
+                    &raw mut (*ptr).$field
                 }
             }
         }
-- 
2.48.1

