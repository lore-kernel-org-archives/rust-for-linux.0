Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B314570E8
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543233; cv=none; b=gcQOP0Qov3JfQNDMm+TBvNu/gCZKJBixWlrZZiBfHRjRqQz1lgroZE+HhFJy06Hlm0lTC0QM4I6oWdza/vXYweRvrRU+Gbpk7pFTknLZcLdx+5V/SsUCW4cry4mUEa0BtiukSCWcCftjeWMK7HeS0TebYxEHsuFVm5jaXGyawB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543233; c=relaxed/simple;
	bh=QuflAl6mIWThNw+DUF7Z+yBLCw7p3pYvcHF319jO730=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FuHNwECploj6y3abV2R4J8zslbBCen6w8fwGTuDRpqHl1qISTH5siTlf7nzxmALZXYZr4aCSZSJCEXQvFWv4iY1iR4XLZmuFyMJQbx5Ug5BaAyLlsiBKlhznbzigclaAX7FAFb+r4s0tqKmZTVriRKlaZ5T81T4DVzOxYhdAF0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=qEghssvd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jcHPp4cX; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="qEghssvd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jcHPp4cX"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 3B01713801A9;
	Wed, 12 Aug 2026 09:59:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 12 Aug 2026 09:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786543163;
	 x=1786546763; bh=wLuKdCe8e68AKm4nfWsSJ4QJuHp5+aj7+M9BHIyUI88=; b=
	qEghssvdj6En96iFadxDFTRBAVGE2MvECWm8ahQ/pCPR1dE9/5ByWtxyUOqqhA64
	HZYjzUkyIjYoHJLLIIrKAaSjp8eAGJyIlLPSp4xvvbArBJpPxGz38JfFLNfdhWaW
	6xka2ngjwlELeODpBT1zd9f+dxn4E9VSjDC0sugG/VMfyI+9hd7c77wmJipo8dBi
	dyCiSe6H5SkXxRfB8vG5RTRSNMd35m/noFA84yc+6M2Xe1cm4pOouph+bVTR8UhY
	M9/ozWldY+3sJpJsz6gizkcOyEW7l72bofDvWP4bN8bEFAujC+QO77tecU8EqC+4
	V7Dwgallh4UIDjfDztNi4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786543163; x=
	1786546763; bh=wLuKdCe8e68AKm4nfWsSJ4QJuHp5+aj7+M9BHIyUI88=; b=j
	cHPp4cXvLTNgzrjq2syhh1eJfqfx1x778+nkN/+/OfgooehHcPMXASp2mnJgslEt
	IdISCw4M4AkvIjE2RDhH9/8DF2zvtkTID0uRSa0J9QY0wpHswPNE9U//gCwt5jAW
	byTyyz2qUh9s3vNr6s91/UiVuoWCv1IigQR7XybMrq+zTF11ahmWB5e5BTrvWrCw
	A6mC4LrqG+ah/0B19ugyv/GtkjbNh8ixsn3MY9+ef3KcIvmC6lIQTFvyxQaG7yEy
	75V5qR6Mbjhnzfzv/4k9ipzbmtnIQ9oHjpRCV4bjOxOIdxNFbrew0uDu4XFOxBz9
	cfqvaBlV7DIkSJc5bnIdw==
X-ME-Sender: <xms:Onx8au_tDgzkuHzaN0aQ9KGAHLB99YCh5pwZqM1m16nnJZXqEpvXug>
    <xme:Onx8avG8gvAGYWfsvUQ8xgCGTNgxBnWJ3K1-pPW1CiSJgM1UvKoV0WwysHSmixEsk
    TBr1OOeDk9OHho8dDIZtkJ10v_bYFYX_-xH44CKMd_tbMKfW0AGkSLg>
