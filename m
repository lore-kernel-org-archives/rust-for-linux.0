Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164DB3563D7
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649287; cv=none; b=hHMWMInqXAalVpfX3hCTEH5Wyvs2GCc9+H3DPV/Ti9yRhNKEnAafoF8EkzSz1lJmepHHq56YwVcmv6OR8HmPFDzBZA1eAerS2YKB9gfJylkl14ifvbSA9BpBH4WnR0qW7iIdh/KHdobCWv3/RQ3r7SxOzwepqp+y0f2ImECTrYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649287; c=relaxed/simple;
	bh=g7S/TfR84iMcvzUx+ooTqFtTekTHlycg3CAyKm29cnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrRq8usCYLlQgYiTN/jmx5FT+upc9spMAVPr2Nkq3P0vvzlWYRF7seIkhFsfCyZbEkSWWfMx8pouHP6Z8nnVUlDDo8vvNpxaZgjj2Vq67DAHWYHD2MwzU43lKDmrBztptUvfr6JhOpPsCwxEHPzIdzP/OA3MAKCPsZxH9gZhpzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alice0.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alice0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b91901d26so57903e0c.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 01:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649284; x=1774254084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kykdzT3KMd0TXKFAz/WK/nN/uUi8cpMSApP1ovckd7o=;
        b=GwMwvnkv6H1oNtYX4jzD7Cf5HQOb4a4qZKteZGTsCPL2IY4gIMOesOeXLH0vNTtls+
         NDn0MkmiYfEDQzvSmq6vN+Rrohxf+pbzvOObi6esZi0rCzPAwFkmn4K4QByzDRWJnVnS
         YhA7lc3hSlbakML5Rz2E2csOdSvYybDPByuRusyPooXEYH2QLzom6lnYQD1p+wfm7mRU
         B7KC1Cwv5eVGBdopJD5E72odUJL5IkTEPS94vwMHs9DbHJOcV4qXHJocnJYPKQELjFIF
         WKLRKlT/K29fUE0psOIfiAZ+QobR72gL5vLl0W0OxtldDf3MbgxfOQRhlWgCYUWg3WQe
         m9uA==
X-Forwarded-Encrypted: i=1; AJvYcCVjPuaD5ft3ht3nwyuPKcs/KqajWGBiEh+HYaIn/1FsnSlTP01B960HKiKOm1vEfR1Yv7qVaDfqTF+uXp4mfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6TcQ7+SOSu7QJxU3ZJN/v6cQUrd1mRJCsh5tZlMgu6Llo/JCw
	XzSHbEfshu7aGE7/bLE1IaS3rim1kyPghcn2b8CKZi5QDuOVjoXzvc7+
X-Gm-Gg: ATEYQzzOKTiTPqOy8+tq+80rO8KK5FrEIoge1c+yrt2LeCk3Pgg8HTiiPGvzdTw3qzP
	+3Sw9KiiB+2pEqIp2Cyg0qnQ9wFQSFBP094ZvuzQwRD64oN+b+FJw5UmRO1kEL8DwV3iaK2wJgp
	4FnXJNRe7ZLBhjmLJzrZylJrEBjZfZzB+q0Dt8ATP/D5tqvukh5CF77X91fLtN8Q8qzFCdP/lBO
	ILJJaGIYW+CCNWVuMZFQUmCK4oOYPswWzZqoKsmUL5piO/VL6kGpkKl9lvABegBrRdr13BJa7wk
	8BSc9HGMiI3usm8z0/cJVwSrnrW6yMqfyTx2t1DPS3brRWh1qkYBx2fXMRUMPeZYXpSwlviUx6m
	oofmtyn3AlIR9KXIKIrlQFLeugFmzUvKwTXTxkXFRyzSGZEd80yslaBFdJVnETdTZGl/rQOGdXe
	rgNxh4b9BmdkpX+NcMOFs=
X-Received: by 2002:a05:6102:c4a:b0:5ff:ba2d:17ab with SMTP id ada2fe7eead31-6020e16767fmr5280469137.8.1773649284041;
        Mon, 16 Mar 2026 01:21:24 -0700 (PDT)
Received: from W871.localdomain ([38.183.115.123])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601f31e7520sm5759207137.4.2026.03.16.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:21:23 -0700 (PDT)
From: Fabricio Parra a@alice0.com
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabricio Parra <a@alice0.com>
Subject: [PATCH] rust: sync: completion: mark inline complete_all and wait_for_completion
Date: Mon, 16 Mar 2026 04:21:11 -0400
Message-ID: <20260316082111.398170-1-a@alice0.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabricio Parra <a@alice0.com>

When building the kernel using the llvm-22.1.0-rust-1.93.1-x86_64
toolchain provided by kernel.org with ARCH=x86_64, the following symbols
are generated:

$ nm vmlinux | grep ' _R'.*Completion | rustfilt
ffffffff81827930 T <kernel::sync::completion::Completion>::complete_all
ffffffff81827950 T <kernel::sync::completion::Completion>::wait_for_completion

These Rust methods are thin wrappers around the C completion helpers
`complete_all` and `wait_for_completion`. Mark them `#[inline]` to keep
the wrapper pattern consistent with other small Rust helper methods.

After applying this patch, the above command will produce no output.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Fabricio Parra <a@alice0.com>
---
 rust/kernel/sync/completion.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index c50012a940a3..35ff049ff078 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -94,6 +94,7 @@ fn as_raw(&self) -> *mut bindings::completion {
     ///
     /// This method wakes up all tasks waiting on this completion; after this operation the
     /// completion is permanently done, i.e. signals all current and future waiters.
+    #[inline]
     pub fn complete_all(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::complete_all(self.as_raw()) };
@@ -105,6 +106,7 @@ pub fn complete_all(&self) {
     /// timeout.
     ///
     /// See also [`Completion::complete_all`].
+    #[inline]
     pub fn wait_for_completion(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::wait_for_completion(self.as_raw()) };

base-commit: 79e25710e7227228902d672417b552dd1d7e5d3b
-- 
2.53.0

