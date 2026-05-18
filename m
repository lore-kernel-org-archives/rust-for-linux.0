Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0C382298
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 17:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779126004; cv=none; b=JMaKpgpU38J0hlO5Ghbn03bIiBfo0KKtWjlUsHdxGLcU/8NcHIFnmPDPjUTySDhBiWk3aspK4Q6frYwMoW0dqcGn8UA69/AUvr1dPN0wrmzezpzijXId6h5IHePi51PC2KZrFgJVhdKa6/Dd56uNuY0E2OmYEOmiYlCxL3DbZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779126004; c=relaxed/simple;
	bh=TdgqM4RiUccFwijsliiJ8OCoq9d8bDGE9FXsLFVxT2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJ+GF5D0zoCCXOZ2roithk478t8cr9+og4EibmARKTc2TcAgvy9qIBAWqyHkQuM/ezk25CGpi38WiuVJ7sEJkHDJ5DxLMUbBL2Xk4IVRRkjp4A23WsGn01LFuDv8GCjTI29uhKpT/Ujr2Y2AK08tJaDlZYF1nx+E84Wh0TNkdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4It2TOG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4It2TOG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-367d88b9940so1571558a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 10:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779126002; x=1779730802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTNSk1VdfU2RERnkAfCi3v1No0pcJQOMmaZgRrBJNn8=;
        b=j4It2TOGJwVrUgOed66aV/bVVw/FCp/O3rTecyssDiqbK2jaqSJlsKk4L0RtmrzoK9
         VcggdrDPFs3xFPnxO065GZyRLba3LQWijHLdz1Z1fzYySdy52n1Bu5XSzDwxbz/IbB0I
         o+ihY0SdDMQuUpDfbMauP0utvQObtp14bc+S4p2x7YFJAj8KvXoSgXNNvHEZUsKMSAwH
         txIzXAGChbtmg/5W892Hu4Ic0ttV/0UbrqQSCT40RYbyePjOnEGyMiu48cDKh3gxVC8V
         /VrnaRDXiSej0rjNSaNgmnqSDzYjcWfdO/Dc21ak4hDltb6eTAoDgAM+ToYQBy0nfASt
         7s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779126002; x=1779730802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTNSk1VdfU2RERnkAfCi3v1No0pcJQOMmaZgRrBJNn8=;
        b=f7mns+cWFduVpScpUSGj2guLlOVUVQS/oEikB44QcDKADQGb6MViHi8HtmfTnleHcD
         XWbMpyYLUulY2EAzW4ChoUUScxHF9MI+LdCXTwWjPESfBzJKmtC50pA879gBFRFHwnDD
         mHTjjJFsbHNl+pR8BtLrY9fBDxpe3ygqbB5wihLkMrZjzjyhUVvQ17tyZt6g2JjKBF8V
         e9oLTsPJ2uXd3bJDSocV5muKVlSDaQM6IwG8M/ALgDibtVdwFrTnOvgniZE+6gbKAnHg
         qSLkWNBrkxelWIrbchoZfKZSK2wsdTjT6ZDlFLw+mnimSvOXw/guOjGb5x9dy0lpZZ4Q
         4Bvg==
X-Forwarded-Encrypted: i=1; AFNElJ/m9HZtja2DOuRjSCdi2DVLoHRNDXrbrLv870X1weSdgIxGrvIBSZ4x3WiR/RBBxnUSOUBIPUh0lmgjolUtZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwykQsY/lAbjorUdb/PdrGxk3nOyXTQfO4aG7lWfAuxxX2Ok3uo
	91fnrBLhXfLNeKIDMnBfS1vDZAI2g8AzjLYyeJOVFUpeg9bC+f/OYXf1
