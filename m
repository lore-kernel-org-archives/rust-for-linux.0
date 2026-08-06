Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC62C3E6DD9
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004609; cv=none; b=gBwfMXB+Lf/5bx2ng+u8i6KL55sMe20/uYF2wjLRx+skz1qv7QXg4TJucm29TSHULnQZ5um7fmkJzqvagKDYN9hdGp/xJLnYaHbJD6cAih5nzwPU+CZfzTZ60kFEA/uQzCv6sDBuQWy0wyLSqnTQcKcK0ymxc2IzyUN9xLBR0Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004609; c=relaxed/simple;
	bh=x5phXPoPmg5wz1xiXdhbj6a/n9TD4iNVEKMkv5Xc+lE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=i7RdqHGY/5i2wpP9hD+LDeuq5vZk8KxVhfBEmWofOmpXPyf46fcrzwZSmdQqgqSBdK3VIwSHlc0sGqU9nMxllBNyiXN8tPpdZCCLjnUPdiXSD6rSMETidL+feDESRjAtcK8zzEr31bA09FIQUmsf8qUyl6eE/qkH3nh5lnq5Emw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=BksZwodt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JAM793t1; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="BksZwodt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JAM793t1"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id A5CBF1380055;
	Thu,  6 Aug 2026 04:23:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 06 Aug 2026 04:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786004606;
	 x=1786008206; bh=HwSnRZ/iiQwkJ8f3P8sGSdY6wrqf9Zxm8y1DalyzYyI=; b=
	BksZwodt24crOx297p+6ex+dQC94W+Y87241/1bpjwBAv92UqUiVj+7Q2f+DlEgv
	jZOipD+nl6YE08Hx9A8yLVjqQtE5jMYIEfxMboJYHHHQRKzKgUAZfgvjSB8Lq2gn
	XdYLnCWqX6iob6ASJof6B9OK3Uq3BAsXuzt+Zjg3ZGDIsZ/3jRYg6C34Mkmacb1o
	DROIP6oNPTt27xlpm3/2PV38mdzPv6f5JlqzgUjQ91JtdRbwxoOfckJt9N8643oe
	XPmyaqWyleNouqIjRE5/YJA4NHvq2LhEl6A5L0Ot1EfNEqtQjbYshfPRZ4Zl7ejq
	zhEAXaUvs33hEi3ocWVbeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786004606; x=
	1786008206; bh=HwSnRZ/iiQwkJ8f3P8sGSdY6wrqf9Zxm8y1DalyzYyI=; b=J
	AM793t1QlTP8DPtszkNzfATrCF3/DPMrv0Ex+pZVqesO/PyqsFtmhPhazvqMTOFB
	065odYg9VZM8UHNI9nSYuDFRwXope/Lm89ht754xunJqKSbQmuj95yzENFgfEKSf
	GFwTUa4DbovTE7tzU8AcqGtk2/VzkNRQEPcW7k3mgHjzvzr13QjR/DWHWa9/Tt3m
	0t0bzRs9/qKa2b5kk1OIsz163rZv667vwDSGxPbd/pl6rliNtDuPhkiYGTuIAzet
	HvH8HjyGFVCi4a2Ed73hAc3y/lVMq/aRvrZyLUBXFmPhtyU0vRrMuM3Ka+tmHnSb
	LzBuTFl4BsCpPiCkasovg==
X-ME-Sender: <xms:fkR0aojH-ZMqg1cUAUBJA8PT9YU1jZFwR94P_kLeD2MiebJeEzIqOg>
    <xme:fkR0ahfsamchFR_WW-Z29asAzfrmWjeX5baMpHJ-F4Vev7BetNtpCaeDdaqLD-R4x
    5x6jPA4Xl2U-hb1nE2b3QU8F3wp8APqBqRi09V_fDyLW-hGxtV2fxg>
