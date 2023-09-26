Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07F107B9
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 12:11:15 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD83010A
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QqzO37c4nOD9mcZmApLfvSSCxeWA6gN00HZCb/h2c7c=; b=LGTz8a2XCBCZPbrJifCt2D1/6b
	LPS4F6rCu7nqRHxX/M7Otq68mtMCgr5w4WIJDpN9MG1tzCpX+sOAaJzcNSWxipE5vkB3Z5QN/FlvS
	QmkIqJLi5jI1qsLBHMPSxvhdPbMIZzhTkjmmmRFsIEJe2RoMlMTjGUOFqBK6MEoZB43c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ql6uA-007Y2f-7D; Tue, 26 Sep 2023 14:11:06 +0200
Date: Tue, 26 Sep 2023 14:11:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Trevor Gross <tmgross@umich.edu>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <13f8c7e8-8b66-4d7b-89b4-dbfc94fad0bc@lunn.ch>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com>
 <CALNs47vyW+A5uwCQ-ug03373xj+QMehx=1pXZ8ViS2jZ8KhfxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALNs47vyW+A5uwCQ-ug03373xj+QMehx=1pXZ8ViS2jZ8KhfxQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> > +    /// Updates the link status.
> > +    pub fn genphy_update_link(&mut self) -> Result // ...
> > +
> > +    /// Reads Link partner ability.
> > +    pub fn genphy_read_lpa(&mut self) -> Result // ...
> > +
> > +    /// Reads PHY abilities.
> > +    pub fn genphy_read_abilities(&mut self) -> Result // ...
> 
> Do these functions need to be public? It seems like they are just used
> to update internal state, which is wrapped up into more user-facing
> API
 
There are C drivers which need these.

Any function starting with genphy_ is based on the 802.3 standard. But
PHY vendors get stuff wrong, and workarounds are needed. That often
means calling one of these helpers, and then doing additional steps to
fix up whatever is broken.

So these probably don't need exporting for the first Rust driver, but
a later driver might need them.

	Andrew
