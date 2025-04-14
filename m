Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB226383A5
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 19:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744659997; cv=none; b=HO+608g+vxdU4XOfEfwvwnJnc7XgySkVVPk6cBSHHM0Oq38syrTl93D4ABzn50BjCgRE8kgvyz3Pn+gseP59dRupOQWrF1pwXEpbZnc3RXHuiJP8uCvlKpjsFEsgvQH/Te1RO0CJhI9RxdwpPzjtTNecNxF3heo+Nil4JVJLf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744659997; c=relaxed/simple;
	bh=ddcpbS6JQHBZC7WMfaUVWYqQ1oEDcOGhALk9cUjhz6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4y/syfEUHcpN5p3uK2yIw/2fso/Pu24w3q5bdsQ/3xp4xTmKSMTFdlzBMSybgBaAO3W1o2d7MjNF9QQccyFRAqbXPzB04WsQgwQrtdjP5vCrBv7VEqWr3+uBpEILaUm3kMuOTg46gCGYT/DGkQH1DcKNAEUSxKlaNTgedi4hjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=OKFNLW+v; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OKFNLW+v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2//YI37gCwEJnWo7XbAl9+oojJRWv9moUx4jBN5YgjE=; b=OKFNLW+vkmj6v9qjccZiLLFMgf
	ahhqabsAexbgPEievMAp9Hu/1LCpC1eJCrvYcapZJvKAVKbq47kpKcGUPtoeVAd0f+B2O60t6M0FK
	vRCeXSSLjN27fF0SWa0Fr7QXxvTRBQ/eWQZ+r8/2cTozGUM6uf5h8zSAov6dB70FFoQQgd0pJMkDp
	VLUkjb7I+OtCnnVoceHzb4ap14cVVacy0ymoS79Q6Ja0QLZTX8lr2N20OZGPo9zACJKER8PgVHpRl
	wg9Y4HvnR8OkeUdXKL8yRGr8fCD41PwCH+zWee/P6SRhyGDDUdpCxo/p55rkGgBTKYvQX62WyxCVC
	Lnoe67Vg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56924)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4PlE-00072D-1b;
	Mon, 14 Apr 2025 20:46:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4PlB-00081U-0U;
	Mon, 14 Apr 2025 20:46:25 +0100
Date: Mon, 14 Apr 2025 20:46:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
Message-ID: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
 <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
> Hi Miguel,
> 
> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
> > Hi Jocelyn, Christian,
> > 
> > I started build-testing arm 32-bit within my other usual routine
> > tests, and I hit:
> > 
> >     ld.lld: error: undefined symbol: __aeabi_uldivmod
> >     >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
> >     >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
> > as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
> > 
> > which comes from both these `u64` by `u64`:
> > 
> >     let out = (self.carry / pow) as u16;
> >     self.carry = self.carry % pow;
> > 
> > Christian: I guess we can offer a set of `div64` functions using the C
> > ones, at least for the time being, and eventually wire the actual
> > operator with some support from upstream Rust. Or do you have
> > something else in mind? (i.e. I think you have been discussing
> > intrinsics lately)
> 
> I think using the C implementations is fine. Not sure how much the
> FFI is going to matter for performance, but it should be rare enough
> that is shouldn't matter (and hopefully we will get cross lang LTO 
> or something similar at some point).
> 
> We could also just implement the intrinsic(s) ourselves, but then 
> the u64 divisions would be implicit which is probably undesired.
> We could also rename the intrinsics so they are only usable from 
> specific crates. 
> 
> I think we need the opinion of the some arm people here.
> 
> CC Russell King and Linus Walleij.

The kernel has had the general position that u64 by u64 division is
silly and isn't supported. Several 32-bit architectures including
32-bit ARM don't support it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
