Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B69F3002C8
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460527; cv=none; b=Rra626KTxbuu6XPTadV41w5W7fWoj4CyDQKKnT9h+/tnWretGbEz0zSuUdT6qIfHSMCEriUFPSpmhBKgIo2aLV2iDkosWmwooQxn/NpZdcp29schUhcghJ1Er7G6U4frLNUt6vyy/XWLtYHXcj/5SLSWRpRD93CZs3SW1UXbc1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460527; c=relaxed/simple;
	bh=iZ7RtHuI/3mg+E7gwPOErtg7K3WLcF+5T6NWc2YeFVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZoDiZ6BN8ket0dId/Be49m+w2vcKMlT4bLQPpuV66+NCo5kpnOto/VxlI6wSFawvvrjLYIGJ0T1XLuyr7qQ/XiK5DgzxKcdiAzvf0nFjwr1oDPhfnHtnycoFXyN31ONnDtl3flgoE4cWPl0EGPFFffYAkwQ1T9eNbjtQb15z6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=U76QZi2O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N+GRhws2; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="U76QZi2O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N+GRhws2"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id F40D513804B7;
	Tue, 11 Aug 2026 11:02:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 11 Aug 2026 11:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1786460524; x=1786464124; bh=P/d6qwPyOO8XZmt1FighG
	TI0B1cUc8t+TOfU1c9OTUY=; b=U76QZi2OA8jIvZHpLrlyDyI5OqeMpR/yfVDAq
	7ifsOjPR44O8DXHvZSy8U8GcuyUp7dB1MZNH2kvAZCbYGnIJx6K4HUcI1cZzOXE1
	hHPGQbR2bKPtbEnvIjYbtNN33Bg5IbqESmMdPi+78utXklrTuZcLW7DRf04QELVz
	zZz5+94r6budb0DWq0bXqr+Ed4Xozb2XiNTU/y9SIU5LqxEXJ+dpsHbEo/uD+bW4
	QmhOKfJicnFmGoBCuZQyg3c+7ejP+4oLf/KLOv5ulIQTOuraBDFh8uxSEcIETcex
	TT2iuYog9xxytP5gHQUDlPWlCKnytbDvF2NpvxT4EddqqJt9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786460524; x=1786464124; bh=P/d6qwPyOO8XZmt1FighGTI0B1cUc8t+TOf
	U1c9OTUY=; b=N+GRhws2J1epjiP0cIiSFnGSH1gVQjlC5eEL/bIryIFYsUE692F
	DDc3y8Q1IHpHtBOLDnS/o0LOOcdlvA9lE5yLllw0Ik4JdogFR3RRV0iuNJ3tdd7M
	NKnk1PpY15qEQhJLDE6qrGlQj7iv2MBpputgqjraWARKwLhCQuU8hFvslrDMyOZP
	AJuYaneqmuY9LTzrtzYbfMfVDsB/8bFenepyPTtYi+DjFdUXy4DjzmxOqrzlcWCr
	MvXx4JskOpPPxQ4KnGxBF+enVL4ohMQCpUX1CavHG/OuhV+h/kLfR4/qZ0be91oL
	VfnBSumcRmoKpldeXd7Vlqr1ggqYq+kObYA==
X-ME-Sender: <xms:azl7aqx_5Z4Uf1_V3i4TH5scYpK2PPKIlAEHKJWU5Q4IR5HIOb2uDA>
    <xme:azl7aiIz_466hT_kAxTaAvwfN_e8VS1DA8msrlrYjKCntdA-rdXFnfgCggHlk0xhH
    qXGl3DpM8Ap696LiEizGb0s5kxlXzfYAYq1MPDtmrsL15NqxTBzlA>
