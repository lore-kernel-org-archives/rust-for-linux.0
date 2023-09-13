Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6234E558
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 19:15:56 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9224170F
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NP6uj/DpN3vnaNBnBkEQ7uyPm6NC8qxLBpkSBPUG/gk=; b=d4cqdByutqXGlzy3DlvS8sYpaQ
	kzKEWTya6SZV7ny3JgSh6UsQOknrn5xj4c7Hh/ziMqe/lYMnI8/8zEErUDU7Y9XEbwvALDBYn/qvB
	ZCIngOybA2enGpzpAlkytRm8qIm8va5rwVA9VHOXaazuTUvY2OoGZ9NF4uLZotRNo3A8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgVL7-006Ktg-KD; Wed, 13 Sep 2023 21:15:53 +0200
Date: Wed, 13 Sep 2023 21:15:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <52517bd0-66fe-4275-bef1-afabc906e836@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913133609.1668758-5-fujita.tomonori@gmail.com>

> +module! {
> +    type: RustAsixPhy,
> +    name: "rust_asix_phy",
> +    author: "Rust for Linux Contributors",

You probably want your name here. You are going to be maintaining this
driver.

> +    fn match_phy_device(dev: &mut phy::Device) -> bool {
> +        dev.id() == Self::PHY_ID_ASIX_AX88772A
> +    }

What is this doing? The phy core will match the driver to the device,
based on the phy_id and phy_id_mask in the phy_driver structure. A
match function is only needed when the vendor made a mess of the IDs,
and has two different PHYs with the same ID. I don't see anything in
ax88796b.c to suggest it has this problem.

> +
> +    fn read_status(dev: &mut phy::Device) -> Result {
> +        dev.update_link()?;
> +        if !dev.link() {
> +            return Ok(());
> +        }
> +        let ret = dev.read(MII_BMCR)?;
> +
> +        if ret as u32 & BMCR_SPEED100 != 0 {

PHY registers are u16. phy_read() returns an int, so it can have
negative return codes. But if it is not negative, the positive values
are in the range of 0 to 65535.

> +    fn suspend(dev: &mut phy::Device) -> Result {
> +        dev.suspend()
> +    }
> +
> +    fn resume(dev: &mut phy::Device) -> Result {
> +        dev.resume()
> +    }

Can we avoid this boilerplate? A lot of phy drivers will make use of
genphy_foo calls in their struct phy_driver. It would be annoying if
each driver needs silly little wrappers like this.

> +
> +    fn soft_reset(dev: &mut phy::Device) -> Result {
> +        dev.write(MII_BMCR, 0)?;
> +        dev.soft_reset()
> +    }

You are missing the comment why genphy_soft_reset() is not
enough. This device appears to break 802.3, so you really should
document how it is FUBAR.

> +
> +    fn link_change_notify(dev: &mut phy::Device) {
> +        if dev.state() == phy::DeviceState::NoLink {
> +            let _ = dev.init_hw();
> +            let _ = dev.start_aneg();
> +        }
> +    }

Again, this is bad behaviour of the PHY, so it should be documented
why it is needed.

    Andrew
