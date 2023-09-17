Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F8290B
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 15:13:26 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F372119
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=guMrC8ZFtdXO8hHz9WXqHkf256jjsAYaXsc5517Y8dw=; b=YD7h0OEnZxy3FyHvoRPdVMkORa
	RKkj/aasT6KG6tOsw9lI3WzZeX6jkjrNUKYXrOxkDA075G6UYUmMlwde93EdpNDqX3qNnTYcmjtc/
	o60rwZKOotMpGWjkJdwCjXqolsd6Q+Q/A9Qm7kausHaDykkB2twZyR402sRSDiTKCPec=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qhtSc-006hVe-CO; Sun, 17 Sep 2023 17:13:22 +0200
Date: Sun, 17 Sep 2023 17:13:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/4] rust: phy: add module device table support
Message-ID: <ef6184a7-2b1d-4a74-bf4c-5625eec1e92e@lunn.ch>
References: <20230913133609.1668758-3-fujita.tomonori@gmail.com>
 <CALNs47s7wH8yFU-jbcQxVRiHta_pEdueSGo9mFOdYriT=o0SOQ@mail.gmail.com>
 <CALNs47u3s1gyDLksk5M=7HwTK=-vjadWKbhZQDm6OpDXqcDUbg@mail.gmail.com>
 <20230917.153010.1023281411128238110.ubuntu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917.153010.1023281411128238110.ubuntu@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> One driver doesn't always correspond to one device id entry. For
> example, realtek PHY module supports tons of drivers but have only one
> device id entry.
> 
> https://github.com/torvalds/linux/blob/f0b0d403eabbe135d8dbb40ad5e41018947d336c/drivers/net/phy/realtek.c#L1089
> 
> So I prefer to define the device id independently. I use the following
> code now.

Just an FYI: order is important. Matching is performed using a
value:mask pair. The core does not sort on mask size, it assumes the
driver registers the phy_driver structures in order, so that a more
specific value:mask pair comes first followed by more generic
value:mask pairs.

	Andrew
