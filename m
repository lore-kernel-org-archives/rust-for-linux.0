Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6B21358
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mvWpY4b4"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD202C9
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hV6at56AtWw4Nl3t+wxr7gq5Sq8rX2IHLRrX4XpMVgk=; b=mvWpY4b4ZJ/IETPgODDS+EVYwW
	lNyIC65gnZ7M2KI9VkbcVOFaq3L/natl/yLCfAjO+8YFumxwAWeV41uOae0qHFcR9+rY/X6E0VQRX
	T8hnPbzlZGeOyWWeuM5uh4lMNbiJJSIcbapkPLnTS1jVNleNjSsnOTN8sXwkrDB8sj+o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qqxG1-001x2d-C8; Thu, 12 Oct 2023 17:05:49 +0200
Date: Thu, 12 Oct 2023 17:05:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Trevor Gross <tmgross@umich.edu>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com,
	miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <03a0f800-e285-4144-90c6-70e9d707c21e@lunn.ch>
References: <CALNs47uCJsTsPVPcL5-iYvzCgrJhPnEXgQ5Di-SEh5WD9vF1qQ@mail.gmail.com>
 <20231012.085715.1926246245884454683.fujita.tomonori@gmail.com>
 <CALNs47s_wjytz3sw6uXA-27NnZkN1z+WYztfQ2Hnw0qVqEWwDw@mail.gmail.com>
 <20231012.121656.1502998233251919494.fujita.tomonori@gmail.com>
 <CALNs47sT2mhP+q7ESEMwuJpQaOS8++xortWLv-Q95Xxr4YXg0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALNs47sT2mhP+q7ESEMwuJpQaOS8++xortWLv-Q95Xxr4YXg0Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> Good point, scratch that. What about this logic:
> 
> 1. Leave `Driver` as you have it, one `DeviceId` with a null default
> 2. Use the macro to create a `const fn` to build the mdio_device_table
> so you can add logic (like in the playground I linked)
> 3. Make this function skip anything that doesn't specify a `DeviceId`,
> i.e. if the `DeviceID` is null don't add it to the table
> 4. Any devices that don't specify a `DeviceId` must specify
> `match_phy_device` (I think, since it will never get matched
> otherwise?). This could be verified in `create_phy_driver`
> 4. In the macro, allow specifying extra `DeviceId`s that aren't
> specific to any phy.

To some extent, we try to avoid over engineering a solution. There
might never be a Rust driver which needs to have different entries in
these tables.

For the moment, i suggest KISS. Have a 1:1 mapping between these two
tables. If a Rust PHY driver ever comes along which needs something
different, then solve the problem only then. And hopefully when that
happens, there will be a lot more Rust drivers in general, and a
better understanding of this problem in general, since it is not
really limited to PHY drivers. Many drivers need two tables like this.

	Andrew
