Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FF41836E
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 23:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292805; cv=none; b=UnU9fulPTFu34Utrp0jAtHPB4Z7jFT6fMlYsah+0L/O3cXStSJUX8ErquUDrRyN+qbutJokdclAtVVGiX1z83TsqFDAfU//xqPhr5UE515ajsJ1+o3vNwFMii4UZrlvrrltGsQ4uFH3iGnz/zW+l8+SOy1Qjsf5+pSMgCHSF13k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292805; c=relaxed/simple;
	bh=wfN+F/tXdirrm/AOA0CQm8pVDOCc6Zdd8CMhpsj2E0M=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dPHW0eMsEmBWI2X8U27xU/MLLoV//ew5bhBwVxRsMBQPzL4rg7amVwQ1JdUPwpJyXTyPVw/j9+oJzlD6QVajjNFrBpH/OvsnSwRFpu0NTrgSNhBujfuxr4kesdxrQyAHzVvTilGCMtuLzNYY8LuUmyuKAHNo3XNy7PLp7Iju+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=QgNDH3am; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ARq9gtcQ; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="QgNDH3am";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ARq9gtcQ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E952C7A0090;
	Thu, 24 Sep 2026 19:33:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 24 Sep 2026 19:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790292802;
	 x=1790379202; bh=nc2JC2Zxo9niE2q94TVIY/g+WxooYGxP9IPArtPjwSc=; b=
	QgNDH3am0IKxYUQqsrBA5p1NQIfVZHAtVi3sq928wz3ND21v6tXicPuwduenQzbJ
	3bmmOA38pmiYVdKN4HP6Ng17xQWd9n2xne++cUwFnSghGyCErB5+AHqaOxNHmowd
	Uwq6qDqlCMEAQX1FMeQaaGNg/KbvvR2DJwHdfjZFoXXa6mSKfHK2fr8zewMJwWgu
	vu0JS/Q+k7RcUcnIWdwUoovlWntAmH/gpWRFWHjK1rHSLxrH0auh0QPq3keoMjKn
	uqAalrEXeSI/lZCMtJB+cZozuzi5NysXw910GgwH8ZUvImGWiejdbhFF0MEijTlw
	h6mCy289Qwm8CB5EWQFrzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790292802; x=
	1790379202; bh=nc2JC2Zxo9niE2q94TVIY/g+WxooYGxP9IPArtPjwSc=; b=A
	Rq9gtcQ2aTJxzJD0L1aqQHsv4sxuuhbY0Sm1Pzc0PrGEH1Z4Zgukl7MakRze0EYg
	FaPW6ppovQzwzNahq/MTA9ZVFmN7cQlqMecRTDktCgy6V2LnAZJ2M4GHMnshLSBP
	oEdL5Os8CDgM36xcZYPFoOQ6M40Hd93Tb8oDwZANFhNpm74hHQJh//LfOYxhkp48
	+8tKzNgtPkI8ZZ72sD3XL3m0K6HHY+noXXzMgK/CUSd3aBSmzgQQ3qGpimO0+yMa
	n2wpm3Jpa2Q0fiG9bUHzBwKMPfbWDmEr5oU1nd9Qt81S9OlWTAimXbClfRpnRYnp
	NPMWkUSOwy4xS+wHwRw9w==
X-ME-Sender: <xms:QrO1aoruXlqMrGuULqnvvWp2vxICSbBXO7r0c7Bl3Q_WO9YfvQBuKg>
    <xme:QrO1avBAAiJ55Rr6RFIfPaUacNKaar8zwgfB7sIvr0jd7YuilzTF0g2gKz2Naq3Xh
    9SGB0Cu7RHoOi4DIY5O8sVv6Wgyrh-6TCP6d4iFbmm5rQ1ynyhku5FE>
