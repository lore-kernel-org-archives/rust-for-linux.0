Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407178;
	b=jHkArGpegSbZBRBSeV7HIF7/LtEGKCtx2EetiIdWY1mHNwHSCLKu/EEJepEVyeU8cPof
	 0V8Y3gXX5mVeg5iy1uql2Q8FVOSynH2OMBCYtncI5xgYX33wXTNK64yfKFUMIy6tB7c/w
	 m1rdil/hoDweMFcQgM47+lDJPiktpWnRGCoKbISnCfcxOg1EmzcOA3ZSd50/rDCJBZ0Ky
	 mHJGvcLr7a2s7iKHWqRvD1F3aysycLw6mfU3xWbDczEqMmleXGMmvHkB8bOpmlvH/Vgtz
	 4SRrVQqt+WHtySDfdH8g2zxkbQOAOPx50G6/bYLBeu569tWEKMWcrLEJJQlrxkjo6Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407178;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=vdswqzPj/pu4tu5VvYCgpsHGE7MYzuyamDvA7wdAGDo=;
	b=NNaVgW46PfTgh4JOxLfi8+UJ2pGGB5p9H6bk4FcwXdqVLZbv3Q3RX92/oyQr8UMCukqH
	 gINvpSp6OwPP966c23YVYw+eqXgQyziH/WoMz3+Kjq2YcAZfTZE18OE/iqWZKDyxyZFjq
	 YC1nWOxN/Oq2p9V8tpAP39/WTTYGEIbYRAWPoeE+RhnIHM+TCinDusf3lheVZSsamyHAd
	 GwzwVwrfb+xdu2Q5oKyWbgW9hd1w97TFgKn56Rz9ZWrANLHFHZbZA7NI8JHUgV7k1Hrsc
	 1NSWhLXRLinpWbXXFbCQrwIK+eI8SiJ+yQYL4FW1gqMUEW93ZyZIKCHU//+a0wVgY2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=TEl6JY7c;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VQB6BNnb;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E11606A325
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 00:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E11606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=TEl6JY7c;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VQB6BNnb
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1F9D47A0148
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 20:39:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 30 Oct 2026 20:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793407176;
	 x=1793493576; bh=vdswqzPj/pu4tu5VvYCgpsHGE7MYzuyamDvA7wdAGDo=; b=
	TEl6JY7cNKUhEz0jszJ8JE6KIigwJB9rpAXdbAZ1SO6jZ95MlMiPoU7QjAMxbuJ6
	K/4+G/pDeMLOd0QjDrwuvk6N9tgfUe68DpZNBT6NQx4SHrRhgL7faFBOQHPplcu/
	FfuHQpQtyNTEDWVdZQ1M0OB9r8opiwKk646YO/X/M6ypU1jQ2Viw/HaA6CpcI2f0
	dWcqpE+hqCn6L/8DORzk9vuFFGxFLA1DmMJzkpURH9P2KiKwbvpwkg5OVmGAo0Wg
	7N8xCSfnufRXBtawflF5aIJvzPgvnKN8nuQ7L72iarBCEca4DGCd+Hic/qcu+aJk
	deI7z0exsQOU3F1LeOM2Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793407176; x=
	1793493576; bh=vdswqzPj/pu4tu5VvYCgpsHGE7MYzuyamDvA7wdAGDo=; b=V
	QB6BNnbP9zTpO9hRF4INJbBCYzWmYfm9JmEQ+8GEvXGwJmWsBNybu4dMMZAQRasw
	kvvzHBcWBqia/xeseMprBDnzZ2pmiaATIHK057M4kXyb6Ni0jXQFQJb3KtrS0nz/
	BWV0m8bdlLjRXxwByaU/GZrqVdyp9DyXEHoJMFxA0wa3ukrjlg3gIw2P8ajxQ0Qh
	2NEtu5l4PP+kdwwbxdX8p1Lunj1GZ4TKpIr/CxD5QFbT11NyoleKk68gy2vb2yjL
	wZEr+9xyTLD5lM2WFmQtfOPiuQMyqjmec8JJ5ny3onYGzPVTQM6S3Q7I5ezKWp/5
	j+0OBuAs119miwdJp419A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793407176; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:Vt87AsdeZDOKCrWnkJv6bGSUutrmNv0vTiTxOpzBYM5Rk3g
	64FTbvAlwTVTwt6HNFiEV/PwwTTb64nXUy1+nOEnZjlXbX4oCOTZIZjV2EoHhWx8
	bUP1z5tgc9B4oMsneJtehOPEq3FIUffWGQ0ej2a1b2v/vAUnKgF9+m98M0rRsbym
	9NFLrDPutCBxRCP1OOFiXQo8HOUfQXTpcHlAEp5mVWiUTXSv4VKApfbRd+Z/cZ9V
	uiQ4LVOpOqV6cML7r8aeFQ6tm3KJ1KqIWtRQJINIBv2TLaSdj76+wicEhMXnNqvH
	d5vIhApI00j2Ph2kDA2cR2bfSl0XPJQSL/Q3Hng==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:KQ1olCpBuriKBYBP8axrDCuWxr4llCjJfgJ1E9E6JxI=:vdswqzPj/pu4tu5VvYCgpsHGE7MYzuyamDvA7wdAGDo=;
