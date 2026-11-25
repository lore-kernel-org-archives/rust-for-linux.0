Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599645;
	b=sSACH6SGPScbNrIfN8BdL4UfhndrgB3jh0AtQbneh59z/hgL8XDwX13puf6QOHdTc4O9
	 Fw27z07iNe2Z5xkPFADgTSW5MO1sdsSUAqDzGm60urbyzGTUgC3Tq5A75+XlMlnIa6bnb
	 H/MRdr3nBIdVndUEvDFIbmci2lkYELvvsT/1mwBhI3G2OWf3mVwyjr0MfxUW0U3fsOfk7
	 e8BoQ54ZABcsZ7t6B1nK/GcZw8SkikPLhI83m4RTVZBdLkT2VShISq+1VwKa/xty/iXwF
	 TCj4GO7pE+mkHByub+cfz2tWd2Pp5lOp+wG0ydPmSqK0eAX5ym5AbsXABGdYvCH8ibA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
	b=rV/1dB/JlHfACs3pgeaodpY+MVcHzJG2f57rURG1rWC4dpKVK6dfCDMX48Rt+QgPRBby
	 lGe5UWLz1bnEI7Ylz8U6zE1PnjGcHM14i3nteeFcAfYzeVhypEM8ajLK30L3nfOs1ej1N
	 7Ff9quTCQmMhhh4zXSCZPl488vjlcGVrjT2+M+eWs726O5pKrlfk4VYUhY8VbPHRmINP/
	 EBs0JF3tv4TEO5ihTY3efkfRwVHWZhk/nt8Jw6gQm1/FTvutxXwJwYEXMie4tvOKHHD5L
	 irGMrSaMItiLyiW78ddJz2YbXXQBURONB3//jem3Vh77SWe+d0okqouo5qxeopdNYaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USogZ0T7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1D606A32E
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 09:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B1D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USogZ0T7
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70059e4dab6so2928023eaf.3
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 01:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599644; cv=none;
        d=google.com; s=arc-20260327;
        b=O1cUDO5wBaecspZUBTMoJd1SaI02XjkIGfWCTP6t4JgD5lBVQEf70+kX7ruytO1LyR
         kVFbRK7frS0U66PzcISOagrxr8esydUlM4afMhgk5U9qLquExLXy9f6cvaDOVYhEnq8N
         fuvOeVdWwqOxMfu/LeKlA+KwuQWjJ/X2dbcfQcKayzDilgMXTxJbnKY1S3Atr10G6WO+
         PN2xcxxC+lfXa7fFSg9FD3kgOoL4c1MJSo91klETEMGOGxIsJZhLiY9bsqrDz8BTTjZ6
         jnAOQdwy8Mc0hERYMabCFQMykJEyQoaf7y2wwNEzxgY2NOmgQxYAz2DClRVWAKvIdmiS
         quaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        fh=3B0Laih2AcNDizDbir/jbEF9XD9OF7xZOlQhQM8JiMk=;
        b=G8ylV5uh0FC07dtDmtuGwdQw2CnM2juMUqJ1US3AFQO494CSHbDScvy/wW27zlGY6u
         NvzNOEowrHorLbzF1MXfN1g72pLVVPxjQLDzMG59TbESaR5AA92OFCajhmxIVDkGeS1y
         wYrfFS4d94Q0gBWw5pS2oQIm1sxlx9cZhYLgKg//PeKzqRTGAjnqJ5VryTxIxMxetRLt
         jEvM4jkhgvK7dGsC48JQS+RyPSlt4Qwi/Q6sb/0WzbZViLF7qal/kGFh7g/gnfCeiGtw
         Ymxp3cdVBDL4rD+bXFYOPG0rHNhcNt+bkOljoLF+Qs9JqexvelIyP1SUERHFBtgtNiLv
         MRPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599644; x=1796204444; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        b=USogZ0T7/+oVKbbiq10JBY6QO9BLjWfuL//cJGrm69dZzwe3xcxXYfejWFRKMykHAk
         JLbCM7dWn1b62yVI8kDtdjJ9tarlF05DXeEiA2BQyimghQfJ3fuol6EWB2R5Eoa6bUzM
         C9i36emuQHVamCvtmNtmFGKA8PGlc0pCFIHgvGVazJO0/a1o9s8WiLhfpIn3J7wWSQsc
         aew+7tayon+TGltP3Ort73UMToKHA/YL1b3IIuT/dXMd68X5mCt3ATymsx8R+q4YMvMR
         BCvRazhZYOuJ+MBQmEsw05DReJlUv3y8mSfzpgzDpJBVLz74ZGhYl55Xks0vpitxlOw9
         G2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599644; x=1796204444;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        b=UgPrKxQoEZDRz5OCI0yHpKDdVHNFQl4A6K4HgtVKZZkvsKXFqdd77iErz6oMeawjwv
         x1zphXisBhrftYjSxVfVEEOB8f7MbYsSWG3ggtTRvmua4H3cMdLKeaw62aun9oLk0a5O
         1ykfNKCbAKxf3j9omGVGS01STwUcX98u+Pit0vlhxfTK9IyhWMznSTWUUuT/PoIek94m
         8zHRD5BojdZV4rYT4x+dHszTAk3MSHnkP/GcxhpI3l1tJXeQdbnILOjF4aAV9o5DPGHK
         SD+KQGsEh+5pSmuKX5alYj7Cw781URNjaJWcVUU+DI/Yy6y0WAhYUXfJYaK3AVUv/r/E
         /HhQ==
