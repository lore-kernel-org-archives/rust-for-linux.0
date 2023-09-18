Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5687826E18
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 17:07:52 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493981AC
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QKZleye8JCcPwr4Jg0Et8x3TXveVKsf9uowWiTJz8Oo=; b=3enwNUCxf3uEzj+py1TgW7bEhj
	JQsQDTiAdSK5uv4WkVkl+z79DoB0Ynlx1HIeufbz/h5we891IwO7hsbXPlvGgb/0gVZKxK7RKNHQ+
	OlQthRpXjzPyfOe0CArdd2V37DICX5fAY3bqYaKG4drj+OmEK4ygAiXQbAC2kjnv8Tuk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qiER6-006nRg-Sh; Mon, 18 Sep 2023 15:37:12 +0200
Date: Mon, 18 Sep 2023 15:37:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <964973ce-84ee-4ce1-b060-cdc0d46868e1@lunn.ch>
References: <52517bd0-66fe-4275-bef1-afabc906e836@lunn.ch>
 <20230917.202804.2074374258417179605.ubuntu@gmail.com>
 <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch>
 <20230918.173527.1946752214085636243.ubuntu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918.173527.1946752214085636243.ubuntu@gmail.com>
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> >> >> +    fn read_status(dev: &mut phy::Device) -> Result {
> >> >> +        dev.update_link()?;
> >> >> +        if !dev.link() {
> >> >> +            return Ok(());
> >> >> +        }
> >> >> +        let ret = dev.read(MII_BMCR)?;
> >> >> +
> >> >> +        if ret as u32 & BMCR_SPEED100 != 0 {
> >> > 
> >> > PHY registers are u16. phy_read() returns an int, so it can have
> >> > negative return codes. But if it is not negative, the positive values
> >> > are in the range of 0 to 65535.
> 
> Sorry, I should have commented in the previous reply. ret can't be a
> negative here due to how to hanle an error in Rust.
> 
> let ret = dev.read(MII_BMCR)?;
> 
> Here '?' means that if an error happens, return with an error
> immediately. So the ret is set only if dev.read() is sucessful.

Ah, that is going to take a while to get used to. It is also going to
make reviewing the error paths in drivers more interesting. Good
practice is that when something fails, you need to undo what has
already been done in a function, particularly resource allocations. So
you see the pattern:

    err = foo(bar):
    if (err < 0)
       goto out_foo:

Where the code at out_foo: undoes anything which has happened so far.

      Andrew
