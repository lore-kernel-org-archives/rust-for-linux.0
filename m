Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D037B3FE
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757127; cv=none; b=FYbY1myWOHCY+YrA7rttt960o0KHNEmIgSbgfKokSzTSfa9o87HVJrmA+eyn3R85dqGqNC1S0j3l+Hvyc7d/MEX19cCfb1yjzdzwzfIcOMENEK5VaL9MbxQvefaxsWT62dmHU+QWgF9VU/+8rMyVaDMixLogjQ3G+oZeLA6QmnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757127; c=relaxed/simple;
	bh=VeatndmZPBU1SppZuDHdAEV8IeqU3Nvbe4Z8ivVS+ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JG26elFQc8jHWzX8/91lqG8wPHRYRvVL9yTV4cnBoEysXoVYE0HR6eCMcn9ZfZs/3IPQpJ8+XyqubohOFA/daB+DyuhmP8A69EHsX0xN2tKnK35qUOM7EPgrM+agRlLbezo/6dAVgyi9nvjgXIC3vDqkKZzyj8DWmbMw8mR5blU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=CBAcIIkg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jcIidMJ0; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="CBAcIIkg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jcIidMJ0"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 5AE5713001FF;
	Wed, 22 Jul 2026 17:52:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 22 Jul 2026 17:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784757125; x=
	1784760725; bh=4bw+9bqFUObTXEmoS+E+xbf41C7DrQs84Jk+RpHr5J0=; b=C
	BAcIIkg03J/IArP2FuGYer0rCD99t7ijHmreTNvh71VsYIG7rDrhMl9bDVyXGD33
	0vC1IzVxj8uIl8csf8IjiXP5NXYHiH/qfnFFpzXyXPCyjzvGpfx1MWug+RdSVqa/
	RRD8+2SMgdh27qES3Cza0c5R/E8DP4TbNxpdJp23PzQcDeDp6+9h9dVNULP0MmIF
	OXD1PpKv0b4dvj5RMMp3CRiSeKAge7c5zWd/ecQbdplOBevzgsH+mTWmc+wHTtGO
	fdPVHIzglWeU9NE8ZhtRR6km3SBgDuLT+iK0aTi774SKw1sKnE7YJsCWVBrkB3dJ
	EQISplNC2d+dcBQzUNidQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784757125; x=1784760725; bh=4
	bw+9bqFUObTXEmoS+E+xbf41C7DrQs84Jk+RpHr5J0=; b=jcIidMJ0zzd4bM8nY
	+VrLikD9A+IqCApkaTqMrtf/s4UEBq/xRDoWpU0yUVJL3rzxm4qo8lwMpFySRRX5
	4GWMiUtM5ZB1P94ZeG3keRLDXo1ITSMPCUq9HCLkr/fQkBzwh5hB0OjBt04VzZyN
	czcV6lDJtS2ipZhq3haivAlommD2RreK4DkS63XeR83h+h34pUcXcq5JlpIdLmXz
	celIfsaJSiSNAXzSq4iOMk0hV6ddqb8uaCYbbLOec9qiBZ4zhKDTNtUDVyx/WuwX
	iwofDW2Qe2zj7EE7UHZgD/8O5fWexbXOlRCVTrmN2LAH6dCSOgI9ICvYMMAr1m83
	vMDAw==
X-ME-Sender: <xms:hDthamRc9RL9qA5Gr-Pf06kpLhbXNdxGwphnqW5hJSXATn7wD850Rg>
    <xme:hDthauh69I_h7PYEyGSfFqjJxxmJEsnKi_zA2y5d5IOUC4bBk1vEBHDyips7jcSvX
    lU1FVi7114PfbdPablW-_kHauQEBnIWOxkPsKn6ulyzmCexkI7AUyQ>
