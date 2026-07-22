Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9F43E085
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757101; cv=none; b=HXzuVsuI8G6Zl6/1q01yWnreJcfsWMfymKPo6M+Zwu4Uue4Fh+HjPdKw5YePlQfnjxsTcODiJorRevXOxMmTeNDtdaFX4o47a2H96lbsPVQrmTb6CLY+slDhGq4ETrOlRx5rEUN6pieSLoy+O8ebdxq2ML4qHb+KGPns8w7/vS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757101; c=relaxed/simple;
	bh=dfIftIroJqYnf8+lwVUXGPQBEa3aABFYfQie6MtaQFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilpKlw7xeds/79u3fxkC9MHvHvE3FZ0OyqnRt6iJv7He/YyKcqONw14NlxGRsV4KzhhcqHiWY1zJTRJUMkGVZG4VaC0+/kuL7zgjBITDfBfRGwIbOf5PHLXUpS6atLi9gXP5z/RQqsb17EMkoA0iq1Q/qxVeitNm9V242wQ+hDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=JJXOFO9W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FG1dZVaN; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="JJXOFO9W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FG1dZVaN"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.stl.internal (Postfix) with ESMTP id 450F213001FF;
	Wed, 22 Jul 2026 17:51:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 22 Jul 2026 17:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784757096; x=
	1784760696; bh=GUFUcbkvsTmGo25v/ynskvf2O+KuTmmzRONL6ITdoTo=; b=J
	JXOFO9WakvEDUOJ5tau6lRAG/Niu1P7c5Rs4RQ66kr25WcOJEJFdNcNCLsQBrAc+
	XdHQxSNcwMye8iEz7ctWNFfXjsihoUaCR2Z9+0avQQ7NFZcke0TSciI02evEAv93
	Mv/8go8FHFOTR7qHrqMJ8Ea51FR/uE6gPTkJbCGiJfPwAjMzD2o8zmAXoQDV0Ig7
	WBGTu5ParqNq32YlswzaBfqupjKNbBIH7WfC1S8FsI66SQrar7Ci9sWfvxCndPw9
	NBxlf8V4/kzkD/38Xx3Nj80RUdgn4cIQ4huPMdplAjSih3Rr39OmG94Q+F4hJ0ha
	0dOEXV2GSpvXOQjN15bUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784757096; x=1784760696; bh=G
	UFUcbkvsTmGo25v/ynskvf2O+KuTmmzRONL6ITdoTo=; b=FG1dZVaNxkLFUu9Q2
	kenAUjhsGhHIe0T7ShdQuYVTMrvRBwT4dgv2u6u0pS8JkPNxfsYqf8CrxqqHJ7zG
	uabd15o8v/KBly/W5i3XH5aemWPxTO4Yd4XAXZGcuWdJIxhD59mwBeZTCKkNxChg
	INQ8Lx/6W3NQdMjXsKh6WnetlXnjs4tPk6vnU5Dl7jhT/2BYEliOOdvtr8fzQI6q
	DuTXCpglzijb7ulHwt19yVG+X3zE7tf2SL3tgeN6CYT02+7eCkALEXrzkI+W/JWI
	HPumVlIaEjQcrVQzGMbXPA5vB714XGQKY7rHGemzdydgD725MhGjglEx6guL6X2F
	uo9nA==
X-ME-Sender: <xms:ZzthaoEa3cQDe-Do9OZ4U0iilEFThzerqOtbqYpMkIapKdSjsnox6g>
    <xme:Zzthatddgh3B2LUcyH7khpARi9sbxwV7O9G2Nxc7uiaKN1RIcIH54lAfCrHhxFUxS
    a_cBLv5eK3TujO_deoPC3lrK63f3nJ3v_7h4skpKdpTliUUw6xUmQM>
