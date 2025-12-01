Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7215432B9BC
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764602896; cv=none; b=pkSeaky1FKMCiUoECWgrnPLxwENZr4r1PrmtEc+xlyQeMFS4Ng9PadIkPqn104FB4nsMLNrYpe0IZmlSDPqLEVXrKkKZnm75UmQJ8v65S7CEbLdCIQ6tgkqRslHz81EAE8vrDbYf3VgF+NWtoT4pePqaSzA1uwtrijWeEDeOaIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764602896; c=relaxed/simple;
	bh=t2N46lKoRo1GP2qUwaJVVUcVv67uyIj8NnYlUPfIiX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9Nk/Rm3AMh6Qn521gNs99b+AwxqSS+e+t6xC9I96ChAyhRGe69GGfAQnMtzyqF4TVp4LAw40ibUWBsa8jtTui24dYvYRWqJ6lo5mmqm50AcwZc5WKntN/dRcspNyaiHYGRHyP4hgfqaIwlN3T8MCnqGrdgr3RLkHZXuAIzBQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vfxcq+NS; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vfxcq+NS"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so3821666b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764602895; x=1765207695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCB4uXBZgUQkOf1CP9f395NPph0GsGyOxLs8b8/ayBM=;
        b=Vfxcq+NSUG5bt/g/cpYHgE5oNtYieRVl45uIaLMzEP4tvvcJwVzeUEjAspOIVOYrPz
         wyZSD0SrN01UDxjJBxjbb8gS5bpwUjLhaXdyiA4q6a8T/9cnZVbkWCmZpIgYChpTVdGX
         AGeejluAwqRgfBHm6+k5bd22E1p9rQZyzxvznBjphLwFEoUMWVa5EI2j2N/OHqURSwP1
         TL0JhyNPvMiF0Kd5d2oUhyuJ7AlkhZ51T8EHXjrYnygG7NBjjnHOKrefowGHSC7OWGxB
         dt/SJFODCNRJXh/2kr0JVANNezC0FAhjCL9LRxCnb1m/hM5aHpN8wL7PcXksRQMpHzRN
         zHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764602895; x=1765207695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCB4uXBZgUQkOf1CP9f395NPph0GsGyOxLs8b8/ayBM=;
        b=Kl0D/7mBoWg9sUSW0Srrpl4lPaEUHV/XNTS212yxJ3gTTKeT26ayCyRw53O1aFlk6c
         kL+D3SbCkeJ1GgsSdcWhxfTHY29XP9q4H+bLGsbwaEKlitIoifyTx0+pz2nyWvp8LG1T
         pfK/vkqoswdY5aPdh76qBe01XLRh/LS7AwBVYF0vvCTNtSQ2v/xCpcisbYq6ZxCQc+MG
         l8/fVr2WD0z4PPZbujYGGQgEtLkEz+4HOkxW0P59sGRe5mbGeQkMP/7wgW25z/xn2QnA
         zwZaxbAsYmwUB7DpB8KcSIo16i6oYiTaU1Bl5domID9b9aSSr65aAvoWh/gtYIWDgBGB
         kZYw==
X-Forwarded-Encrypted: i=1; AJvYcCVte21dmsQ6lW7X3GJuuIXGivWEpFBjU92W6ADo1SNAnczMfXc4OoQGto8Y5Zcez3ceg2tRibATM3Zge1SY7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+g7+zaBoYNU7Lyo9vZqmMK0h1i0Un0kaKVWQhDeIsdLDiHlCj
	8b4hA42z5pgdMKh/FKyOXJkYYINDa5bCKFqQvX2GPgjoDB71+XM6+bf0
X-Gm-Gg: ASbGncur0q8k+XDLJk0wHHAKOMUqi5QSkiuJZ1L2FwrfUz2ZyDZQ9Ve+4YBaFmL9kcj
	jVE8E5kobuKaC9PMIif+3+jwteih5G279ErsT7l9EWzPv2JKJBLhhKvXjitzdjsOkFsXcYULsVX
	y34/IRp7icJCsoJxS4LuGfg5D64H+THZ4HJmvJmtFk4QfEy1rCgWbQYU2rPEO2lz74eUEHR7qGC
	ZkCKAEsfq1wve5Uuz8j98lStOCMZq9F79JZnyLoGhC++7Jymb2PI59bO1ynmIWoA78H/BPKhzv4
	5tgVR5IqaDAcuYpvBQlGKw4td6izNYg/g9dHxk5kP5kaCyaLqr7LfKVDXcA9M7rbIUZw7+rQPIu
	B0McjujXlap7IGdwBx/GIzUR17lBhaAZFd1nWhz2xYdivq4qa+S4ROjCcTsUckpOSPNi3XNWMt7
	nuGcPJvMutflCXktBzGSRF469SvGPBwlDDoD691UBR9Y5ys6KIKfKm4L84bdt8DFxz
X-Google-Smtp-Source: AGHT+IH0CcqA+i45zWE4hwAOZUK/YbYfpvPimm4i7NbGuR7Rv0Kwg1psJKl2PjAExOkxM1RJMnNT6A==
X-Received: by 2002:a05:6a20:4320:b0:35e:deb8:bcd7 with SMTP id adf61e73a8af0-3637e0c5ce3mr30015738637.53.1764602894536;
        Mon, 01 Dec 2025 07:28:14 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3e41sm14059158b3a.33.2025.12.01.07.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 07:28:14 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Atharv Dubey <atharvd440@gmail.com>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: drm: use `pin_init::zeroed()` for file operations initialization
Date: Mon,  1 Dec 2025 20:57:58 +0530
Message-ID: <20251201152759.16429-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual `unsafe { core::mem::zeroed() }` initialization of
`bindings::file_operations` with `pin_init::zeroed()`. This removes the
explicit unsafe

Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 rust/kernel/drm/gem/mod.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 30c853988b94..f9fd98dc102b 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -298,9 +298,7 @@ impl<T: DriverObject> AllocImpl for Object<T> {
 }
 
 pub(super) const fn create_fops() -> bindings::file_operations {
-    // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
-    // zeroed.
-    let mut fops: bindings::file_operations = unsafe { core::mem::zeroed() };
+    let mut fops: bindings::file_operations = pin_init::zeroed();
 
     fops.owner = core::ptr::null_mut();
     fops.open = Some(bindings::drm_open);
-- 
2.43.0

