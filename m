Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408324;
	b=HIIaZZI6vJdGuCxhO2CShUi60I8HpHX8hxtyFnHIYHCods05CNZa+ewAwITZv+zwTItc
	 Vtl0QLHuvjs8muxd8tUhOON8dV5h8fMyOeI1thWmN/kTHQjHwYZGdfvBiOD2LpShc/QOi
	 yQ/nrKh/JfXjeZDvEwxZNe3vGDGWTswYhZEslIr+jaryb80krWBWuILthDr4wzzvoUsae
	 gn9DyG+I1GNzaUwp60iUUx/Y0Alpa3D97UjZpUhocVbKEEpYYvk1Ukh3Le+U68+BkNI33
	 nscRIRYsU7RMzjl7orgVXpAqq5FUB0CJWnfpCOKtDMxFS+7zGIJAgvVCLx0Uba6cRuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408324;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=qg/kJeOBkORTxeX5fcxRClbAV/v8KBYiSMusiaVJKno=;
	b=y6oKa55NXbXFYQU6Pk4MkSjjjXU7pU69PlgTTMzzxIJeB33RXnBBiAJj0mJYVPaTvGV6
	 gCxz/CPgxGPAH99R59j2lAcJZXmcr9uZv2ryeA/VSI+p/9LsgchONZr/Ks8ZIxByv6FKn
	 Khjvm0E13xygA1MN3gzebAbi5U7Wc99IJXhEqcXDIXhmSop2CqYdPZE2LhZAyvEgxSEWf
	 JEzWz2PPZZ/3BUCeF/JiZHncYWnhDbLcJdT6GDHEH6owk3+ZUTomD5Gys0nimXYe6wi6P
	 4mQQ02xEYm0O/3kAKPEN2NXXLq9cAYEvaob8K6RzOmwVItE/x0DEaBSygbW1wz0w6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WOttlwxa;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC4606A31A;
	Mon, 23 Nov 2026 04:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EC4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WOttlwxa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=qg/kJeOBkORTxeX5fcxRClbAV/v8KBYiSMusiaVJKno=; b=WO
	ttlwxav6/WRXMtpDRzgT7DlGf6XYq4BfMZE2fARkj7uTlyMCHvNM2lAq/o0iO9ZtSG/9tUT95Q1lI
	6fOikqF/7kAhtx2XfSf8a2TRSLMxUdF4NoRaixYKtkDHktRRaLrJ02irL87ohOUH1Wn7FGWkogCoM
	0gRYobqS3YuVTwo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVLiE-000h2b-7O; Mon, 23 Nov 2026 05:31:30 +0100
Date: Mon, 23 Nov 2026 05:31:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: SeungJong Ha <engineer.jjhama@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, fujita.tomonori@gmail.com,
	tmgross@umich.edu, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com,
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/3] rust: net: phy: make Device generic over
 a lock context
Message-ID: <bfd7a44f-2bba-4aee-9758-1dd88f94566f@lunn.ch>
References: <20261117-exp-phy-rs-maybelocked-v3-2-4e183a7366a7@gmail.com>
 <179513866237.3136.3197734576083995986@kernel.org>
 <CAGAB667HcHxS-XboSz559SG3tT-RhVmZKt5McWoez8iwuUGq5A@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGAB667HcHxS-XboSz559SG3tT-RhVmZKt5McWoez8iwuUGq5A@mail.gmail.com>

On Mon, Nov 23, 2026 at 12:11:55PM +0900, SeungJong Ha wrote:
> 2026년 11월 20일 (금) 오전 10:37, <netdev-bot+sashiko@kernel.org>님이 작성:
> 
> 
> > [Severity: Medium]
> >
> > Does this SAFETY comment justify the from_raw() call?
> >
> > The new Locked invariant says that no other thread accesses the
> > lock-protected phy_device state for the lifetime of a &mut Device<Locked>.
> > from_raw() now also requires the caller to be in the Ctx context.
> >
> > However, this comment and the Locked docs above both say that
> > phy_mii_ioctl() reaches this callback without phydev->lock while the
> > state machine may be running.
> [...]
> > Would one of these work instead?
> >
> > - take phydev->lock around phy_init_hw() in phy_mii_ioctl()
> > - weaken the Locked invariant and drop the accessors that rely on it
> > - give soft_reset a context that does not claim exclusive access
> 
> This is why the Locked docs list these exceptions. Taking phydev->lock
> around phy_init_hw() in phy_mii_ioctl() does not look safe as is:
> vsc85xx_config_init() takes the lock itself through vsc85xx_mac_if_set(),
> so it would deadlock. Fixing that race belongs in phy_mii_ioctl() and
> seems separate from this patch.

phy_mii_ioctl() is meant to be a foot gun, bad things are expected to
happen if you use it. 

/**
 * phy_mii_ioctl - generic PHY MII ioctl interface
 * @phydev: the phy_device struct
 * @ifr: &struct ifreq for socket ioctl's
 * @cmd: ioctl cmd to execute
 *
 * Note that this function is currently incompatible with the
 * PHYCONTROL layer.  It changes registers without regard to
 * current state.  Use at own risk.
 */

I would not spend any time on this.

  Andrew
