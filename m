Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FC4125D8
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 13:25:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260EEFE
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZrjQvTpzMWgKcq/JHGY/JQyw/aGF9T00wKI9Wo6zSwY=; b=NfdP4ietlcWQVhhZfUiLuyfxe9
	Q1+gWBWupNY6uUXVNN0De5jb9kfXTGTjy+hm8cpt8UAKD54eN7jYvFuIFmosDsI311EmF1DY/SGS2
	ofbPWtHgaYKZgC4mPexIsNO8OPszh5iXxgOM90NVVc9Jx0RphK5sirO7tOKQoKZinxf4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qklaa-007Sc0-19; Mon, 25 Sep 2023 15:25:28 +0200
Date: Mon, 25 Sep 2023 15:25:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <90842417-22c6-4256-b46f-e2535ac7a59f@lunn.ch>
References: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
 <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
 <aae808cd-68c2-44a4-9e01-2c5e01193fbf@lunn.ch>
 <20230925.101316.1428618195606780609.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925.101316.1428618195606780609.fujita.tomonori@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 25, 2023 at 10:13:16AM +0900, FUJITA Tomonori wrote:
> On Sun, 24 Sep 2023 17:42:16 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> >> > +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> >> > +    /// may read or write to the `phy_device` object.
> >> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> >> 
> >> Is the requirement that nobody else may read or write to `phy_device` realistic?
> > 
> > In what scope?
> 
> Inside a function in phy_driver like suspend().
> 
> > The phylib core will use phy_device members. The MAC driver has a
> > callback which should use phy_device members. However, the phylib core
> > also has a mutex to protect phy_device members. Nearly all calls into
> > this driver and all calls into the MAC driver are made with this mutex
> > held. And phylib core also uses the mutex.
> 
> Thanks for clarification.
> 
> I thought that inside calls in phy_driver, exclusive access to
> phy_device is guaranteed. Please let me know if any exceptions
> exist. I need to think about locking when adding such to the Rust
> bingings.

You actually picked the one method which is not locked. suspend and
resume don't hold the phydev lock. I don't remember the details. There
is either a lock inversion, or a true deadlock. There was a discussion
about it a few years ago, Russell King found the issue, maybe with
mvneta.

There are also PHY drivers which do more then PHY. e.g. the marvell.c
driver has a hwmon driver embedded within it. That code is not covered
by the mutex because the entry points are not via phylib. So it needs
to consider locking itself for those parts of the driver. This locking
is always going to be custom to the driver.

       Andrew
