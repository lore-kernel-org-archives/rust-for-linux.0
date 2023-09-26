Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5F26FD2
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 12:36:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECA710A
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=iRvKJzBiRWJdVJyLdq1jhb/rq6t0+zTo8N7P//RTMNo=; b=Wm
	duiFHDQATytNXGAy3KQyofSNpktTftAgWAG7ab4WzsAb6Qv8XT5e3GBaCFp0t3b0sr1QD08vzwg+Y
	K6V/PmxfXKACyn/cLbM2sjphMXVO3e/2LrRfmMcV23uQ0VLvXlcRscxhC55kd1mPcbdHnFvfsmjqs
	JOB08bnVbajwEJ4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ql7Iy-007Y9i-Dw; Tue, 26 Sep 2023 14:36:44 +0200
Date: Tue, 26 Sep 2023 14:36:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Trevor Gross <tmgross@umich.edu>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
Message-ID: <baa4cc4b-bcde-4b02-9286-c923404db972@lunn.ch>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-4-fujita.tomonori@gmail.com>
 <CALNs47tecmP6yL=ogjEDPuLBS6q-E=fyya7xKQ-c2Uc7kTsx_A@mail.gmail.com>
 <20230926.160724.485514445673047276.fujita.tomonori@gmail.com>
 <CALNs47uYnQC+AXbJuk8d5506D25SDhZ-ZKuhimFkZnYOhhdfCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALNs47uYnQC+AXbJuk8d5506D25SDhZ-ZKuhimFkZnYOhhdfCg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

>     > Also, we should make sure that the user-available MII_X constants are
>     > available as a u16 rather than a c_int.
> 
>     I'm not sure what you mean. MII_ constatns are 0..31. That's IEEE
>     spec.
> 
> 
> Thanks for pointing that out, interesting. I feel like we need some sort of
> bridge since if our writes take u16, using `some_32bit_mii_constant as u16` is
> going to be a footgun.
> 
> Maybe it’s still okay to create u16 consts for what is available since nothing
> in mmi.h is > 0xffff?

There are two protocols defined for talking to the PHY. These are
called C22 and C45, because they are defined in Clause 22 and Clause
45 of the IEEE 802.3 standard.

The C22 protocol supports 32 registers. That was sufficient for a long
time, but eventually became too small. So C45 extends it to 16 banks
of 65536 registers. C drivers use phy_read() for C22 and
phy_read_mmd() for C45. At the moment the Rust abstraction only covers
C22.

Of the C22 registers, many have well defined meanings. These are
listed in include/uapi/linux/mii.h. However, some are reserved and
some are left for vendors to use. The vendor ones don't have a name in
mii.h. So you could create u16 consts for those which are listed in
mii.h, but you also need to allow other values < 32. And if you do
give them names, please follow what is in mii.h, to make review
simpler.

For C45, the named registers are much more sparse, and there are two
banks of 65536 registers for vendors. So C drivers tend to have a
collection of #defines giving names to registers which are not part of
mii.h.

	Andrew