X-ME-Received: <xmr:Onx8alIGUYiM2Ti2I_h8iq3YGgiF9E-oLh7EuBp-ukQwa9eg7aRvvPculp0DgpfrYi3n-Cd3Qiidt_HCCAbHF4CJ>
X-ME-Proxy-Cause: dmFkZTFbv3rd19t+wlAo2SxgwabSesgW4ZRztwP6h5jjovwMcNIrtHMBd/LoIYgnRlFK1D
    N1lFmNtCjJvPgnSEFJmGYo1XJUAKUSqlj2oyqzKrksTGxT2J7/eZGrw0GInXCZ7tSyg7m/
    9TLXMqva6VSFQRCzCLpjMZgIdTIDPmVR8a/IMnVuSvAxS6NNVlyQGVUPeknpWx5+T43rgq
    +Wy8ekv+SVEH5zDwmPNX4ATYcCVjBiDapGKaHFuSk3B6DNeatD203DsqqS1apuhA76pVFN
    bbZDqZfr3CYaF5WnuROQteKHZT9UFDltiquu9LR1+MgRM5Zhs3KhPJt++4its1DkIQv1Md
    dz8jv9PVpfC9iUTFCvRopShb6NP/ubW65/rVMFOqihnwe7uPGCCkXOzMPgfDpWh1n6IZ+R
    YNS9rq/nNDzAHxP0GAweaKGPjxI2rzulTBq0kH2WdZ3n2w+GwxgGYrz6vgIIQJReq5gM72
    BEBp+oXv1iWRmAAxYqyWoRY1sZRRQ+1jLY4164dtJ9uCsKxWApcHpQBAL7r1Rm4hbnDq28
    Nmkany5YRouIWy2GmZ+KVWyidPrLOJ6e+I4nGIM7t6Tsko1CtfhZS4t6fK2qv28bGo/5n8
    VmWKoGPmsYX7Hq1L+Fayyr9+8Ytfo69shwv1N3dCldaHdD18p0nWxVFobsrQ
X-ME-Proxy: <xmx:Onx8aicOl2OuHV-7vmxOBWKzj1bwvFzj7rbtrwgFYQH8bAXWW5sXaQ>
    <xmx:Onx8aiUVK5ckOc4cYoEWd2ydhenYTytGpSxD4EASLjKV9uWz4659vA>
    <xmx:Onx8apHmLlEbefu2CQIFPSU-wQx66nK7BxM3oy2eR8J9MsiOvibdIg>
    <xmx:Onx8ajUP8EXfYSqK7Y3tskbS-y475UP4zj-wToow3tbSyXcbDPj8nQ>
    <xmx:O3x8al3Zc9_wiApzS7CZ9z8kFTYDZDcnP6VKI8gAptYxG_CR2k2hpo31>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:59:17 -0400 (EDT)
Date: Wed, 12 Aug 2026 22:59:15 +0900 (JST)
Message-Id: <20260812.225915.1358235872335365762.tomo@flapping.org>
To: ojeda@kernel.org, a.hindborg@kernel.org
Cc: tomo@flapping.org, acourbot@nvidia.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
 sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 1/2] rust: hrtimer: Restrict expires() to safe
 contexts
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87h5l22ptn.fsf@kernel.org>
References: <gaVV23pVoQuUbm5qsnhQShsVZfOivBkIjMB8yfwrQCi7DeMizBafFVFI0bol4_aolii89peid2LdkWIBA9nMig==@protonmail.internalid>
	<20260807233039.1091842-1-tomo@flapping.org>
	<87h5l22ptn.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 13:11:00 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@flapping.org> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> HrTimer::expires() previously read node.expires via a volatile load, which
>> can race with C-side updates. Rework the API so it is only callable with
>> exclusive access or from the callback context.
>>
>> Introduce expires_unchecked() with an explicit safety contract, switch
>> HrTimer::expires() to Pin<&mut Self>, add
>> HrTimerCallbackContext::expires(), and route the read through
>> hrtimer_get_expires() via a Rust helper.
>>
>> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
>> Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> This looks good to me now.
> 
> @Miguel, can you take this through rust or rust-fixes? Please add the
> missing bullet in the invariant on patch 2.
> 
> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Miguel, on the missing bullet Andreas mentioned: we agreed to leave it
as is.

Is this still fine to pick up for this cycle?