X-ME-Sender: <xms:yDjlauQrJxkPfhNCUri7g4-cm0AW3nKJTh1izQtpubVW2GvFv-XV4A>
    <xme:yDjlars-QxkdA3xpnPEFufL6-SJNnbxPXvHr6FgYeLSpPFjbLZufzXRFNQ-joeEEL
    yUdcbbbeD9C7i4PdBkucYBzDqwvJbJE4NxaLStaH7Sim0QCS1lsxPEy>
X-ME-Received: <xmr:yDjlajDBB0BX9-3xPOY3xu9crhkuoCIPwghxG-6qPpURS5pDvLoDfsDLOVZX9x2eReTVGXgrid5Yzde7YhT_ytYn>
X-ME-Proxy-Cause: dmFkZTGvjFG8DHwcdZ0uQY/tdyzUIFMEBr/0ctBz6Vh1z4KgGBxcxyVj9GpuOe07IhSDJw
    HA7tN4OleJrH/6qOqT14gMoYkHjLXEV9ryT81pA0HuWt6dlOi5/sMZ1Sb1249qaHUPx9Q5
    xtfhVZtFvmLDMYGP+40uMAi9PFn1NDuTVx6B7yQNMfchN1e2sTUVtD3qP6Xj5yNNknlp3K
    h56xzpUBPIqTOu9Y/xwjDP+BVy/5p0+6iuQVctmU79LAQFC6XSsadROUWCIss1TxoHfHSD
    orXK5q1UGdHG64bIClO1tugsBPZW88Utzebn0hrzQw4RvsoBOi6kMKwkFQrWOLLVBJdFCd
    jizbEJUDXPKUV4koLZJi7AyPK/rzfK/Reve8ek9XcnKis5AdVW6Q70h3qfHlo4WiOmuPpn
    SzBUP2MTiaGqy1L7DtVKiC31nUqvEwQF6rPpgajGg0UoIHzaDzEu0j95LbgxS8ZyMKDb7F
    3fCgCdUTn1Wex3SzjRU3wJUPQQcbano9ACBjPC873lAD+LUUDsx4aS/AtbfVtjUHwSFRzX
    QAg2ZD2NgmOLUcXDR7PAtkKtSncvsHGxftMdFzIlarj9GYK4WcF+TLL7Wijiq24p6woVvQ
    bqnbuy/26vBKddstwZfNe6vcQYSPB5B6Hn64rQJkL2Aoe91RCz7N2IHjmDmw
X-ME-Proxy: <xmx:yDjlage_AQgn3or9ZA1dmcctT_J-g3vaYGjg6nC1oPvJYVRvBRvrog>
    <xmx:yDjlajrywdiW3i0-2LJh8os4mHgo8vH7Hagn08mD9qiSy3akNQsHcA>
    <xmx:yDjlas52YkgrBZQOeSgFxeYv52Z_2iwsvroM4mqgqB0MvSjqjHbWjg>
    <xmx:yDjlajCe8IwVZSQyZDnnmk8N-raY8UMk_GaPcKvDvkbrAgqYqjRYuA>
    <xmx:yDjlarht5nxRb1JN74sRMX1rWv4ducLuqOvY_rCExihiVSOdxeVSZnHU>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 20:39:31 -0400 (EDT)
Date: Sat, 31 Oct 2026 09:39:29 +0900 (JST)
Message-Id: <20261031.093929.648818945104239611.tomo@flapping.org>
To: boqun@kernel.org
Cc: tomo@flapping.org, mike@fireburn.co.uk, a.hindborg@kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <auTpDD4GRiD00jP2@tardis.local>
References: <87h5jzx5gj.fsf@t14s.mail-host-address-is-not-set>
	<20261030075750.356854-1-mike@fireburn.co.uk>
	<20261030.190502.1711453613571853758.tomo@flapping.org>
	<auTpDD4GRiD00jP2@tardis.local>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 11:59:24 -0700
Boqun Feng <boqun@kernel.org> wrote:

> The way I see it is from kernel::time perspective, we still want to make
> sure the APIs are still in the same abstraction layer, a
> ktime_get_real_seconds() co-exists with Instant::now() as the public
> interface layer breaks that in my opinion. And the generic type
> parameter should be flexible enough to avoid introduce anything we don't
> have a user yet.

OK. I sent a series that adds a unit parameter to `Instant` and a
seconds based `Instant` on top of it, with `Sub` and the other
arithmetic on `Instant<C, Nsec>` only:

https://lore.kernel.org/rust-for-linux/20261031003334.4161188-1-tomo@flapping.org/

What it costs is a new trait `InstantUnit` with a read function, a
second method on `ClockId`, and per-unit invariants on
`Instant`. Please take a look and tell me if this is fine.
