Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325766;
	b=4l62gT17rdiCqxgGb4+C0okANrzZmLYziUYcsGc02YH2LlqOMN3g/fbeftKrLqPdxUgm
	 Jgxiid7fdZUMiuEJA6voTw6YfYgYvPYyY+xohgS4ryDfluMCwR4CK5x3iDstEX0ju+eAL
	 FlUr8PYN83XdpUDvJPyKfPecdvi6f/WEq4G8MWMdlG/0TK1r6OBqT8cBWz2Xz8CZSl3GO
	 nQAH4DX6I2oblDIElbVYiXOFXYmyiVCEE0rtNSHMQNzJIfV3qvcl9fxAF6ysbDVcyM6b2
	 j42eR7eKLMNb8QdXV4VBUYgevAbW6nHJDTlOd+f3D+utTsOEnHAJPg10my5RYH4H5Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325766;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9RjQsPFtV0dJwIuiWhAi2gHvAbHUBmtk02whHrpogBI=;
	b=DbpoN/3oKJElfTMclqtrL+fxX6xdIAqxxKj9pAV1oI+R8CCTyTmCsdGoOmG4CeFqs7cx
	 ss9ounzgUOG+qJlsHLRJtTzFNaebUDoNCJKTQCEoBTgbeqr8Tah6UKHB654YXt9GRXXC8
	 6W8udpaIaREAoO2/NXP4W44UHUvLlZb1Nq1dt0kbjARXnqIgPINtGeHgo6CLnJI+QZpHL
	 xaYZc43+18rzOYRcku78R0qv+CPhiQe/GbXuW825bgscAZY6BuEe3pDJ8GNwo3xSmDJek
	 1S4o7GMEMRLHhZGhB2AX7RAEuKKVDhmkCm1fNVjIDZ0hVaDdauWvcsLhLLsP494GC8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=pkiNaxFk;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KtdINzOu;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8245606A32D
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 02:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8245606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=pkiNaxFk;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KtdINzOu
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0C8C61400195
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 22:02:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 29 Oct 2026 22:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1793325763; x=1793412163; bh=9R
	jQsPFtV0dJwIuiWhAi2gHvAbHUBmtk02whHrpogBI=; b=pkiNaxFkRb9ismSXEE
	xDOb9AA3wCGdF5pxX+WDHO+GuS2Wcfrqk/Fc5H9VHYdROJ5VckkWTWz6JLLwBPa9
	McwgG3CClv3p0tIHIiTmVBRi/bjY8fleQVeqhnwdY6uwM+0Ad6kRwd5MqgMcXxx9
	gMn2Ae8ZxyHtZivtnlh64rXn627jmys9FbcTHVHtPckQohGgpAuPm2KKmxuyJnBv
	tdrRldjDFgk9p0ieTcz4SvNn8JWG/60axQWAmjQ1G5GbOCodsttkg/FxdL5F9X07
	eDH3+91Z0lLq91CtDYEECjCnP0rckLnjAZ7XcHCIeztOZXMzxWSoyf7+vNOB6Qsr
	xTAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1793325763; x=1793412163; bh=9RjQsPFtV0dJwIuiWhAi2gHvAbHU
	Bmtk02whHrpogBI=; b=KtdINzOuYmglTOVclPQUqQA6eleAgU3ZBI7aq4MPFlGj
	UptNuG5eOwGFBVSyEHxOADyiwE28K/lqBRz6V6VIECkNwnG02B31SfIZAmFkxKqk
	EN+nJGPADoPfI2m75HrtwaTtDXojHFrj/+3R/nEbA3abnEyOoSsBB36FtdLxzNsj
	yy1hRa/w9KLi1kr3lxF3ELz659UTdXZ1RYBQguloruGfH3v+sse1DNA0IAYhLkFC
	bnrJj0CdxlWNin7kv3H8VmuYnBEqO0j60Iietp9rDLBvxkX7JrtYLXQ552tfIv4P
	JAGUtp+z8rl6hZr2dG8ZvrqGD8xDM1pxwzv37yyppg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793325763; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:o/lkeS7VsDOd7C/uY726ljYyf52q1mBZ31A1j/D3zjJ1g4J
	PFCuYChRhonvKPCysp/CeWegfVWGDxELKw2BzJ9hv1y1Y1oIKHAyGskhxxORSfT2
	nmM0LfySuNXkFsHvmNMPr9nDynMIu4/q4nLsN/oLrZCE9LJxKczYe/fzp339FxR0
	jld6ady2NxBFW61ih6gsugOeP8a65XjKviEQx9AARbJyefwi6ZtCM+OuOdph+0bC
	mJsKIcvcSPJrNTF+fAQXm1G4/4kcrQW2sdqaopz2lPTMXoFaZWpiEZhRgxtd0Gcp
	FLsrhlwsewCQ/CXVQtBEOFJpF1zaP0H8aOAQp2w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:7jErpdMG98w/wTNXq0Dz90F5w5QrAglLEpkiQLfAnMI=:cJekufhxQOYoqR2/kORJy7p48weaHkoyYUTFfTddYh0=;
