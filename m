Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C67E4C7B
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 15:46:44 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C792128
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pNeCSeuC6UeEf1UGnifu+36Bfm5GQL/wN1CEf8WHi+M=; b=YXBOY/Ykvs0J1CD8olt9EKFR/g
	DpsTIkTwvQjZUDkOGk5mqEo73WO6LF67MUn7NpUV3/qP5UZEJbGoc3QoLl+ryMMz/sgV+ABdqgLrZ
	IbIciJxGoMnAC+mKKq2isupYuv6loNGeFSaEgrqf1SQ5JO92wpOC4RVPGP51hQqnhYEY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qhtyp-006hb7-Ka; Sun, 17 Sep 2023 17:46:39 +0200
Date: Sun, 17 Sep 2023 17:46:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
 <52517bd0-66fe-4275-bef1-afabc906e836@lunn.ch>
 <20230917.202804.2074374258417179605.ubuntu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917.202804.2074374258417179605.ubuntu@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> >> +    fn read_status(dev: &mut phy::Device) -> Result {
> >> +        dev.update_link()?;
> >> +        if !dev.link() {
> >> +            return Ok(());
> >> +        }
> >> +        let ret = dev.read(MII_BMCR)?;
> >> +
> >> +        if ret as u32 & BMCR_SPEED100 != 0 {
> > 
> > PHY registers are u16. phy_read() returns an int, so it can have
> > negative return codes. But if it is not negative, the positive values
> > are in the range of 0 to 65535.
> 
> A negative is an error?

phy_read() can return values like -ETIMEDOUT, -ENODEV, -EIO etc to
indicate something when wrong. So you should see the general pattern
of:

        foo = phy_read(phydev, MII_M1111_PHY_EXT_SR);
        if (foo < 0)
                return foo;

After probe, the probability of an error is very low, and generally
there is no recovery. So not all drivers do check the return value.

There is also a second C problem here. Because a PHY register is a
u16, you sometimes see code like:

	u16 reg

	reg = phy_read(phydev, MII_M1111_PHY_EXT_SR);
	if (reg < 0)
		return reg;

which compiles cleanly, but is wrong.. The folks running static
checkers then report the bug.

> If so, this function should be:
> 
> fn read_status(dev: &mut phy::Device) -> Result<u16>

No, it needs to return the negative error code, or 0 on success. This
is a very typical pattern in Linux.

> 
> >> +    fn suspend(dev: &mut phy::Device) -> Result {
> >> +        dev.suspend()
> >> +    }
> >> +
> >> +    fn resume(dev: &mut phy::Device) -> Result {
> >> +        dev.resume()
> >> +    }
> > 
> > Can we avoid this boilerplate? A lot of phy drivers will make use of
> > genphy_foo calls in their struct phy_driver. It would be annoying if
> > each driver needs silly little wrappers like this.
> 
> you meant that C style like
> 
> {
>         .suspend        = genphy_suspend,
>         .resume         = genphy_resume,
>         .soft_reset     = asix_soft_reset,
> }
> 
> is clear than Rust style
> 
>     fn suspend(dev: &mut phy::Device) -> Result {
>         dev.genphy_suspend()
>     }
> 
>     fn resume(dev: &mut phy::Device) -> Result {
>         dev.genphy_resume()
>     }
> 
> right?

Yes. If you really must have these wrappers, they are not specific to
a driver, so should be placed somewhere common where any driver can
use them. There are around 60 of these genphy_ functions. Because what
a PHY does is mostly standardised in IEEE 802.3, PHY drivers heavily
use these functions to do the core of the work, and then deal with
vendor extensions and vendor bugs.

    Andrew
