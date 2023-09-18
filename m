Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F7C23757
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 17:08:01 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5D6CDF
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MftHigueJga4Ihcz3hEXahePPRWzWBxr8zkz9MZyOT8=; b=hMo19nfJqlNeAAzbXIlKfwcD6l
	i+soNMTzZL+akh22GYP0zsq6qnt4lkyX186SgXpM6r3bwAnQyLzkBVqhp3TW2uwoS3l0+08kAyiy2
	w4CbE2C/Zoahe3AyHv8c+JdRPtJ4DgBIPb7F9mGrWJU9Zp/rv2YVfSC/YgYmLLBpAVmA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qiEDA-006nOZ-Pp; Mon, 18 Sep 2023 15:22:48 +0200
Date: Mon, 18 Sep 2023 15:22:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Finn Behrens <me@kloenk.dev>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <0c58572d-6f8c-41ce-af75-fc0b06219e10@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <758E90DF-ECA5-485E-8446-91CBC2845999@kloenk.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <758E90DF-ECA5-485E-8446-91CBC2845999@kloenk.dev>
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> > +    /// Reads a given PHY register without the MDIO bus lock taken.
> > +    pub fn lockless_read(&mut self, regnum: u32) -> Result<i32> {
> > +        let phydev = Opaque::get(&self.0);
> > +        // SAFETY: This object is initialized by the `from_raw` constructor,
> > +        // so an FFI call with a valid pointer.
> 
> This function also has the safety requirement of holding the mdiobus lock.
> This could either be an unsafe function, or some other way to ensure the caller holds the lock.

For Linux kernel mailing lists, it is considered good practice to trim
emails to just the relevant content. You should also try to keep to <
~80 characters per line. Basically stick to the old netiquette
guidelines.

One option for this safety requirement might be to use

mutex_is_locked(bus->mdio_lock)

	Andrew
