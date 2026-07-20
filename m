Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC5D3998A4
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 03:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784519733; cv=none; b=Tp9kqG+LDsgcs7V1o30gfY8wxs+wW7U77LTFfPdsUfii1WMwglzm45hFwtRL+yMPvXJ+s4dCi01GiZyfRRZjgRs79ApwHAgkkibajs1qRSgOFd7hE+kq/7vJOQEzvbyBRiuTPOzXZPMG3cSWnyKqfp2bzfXQ+HnC2YwAZ8WST8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784519733; c=relaxed/simple;
	bh=JfyR4fyFyIKTXlsijkbLCFLIp8+OYoJrwqHkAU4bwPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFnzabDTtDPJiXWCzWvnrB1ZJ2oYtque+It5yhZMmLSYaJ8PpBfVMaAtrba8xcRv/n9/wBzdVHSH2X4rdl/Qev5LxXcuWjG48NZ4cCWB+FghfQvP/m/zQhz0TLGwAcMoprK0Bxsy5KgRTgL2Mq0AgxacMrPd27nAfJhGyzRcJ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=USwxelCm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dn9vOGwr; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="USwxelCm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dn9vOGwr"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id 90812130075C;
	Sun, 19 Jul 2026 23:55:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 19 Jul 2026 23:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1784519729; x=1784523329; bh=l8oVAf+/TlYCuu1Dj6MY0
	GlYLWWCcl4eowspK4q9jHs=; b=USwxelCm3MpuZix4gQc0LrrLk6n24ebqRkFYa
	X1LFxpgfQyBcsEfkM07FG+l2f5IuVhtyH2aPdCHXV52kBkxNmHuUyg3T8De0toB3
	sqLcw7Er2ium1umonnDtfrcwYrOC9LlT83JHx0GTSHhHyzYwFvsJwn2ZSP+svLta
	a/ORpifB/1sNmUc7T8fAcXQmGIVms1a+YkgmoKq2ez2gxkwkR1rxwTKVRkDS0CZO
	0pMzdmlY0P+WlUT5lEU4uWKZ7P/RAffZSvkCKk0joRprjp4bBYLAAgrgs9qkKUCV
	bpmU+aLKtf4mMdBk/SeSYmjkqk2Lm36UBVthOwbvrUkqD1cdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784519729; x=1784523329; bh=l8oVAf+/TlYCuu1Dj6MY0GlYLWWCcl4eows
	pK4q9jHs=; b=dn9vOGwryWT+8kzJoZ8S8RvgP/nZqiTrF2Oitbuw9pAfRfDNmcS
	0jd4+pMLIlb0Fmk2tCS4djEr+rx6t0IfSSSU47q3P9Sv8KUObSuIwYkJrFxEpJkj
	b6oDiuXBMOiKQhuuuWx3y+XhdURNwuGSmhWs996QOn+FOMP49j4k7WG8krCQidQs
	5Xv45FwSPSViA8piBSkGhtmFdY4mV6g2GSld1uvW2Fcyegeu5ul4vVHvZG96MdGP
	KNnHtfnL9C2KSW5PCfFhr6ZMOkQddx9fJ9Z7r/dSSvmi1AnEqOY2ZMNMkqAlnZ+d
	tyIdfvBgZxXMbRWf+NUxMgvCaWoioxDWHUg==
X-ME-Sender: <xms:MJxdalyAOYOVM6PVC-2jQd5XUWPj0HYC5bjluiGLGu9vJ5mNVI5Zug>
    <xme:MJxdahrPfubXpITfGFnSzPW5ITNTIOs_eCz6AEJPraYc-oZBEI8IY7bZfCyM7QBis
    Jw7M8BauGfono9qJyCBj1x0v0unaw64VRevYO9naHs5OobW79bQfdU>