X-ME-Received: <xmr:Zzthat9qT82a17biadOd91HTLNSYrQuLL430R5AOrYqQATRMOIBDvjPp_NXKIeFYp7gLdqJbECr_oa0CBWg>
X-ME-Proxy-Cause: dmFkZTGuoNy9B4Nm4eUiSt/VO/ZwmCQP+pc5e41if9fnwGdZOMxeWyXy+Utey7GravQTWS
    muAn+B62eren/+/qU3EjCcmq1A6Eqv/2TSGyUXtamSBV1XbJXh0burYHMsiltX+K3CtEff
    Wco0eXJKyhY0hcEwzWNRu2xlxwLsydcKZzw9PWSXF6a5FRETjsjcJ2OKj6rTuDQTgABHtb
    ILguifJG57tR2Wc7xaCTnmZVRe6QvnD67FskWzmUPI2exQarWI/gxcbziaEnx1ptUC9fe2
    5uCFs5iP9pgb++LyH7dLUYB5glPYeF9nYP1PyEK9FtB8D5G90yfpz901nPJyFMuBsApRD7
    XxHiMc3FgYk0iLS58rUqbJiszhWFF2i0Bm7mZyIvP21n7ClOhRX7WR+gsJdYGiRHJUNcdF
    nWBT/v69uImoGP+zVn0HFCPOpfLKHYSwZHb7PrASsGAH6Oz6yXA62LH/vzgr9Ujh7ha869
    eBsiePe9s6lpytsiDgfHzNygsMF3edD0BpF0LTSv1PzQNpnC8cTpH3leggCNKPk3M061B3
    +ljsIG9I0DdYThjujR8hPv+AozxdTGHjSAIAkM+52DlgcXwmmhzUsYoGIeYbT5Syb2NKoV
    2w2/742IrSEhkHsAvoHGCQR8iLsC0AFueJiQzoiva77SZmYu/QuSuqCIsa+A
X-ME-Proxy: <xmx:ZzthajZ2xT_SPCgGD-OreD_Dm7HX8LUiraWiI5DwTYEaC8Vh-bPWJg>
    <xmx:ZzthaueJDlohMc0m8kgPR8HIJTXSfuM03tGFEmgSy1J_ashQbRuTvQ>
    <xmx:ZzthahQ3eTTmV8sjt962h95m6uHElq_JitnpIvnGIFa627j8tHgECw>
    <xmx:ZzthaonI9GE7SBmsDaRCFgo2nMWd9zzNHRAamtap_jUlxpcNUNWKVA>
    <xmx:ZzthamZ9JH0zRz780x9uHDXMahleEQZ36ycDr6uijG5LHy9Q_mWyACSr>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 17:51:29 -0400 (EDT)
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
Subject: [PATCH v4 3/7] rust: time: add Delta::as_millis_ceil()
Date: Thu, 23 Jul 2026 06:49:47 +0900
Message-ID: <20260722214951.72941-4-tomo@flapping.org>
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

Add a ceiling variant, mirroring the existing as_micros_ceil() since
the existing as_millis() truncates towards zero.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 20f059d19a6c..f890c2d03932 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -518,6 +518,29 @@ pub fn as_millis(self) -> i64 {
         }
     }
 
+    /// Return the smallest number of milliseconds greater than or equal
+    /// to the value in the [`Delta`].
+    #[inline]
+    pub fn as_millis_ceil(self) -> i64 {
+        let n = self.as_nanos();
+        let n = if n > 0 {
+            n.saturating_add(NSEC_PER_MSEC - 1)
+        } else {
+            n
+        };
+
+        #[cfg(CONFIG_64BIT)]
+        {
+            n / NSEC_PER_MSEC
+        }
+
+        #[cfg(not(CONFIG_64BIT))]
+        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
+        unsafe {
+            bindings::ktime_to_ms(n)
+        }
+    }
+
     /// Return `self % dividend` where `dividend` is in nanoseconds.
     ///
     /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-- 
2.43.0

