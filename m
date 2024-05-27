Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8897179A8
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716847071; cv=none; b=WxcOwFs9HRmGzdS52pFHRRwbVc9cjlgVgHzeGBZYLzHc+scQXC6CPli3EhBWX+atAZMQGsv6VHs3z7+gwm1FrGNXbOlZ0hUbDNH5EPI5gHtgetJdb4O3+aAiNdlfMSqTjvrTPu15+n6s76XdXf7D2LBKK6gc9jDSF71yG3s0hIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716847071; c=relaxed/simple;
	bh=BpDiOAFRIbV+nsYptbnDjAg3QeGlW79mp37fxNyc7Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRlFrHI2e1CChVjZeUoKc530HkmuYVuflXnfjLPTHNHc9sm54COp4rQFyiixZzYX7j20RaRPdvk/lSEBUClnmR8v1MJ/Rii1caUAsnELMqTCoddnVoK2urtklHAxqrldwQ7SROGs49uskdABK9+LgQNbOLXvj2xqt3KrGaeoI9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lkHlNG7a; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lkHlNG7a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h/ewEYuBp/E1lbaF5MZLYdXyQ6z1F+zzuVdjTeIfnfk=; b=lkHlNG7adWjVkY9/+ZX27CUDsv
	jiQctWJ0zGIvkitwYQz8yn7UwfAbCIeHkUCMfBT8b9ciryhrYlqZpPgFX+rFH9AqlXvafng7WxRuQ
	p/QEU1jZQcwfXZwJYRmiuLeebCFAX+qYw0BSNyl90V/o62V/iyMw6G91AHCHCWWQlmKI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sBiLZ-00G6ir-2W; Mon, 27 May 2024 23:57:37 +0200
Date: Mon, 27 May 2024 23:57:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: benno.lossin@proton.me, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
Message-ID: <8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
References: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>

> +/// Accesses to C22 registers.
> +#[derive(Clone, Copy)]
> +pub enum RegC22 {
> +    /// Basic mode control.
> +    Bmcr = uapi::MII_BMCR as isize,
> +    /// Basic mode status.
> +    Bmsr = uapi::MII_BMSR as isize,
> +    /// PHY identifier 1.
> +    PhysId1 = uapi::MII_PHYSID1 as isize,
> +    /// PHY identifier 2.
> +    PhysId2 = uapi::MII_PHYSID2 as isize,
> +    /// Auto-negotiation advertisement.
> +    Advertise = uapi::MII_ADVERTISE as isize,
> +    /// Auto-negotiation link partner base page ability.
> +    Lpa = uapi::MII_LPA as isize,
> +    /// Auto-negotiation expansion.
> +    Expansion = uapi::MII_EXPANSION as isize,
> +    /// 1000BASE-T control.
> +    Ctrl1000 = uapi::MII_CTRL1000 as isize,
> +    /// 1000BASE-T status.
> +    Stat1000 = uapi::MII_STAT1000 as isize,
> +    /// MMD access control.
> +    MmdCtrl = uapi::MII_MMD_CTRL as isize,
> +    /// MMD access data.
> +    MmdData = uapi::MII_MMD_DATA as isize,
> +    /// Extended status.
> +    Estatus = uapi::MII_ESTATUS as isize,
> +    /// Disconnect counter.

> +    Dcounter = uapi::MII_DCOUNTER as isize,
> +    /// False carrier sense counter.
> +    Fcscounter = uapi::MII_FCSCOUNTER as isize,
> +    /// N-way auto-negotiation test.
> +    Nwaytest = uapi::MII_NWAYTEST as isize,
> +    /// Receive error counter.
> +    Rerrcounter = uapi::MII_RERRCOUNTER as isize,
> +    /// Silicon revision.
> +    Srervision = uapi::MII_SREVISION as isize,
> +    /// Reserved.
> +    Resv1 = uapi::MII_RESV1 as isize,
> +    /// Lpback, rx, bypass error.
> +    Lbrerror = uapi::MII_LBRERROR as isize,
> +    /// PHY address.
> +    Phyaddr = uapi::MII_PHYADDR as isize,
> +    /// Reserved.
> +    Resv2 = uapi::MII_RESV2 as isize,
> +    /// TPI status for 10Mbps.
> +    TpiStatus = uapi::MII_TPISTATUS as isize,
> +    /// Network interface configuration.
> +    Nconfig = uapi::MII_NCONFIG as isize,

802.3 C22 defines 16 through 31 as vendor specific. Most of the
#defines appear to come from the S390 driver. We probably should not
add them in the Rust API when there meaning is not clearly
defined. However, a driver should be able to use them, e.g, by
defining their own vendor specific name to a given value.

	 Andrew