X-ME-Received: <xmr:fkR0alhzlYRfCSrkiTMIr9DIxBgJX4U38W1zdCH8xBCyBnDuy3TXjb9R_qr-jeSeudLqr5OeD0hFLZyZOLNzObxD>
X-ME-Proxy-Cause: dmFkZTGxIILnURZoapVW/2PJxT+ECKsKd1DYHkIeVGppQYKR+tMsVDCUOa4rCfSOfYeV6g
    6+f/0ULL2gWCFAVwwdb6+dnZ9hpH8mmBjSH14fx6QyB32ZZfcmvi1fcDKbab99rDcOMMGf
    8fyNv/fQ2u+uMiZioFhjXK8sMnj7nZfY+PHS0rHud2hjYReI1x9mQG6rxama+xy/yTx9fl
    fejVpKc1SxfqVAocBY6DHFQ/jLFzpEZws4bib29rN4zxbLEsPnudOcKv5qc7cODTIoYDj+
    CUZyCw+VXu729+KBHz5sWp894qJtGjoss1+W2nxqB7GrqDvmv0zjXri3UD52lUxWydQBpV
    WYUmF3DnDztZzBtju1oRc9HokSawpEFMqwM5gU0+YArAe28p8+mUOcmlCtwBoTuz9oZ/4M
    zd9W1SvLM8cFhgqoEy6cugmuMd+Py5b+eiPpV8U19sAgZQPsqr6TeXKLYtdDMwmI9UOzI2
    V5JoD68ql6gMFbBl9AX+Gl5rKHqrbTYGp96FKtuhkCtoHqFOcpE13i5xcyL+B35abck52p
    BTdaLY20BhPP1cg8zDCHl1X4HhVvIv2ljVaniPjP/ofGX6e3eAbc34F3V5siBH4Y7w37E7
    m0aO5mJMkcE9M52ego0B8nMQxOaErro0B9IU4VshvjWRHni9y6M4+QZa37qg
X-ME-Proxy: <xmx:fkR0anODm3Qubon-n3gDG8GrOysAcN6XrTro5nWw9gxZD238aRR1cQ>
    <xmx:fkR0apnCCz7Y9a50QEzAMdJUoDiR1HmdkEm2OEov_BqscWCzKJzgRQ>
    <xmx:fkR0amdYrCQNoC-xZcQfjl03Rv1AqGtI6gQD9Z7h3ul0_r78Dx4TwQ>
    <xmx:fkR0ajsThKzTqmOnSkmN2qnLgkb1q8eorZjP20u-YMv3KbkDt2sCLQ>
    <xmx:fkR0anmWhs0tRWBkKobRK82oFQWJyNOtjeUSJoDNJDqrD4pBRwYxXWO2>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 04:23:21 -0400 (EDT)
Date: Thu, 06 Aug 2026 17:23:19 +0900 (JST)
Message-Id: <20260806.172319.1970353690506890750.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, ojeda@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com,
 miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() rounding near
 i64::MAX
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87a4r094ow.fsf@t14s.mail-host-address-is-not-set>
References: <pnFuloASX9OPRE4rxnDZmJLS4_GaTn6IAT2OPZgNSvUK8JSWvobnoTZr6EifpDauCqMlUcmFmi6zeLTeBxsYsw==@protonmail.internalid>
	<20260723120907.209643-1-tomo@flapping.org>
	<87a4r094ow.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 05 Aug 2026 13:39:43 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@flapping.org> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> The ceiling adjustment used saturating_add(NSEC_PER_USEC - 1) before
>> dividing. Once the nanosecond value gets within NSEC_PER_USEC - 1 of
>> i64::MAX the addition saturates to i64::MAX, which drops the ceiling
>> bias and yields a result one microsecond too small.
>>
>> Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
>> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com/
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> 
> It took me a little while to understand this one. Perhaps a few comments
> explaining the boundary conditions could be warranted here?

I added the comments for as_millis_ceil() [1]. You want the similar
comments for as_micros_ceil() too?

Or we could add a small helper for _ceil() and keep the explanation in
one place.

[1] https://lore.kernel.org/rust-for-linux/20260806073241.1024319-4-tomo@flapping.org/