X-ME-Received: <xmr:MJxdajwbw8zsGgyuCZvvnCuTuGrcXzYrrUSYdx-SRd49VMQc1SDPrs7ZJVeykdQRbWQQ8oNzRqI8H-cUcHs>
X-ME-Proxy-Cause: dmFkZTFG6q6PVQHEUiP5ua4VvA7R5Z6CoGq+ELzxqLKPFSlTlY0CdUSFyF6yAg3gDLk36x
    2tJiHkNNqSm40kYEU85cCrhBfLsPo/ECHRVyiy9+M5NLasgIlNytCtKvwBfaJa7HbM+PYh
    1HvXznhZfN170HvgNVJULUfzeHLIDzMNWuHoLM0m4xeHfEB2FcewaFu0OQY5UdeXmgsLnw
    5nJOFkXXbVyra29kRM0xsEpXWhBETzz+0gSKg4EEerjg3I5ySZC2I8NWUFXfZT3hdJYxPE
    BlDvG34In1kW2Ko6bppNKwdrKd3pkBSa5UH9Buf1UAxcLFiRspkMP77jZwFJMg1AT4tnNQ
    YG6I78RZee+qQgTL7hi9HVvBzrhxpcsuverIw6WWb9uq3D9g18C/lKZ0hj2YL2Ept5Ly1b
    bEtTM7njw8+vDzrWyVG4+3YEuRucfO1fAreW9m9Eevbvcm2GpBchyaVayAYoOwqwa1miQb
    tod+0CeiXBqc42aydLSD02XUQmGXL2sODYA+l27p37mmfLHYYc6vS5vaGYIxOLlNL++I68
    6CEh9XO3f9z0oNSPwcK5PvpptBM09HG40vf/p0t/+v0ijFXWVfj/Hx4SpuWSI3eT9quIJh
    D40cx9yp3ZcOxQa9ddS6R58/HrwPZKkOBT+RrF4Nj1e2RccRB9Ulbuvoy1Ag
X-ME-Proxy: <xmx:MJxdalqVDySPCJsBccYhxalKCl8tgsR6F9gbA7AOcLtFmrXBXhbEJA>
    <xmx:MJxdajcTkMLyJ72mt3pQ_quuOfb0GxYqTbPsvL2LGrlCX1J45fZ4AA>
    <xmx:MJxdaoq8tsyU-5WZqVCwWL1TBiy8uqeXuObg072KUmihJGp_DNM6vw>
    <xmx:MJxdatlHlWYxLqrBN5cNEPFdllFy_TaGNVoTn0Jtc4DqJueUCPIEKA>
    <xmx:MJxdalkJzau4igMZ9qpcNPLPSm3ZVwkNWLmSx8yIUzkowvBOuWVXaBhY>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Jul 2026 23:55:25 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: bug: prevent dead_code warning from warn_on!'s flags constant
Date: Mon, 20 Jul 2026 12:55:10 +0900
Message-ID: <20260720035510.4048145-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Fix the following dead_code warning on some configurations in an
atomic development branch:

warning: constant `WARN_ON_FLAGS` is never used
   --> /linux/rust/kernel/bug.rs:126:19
    |
126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
    |                     ^^^^^^^^^^^^^
    |
   ::: /linux/rust/kernel/sync/srcu.rs:106:12
    |
106 |           if crate::warn_on!(
    |  ____________-
107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
108 | |             // and `srcu_readers_active()` only checks the active reader count.
109 | |             unsafe { bindings::srcu_readers_active(ptr) }
110 | |         ) {
    | |_________- in this macro invocation
    |
    = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
    = note: this warning originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)

The warn_on! macro always defines a WARN_ON_FLAGS constant and hands it
to warn_flags!. On configurations where warn_flags! does not reference
its flags argument (the LOONGARCH/ARM variant, which only calls
WARN_ON(), and the !CONFIG_BUG no-op variant), the constant is left
unused and triggers a dead_code warning.

The warning only surfaces for callers inside the kernel crate itself:
uses from other crates expand an external macro, so the lint is
suppressed there.

Rename the constant to _WARN_ON_FLAGS so the underscore marks it as
possibly-unused, matching the existing _COND_STR constant in the same
macro. The name is still referenceable, so configurations that do use
the flags are unaffected.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..2fd7ee25abcb 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -123,9 +123,9 @@ macro_rules! warn_on {
         const _COND_STR: &str = file!();
 
         if cond {
-            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
+            const _WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
 
-            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
+            $crate::warn_flags!(_COND_STR, _WARN_ON_FLAGS);
         }
         cond
     }};

base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
-- 
2.43.0

