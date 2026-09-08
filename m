Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9643046A61C
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908701; cv=none; b=ipkcJvVS0LPkNKopT+p6BoRyXNaFET9TIkTLOHBgs3AzJdjZNuxhUU/GpUXKefZCiwnh2q2eU/qlSdoNRiUhaRhbd0PobquN6TTIVAJ+IQ7tLQ+xWy9zGBBY82jCQIYQ/whoQdZbeZsaD7p+0odkLSLjcniJnx+mNAcR5YQiJK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908701; c=relaxed/simple;
	bh=Fp17G64qJhR6vQSguHjlazDhjI4Hkff1FgEGMG1ExxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m6Jb/G0JDeu0yWTcu1bjHewWbZNIlFYeIXmzqJGDkBOT9PVB+Xg5Ne8/x3tcFoq641gxT48TA26JFzTyK23a2/w16j2/8v+5WqRDbiLeTX8SG0peMXsA7c8JELrBgDO9xCMaNEqP1Yj2a0Wz7IygLnOlJFU/SFnwkxHHAyRPuKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=t8gqoc1c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tBtLOcfH; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="t8gqoc1c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tBtLOcfH"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 35B561D00126;
	Tue,  8 Sep 2026 19:04:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 08 Sep 2026 19:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1788908698; x=1788995098; bh=DdBPl/80jQwwDIdxOdBIK
	Fcgdk0PXbM5sNCo+b+gijM=; b=t8gqoc1cQRHGTtd0isDRTBWlvg1u0+ZEGMorZ
	4UeZJKrfTWVk03PXQkQBmTHpkZ6PwD/Kz9zAgIf4PoSMPZOSrBNBQCORxyT0GsLB
	g8Up4cBGF222KnkM6O1NwvNN5iqa8eceUekrpv9o+0ZVQ2Md91nHucmXJkQzMtRp
	J6SxhX+yQwxREPMhibsK+OLOMBMiSxQQz/OiZHPXo6RWDDaqJoAoQsiBjLx1ePcq
	JgnOmISgeIYJ3N9pYkNIWlrgAy56pZfI5xuhgnQM6DbHO920J6NGfeRLpb33dgzq
	hLHP3pBuUKiW7b07nGnFkc+2nmoqdTiic5CvZxwjj3yqNJviQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788908698; x=1788995098; bh=DdBPl/80jQwwDIdxOdBIKFcgdk0PXbM5sNC
	o+b+gijM=; b=tBtLOcfHwCZ5k4y88r5V2lTtUkcbIIUDH5XtOmTGKxBltHfP4M1
	rObGKMG8ckBnBva1VbMgwAXJ0E4Yyv1q9GJ9CIw5e8RJfQv7B4ny9O5tCR0GmAph
	jncfjiOxVC1cv+orcJ8Wyqlq+01Y+lIo7qVnQD9kMQBiSqOxAnwa5sfVlDstz68c
	dD5fbIyBCO7XBSzHTO8dVE0rLCSEdKFYBXJoegUTG2GY9yrnb6BO7PGIyeoM17an
	EXzlhH14x2FyOVBqfBU9yMOpy3PEpExTngjOCncCQOUlBkOpMSGKKcGx/0OdsWw6
	f7RK91wntWl3CvoXuHtP9UnEkXny8Du1DJA==
X-ME-Sender: <xms:mZSgar-ffLYPknRagbbQrCvmh1ynw63go0Cy6YxhQtOuq6bvebBuiQ>
    <xme:mZSgajntrGwF-Deyge8hhqa2zM4EsbzEGQ3svvLnt8byRzC0yBi2x4RHKmpWfmapT
    hYi5yBKGDR9cJaoXYOX65wsw7gkY07xlxPFQN-kwecofRq1OIkr8eEy>