X-ME-Received: <xmr:hDthagtgwQIBn9fhYVPvohtOsBQX6tLeCCPGDwN527dXlB6oCVvODWLn9G58IF6N4p4735RK9X1lpd5pXAA>
X-ME-Proxy-Cause: dmFkZTFPtQh+XDiIlN/deL/zNNtaMycIlI2Lr+BxbJi1FsWXTVFzkk+8yYSvkRxAJHk4qW
    sgP6RWrlEhQ7XaDBYLcb5S8EzlOGHjpDFiZfVZXHDXuoddfD1VsT60d9mtHcd7WoBtj1KM
    HDIn45Jsio0Idz1r0FxQeMcnYGD8D/kMv7yYzHa4vnh1aepyfdsERDWX2oAoUZ19e+WaAp
    0CkqpCyStETs4zyYqQq5O/ZESt5ugjiLTUjKUAf9Ati9HSvq3vB0LLrTWr6+Aya1tm4WGa
    dKuqV2S8riFrEJAoN6SyqEI1lLaaHlL8v7BE6Sm0dm1RqBXhArzPCrk1jBqFih9himSbKC
    iaV9v3zrtccMdZfx5UDM9WFkfcBCDEE2AYXHwloFBysRtX2lu4/C6IHkCZpKrC+lHTwCMc
    P4q1HqcOYgaSwP5d14G35yHpa2BddRm/TA37umQfm9sOIu+wsbE/H2JsWDw5k6raBc+9ra
    ef+9CQqj04Obl5Wd7K8Uhayj71TfBHZkvoDLpgaq+yLEMqtpf8rwBWpixNX4EyeG0j3rBq
    NEK2o/4U/ghEDqZ/mYiiic5W9fG6nQ9sOZuGMChr8EsMzAEEya+mWIUSilanN+S4nydh99
    EyxvJEvQsvVrrN8kxQ8aqVj2awxK0XQ/q4baJSgML+lleIIDs1Bu6w166FsQ
X-ME-Proxy: <xmx:hDthaph3wvkjayHvud6L-fBHR3w_PcXP3na-In03VLm4KZlS_BwhlA>
    <xmx:hDthanFxzniduDGeYP7sorMebq8Rd2P4Hd7d74rsNA_xRfkpJ1CMoQ>
    <xmx:hDthaiIwaoDSMYuRKcfQbXS-4kX9JSLZi2C71QqvzoQdFmeHuTOsdA>
    <xmx:hDthaqCJrxAGs_NjlYeCJ3CYa0tCTSmuQAMXlcy2oqvVm8WOWlvQTQ>
    <xmx:hTthapD-wHlpL2wizrvky7ZSXY-2sb3mClzZGpyF5ufogT6IBqGs2vg_>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 17:51:58 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v4 7/7] rust: time: remove unused Jiffies/Msecs helpers
Date: Thu, 23 Jul 2026 06:49:51 +0900
Message-ID: <20260722214951.72941-8-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722214951.72941-1-tomo@flapping.org>
References: <20260722214951.72941-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

CondVar's wait_interruptible_timeout() and workqueue's
enqueue_delayed() have both moved from raw jiffies counts to Delta, so
nothing in the tree calls msecs_to_jiffies() or uses the Jiffies and
Msecs aliases anymore.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 900481a3cba2..876897103a5c 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -39,20 +39,6 @@
 /// The number of nanoseconds per second.
 pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
 
-/// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
-pub type Jiffies = crate::ffi::c_ulong;
-
-/// The millisecond time unit.
-pub type Msecs = crate::ffi::c_uint;
-
-/// Converts milliseconds to jiffies.
-#[inline]
-pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
-    // SAFETY: The `__msecs_to_jiffies` function is always safe to call no
-    // matter what the argument is.
-    unsafe { bindings::__msecs_to_jiffies(msecs) }
-}
-
 /// Trait for clock sources.
 ///
 /// Selection of the clock source depends on the use case. In some cases the usage of a
-- 
2.43.0