X-Gm-Gg: Acq92OE8HNoRbNr5iPnGdpIUqofjrgaZHpb5lohXqpNYu6XTpl1MaJ/V0Oe6+YbZF33
	CwA4tjk+2I2p5K6wxVMGik24m/wzHX5fAard/hNsb0V8NiW95TLyesWc/EXgn9hxz8BxB9mnesK
	BWcV8QyCw91lB5dc1YPRHnZGZ3V/5jauC3MWvSttwCA754LFlTB2PSSrLKB8WKU4IyPlLTDNpUr
	k+erg61tB0s6bKhecOHcgHf173xdncNLFxtjQmvVRbtzj+OdzHM1/evOaMnEe4AtvCdVDFnwJ0J
	ZyjWb9Z81R4Z5Y4kZIDdJlkfSIJo3J8oMM33u4dewegZS/JBFFUqHGUS3V9LeUJ47E2sgWQW/zJ
	6Zu9kRFkvitzIM2LGcIu8TZnIvunwWl6JMYKwvnjIY229iyaZ0GwwnJqTvLjW9CSSw8O97QbigK
	byGX5yLEw76CJrJb80HQ6KbFihRwJetc+dxV+ngnF5
X-Received: by 2002:a17:90b:3d0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-369518b25cemr15826231a91.2.1779126001970;
        Mon, 18 May 2026 10:40:01 -0700 (PDT)
Received: from fedora.localdomain ([49.36.193.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm11887646a91.7.2026.05.18.10.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:40:01 -0700 (PDT)
Received: by fedora.localdomain (Postfix, from userid 1000)
	id 0CDC76508A7; Mon, 18 May 2026 23:14:15 +0530 (IST)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: tglx@kernel.org,
	peterz@infradead.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] rust: cpu: use `unsafe_precondition_assert!`
Date: Mon, 18 May 2026 23:14:14 +0530
Message-ID: <20260518174414.204573-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace `debug_assert!` invocations with
`unsafe_precondition_assert!` in `from_i32_unchecked`
and `from_u32_unchecked` unsafe functions.

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 rust/kernel/cpu.rs | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index cb6c0338ef5a..e33a87304c59 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/cpu.h`](srctree/include/linux/cpu.h)
 
-use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
+use crate::{bindings, device::Device, error::Result, prelude::ENODEV, unsafe_precondition_assert};
 
 /// Returns the maximum number of possible CPUs in the current system configuration.
 #[inline]
@@ -54,8 +54,14 @@ impl CpuId {
     /// The caller must ensure that `id` is a valid CPU ID (i.e., `0 <= id < nr_cpu_ids()`).
     #[inline]
     pub unsafe fn from_i32_unchecked(id: i32) -> Self {
-        debug_assert!(id >= 0);
-        debug_assert!((id as u32) < nr_cpu_ids());
+        unsafe_precondition_assert!(
+            id >= 0,
+            "CpuId::from_i32_unchecked requires a non-negative 'id'"
+        );
+        unsafe_precondition_assert!(
+            (id as u32) < nr_cpu_ids(),
+            "CpuId::from_i32_unchecked requires a valid 'id' (i.e., `0 <= id < nr_cpu_ids()`)"
+        );
 
         // INVARIANT: The function safety guarantees `id` is a valid CPU id.
         Self(id as u32)
@@ -78,10 +84,16 @@ pub fn from_i32(id: i32) -> Option<Self> {
     /// The caller must ensure that `id` is a valid CPU ID (i.e., `0 <= id < nr_cpu_ids()`).
     #[inline]
     pub unsafe fn from_u32_unchecked(id: u32) -> Self {
-        debug_assert!(id < nr_cpu_ids());
+        unsafe_precondition_assert!(
+            id < nr_cpu_ids(),
+            "CpuId::from_i32_unchecked requires a valid 'id' (i.e., `0 <= id < nr_cpu_ids()`)"
+        );
 
         // Ensure the `id` fits in an [`i32`] as it's also representable that way.
-        debug_assert!(id <= i32::MAX as u32);
+        unsafe_precondition_assert!(
+            id <= i32::MAX as u32,
+            "CpuId::from_u32_unchecked requires the 'id' to not overflow i32::MAX"
+        );
 
         // INVARIANT: The function safety guarantees `id` is a valid CPU id.
         Self(id)
-- 
2.54.0

