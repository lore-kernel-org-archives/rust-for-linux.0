Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648325;
	b=dQUHBvKnHJx1p6sT6zZekX6vdL6AuLdNpH2KacKNP0WT0Q7MCPZfVVLXcOrOM9Iu6RQc
	 soBxjWRllUrNjADnrVhyJQD5JcHkRnaHANcjrk+YW8WEcsoAVkk1scB9of5Mp/npQMhw5
	 sm0nWBS7SWlkfJhzveBTupLVYEWjHiQUq6ctzNRcAoOKhAIzDx6j8jb7ZlT6dOCCerXOI
	 eq8zBQz8opGgnATqFf2JmBTckr2qhVd14zCYcMErsAE9aleS/0ZsiaV7K/iBx3qsJVONn
	 qYarsx5lktaDLMKcrgzrnTRKXBhAPA2QU8V3gaigPMxvq4UCBjCwpNAS3gA8hrqMYeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648325;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=pGLjl7j/SBb86fKn90UOENSPBdsbSFo/tf5AbXyjbKY=;
	b=4t7sfKR4OB3sdiEi9daXuS6WqD5wqYq9jrcLnWNII88u7avRx2L37jm3QuXifIRctf9J
	 tKgUxDiN5y+5XwuZE0llTF7QnpzawGp3xAZfeaeN+hCRrsAAShl0gomz140/yaSg4vNCu
	 Pl1y+cI1xxXG2t5ZSqP+F/4i2ke//ioSJmBtUdFbRuf1dwx7p9XtkJSwc7x3rv4fh5N+v
	 tfFdjw/9PXqiNEaBFECAAjJQEMLTqTJia0d6K3sfhheHP2o4rEbQyeNBI/Pq04neL5QXw
	 yCgD1whUp9rrx5HvnpINkIAQIElq61N3nUiPHoxHyQHRx1zmPow2Lgz3yufv2eNTh8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=Ytdfc3Wt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=e4eXdFW6;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBA5606A330
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 23:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CBA5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=Ytdfc3Wt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=e4eXdFW6
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0DD8A1400418
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 18:12:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 25 Nov 2026 18:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795648323;
	 x=1795734723; bh=pGLjl7j/SBb86fKn90UOENSPBdsbSFo/tf5AbXyjbKY=; b=
	Ytdfc3WtKqM3C5b4lUGW2YbjQf1+OfaJ0u8pdNl0dNeadsL5F1xjjc9tWXfY2lEc
	km/kE9pXJNEkxn/Tjbz+PiA7xpQsCrqjgpYm4AE0lWLHJWapC1PJGbl4mpcS9z6d
	/GTIWoqyDA2Lj9KPYrRboDPv2zhVP+51nkfxcw8+LYqr/s4M0FrfYXdEdg4Lq6WC
	jzkVHTh13OMVUkchDodquoC5HKbbsDizIYK31kC6YEJcJ7AQbI5wqNM+zaXp524u
	4GWPKeYQO48mw3U4rAi8cMML/Dc8a5dN6/lLu+EodJP4bADnqxocYJ/+VV4rHNkg
	dk1dOR/7MBbnIehjdrN7gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795648323; x=
	1795734723; bh=pGLjl7j/SBb86fKn90UOENSPBdsbSFo/tf5AbXyjbKY=; b=e
	4eXdFW6xBQhKs2prfeNS2EkUICB10Yw85aRhKBIpfRCGP1u6atV+0jwCoZdulzPU
	bgo16KIMQiqdY12RuJKXxC8TtZfgw6a4RYkwgKB8pki4h0ErZLHcZId0OWrhBb3q
	HA+eyPmaStFojOjEgXgH2XRG9Utjz0xZEerafZvYOgrUgNjJoQp8UMW+5pkR09Nr
	GFLi1k4cfF0BfWhL4vECPSFohMPilahfCy8b5Kv29sJjEAprbJKhE/z9vXp6BP9S
	rStjAT9xyCkX/SGT/RhpiaOaNqtJCxrwqjPXFmcI2i9lErWsokGgJibWCDBqtZXC
	Lszp/ywXsx19zz0hte3Yw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795648323; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:cPFtnJOjVgatvwF8ZVXE4uN46y9T0mDxnEveaQ27InHFyeh
	6HW8VA/8IorwljStjfDbQbsj0ZydR9dsOzdI9MJw3XlXjUDumgPvM222h9/7O8IE
	MdvisXxQrViCPfLQ4F4kNhwC/l1ypeA5gBJ2zTovco7n3adRj9VHQiaoABeyUuGt
	64am8kZSgZgkwFe1ksRn8vJU0Sf6fjiO/B+mnKyajXqAJa+nu+VcX2TS6Ue/qzSp
	CymgsetmTvHOqjS4PTyyDlz31zfPHgtJmie1a/3aISmbwZMYEOOcIVCH2RObZoOr
	5rvQtc90RoyhhcSGOdwL7ZfFE4HtDrXcm4v+LWA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:YUnLiMJtabnPyfBRjXF0Cp1S+S2sLQWyc7v33qlqgzw=:ReMT3etTEGHzj3x1XVKD+IW7FqMajtWZnVyCfA5+voA=;
X-ME-Sender: <xms:Q2sHa6R4fkkPsyqwQyMpSC0tdGunAaSfNvgcaNC7lnreqMsyMqRKkA>
    <xme:Q2sHa4JOscRJpAcVpNn_7PUR1EXltoAn9SJpOr8iYHyak6kbUPNHWB-tYrytlBLU1
    mLi6AQfHf8AuEI_m5IH4gwSun-9PHoPijuqp47-Bquu9tAbjE9N2ig>
