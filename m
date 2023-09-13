Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5229CA
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 21:05:34 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40D31BCA
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=47SUtMWrb91T6Eyixlk2C4V0seEqLWNqmxhyKqH254s=; b=4VQUeDiAK6GN2byueJmYL4DPwc
	ZgQYG8D5WjDAmpIBoQEKFpTxQuljUYrUOIX92WDs3fRNqUQLTJEfukLQ8IJUTeQvuiLWb5B46OVHc
	KsjLhglSu+vtCFlsn9W5o70yO9wH0QPxTXjXxvoDHB07iCPoF4ALB4TYRXRoW4E121pY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgX3D-006LEA-TI; Wed, 13 Sep 2023 23:05:31 +0200
Date: Wed, 13 Sep 2023 23:05:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <0a986803-e02d-4f7a-8938-fab89af6a655@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <ZQIgbA2J46+B37ar@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQIgbA2J46+B37ar@boqun-archlinux>

> > > +impl Device {
> > > +    /// Creates a new [`Device`] instance from a raw pointer.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> > > +    /// may read or write to the `phy_device` object.
> > 
> > Well that is untrue. phylib passes phydev to the MAC driver, in its
> 
> Note that a "# Safety" section before an unsafe function is the "safety
> requirement", i.e. the things that callers must obey the requirement in
> order to call these unsafe functions.

So by lifetime, it means while it is inside this function?

> > > +    /// Executes software reset the PHY via BMCR_RESET bit.
> > > +    pub fn soft_reset(&mut self) -> Result {
> > 
> > I suggest you keep to the genphy_ naming if possible, to make it clear
> > this is using a generic PHY method.
> > 
> 
> My opinion may not matter, but this function is actually
> 
> 	net::phy::Device::soft_reset()
> 
> , so it could be a step backwards if we use a prefix in a language that
> support namespace ;-) But I'll leave it the people who will read the
> code day-to-day.

So a bit of background. IEEE 802.3 defines how a well behaved PHY
should work. We have a number of helper functions based on that
specification, all starting with the prefix genphy_. We expect PHY
drivers to use these helpers where possible. It helps reviewing driver
submissions, in that if we see genphy_foo we know it is good quality
core code. If it is not genphy_foo, we need to review it closely.

When reviewing a Rust PHY driver, i want the same hint. This is a
wrapper around a trusted genphy_foo C function, so i don't need to
look too closely at it.

> Agreed, these functions have no users. Also the wrappers doesn't reflect
> the lock requirements, at least not in comments, after a quick look, I
> suppose all the functions should be under phy_device->lock?

The core will take that locking before calling into the driver. So the
driver never should need to touch phydev->lock. It is one of those
rules of thumb:

	Driver writers often don't understand locking, so try to
	ensure the core does all the locking, not the driver.

     Andrew