X-ME-Received: <xmr:mZSgakgeYsoudWx3lUbQpu-ac7EOKo6cOoBqQ1l2aYgtPHYbZf3PGARvJQ6v-iqnQL1pspXWPFPAEV11_MU>
X-ME-Proxy-Cause: dmFkZTG3mJ7ZsJQTofQ/C7GtQ41+vGkXTpHDhHVQ/PbpA++waCk6qabmV4UZGyqtGxxrMK
    C7i8IPUQt9H+SNqCBIXDk1jiPkGT7iaEzsCL+uJ4xsir18zG3mgboVZjON3iACUhmiFZ2q
    5tMCs72+etg1YXFQ2Y5COKTlVZLGQATdxeu12evqLzEq13ILqdaYJNlwh2hKcixzgm4NHw
    FoFB6p7rH8nCH1Q6mb41IIU209UkuXb981qGAgmWHPeOdcJnz1iGjZ9m8azjyAg5DGneRi
    ceijP/TPuoHSj7M6EEFw5GWydjZNKzZbnYIXKoDE/IEfKqvRXSjubSb994sZod4ehSHTsh
    p6P9UuiZXuKXRzW5AYTIPi5nKqDCW7LvOy5YexYkKMYbc4kWzzVzIYSTQabURCuQWUqVMz
    sCk/5BiiGwULVXF+FPHvFXBThNGPv1w8zdm9pMLFIvC1fMQVFjAzX9AfOAw0JjNxCJ31dn
    3C69WT6a968fJrL6un76LlHZGFxmSfyfRQZPXamOh0z4zDzJxTqTWBA2YUC5XgzODi/Hkh
    jll9GJHTicPrecI2fiP1/Rtko++uOElnAGyAMnVGgcGQPA+I+fRqEl8PfOekI7T58MgMl/
    BRtmUqyHJBdVfeqiW//4o33fPoe0BkM6wbajaLJcmoUxzYGSJ/ojPqBX/RMA
X-ME-Proxy: <xmx:mZSgarZ-zgADpv2OhCFJyvh6ZxDLGffCOuc6m5xWIG_2A7eK8oUeXA>
    <xmx:mZSgaoEw9_xiaih0jXNfXP1MxliU4ace_Atq1VS10XtR_EVftkAC1g>
    <xmx:mZSgaoYjGyDIPzhnOcNCuq9eg8ePoayljAU7y4HJD1c_AEuc_gg05A>
    <xmx:mZSgap2lygoYskBAUg3iN61913y6Jhwn8q_fvRUManyQ-kh9JPWr5A>
    <xmx:mpSgav4axLHm69ffTzAf-Uzkvg6vKiFs33t6wTHnPVLX9LRyhkyDQSMo>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 19:04:53 -0400 (EDT)
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
Subject: [PATCH v3 0/2] Add Delta::to_jiffies_timeout()
Date: Wed,  9 Sep 2026 08:04:43 +0900
Message-ID: <20260908230445.2430296-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The first patch makes bindings::HZ resolve to CONFIG_HZ.

The second patch was previously posted as patch 4 of [1]; patches 1-3
of that series have been applied. It has been reworked.

[1] https://lore.kernel.org/rust-for-linux/20260808062839.1159990-1-tomo@flapping.org/

---
v3:
- Add the first patch to set bindings::HZ to CONFIG_HZ.
- Drop the CONFIG_HZ workaround.
v2: https://lore.kernel.org/rust-for-linux/20260907123524.2332118-1-tomo@flapping.org/
- Use mul_u64_add_u64_div_u64() instead of __msecs_to_jiffies().
- Dropped the as_millis_ceil() example and KUnit test patch; the conversion
  no longer uses as_millis_ceil(). Will send it separately.
v1: https://lore.kernel.org/rust-for-linux/20260811150147.1360102-1-tomo@flapping.org/

FUJITA Tomonori (2):
  rust: bindings: set HZ to CONFIG_HZ
  rust: time: add Delta::to_jiffies_timeout() for timeout conversion

 rust/bindings/lib.rs     |   5 ++
 rust/helpers/helpers.c   |   1 +
 rust/helpers/math.c      |   8 +++
 rust/kernel/Kconfig.test |  10 ++++
 rust/kernel/time.rs      | 105 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 129 insertions(+)
 create mode 100644 rust/helpers/math.c


base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.43.0