X-ME-Received: <xmr:Q2sHa6CRo1IoqWZUEwP0oVnuaJBYn9NT5WVlMIXsSIBYVazKS223WS3O22605trJCa8-HYMmxaN5xfho4iiMDQKG>
X-ME-Proxy-Cause: dmFkZTFkdInJTRfS+07fsGcPolMb2Cn0DmAYTwufftzh15xMEvIviqE5Az8VlMNthE41Tv
    CDBikO5ZSU3s4zorfxRrVfgA2m/33BP/X9x69o1mmF4/Cep7E82M+yClHJGkSkXw0UPeSO
    9lLz0ig9ySbRVyvDJKiqERxamf5Lr04BM4vd1doEoNbmEXbcoIA0FRkKkKWZgL4DKd3kVb
    ud633an5FXbXou+pDgBPgOZaQbmLOBSTCO0UclFMp1H7KZuThiFEtl9sN7pnh+TqHT1VFJ
    oBZ0st44s8HFCZts8DydMt+R8eGVdnJjIlBGX744qFC9MuPqJmnq0feyV+fqe3f7+i2ybZ
    cF62s6le3Tn67GCXyJ/qC4U/KbdX+Xu0L8olXN0FhjymrOxgOrThlwynWv6fxkfKNxWmzO
    aCRBtgeff6j/IzYRzobCm41UhNwKceijc5UdNDw31YB63OK0kA1mqvLOAKQJ76axrIW5Z3
    WDPIsmvL9xSWlgrRfn6GnR+8AfWIDZVdopeyfcC0Dm5rVUrR5jI/IZilxUeIrzXvt+XH0y
    XVwzRgp3mx6DuuvRMNkZiUKInLIwiQIQA0DkxCTkqinmqqb4Us9+c/yIa/REewoFFjTr8e
    tAnK83BWTpb8a+JiXbXkzUyCojqlN7FTBC3EVCunBTuL5Z3M/C03BRyMm/lQ
X-ME-Proxy: <xmx:Q2sHa93yWBVLDCrQxSbcU2ys8aJzWrUZ4mTEe4lSw9L4VStF4-0t9w>
    <xmx:Q2sHa1lfn9SyO8xYhcz2VZdtbav0EZuz2defxC8VzqloJf85A2c5vg>
    <xmx:Q2sHayfuoA_wt79TrDiF8dAPBIbZRaNl0vMlICez1IZlEnviUze7gg>
    <xmx:Q2sHa6UaYj8OOtyUyxni-isA47DMnT5MrXvlqyyfeYKzP5SHKGkkhw>
    <xmx:Q2sHa3DQc5is8KUEA8BR_tUK4tHCn-B0bcQW6o8X4GX-HUBsGK3ZIMpl>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 18:11:57 -0500 (EST)
Date: Thu, 26 Nov 2026 08:11:55 +0900 (JST)
Message-Id: <20261126.081155.1605990248496749195.tomo@flapping.org>
To: engineer.jjhama@gmail.com
Cc: tomo@flapping.org, andrew@lunn.ch, fujita.tomonori@gmail.com,
 tmgross@umich.edu, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/3] rust: net: phy: suspend may run
 without phy_device->lock
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CAGAB666qnAjFnf41PQmG5kWWSb+Au01OgspPhvREotLGXTYwXQ@mail.gmail.com>
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
	<20261124.215747.1090155063373507910.tomo@flapping.org>
	<CAGAB666qnAjFnf41PQmG5kWWSb+Au01OgspPhvREotLGXTYwXQ@mail.gmail.com>
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

On Wed, 25 Nov 2026 18:40:32 +0900
SeungJong Ha <engineer.jjhama@gmail.com> wrote:

> On Tue, 24 Nov 2026 21:57:47 +0900 (JST), FUJITA Tomonori wrote:
>>
>> On Tue, 17 Nov 2026 19:36:18 +0900
>> SeungJong Ha <engineer.jjhama@gmail.com> wrote:
>>
>> > Patch 1 drops `read_mmd`, `write_mmd` and `match_phy_device`, which make
>> > the same claim but are called under other conditions, and have no users.
>> > Patch 2 makes `Device` generic over a lock context and documents when
>> > the `Locked` callbacks run without the lock, and patch 3 gives `suspend`
>> > the `MaybeLocked` one.
>>
>> Can we use &Device and &mut Device instead of the new context types?
> [...]
> 
> Yes, that is simpler. I will do that in v4. Two things to check first:
> 
> - genphy_soft_reset() reads autoneg and writes suspended, so I would keep
>   it on &mut self. soft_reset gets &mut Device, and the SAFETY comment
>   says that the phy_mii_ioctl() path is outside the guarantee.

Agreed.

> - read() and write() take the MDIO bus lock, and &Device cannot say
>   more than that the phy_device->lock state is off limits.
> 
>   In read_mmd and write_mmd the bus lock is already held, so they
>   deadlock. A test driver whose read_mmd calls dev.read() hangs as soon
>   as the PHY binds, and lockdep reports recursive locking on
>   bus->mdio_lock. The path is phy_probe() -> genphy_read_abilities() ->
>   genphy_c45_read_eee_abilities() -> phy_read_mmd().
> 
>   In match_phy_device they reach a device that may be bound to another
>   driver, which the netdev AI review pointed out on v1  [1].
> 
>   Do you still want to keep these callbacks with &Device and document
>   this, or wait until they can get accessors that fit their context?

Yes, please keep them with &Device and document it. The deadlock is not
a soundness problem. I will add accessors for the bus-locked context,
with a guard or a context type, as a follow-up.

For match_phy_device, &Device fixes both problems in [1]: read_paged()
needs &mut self, and read_mmd no longer gets &mut Device.

> [1] https://lore.kernel.org/r/179454612500.2199510.688554972467066283@kernel.org