X-ME-Sender: <xms:w_rjaka-Qk5rrfZ4scOkaE-LSwvlBHaTlcKBC2-in-VLtItNhEN6AA>
    <xme:w_rjahDvrnv1IU-zijm3N7jI2MdmsPsW6DbKPR86Z37m1by2R79gaO-i6r1uNZKdc
    BfQEf4Patw6hO9zIiF-ViPSD2yKoGa4RgCApbAjTpqaIEaOv2io032E>
X-ME-Received: <xmr:w_rjajAPxn2JQzaCK6xto7iGZGFL0kSx9bPpR6Jhe6m2Va349Pgt_-28W7moCnqwTcj07Daawio5D4jO_lk>
X-ME-Proxy-Cause: dmFkZTF5xQGCJ7laCKmHYkzvQhfBP3u5oWYscH37DIy0pDRfSgoZNxlfcxnpDDS+jtI/wZ
    5amdrQKdoIKp0Ks1o0YsG0suubVonP/Ow8NGxBsoR3mjDPuKiAnN9nSxCSbWMvPe0PqbQ1
    83olZmODKbhAkabr994lev9A2WTDwNYp4lrfdE2RBcQKIhMIXVdq0HFCCsMNy4VoGPYAmE
    2tLFEzKhhF/mQQrYrHsum5s82tYabbgEpGw4F4/k20V6bhGhjl5b3Ya0kD6hUhIjyP9wZ1
    rLstA0wjp2kL0bB80TPzqPkHVwFGVrcdgaq0leh2hxbo4dZteJLykF97HYCQyGIiFTKpDg
    eKL60XYnKdGP94d0MBzNWLeBmOYVkUT2GGCVtAJitZWSQQzb1fhmNIkqpNcKshtlZLx+ni
    PEyBB6u1zOZl8G7GoztKm731AhCCmDpfeb72a1wk9GKlE/NexJM4jzZE1mbvnnzcAR7fz0
    KN/aTYIo4W/RWNz1qYT6SOsY9yn+FaM21QVhXbbNHj5emKqd2Ywhkg1AaB+T5XhDg0IcMh
    x/iDXI82cRDBdTG7obuojKf4QbGK++QmG6xZ5EmgdLLZjTJl2Q59x0/yWkWBe4/kUrhpfg
    SIOKE2P16MqLCmNPA0JyNeZVBpMrqSy19ELVODbudId4o0lTX26j5Xmbefdw
X-ME-Proxy: <xmx:w_rjalE-S-UuxQe4K8gVd0QvHa1R8NBki07x5FsJAEf7BS_1359-4g>
    <xmx:w_rjaunqrLkt9mVluNbpDBRgfQGzPKGQYWBVoTBE84ON5Dk7JPBevA>
    <xmx:w_rjaqtOygibBPnRAZ-3nmHIZ6Ep3uhY0J9AVPkIQTAk4zLwOijo9Q>
    <xmx:w_rjaqMxoag09SA8GjfCixcMnfFcqR5bIkr3VfIwZitgJ_3lGg40Ow>
    <xmx:w_rjapndJ4NBfJUH6saPQrOYjmQRZUG6Sie9WoqOuMymKSxwFy0hyaxK>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 22:02:38 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: fustini@kernel.org,
	guoren@kernel.org,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	wefu@redhat.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	chenhan0017.work@gmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-riscv@lists.infradead.org,
	lossin@kernel.org,
	m.wilczynski@samsung.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v3 0/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Date: Fri, 30 Oct 2026 11:02:07 +0900
Message-ID: <20261030020209.3833766-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This series fixes the 32-bit build of the TH1520 PWM driver with
COMPILE_TEST. v2 limited COMPILE_TEST to 64BIT. Uwe asked to use the
div helpers instead, so v3 does that.

Patch 1 adds a math module to the kernel crate with Rust versions of
div64_u64() and DIV64_U64_ROUND_UP(). Patch 2 uses them in the driver.

The driver only needs u64 by u64 division. It does not need a 128-bit
intermediate value like mul_u64_u64_div_u64().

Uwe, are you OK with this series going through the Rust tree?

chenhan's series [1] also adds rust/kernel/math.rs, with signed
division helpers. Both series use the same module header, so whichever
is applied later needs only a small rebase.

Tested with the doctests on x86_64 and 32-bit ARM QEMU.

[1] https://lore.kernel.org/rust-for-linux/20261023130413.178487-1-chenhan0017.work@gmail.com/

v3:
- Use div helpers instead of limiting COMPILE_TEST to 64BIT (Uwe)
- Add a math module with div64_u64() and div64_u64_round_up()
- Drop Cc: stable and the Reviewed-by tags, since the change is different
v2: https://lore.kernel.org/rust-for-linux/20260930101257.1649945-1-tomo@flapping.org/
- Fix a typo in the commit message
- Add Cc: stable, Reported-by and Closes tags
- Add Reviewed-by tags from Andreas and Gary
- Rebase on v7.3-rc5
v1: https://lore.kernel.org/all/20260929095612.1072417-1-tomo@flapping.org/

FUJITA Tomonori (2):
  rust: math: add div64_u64() and div64_u64_round_up()
  pwm: th1520: Fix 32-bit build with COMPILE_TEST

 drivers/pwm/pwm_th1520.rs |  8 +++--
 rust/kernel/lib.rs        |  1 +
 rust/kernel/math.rs       | 71 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/math.rs


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