X-ME-Received: <xmr:azl7an04BdMHWTnye4z2EACwFTIWzZtebmRY5JsWW_BdGuKp5cWcw6cs8bn1Lby7BK3PAbBwDc25MhrmAkg>
X-ME-Proxy-Cause: dmFkZTGRyisWZJnOTCYE4a18khsYl+Q/ZE6HzEIObVgIfRF8stx+J//G2JkTer1twapicD
    EBWxfORtJTTKYbIgcnEr58l5/eTUbVykCYoRGjofy6GNfn4s57gi0cjBmXD8nRRznqwmJ9
    5mKnT9svnHQsxMjJ+RpFX2e4/6QFXqbN4OmE+Vdj1SfSFRlu00xoay8zlZy8ZdKuQGkl78
    xDaEme3fU6hdiMajBQVF4ZtjDgry5xhn9YjG6ZG0BGzgm8Rnqt+2M01OCXPNWpiey2VsXI
    xbBM1DHmsDyMaZF9vMHlUR4TGPB+X+HOA9Zj1EEbIeXgty1i2xbYM8ZQcasr1oYQwS64au
    xpg/koN9xjl1Z70Bg7X3SznokefvK8CMZQ5q8MLPCty0dHR+VExvwB6wfsN6MVzmOti+Cd
    lCnLTK256eAfoLwXOsgjBQqgbpzXJtOF9GkV1mv47WRQWpVGSOd8E2faw3zeJb237EwVT2
    DOndR+tV8Bf8QasziFpilCg+fNzEBVbfiflhtIMlRG5RoNn3CcEpNR7IUL2fvLpEOPgs70
    UWq+IhxRlNKM6nLqfX7pO6LoDdduTTY4JGmfk3gXuw64PWVCER0RBl7GJL31NCWTxx/nSB
    j0xu3R+B2z1UB5dOsrkaqP8GR3DO7IUuqD8r+jJ4pFO2V8FA0JZ0MqwGlnuQ
X-ME-Proxy: <xmx:azl7akdFqFa1YcEP0PWIugR_pexBG7j1ny3FHJeAybR-EpZS3rE7vw>
    <xmx:azl7aj4Cw_6yUlJFv6RGwcmRasksSOmCNZJM5ypEnphDeP4aXLXI2A>
    <xmx:azl7av8-j0KBrKyL9WpC37rltnCbxkcevfyUNL0dtaEfmlOxsEEs1w>
    <xmx:azl7aiIOdUjDj6jOibqOF53R446DHOGJxypD-mM3w3SBBGzIrqaagw>
    <xmx:azl7anCAEuMMe8lHgp8HHpYcSXjoERjeOapid6M7DhVtMAKW2CpdHIW3>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 11:01:58 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
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
Subject: [PATCH v1 0/2] Add Delta::to_jiffies_timeout() with tests
Date: Wed, 12 Aug 2026 00:01:45 +0900
Message-ID: <20260811150147.1360102-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The first patch is new. It adds an example and a KUnit test for
Delta::as_millis_ceil(), which Miguel asked for [1].

The second patch was previously posted as patch 4 of [2]; patches 1-3
of that series have been applied. It has been reworked to fix the bug
Miguel reported [1]: on 32 bit with HZ=1000, to_jiffies_timeout()
could return a value larger than MAX_JIFFY_OFFSET.

Both patches follow the format agreed in [3]: the examples show the
behaviour, while the boundary inputs live in `#[test]` KUnit tests, with the
magic numbers as named constants local to the test module rather than part
of the exported API. 

[1] https://lore.kernel.org/rust-for-linux/CANiq72kHP1s7bGr4=xfJGR8KY=aUpjOB4OwLEG5E=TKULXg5Rg@mail.gmail.com/
[2] https://lore.kernel.org/rust-for-linux/20260808062839.1159990-1-tomo@flapping.org/
[3] https://lore.kernel.org/rust-for-linux/874ihxgxy0.fsf@kernel.org/

FUJITA Tomonori (2):
  rust: time: add example and KUnit test for Delta::as_millis_ceil()
  rust: time: add Delta::to_jiffies_timeout() for timeout conversion

 rust/kernel/Kconfig.test |  10 ++++
 rust/kernel/time.rs      | 108 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)


base-commit: 8fe5e5f62bdb9660999449a4b5eaebcc37d7f842
-- 
2.43.0

