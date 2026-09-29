Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCC34F46F
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675811; cv=none; b=pySKSV7gzic52VpwINkPEKfi+GHNvomU4Dp10AXiWXL8U+R1Y96sTHBrjxvjs8eYa6A6wvVJDys01UupJ+BP/uuX5kEcmZcD6AXOLQzbs6QBFqupSMPQWJqZ5uJROQ8UW/ofPaLDbayGIGGeNsHuieJuDNtPFffeifeoZwRIxzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675811; c=relaxed/simple;
	bh=62jk+ArcPsJrcwqOo7iO+ykvL3sBQL3obMFZms42aVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IfjcYrg1m0gLMmTeopBzTr1iBWDYVzmV/xjmzUW89z8FZgMUujaGLdV75LE7TNsa+sgcqaAAWhmbjG4X+LzPjYVD7kGarKsq0KFKhaewAXM4dehN2EDhO//CU/DYEVfSbvVfR3Idqo0A9N+eYdPGd6+sfsle0JxHjBLfjlGH+LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=YAVl7b29; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dAg0tvpf; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="YAVl7b29";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dAg0tvpf"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D1B5E7A007A;
	Tue, 29 Sep 2026 05:56:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 29 Sep 2026 05:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1790675807; x=1790762207; bh=D8IUYrRXtjkc2HSHXutSK
	zr1ZkVat0bgbq+ycjvQ0Gs=; b=YAVl7b291JYgRcjhYYd+myDZlGmYSuqALZEcB
	KdUCm03CUIzmKVNkkx0qdwjz190dW/9Az9wg9wExwCDopbRFs0NYZHhQgGEnE13E
	QQdWKInwdTC7g3iLMejDs55IuENxxnCKIH6f4M+YafF336T+9cEoD/1YLJxp5P01
	VvLwCs6H01yRyDSI6l7nw9dVwCKNzTqO0VVmdNgtp2PaWgVUwdINNCcjAOM/oCzr
	AM5DaXvzyVX86XImiOOwFdBhmbC68UktVyng0ifaBeVd/uGMDsrF6ID/urZojQO/
	a3alr8xpmS0pZ3OXEenoW7t+OTEW9oINDP1BAHreoAHkulYHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790675807; x=1790762207; bh=D8IUYrRXtjkc2HSHXutSKzr1ZkVat0bgbq+
	ycjvQ0Gs=; b=dAg0tvpf8JEN9QGy3IY+EnUb31GLjarQd9bz7Wzb3hc+Iea8x2P
	IvXeeVYPs5lF3b4eXTvE9JjAje4AHmSYgh31sZS1hobndTH9DR8UgMGGzJSaTD4V
	5OrmUqU4RZnfwSCyJnoT5CnOrUDZAC7CpG6m34BH7hj0CsG1HK9+lrrj5gBerZnK
	GOh/un9vqTbvtWmH3eEdH6WPhLMWifielUe8Mxzq39XEldVRPF5rBtT6g6dIYMVk
	Q42Wj7vyiKGfKK8qVrB1qbjpwJY9ALv+VR+a0uwUH9DY+PRNU9CwvMjofIvB7W5+
	S3Y2PegdKnXXfryJXcRiRaPN2mXT+c+etOw==
X-ME-Sender: <xms:X4u7aj72SRurupoSdkUz6RdaacMRemzMJ9i8WZCKL2PnoMRsIU9Qlw>
    <xme:X4u7aqQj_DgB2pH05KNSUyoTTpphx87GwfndoJ3FwDGD0FX603yfgh6Nnfg7pJmuI
    sMTCY32LU-fwv46QyqidzhKKEeoQM4B70SyCbEPkaR9w3_UM6xfx5hS>
X-ME-Received: <xmr:X4u7ajtER3pjfd5vW79YpHsQNC_e17qaGVu-kEY5YCXg3lp-IHQCclnMOEc0otTciPokwhG8IfgwLo7aQrY>
X-ME-Proxy-Cause: dmFkZTFvS3OFwVHaxub+ihmrLrskOCZmNiUvt1Z6reROFj64gHR3tsdoNds+dRKnW1YbtW
    j5lCJiqHgqxPGdKQtMq7ysxB0x8OT9QnWoZKWUUbfVR5sHIRU2jQlWr0kFrVauvZjXgal8
    wS/Iq7H8TmvgzjZyuiQz7v91L7fBo6ZbyVN/R0ahvFSvmSKA+eSr8kzJutl8P/VzJKV8T+
    7cw/GaUVA81JbPC5rpwCSufv27Os11ZhtET9kGrXqRb6ly7GlzuUirfE1NsVOlXOCh7Gie
    cXYspOxF8jMTh8Nq25rrDDKwSl7ja8fOac6MoX628Imq/CRc58vGk8wVXYx1uwUbPCioBN
    fZz+pJu0I1yD2vRnjQWan+wbxGP1f12epgTJH+8j7flj227hSsFTwsvBiwvKjeIpsA/WAj
    9IXCWlxxvC/yAdNb563bKKS5k2j2XgPoCmiwFLRGnWBRgF/+cTn0/B4SW/VJZ1PxHeKvwh
    4tfpCrTUDsQIXeD8KosBerc0uRGU6qF+GKAd2szZgnwsqYdmC9KCZE4ZVScDXlHiHgTq3a
    pvzNZ7lrPR4OFoFaunrlChmuMQiq7QE0FJeWfTsnOWu5K7D0uwBh4FRV2+iFar7bnOlPx+
    sOjDyNTv68nxvUc3UUbTt4Z7TX2SRPX4stv2+6cUdmjnHcKlTzvdddBbGb/w
X-ME-Proxy: <xmx:X4u7asbF_yvVxDao8M8Olx8IbgAQivzQ54AEXCT3TD0coIv_12zwMg>
    <xmx:X4u7at8ixaNq5Ao7jEbuwtICxMMFSPBes22MG4PSCy3kOkvRCA-oew>
    <xmx:X4u7aoqQu3T9ASdXwh2VRDQOPZrnkLqf79rPihKybJa3YbD3hhQRtg>
    <xmx:X4u7agHZ39QwZALPpDVP3DxX52MqP2p-1BaFTgaBalTkrz87DlX2VQ>
    <xmx:X4u7apBmdM9FuaANTtyeRfxU7ey58iaXwQP0ywM8QZy90TM0an56t_Sw>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 05:56:43 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org,
	fustini@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com
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
	linux-riscv@lists.infradead.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Date: Tue, 29 Sep 2026 18:56:12 +0900
Message-ID: <20260929095612.1072417-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Fix the following build error on 32-bit ARM with COMPILE_TEST:

  ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' undefined!

The driver divides u64 values when it converts between nanoseconds and
clock cycles. On 32-bit ARM, these divisions are compiled to calls to
__aeabi_uldivmod, which the kernel does not provide.

he TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
64-bit kernels. There is no point in compile testing it on 32-bit.
Limit COMPILE_TEST to 64BIT instead of changing the arithmetic to use
the div64 helpers.

Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 729776086879..abecd95b0c3c 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -772,7 +772,7 @@ config PWM_TEGRA
 
 config PWM_TH1520
 	tristate "TH1520 PWM support"
-	depends on ARCH_THEAD || COMPILE_TEST
+	depends on ARCH_THEAD || (COMPILE_TEST && 64BIT)
 	depends on RUST
 	depends on HAS_IOMEM && COMMON_CLK
 	select RUST_PWM_ABSTRACTIONS

base-commit: d266640c6c760c9bc215bf5a3ece122ca488b6f5
-- 
2.43.0

