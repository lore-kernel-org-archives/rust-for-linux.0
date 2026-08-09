Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8B72566F7
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786283355; cv=none; b=HhwPd9rk8dd9xjT8d7hlDPY1GAqIWYGLrvG3AGhAyciGfDf1hCB9QgnP+2WYuW1J1imW70w9iQB68X1QZtu0h1c+jBlnrWhX3N7Gpi1jbS4xOIYjaHEHBaTlczaplcPK1s6J89+MYmVTG8OV6qbM/srNm/zKNQlOXoauH0fuAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786283355; c=relaxed/simple;
	bh=ZWohnbyLhEgek6QXuIB3O90WDaQspQFhr1CChav/+/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4k6+XezdpZsgj/pOPi/J/fNz4zYaUriO292ZazU50UIx3gdPlotgKsufxYsOjC3AAJDCrdIMuaPrE9oN9oCJ2c9iUKjM2xxE6x7SL/KKqIeR9FgqdyFalsQeevFy67WP0RPQ2C/kTNoX1fe7M8bcv0pJCUBCVO5PAxZoHYpvHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=jIxWboKe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Hpzd8GXF; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="jIxWboKe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Hpzd8GXF"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id 11E61138014D;
	Sun,  9 Aug 2026 09:49:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 09 Aug 2026 09:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1786283352; x=1786286952; bh=JCn1WzX2BXab/TQ6nLSc9
	6Ot9oYIbhO1YJ/cQCKZWLQ=; b=jIxWboKeVYH7ZvFWPIgd+fy0nKj5nRpIVWwFk
	QZxg1PTM3/2ni4URoQPQ+07ON8nPbiY5gR0g2VGAOYaEdjVJdGWl6Y5hr7GIh8rc
	mega7sYy9nESBCWBGmNUf1yfqt4TrFXbUBwh8DOXGMQvJSXtkEC8bVPw+7ebj9rp
	+Suja1wiy9JNHmzNLN5K67EeMLCXiQKy4c66LqJ0nxzHlHl39cNejRh8cxkfNAA+
	vxFU+y/pTh1KZr7pMnxY1Oxkk66rVQwolXudFP9FdbpJCs4N0L++gmJojlD3cj33
	fllYN1JdnareL3QT/ldQk07N561dPyO/6PzbAm0fG3Lb+hXgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786283352; x=1786286952; bh=JCn1WzX2BXab/TQ6nLSc96Ot9oYIbhO1YJ/
	cQCKZWLQ=; b=Hpzd8GXFbNEQXJXRg00puzMWSFoyvGMUfcz2GXxbMgWfzvkZIai
	sBYPcH7Ri7Iv2hhkWHywFChBEUMSBPsO1xMLZjCx6424kTI6fgy2YX78eSqO8lzf
	HQVsNh65WswXz/jteH1zrQwgiJYTMGzYtrdBXuZYKarcyrgLFMlLO7dKooaJphYD
	ow6x5HL3HbtZi1v1OlIbAcn1LGNCd16jokosi3RjZYWFYxARSvItqrjuahJY1ocZ
	JVX37JTH0xLd5uSpTaD+v6OOBfu3PKpbLI4Xg4ZLwEVdkTXDYZbgvWv+PcrnZVAE
	uosy1msdEDs2lkOlX3WAjZxDVl6ZKzOrGTA==
X-ME-Sender: <xms:V4V4aiEzSshjOxS8FPWZgFGpwGfSEpCikG-Px4qWqOhKdcLBpVMXtg>
    <xme:V4V4aqTI1saQrYX38bK-KglJXgWSUIlhK2GmFRjzaI8MHD_gZjaWWgnfEu80UL6x6
    BZZlBt17V1UqNHiTdT92iNjfV9dgW5tmA2o-7ASUhiH2vmPD1YdtHz3>
