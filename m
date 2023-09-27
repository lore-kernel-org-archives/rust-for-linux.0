Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7D1FA1
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 12:21:13 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EC9BE
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 05:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WxlKhgvHTVn/zDDylJ/4GAHSCpdLWwge+cvaEUm42GQ=; b=L3lhsbwhlp3VFsCQKhioBLF04c
	8watozyvtoTlw6wYvtx87+Ai85yUNc/od5KIiz1UnQp+9ZGxNydwrP+Ops7WrQbq6cUYCM/mEfVpB
	zcZjIROYMqgcv+qnJTLLB5oRkFg2tBk8RrODLV2EpKPVgboLn7/B3UzHP43lAGySBD/Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qlTXM-007dly-RK; Wed, 27 Sep 2023 14:21:04 +0200
Date: Wed, 27 Sep 2023 14:21:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <f4344aed-03d5-485b-af62-cc88fffadaab@lunn.ch>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com>
 <CALNs47vE7p_m=q0Q5+bHUSVaNVEbfeJfZFHS9AkT1UaUMvuevQ@mail.gmail.com>
 <20230927.123945.1084774133034584337.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927.123945.1084774133034584337.fujita.tomonori@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> > Which really isn't all that bad since it means that if any fields are
> > ever added to `phy_driver`, we will need to confirm that our default
> > is OK a single place.
> 
> Such change to phy_driver would unlikely happen? Wth such change, all
> the PHY drivers need to be updated.

We have around 60 PHY driver files with around 250 phy_driver
structures. We are not going to add new members which will force us to
edit them all. It is very unlikely that new members will every be
compulsory. It simply does not scale.

	Andrew
