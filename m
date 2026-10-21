Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601564;
	b=PNmR1HJzYWq2x0d15T1Bq8VmX8Uh9aY1s1rTlVdB19AGk83xQQM3BgSKWTJEphNCsRnc
	 7IMvKimKC6Sr1Vh09BReTb2FGRAZWilmUspGLKxVdL1FAKrqggnnIE+h5g+/LVjLE5EK8
	 dIyxHvK//NNVWFdtt2G7sVYJNddV8swIAe4MobPE4FXtmOaoornWiCL8shyxIbjxTHfPg
	 sJFWzWjMFjkZ7ceR309CJ+WDtrd/S72nAou76ccfyA4BLoH190UggpxqPqGLt9uiHXXjs
	 RlbbdTdC8Rk6tHmwQZlYuPrSN4dWyloCI2oho/o6SPkWpVckXaoV25YjHc9nTxdi49w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601564;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=C5514rfBdcc369oaOgCRKH1VWmrGbODGqjctAwVvvUg=;
	b=c44Kz6OI1ZcrAVVf7hyntKIA+pBKvw+jCW+WTCYP6wewhwW8GARcEE97seVLHjFliFIm
	 0jO3DigyOwC7lV3M8c/lhTgG2xGX9/Obx4UVKk9C2GqFmyJCjF6mF5/Z2tUbHrAcAmGkS
	 nBYPgYCgLtaiW7CkB7Vl0PgLPU4+HK4cHDqPjFynI9So3o7D1fYQkxVPOUUGBI7vPaM3i
	 tIo4SPjCzPFYN4pLurrSms6xHju5r7BCwP84qfFB2/vlT1Dur3uSsJFsB75D2vO2YLdhK
	 gFQCzr8qYuzE68iUew+elaCGyevnxbd6ub4urX0dS92bn/8ai3SkrOntnwH4uAL/VLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L8ls7cce;
	arc=none smtp.remote-ip=95.215.58.194
Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B6606A31B
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 16:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8B6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L8ls7cce
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=q+P7zs7+ecDaVW4B978U7c6XK/QOMKCkLr1CJdTiFXQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792601561; v=1; x=1793206361;
 b=L8ls7cceRza9IZFuvTEaRO3sOEaC8Z8N9rtrsdfWJEMXfDI70uIR1GlEMSLOw7ul8kIAHU4H
 fzH/1sxIffzgHnQuduecunF/Rk9od0xmJR2HNr5aYM090SBViUaV+qjbu3kppwfL8fYwfVC7Z78
 GvnxahlG6gfnaHl4VSFq4LsU=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5520683f3422318f;
	Wed, 21 Oct 2026 16:52:41 +0000
X-Mizu-Trace-ID: 5520683f3422318f
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [GIT PULL] rust-i2c-next for 7.4
Date: Wed, 21 Oct 2026 17:52:39 +0100
Message-ID: <179260155969.2966.15552703862037914616@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andi,

One fix for this window -- a real use-after-free (KASAN-reported, GitHub
issue linked below), not a cleanup.

Thanks
Igor

The following changes since commit 0f6be986ad0eb6fe7338d963a14eaf0dee87677d:

  i2c: imx-lpi2c: remove dmaengine_desc_free() (2026-10-13 15:55:40 +0200)

are available in the Git repository at:

  https://github.com/ikrtn/linux.git tags/rust-i2c-for-7.4

for you to fetch changes up to e7755b5f29ccbfd1222dd52dc2d6eebf39d02289:

  rust: i2c: remove TryFrom<&Device> implementation for &I2cClient (2026-10-2=
1 17:47:21 +0100)

----------------------------------------------------------------
rust: i2c: remove TryFrom<&Device> implementation for &I2cClient

A single fix for the Rust I2C abstractions, targeting 7.4.

Removes an unsound TryFrom<&Device<Ctx>> conversion whose input and
output reference lifetimes were not tied together, letting safe Rust
upgrade a short-lived &Device borrow into an arbitrarily long-lived
&I2cClient that could outlive the underlying device's removal
(use-after-free, reported with a KASAN reproducer). The conversion
had no users, so it's simply removed rather than lifetime-fixed.

Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
Signed-off-by: Igor Korotin <igor.korotin@linux.dev>

----------------------------------------------------------------
Nicol=C3=A1s Antinori (1):
      rust: i2c: remove TryFrom<&Device> implementation for &I2cClient

 rust/kernel/i2c.rs | 21 ---------------------
 1 file changed, 21 deletions(-)
