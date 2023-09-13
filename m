Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D3520EF
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 18:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E00C433C8;
	Wed, 13 Sep 2023 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694631576;
	bh=eCNZCjO/qiV/fAe/r/C+RACjiL+AIzl7FqrZWsAnHAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBCNpcEaMugl1MUAm2p2K4KsQN2CNXA/fxziL94nV281UBnEaOKH49XPgbe0w6/oy
	 lnSVT5HqaJvbCcbZ5gy8o3QXEGUl3425eYTi/ABd50u/GubLhBW8JQj0NW0VF1oXRC
	 UdNPv7mYVmboXxv30aW2HnoCHvgcTK8g/URQ+DKM=
Date: Wed, 13 Sep 2023 20:59:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <2023091349-hazelnut-espionage-4f2b@gregkh>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
 <894554e5-fed7-456a-a214-efd01f43958b@lunn.ch>
 <2023091353-handclasp-charter-e30a@gregkh>
 <3e858fa9-c498-48b6-8376-99e4db10d846@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e858fa9-c498-48b6-8376-99e4db10d846@lunn.ch>

On Wed, Sep 13, 2023 at 08:50:18PM +0200, Andrew Lunn wrote:
> On Wed, Sep 13, 2023 at 06:53:33PM +0200, Greg KH wrote:
> > On Wed, Sep 13, 2023 at 04:11:00PM +0200, Andrew Lunn wrote:
> > > On Wed, Sep 13, 2023 at 10:36:09PM +0900, FUJITA Tomonori wrote:
> > > > This is the simpler version of drivers/net/phy/ax88796b.c. The C
> > > > driver implements three PHY drivers but this implements only one,
> > > > AX88772A PHY. This provides educational information for Rust
> > > > abstractions for network PHY drivers.
> > > 
> > > Rather than being a sample, please make it a real driver. Place it in
> > > drivers/net/phy, add a Kconfig option to select it. Maybe drop the
> > > rust_ prefix, since the .rs makes it clear what sort of file it is.
> > 
> > But note, we can not have duplicate drivers for the same hardware, so
> > the .c file needs to have the support for this device removed from it,
> > OR you need to add support for the other devices to this driver and then
> > the .c file can be removed.
> 
> I would suggest these Rust drivers support all the devices the C
> driver does, and there is some kconfig logic to make them mutually
> exclusive.

No, don't do that, it's horrid and we have been down that road in the
past and we don't want to do it again.  One driver per device please.

thanks,

greg k-h
