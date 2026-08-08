Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD96272803
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 02:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786155992; cv=none; b=g98R0Bz0UzJ2DxfC3yn4+yQnmCpA37/VPnStNmGVM3Jkc0Aw4rLknYkGlpwZmcpX6rk1aWTnLgEOBg+6+3PQEyx6fXAeL8UqbpwqrQclXQkmC98GTXMSSoW5vF2AvvZnJY41Ha50bKRGfAcGCOl4Dsu7TXhV5bKHb9PtN/EFqzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786155992; c=relaxed/simple;
	bh=uZUVRju81i1lLcrtRlX7ovg5SJNieRe7e3zQsSTWsZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HElOmfEH1O5u4EoDKng8K9WiAfzT3qBTEvugmzfUOBz0J/dBtsf2nqqcJf5qh6pGtCei2ixtxK2kyg5AvUA6iBikXuMkFvcebV5+DHxlPwCc2bD3OkuPO4HiZ5R4BckF4VHULOBKP48/RzrJ5ktmnJ20MqOBV65ArnoABU3Qcq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Maz/y+Hd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bIsxOqwW; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Maz/y+Hd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bIsxOqwW"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 8D65B1380076;
	Fri,  7 Aug 2026 22:26:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 07 Aug 2026 22:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1786155989; x=1786159589; bh=DrZ/ugl0jrV+exNDvkqqv
	jkGRbqAuIQ3t5N3+4zfSfU=; b=Maz/y+HdGNUap9xiQWmP9mz9PZCJOhCLf0mLl
	QbdXplxcnj6ChdCaZ3f0gHGrHuzlJQTAb1wjs3H+tt9bePO4C1aYQcZHBuf70L83
	Zq29ebDQh9ilyWhUeg0Gx0WIO9hy8+agc9N734zg0kN6LBPgmBKRecMko9jFbxzb
	VKLtOo5/VGiZcM/AHyEYURPcnlx2sh1TIHDRGK4YoViyctzk0TtwIGaz9SE3ghJF
	0WMdJ8AJPgmWv12Cc5195WscJaD57yb9s/r5YtYszgCvBCYu5PaksMBaY3Z3/ur5
	hxRqcSTPSGljaUow7gCUzND1yAUNPQht/QZze5F088yI9VbgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786155989; x=1786159589; bh=DrZ/ugl0jrV+exNDvkqqvjkGRbqAuIQ3t5N
	3+4zfSfU=; b=bIsxOqwWb852p7pKB8yFc35QfOppByme+f/HRTp+o3s9R7BbRFW
	aZoMQSPp+5Lkrl3AEVSifJraJiA8U/wgaOgR1FjrSUUmunk/7HaVozYiYiP/yBdz
	S1AJ6YyCNLMeFQY7xTEzJxNNk9neC5pXevpQTJXo6zMZe+JL8QGgxdnnHPzKxreS
	EtZa6AUaBkb0NUFb83EFF3mpmLjTPWV7SLEFSmev4kKFFXgVLOmzUmUIZJAVDZuZ
	sbxnz4Exsz2X/DVWIXXYv6L58hbrLlqOInbtILxa4CT9gLZ7kFYlsO336a7nv/vw
	L65inazfVJ4yOWUZJtH4D8OtuHvcFh+lnaw==
X-ME-Sender: <xms:1JN2ao1DuinhhZk7eiD9sL7DZv7qrSSZIyHXLA9ERVL60dSAeuLvmA>
    <xme:1JN2avfw2-mb1rPUuIJk9kTlYayj6p4m3H58UcsVIaNNbFsJaDTTsNlVYAR2XiKpu
    9PyjN8nG4f031ko9i2WToD4PgjGhlurz-D8MpoqDFr5XDvvO2r08kg>