X-ME-Received: <xmr:QrO1auVTR_2AOIMCc-IpVwJJxso3ckEO3NIpyRObarnSNR4djw4tuDWZHU-Kv9EH3_uiqPxXqdJWdkBVLQPUfuST>
X-ME-Proxy-Cause: dmFkZTFgsSDRsbZ5pT9tNJ+Wqw0HTkC+7GBexh/B7t8J6/0pZ6w4XzAlLnyWHPGdVtB4pl
    B9koSu1Ox1YuJeqnNOjGArPeVlaOFxEhSwjmTvM+05Tr5E/z17oXwTYUYaQHeX1cf5X7iJ
    yLIajyAPlUHvZLJqvdJJoeV1oM6Ko3bU97KF2V/p1c90IgSi9+QCb2Eb7GtWjV+vbE5TY9
    vt1a11wB9J91OIBu4O9z/KqlyRnAK311YfzGOh9IhtYyA8EhT8NO06Qy8T6Fe3978go1SZ
    QKNlf4huvQAVgEMrcY6QLG9N6FeBhg4bx+6e8X5uXdEll816SeU/sOzxELIERiA9Wo/fFk
    lt+zNPneGVmYEYIZHwn59jAo2mHkrySuhLqBtXnOOhEZitF9U2LwRZ5e6kA8HjK0cAhiro
    sRjZ5olHLiFOzYmJfABagkoZT6CnDAS98wr+cYxZqoEaf91uYmD9JyN3xnNUMnuZXTArrU
    iSXkEmvVAfvT8JrBvMZqxE9mcVWntbJzzUPbaZSmct+UrBdN0cCBBFHKX7+S9d9X5CqgFy
    h+cQYxhibt6G1FjRNUw6tKR56nTUfzutwHEKcHs8PgkiHyZWtJPxNi+3P4nAZ40KookuKX
    6tpN9pk+PxZUauBSdXrwUY9cjrbcKg3ug8jVdLe3NgouMCD9coILiOciIBNw
X-ME-Proxy: <xmx:QrO1ar4nrHf3MkeefV55x-FkCLlZvVZR--Cy6sxgJkGZyo6ia82o6w>
    <xmx:QrO1anCkWKJ2Yj1Ud0j_TfzbS4HnGsKHNl5xJyNaC6tMbeaFnX9KzQ>
    <xmx:QrO1aoBLdiWv6abDweWKf8tc1nc0kceFVhDnpHelqoEsIA2wzMcSxA>
    <xmx:QrO1avjCWBv2Cnic_0eI1gsxqJea1ZzUR1hwbKiXU_rhhG5Qr8zykw>
    <xmx:QrO1aunNLFXF6G6pqiUerCuYt9d0--A2oU17sEB03GnKG5N0YV7WqYaq>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 19:33:17 -0400 (EDT)
Date: Fri, 25 Sep 2026 08:33:15 +0900 (JST)
Message-Id: <20260925.083315.1383506554290485158.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, a.hindborg@kernel.org, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v3 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DLMME4OBH3P8.3Q6UK95T2WGI@garyguo.net>
References: <20260908230445.2430296-1-tomo@flapping.org>
	<20260908230445.2430296-3-tomo@flapping.org>
	<DLMME4OBH3P8.3Q6UK95T2WGI@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 11:22:47 +0100
"Gary Guo" <gary@garyguo.net> wrote:

>> +        // CAST: `max()` makes the value non-negative, so the cast keeps it.
>> +        let nsecs = self.as_nanos().max(0) as u64;
> 
> Please use fn syntax and have `core::cmp::max(self.as_nanos(), 0)` or
> `u64::max(..)`. Due to the method syntax hinting some action is taking place,
> many people find it confusing, because you can easily understand `.max` it as
> "clamp to a max of" while it actually means "clamp to a min of".
> 
> See https://internals.rust-lang.org/t/am-i-the-only-one-confused-by-a-min-b-and-a-max-b/13252

Makes sense. Fixed in v4:

https://lore.kernel.org/all/20260924232530.446588-1-tomo@flapping.org/

Thanks for reviewing the patches!

