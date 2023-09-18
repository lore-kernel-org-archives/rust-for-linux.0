Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E322F15
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 17:08:16 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA9B181
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LqR9M4MKtz+tu+F80PTWTXHnJxo8DbjcMf3OPqGi5Rw=; b=Gsa7KU10KRuwU14ttIifErk/p5
	5kBvsXc7zUUBGGky8j5z1bbKc2+YB2WHdrr76xUZYMgWZKbZMYi+ptOjTofXeU1O/FwyghG9i0l5R
	OgQETy0u5lHY79yboiEmqlCaURS4wyr5z9rvi/rqscPcfrqBi9H6SjvPkCVG9MI9e0Do=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qiE40-006nJu-LN; Mon, 18 Sep 2023 15:13:20 +0200
Date: Mon, 18 Sep 2023 15:13:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <0bf24fb6-7b22-4228-ba31-06d43d89e0f3@lunn.ch>
References: <CALNs47sRKxnD1NhJZaoorEZ2xyLjAse23RmkacoPuCiD7Enq=g@mail.gmail.com>
 <140bc6d9-b2a9-43ef-b8b2-66767bc45910@lunn.ch>
 <CALNs47sTJmBweLA=ZqqSa2kTQi1gUVzTXOeq=iPCCfLCXvp7jQ@mail.gmail.com>
 <20230918.124427.463760682115136745.ubuntu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918.124427.463760682115136745.ubuntu@gmail.com>
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> It is placed at .modinfo section by the module tools. You can find
> "mdio:" string:

Ah, good point. It probably is not even loaded into memory. It is
there for depmod, to build the table /lib/modules/*/modules.alias.

> > Is there always a 1:1:1 phy_driver:phy_id:phy_id_mask relationship?

No.

In theory, one entry could cover a number of PHYs. Each Vendor should
have one or more OUIs. The ID used here is a mangled version of that
OUI in the high order bits. So you could in theory just have one entry
with a mask value for just the OUI and the driver will get loaded for
all the vendors PHYs. But that is not very flexible, why keep to
register compatibility when you can change everything and write a new
driver. At least some vendors seem to think that way :-(

	Andrew
