Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAB2620
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 01:18:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82935128
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 18:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Lb5+8gO1s1tafluVg19gT7UnRLFNTgYE7nm7vuz/aEU=; b=21CQHrmDwU5v2uP3YRfppqvbK5
	PtFJ1eFrLoDOWlpM7TFhrLiKWL03f3h7a8I3HS0ErtVhw+lPA5L1B85Bk0LYiTIea1fPhQwii89xm
	TAdW0plCDM/X5i87hloVABUSFIoV949tbpWOiqJM6rG8G6aPX0keK7KXom/ncfhyHTlc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qi2u8-006jF6-Jn; Mon, 18 Sep 2023 03:18:24 +0200
Date: Mon, 18 Sep 2023 03:18:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Trevor Gross <tmgross@umich.edu>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <140bc6d9-b2a9-43ef-b8b2-66767bc45910@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <20230917.191708.2174483069021340663.ubuntu@gmail.com>
 <3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
 <CALNs47uCFDJ5xz7_3qkjszmmAFXzA=dwB7CM4+sVeVtnSTZAcQ@mail.gmail.com>
 <f55a3e84-3865-432b-b009-c4051f9a3b0b@lunn.ch>
 <CALNs47sRKxnD1NhJZaoorEZ2xyLjAse23RmkacoPuCiD7Enq=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALNs47sRKxnD1NhJZaoorEZ2xyLjAse23RmkacoPuCiD7Enq=g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> That function can only call other const functions, but I don't think
> that is a problem here. A caveat is that in a simple test I'm trying,
> anything that contains a function pointer seems to go into `.data`
> instead of `.rodata`. I'm trying to figure out why this but will have
> to get back about it.
> 
> Is that something you would be interested in for the `phy_driver`?

I was wrong here. As you noticed, they are currently not const. I just
tried to actually make them cost, and it does not work. Embedded in
struct phy_driver, is struct mdio_driver_common. That needs to be
read/write. We have a bit of history here. Originally in Linux MDIO
busses could only support PHY devices. But as things evolved, it
became clear other things could be placed on an MDIO bus, such as an
Ethernet switch. So we had to do a bit of refactoring, and ended up
with this structure. It is probably possible to do some additional
refactoring to make struct phy_driver const, but at the moment, i
don't plan on doing it.

What we do however have in PHY drivers is the table:

static struct mdio_device_id __maybe_unused asix_tbl[] = {
        { PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772A) },
        { PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772C) },
        { PHY_ID_ASIX_AX88796B, 0xfffffff0 },
        { }
};

This could be const, and two C drivers do mark it const, including the
realtek driver which is being re-written in Rust. This table is not
security relevant, it does not have any function pointers in it, so
its not the best example.

Even if not relevant for PHY drivers, getting const structures into
.rodata is something Kees Cook is going to want to have.

	Andrew
