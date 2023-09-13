Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919C1A70D
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 16:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD17C433C8;
	Wed, 13 Sep 2023 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694624016;
	bh=gDQkBzZMh19JPnF7yqRQKxQUAWBrAA4Df5vx3e1A/LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wx4eVwZ2kDHyFwIfZgzfmRAekEQV3FNQIn1jWy/mSzffIvShudsSD+nyWBelLn8OA
	 wMLFsg9qUOp77/aIDCX4UJ/5ycU3htoubZueBQStYZbIKkUOPoHkVCZh2tMOAd2BPh
	 b3BtcaN87XK3bi78V0bcesMQcwDciE8IluZryw7I=
Date: Wed, 13 Sep 2023 18:53:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <2023091353-handclasp-charter-e30a@gregkh>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
 <894554e5-fed7-456a-a214-efd01f43958b@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <894554e5-fed7-456a-a214-efd01f43958b@lunn.ch>

On Wed, Sep 13, 2023 at 04:11:00PM +0200, Andrew Lunn wrote:
> On Wed, Sep 13, 2023 at 10:36:09PM +0900, FUJITA Tomonori wrote:
> > This is the simpler version of drivers/net/phy/ax88796b.c. The C
> > driver implements three PHY drivers but this implements only one,
> > AX88772A PHY. This provides educational information for Rust
> > abstractions for network PHY drivers.
> 
> Rather than being a sample, please make it a real driver. Place it in
> drivers/net/phy, add a Kconfig option to select it. Maybe drop the
> rust_ prefix, since the .rs makes it clear what sort of file it is.

But note, we can not have duplicate drivers for the same hardware, so
the .c file needs to have the support for this device removed from it,
OR you need to add support for the other devices to this driver and then
the .c file can be removed.

thanks,

greg k-h
