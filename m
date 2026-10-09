Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4433B0ADC
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549707; cv=none; b=nDwa/Diono9/FNmove1P1n7JZLD9mFW7q6hVPq1pFXozKPzMz2rIK9YIsESFVRkD2y1k5r8TyL9w6y0m1xMdV6Ix7aWt702K1RiPvM6eJ8fDykij3LLCL2QfbJrynZ/V7n3iNBeFAD6XvLDcwMd/1J4ZVwT85ft7vJTuBTkb/+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549707; c=relaxed/simple;
	bh=cXQ2uYAXnsF0HDpHNFrfOB3H/gD/xL/ZzjSSAwTMiTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrLIJ+GJrXyfwLVCQlOSwJ76JRhVQNyV2MsUF9aUWlXV3RIy+UdQGbsPc5g2CN0qWp4kFIjRouZIz2jbTvltfzPphvDxYIAgWcqsgT6DUYeCCR1MCs796gvMBa/B2EQVa+aVKJWYR/IWYqwZ+ot1bYG2Fj8qa03piUTqWuPQ+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=JdWyUYvw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RhyEEt2U; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="JdWyUYvw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RhyEEt2U"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5130B1400108
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 08:41:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 09 Oct 2026 08:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1791549699; x=1791636099; bh=kpVSr9gHlQi0GopQP3kB8
	p9/+gPvh4wfr7Vzvl6zPoM=; b=JdWyUYvwHFb42I9cfl2d9QowaFLwR8ej6oX7+
	hrcLuVU4Vpq090HIqnJaQhZ5Xg3Qyio0A38dUZMYCGlvrMRLfD42xstLBdwomRCe
	T53alrp+sgqCv2vxNb6PdGEIAymIRmio21VHDM+yXDaPTQk1u5D/yI53wkb1VxS8
	rvIQ+Fq5cWabZLSJwiU4W1JmDGZwmV5/PXnxhv1/MEqC49yqyR+AXAtT2o8fIhhi
	3Ywrb6QAlQcmco+YPQXH11ymRB0dYsjYsusEn1wiGoD56ehssROBAk3g15yfX+Xx
	1QQjJcqiD9y0aC8vav5NvufwxSl7IS2XBV1kV9nRoc/ZciIrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791549699; x=1791636099; bh=kpVSr9gHlQi0GopQP3kB8p9/+gPvh4wfr7V
	zvl6zPoM=; b=RhyEEt2Ul+VRfX/Jw1SC3uniCJQb7SzsaIc2qrFVshjiLXVK87S
	+kC7Q6SJ+RpzJ2j/5Vc/6/e//dVLZmWNAe/ziLZn0b3vj1awd+FX/Y0lWrWmbdaz
	HAQkW/ZsVyJQAk5ITFovQzD2QkveMu7a2juqreoQd+xtoeW1C8opyfIr3iHz/auU
	quOcaq2Lm9Ml44cIwreXCmClZyPHU8nE6SWGyXHJdiq7v6Rbf4lYNMdHkXIdrNW/
	GsHFhXyy25FoPkyjwxn/6Sw5GSmOKZrAMi8DGTLa8AcF2783XkqQRD4Iz01YI4T1
	Nl6bKJzkDhgUhBY21nIXwp3abP/W8WeTR2w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791549699; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:acmkurZmxbivhvDrKuLZljACmJr4MIGrhCOFGE/HAeTmc7I
	HSEIIqcWQyJX+RtJk/nW1oAO2DObMVAvuOQuJoggpxLIw/9YI1egF+uKw2jk/bnV
	J5MYmNcJAyQZhE7qams9wbn4gxS2xel2UTDfom1eRQVKSZndsMOzLJXcPMvRAIqK
	T8/V/4KvSYzmjph19v/pg7qnKakxPU0/hXOrEvEsgBinr0mED5C7W5QZaBkGSwZt
	1jQvSrLsFLn5Pn9p7oexsFLYmx93xGAaOP29/CGOFGNdnYEpzhcd7v3vr0QUYxNq
	e0WR8YU04AzfHhET92YvX9gihoTDkHCbE6FUQLQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:WZc1wECgbzrGt/wLnVTxc8T9coIzO2SfGqRrjpr8lkY=:cXQ2uYAXnsF0HDpHNFrfOB3H/gD/xL/ZzjSSAwTMiTA=;