X-Forwarded-Encrypted: i=1; AL+hErEc5UAO/PgGJBU7+mj8eFqp4/gzUxnZpp55YHpG3jRIN/MLFrPyG4jQDHhAAIAugfYd3Ztw2r+yoB62lhwyOQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2Dfg4CA43vkR4Qs4vhSRrR9SHaQ/JOPChTgp1balEsAOVBo7n
	HF+YOx8A/fiBYdiodQmKPtQQjMdGj8rOgcxn9Bhc+fUtKpZNgsMuB0ihViI89YF7aRibNRGLvxK
	IO0CkeRCG2nRUiWJhITIi4Auq9FVNja4=
X-Gm-Gg: AZFdTZcxwa5/YyjKsMjmN78WjXhOtOmH+DChZ46hkd3VeYl9XcPOL1URxWT5MNqeqlo
	NuYIVTgzwCBJF8DSFDlNZGaYk9bbHKWJ6t5E2SoQUlYWYwBvjjrernSoNoD3t5H+pIToqNPogZb
	1CGBeevyYDt3DgFMObbJBn9OPi21A/jChtGvf5vXZ9AAUEDSd4u21c+iEe8OQWBrBxXrDIa+21P
	5AoOA7iFwwXnepiNbnyEeAUhusST2lNzyWoKNUDTVfmp4nIMsjpBBI1DXnjUpDDFH0drt9//H6o
	DIVRihmUXcgksdI9n0W85RR3bf5i6AMoylzc+FmGj7XYHGJINdN+IgEUjy4NcSXebTl0I5nwkcF
	bG3tH6KJ/mwBPLtff9nCB2VxTm3mEityQW4ajxlXVfxfc8NWSUvHH8PWMJAXvXMotu7xR4igKkR
	HmLDtP01BPVzB+z/j5acuE5uRttPRsLGduM/O+m2XOs1puwMEakGnaIoAN
X-Received: by 2002:a05:6820:740b:b0:71a:ff98:1734 with SMTP id
 006d021491bc7-71b395674efmr12396945eaf.45.1795599643823; Wed, 25 Nov 2026
 01:40:43 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com> <20261124.215747.1090155063373507910.tomo@flapping.org>
In-Reply-To: <20261124.215747.1090155063373507910.tomo@flapping.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Wed, 25 Nov 2026 18:40:32 +0900
X-Gm-Features: Aa3M54pIN7Z7-kOVJu80h62SthWObgtP2wcxlpS5G_JuF9aGWICvZzW1W-c0JhI
Message-ID: <CAGAB666qnAjFnf41PQmG5kWWSb+Au01OgspPhvREotLGXTYwXQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] rust: net: phy: suspend may run without phy_device->lock
To: FUJITA Tomonori <tomo@flapping.org>
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com, tmgross@umich.edu, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 21:57:47 +0900 (JST), FUJITA Tomonori wrote:
>
> On Tue, 17 Nov 2026 19:36:18 +0900
> SeungJong Ha <engineer.jjhama@gmail.com> wrote:
>
> > Patch 1 drops `read_mmd`, `write_mmd` and `match_phy_device`, which make
> > the same claim but are called under other conditions, and have no users.
> > Patch 2 makes `Device` generic over a lock context and documents when
> > the `Locked` callbacks run without the lock, and patch 3 gives `suspend`
> > the `MaybeLocked` one.
>
> Can we use &Device and &mut Device instead of the new context types?
[...]

Yes, that is simpler. I will do that in v4. Two things to check first:

- genphy_soft_reset() reads autoneg and writes suspended, so I would keep
  it on &mut self. soft_reset gets &mut Device, and the SAFETY comment
  says that the phy_mii_ioctl() path is outside the guarantee.

- read() and write() take the MDIO bus lock, and &Device cannot say
  more than that the phy_device->lock state is off limits.

  In read_mmd and write_mmd the bus lock is already held, so they
  deadlock. A test driver whose read_mmd calls dev.read() hangs as soon
  as the PHY binds, and lockdep reports recursive locking on
  bus->mdio_lock. The path is phy_probe() -> genphy_read_abilities() ->
  genphy_c45_read_eee_abilities() -> phy_read_mmd().

  In match_phy_device they reach a device that may be bound to another
  driver, which the netdev AI review pointed out on v1  [1].

  Do you still want to keep these callbacks with &Device and document
  this, or wait until they can get accessors that fit their context?

Best regards,
SeungJong

[1] https://lore.kernel.org/r/179454612500.2199510.688554972467066283@kernel.org