X-ME-Received: <xmr:1JN2alUUk8WQNdgZKc2ppBml4pGgHMM9nxzflzKY54EnUFJjxCgTx0B2j3lX5K4dGhTqXXCczJr1wgnqt4o>
X-ME-Proxy-Cause: dmFkZTFfvvNoK8ROgdTVDZkURJ/qrqVzUu+GBYlvg3ZYU1Va342/z7kGrJgZeCaBM7hpgO
    ZXwCHxpvCl5LYoh7o9f8PKLoACG7qREPtNjcQgtKcG0xkIhuPGqAxdeo7pXm48okWQ/okR
    8PRp332MNsEduTnLCXw1zRn8Ro7HYdhfe65Zjc8uzEmnXP2p6YOsvnF5f4xf70nqMTN988
    Izv2FWLcl8GRJDjQUfRpI8Dokvsg/VZiUOFBMrvuxaEbKFht7u+WtsTni7yf6A9F4k4b67
    gwzvgdWqnB9bF3eWjf/GYrKz2phWpIHldi+owK6FZsa13mOxGZQD1rp8zFTAFrgEykQsEQ
    VfVCsxllhBI/Kmm9NbGZJIupfVo4InWfGGpLzMDVlO8Q7EUMj0J9xBHhSPXZ9WWcDMVXFd
    /pFQV3QUzIOVhBGv3LQdamjpPM3p28Ahp+4Epf+3sfcK1LvCe4eOFYrwCSy+r2nW+p4ohl
    UMTNDbt/4OUHyxjW527SrJbxXVsTdxXLm7uXLIu3GpSlXkbScZEdexko7+J8CTOmFohPJp
    hwXgmJFjm9tHKUDM3vFuLVc8jXOyOwII5fiRJSDfX3JLJPtMGHAmtYjqnov2UBN+wSubGu
    F1U2yY+lnDEk7BoXLRpwP/BQdQSfPoCRJrCJod3f3uu3een9ZSWrHZ784tCg
X-ME-Proxy: <xmx:1JN2av8adT9VQYc0TW-c6UgfFUspDf66-1jW37GX41qhLVrmXm0AOg>
    <xmx:1JN2ang4-Ow1HqPpCrvH5rOVGLylW0LnuiRZ-fv0XaltI8UGDoyRwg>
    <xmx:1JN2ajf_ciL4GrBotQ3dg5KYn0LJszBLFX5XlKstH8DKHRJ1JTch3w>
    <xmx:1JN2aoIZIYkw6Z0_VKb2WQoMidfIGujSBC9WCevTk2QUFHC23-wWLQ>
    <xmx:1ZN2aqKB3Hp8DDeOhV_8wIUmcuQpsDWy80-OKFHea4OVTPf4jaP4fO1F>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 22:26:25 -0400 (EDT)
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
Subject: [PATCH v1] rust: bug: skip arch-specific asm in `testlib` builds
Date: Sat,  8 Aug 2026 11:26:08 +0900
Message-ID: <20260808022608.1125174-1-tomo@flapping.org>
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

error: invalid instruction mnemonic 'brk'
  --> rust/kernel/bug.rs:63:17
   |
63 | /                 concat!(
64 | |                     "/* {size} */",
65 | |                     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
66 | |                     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
   | |_______________________________________________________________________________________________________^
   |
note: instantiated into assembly here
  --> <inline asm>:1:115
   |
 1 |     /* 8 */.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .;.short 2305;.align 2; .popsection; 14471:brk 0x800
   |                                                                                                                      ^^^

The reason is that `rusttest` builds the `kernel` crate as a host
library: it passes the `CONFIG_*` cfgs of the configured architecture,
but not `--target`, so code generation happens for the
host. `warn_flags!` then selects the arch-specific inline asm arm
based on `CONFIG_*`, and the host assembler rejects it.

This does not happen with the current `master` because `warn_on!` has
no user inside the `kernel` crate itself yet, but it will as soon as
one is added.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/all/CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..8e4c21e393c9 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -8,6 +8,7 @@
 
 #[macro_export]
 #[doc(hidden)]
+#[cfg(not(testlib))]
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
 macro_rules! warn_flags {
@@ -47,6 +48,7 @@ macro_rules! warn_flags {
 
 #[macro_export]
 #[doc(hidden)]
+#[cfg(not(testlib))]
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
 macro_rules! warn_flags {
@@ -73,6 +75,7 @@ macro_rules! warn_flags {
 
 #[macro_export]
 #[doc(hidden)]
+#[cfg(not(testlib))]
 #[cfg(all(CONFIG_BUG, CONFIG_UML))]
 macro_rules! warn_flags {
     ($file:expr, $flags:expr) => {
@@ -91,6 +94,7 @@ macro_rules! warn_flags {
 
 #[macro_export]
 #[doc(hidden)]
+#[cfg(not(testlib))]
 #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
 macro_rules! warn_flags {
     ($file:expr, $flags:expr) => {
@@ -101,7 +105,7 @@ macro_rules! warn_flags {
 
 #[macro_export]
 #[doc(hidden)]
-#[cfg(not(CONFIG_BUG))]
+#[cfg(any(testlib, not(CONFIG_BUG)))]
 macro_rules! warn_flags {
     ($file:expr, $flags:expr) => {};
 }

base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.43.0