X-ME-Sender: <xms:AuHIaj2_g7AekfpslRQcSf4hb9sCa3MRzlQFCeDx8EPV82TRrXhs8w>
    <xme:AuHIaqDxG7w-8VvdR9hVYMKXhoVo9b6U_hTTuGEzcWkHdPvNBrHQJPhPdvn5gP9S8
    KoQnuBYzFnXPZZhualdFn49yj8BH660ZInnTOfBQG-Vx7AXO1tVxmjh>
X-ME-Received: <xmr:AuHIarGqIcjPICvlPXRh99S6U0Zwm_N3dWGkKetTaveJ3U2hKlyVM1dnV3tPkLUF8JMnTUaq9GXo214Fw6Y>
X-ME-Proxy-Cause: dmFkZTF6x2cjlzKKOSSvIWXSsvMOZAaN/idE1zYMJYrdOvj3LXGcW/lyX3XLLCMERjEK9d
    JnVXPixAAlK83HvcO/8QX5QDKa6KmGj8WzDr91w234Mtl98JxuG6xawl4GJ+xAB6ItpKV6
    tGuWY0euMN+6pWAlcH34MBKSYSjvYJkR5uSOyZ7OZb36+wqVLzzqU1r3zGz2ljssBbTGJQ
    e8oqGVC6IOAlDshwVp58mY/bBfofdv4EIP55bhieA2SpDMyWL09S/xkKCPhea8FDf//5Dp
    qs34sWTMOwMkJEQdyJ+eOunVC45c2QYeBGbedQM3yWIeAUVf3atT5RiMMXTrwG6NKDMztm
    qEinbhnvanR6yQpPubg9X6g9TKNWtqiaqchumrCfxrzN/lqaJbH0QJmUBIWzrdCewCrQw5
    uJ8UWeEVSrUlwlpcPmCTQcQCjxcW7XJJoWu8WBHWjmyT8wgPoiVp6+OORFVvawRGFjWy/S
    zlZn2GRrGRXJYoL7JEtXUSa8gLglCnjC8kBzSfUTHSgl7SBjW6dc+FQ02XUPX0UGpVR677
    VctBVuC9Vy8L5XwyumeGJdxFZYrg5VOpa6eTa+RPt6kyLiDuXoJybO8J366jY648+TcjFP
    NKTyuKsGgq3pvlIrtYV4FbyNzYUkobyDk9u8+11TBm1yfFS3oSAOqx6y2sDQ
X-ME-Proxy: <xmx:AuHIavQQwGORNEiKrcjec9aKMv7lxcTz_FXw5ZrSLfQpD9oFD77V0g>
    <xmx:AuHIaiPC4fI3zZQdxNd43YrHr-b-_tdJ4Nhs_xdUYz6ET_MiISqyEg>
    <xmx:AuHIagNThbUaFyVIdNcfRPcZEoyzfTyoSAtoMufyjVsm1FTAuICwJA>
    <xmx:AuHIasH-e03IUaELJrTfj-9CONJxXK5PRc_0GF4DCfT6jXvNgMTbnw>
    <xmx:A-HIav6Ni-WOoex-aSvNFPa2TTAKBcrYMl83yz5eloBys05Ccr6O2l_f>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 08:41:34 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: linux@armlinux.org.uk,
	ojeda@kernel.org
Cc: ardb@kernel.org,
	chrisi.schrefl@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	a.hindborg@kernel.org,
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
Subject: [PATCH v1] ARM: rust: Generate unwind tables for Rust code with ARM_UNWIND
Date: Fri,  9 Oct 2026 21:41:24 +0900
Message-ID: <20261009124124.1176706-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

When CONFIG_ARM_UNWIND=y, C code is built with -funwind-tables, but
Rust code is built with -Cforce-unwind-tables=n. As a result, the
unwinder stops at the first Rust frame.

Pass -Cforce-unwind-tables=y to rustc in that case, as arm64 does.

Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
Assisted-by: LLM
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/arm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77..d59b8daf4f4e 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -117,6 +117,7 @@ endif
 
 ifeq ($(CONFIG_ARM_UNWIND),y)
 CFLAGS_ABI	+=-funwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y
 endif
 
 ifeq ($(CONFIG_CC_IS_CLANG),y)

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