X-ME-Received: <xmr:V4V4ahMY1oIFLrX61GeLjwxnzL0p-2R-aDPMz_qoDtRcD7o1Q2cNATaKc4Ad2Wne3nnQHilbo38mOV4qtgs>
X-ME-Proxy-Cause: dmFkZTEc71FJcO2oRYlBn8xi9OVwbsQP3hB4G6CGota+eVn2VBN62za+/llPMYKAijYCAY
    ipdUVK2vKjl0S9KbPHJKtkQ+jfraULqqKzEMvvfhb+uvLETwr6OJ208jGC58LdfFBT99XN
    sotZWWEGd9QzerlTlTL1gEETUCcAQPrMtYa9yAW1b12BLDNXUdCExY8buCLd6xxyeGvwWf
    1alVDimgVTvUtUXnS+T1I1hJYIfOqXTbC1ZQ3nQIdat8oQWVscpyD+/uXTfoEphfZqXtRN
    t0ExWI3x87ajM+jC32Lz0uz1Ia0+vQv0huXxs+ccLPWU5QcqsOw75YGyGX5DxoqbV2W/Q+
    fjJ0fmjB4QT8hjd3n+XvWZsV4x2KL350T+N34uSm06aztB4tAnG+L2O0vqRTVW6yUHMD8s
    hH7U+K8tgL/SaBqSrhlWcIRzjblY+5ZnDCurIvH55VrSNMqpeR+/J6aicSB+xG281WlqQW
    USW5t0z5u5vIm/IiuNgunaAZqAuv7yqmN/9ESrD0CIwk6a50I+B49P4jsN6C06IGbNtUlz
    E2YvawaYEJVnfQDurdRsuP7uEggDNO6yzUamGQaqPnz5XZF5/jOVPFJa0vSIm+TZTM1fzR
    VfPM+FNlgZbiSNBkMv6Yafa/QGQAub66KvgofczZLrYoJNOJg+8hrOY3TAag
X-ME-Proxy: <xmx:V4V4ajOKA9_uG8Kg3eMDYDWDFtjElsZzHiYOnhrc9Ob-HiheDMGETA>
    <xmx:V4V4ajGeDt4uoKckbCpRIM2bFx6xDgmxSRcYbW5LGSLfDkf-UFPSLg>
    <xmx:V4V4alM4V36zqbxwHF_7VckTvBiYznEw353DPSKTop4BIm_CtPOcCg>
    <xmx:V4V4atvVjUHAf5SyRHfmkePqQ5KlrsTpkF4xBpgs0-q282jsclS9PA>
    <xmx:V4V4as4rjR8Q34Pu8_6QnMXubekNB1T8qzsHg7TW__t5wnYizwuMyDTO>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Aug 2026 09:49:06 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: aliceryhl@google.com,
	jbaron@akamai.com,
	jpoimboe@kernel.org,
	ojeda@kernel.org,
	peterz@infradead.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	ardb@kernel.org,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	rostedt@goodmis.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: jump_label: skip arch-specific asm in `testlib` builds
Date: Sun,  9 Aug 2026 22:48:58 +0900
Message-ID: <20260809134858.1219036-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Running `make rusttest` with `ARCH=` set to an architecture other than
the host's fails, e.g. `ARCH=arm64` on an x86_64 host:

error: alignment must be a power of 2
  --> rust/kernel/jump_label.rs:51:13
   |
51 |     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_static_branch_asm.rs"));
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
note: instantiated into assembly here
  --> <inline asm>:3:10
   |
 3 |     .align        3
   |                   ^

The reason is that `rusttest` builds the kernel crate as a host
library: it passes the `CONFIG_*` cfgs of the configured architecture,
but not `--target`, so code generation happens for the
host. `arch_static_branch!` then selects the arch-specific inline asm
arm based on CONFIG_*, and the host assembler rejects it.

This does not happen with the current master because
`arch_static_branch!` has no user inside the kernel crate itself yet,
but fix it now to avoid surprises later.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/jump_label.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 4e974c768dbd..f54cedcb6fd5 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -44,6 +44,7 @@ macro_rules! static_branch_unlikely {
 
 #[macro_export]
 #[doc(hidden)]
+#[cfg(not(testlib))]
 #[cfg(CONFIG_JUMP_LABEL)]
 macro_rules! arch_static_branch {
     ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
@@ -61,6 +62,17 @@ macro_rules! arch_static_branch {
     }};
 }
 
+#[macro_export]
+#[doc(hidden)]
+#[cfg(testlib)]
+#[cfg(CONFIG_JUMP_LABEL)]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {
+        // The asm falls through until patched, which never happens on the host.
+        false
+    };
+}
+
 #[cfg(CONFIG_JUMP_LABEL)]
 pub use arch_static_branch;
 

base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
-- 
2.43.0

