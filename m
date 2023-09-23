Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC751DF44
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 14:43:09 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D8B192
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=aHcGLODmb94Rp9gfB6v26ri1pWTqJSanws7wonAH6/o=; b=Sm
	NeMVzI1jSrZafNxuUCCJp1QLwGzC5bnmRKvY+InSRAKPNmu5WQVM9B63lYbjS3L/wDZkV2V5UMU6O
	wm7fqRKoypmzFhpbzM5eja6qzZUfFbAZAstrKTLBqG3CQ9MEzkHizJLNgfPF3i4xqkx9if5UHBP26
	ACUPXkvLfik2nu4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qk3qR-007INR-II; Sat, 23 Sep 2023 16:42:55 +0200
Date: Sat, 23 Sep 2023 16:42:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file
 to the ETHERNET PHY LIBRARY
Message-ID: <4659894c-ae10-4e21-87da-6291c940af3c@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com>
 <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
 <20230917.213248.712797486250583805.ubuntu@gmail.com>
 <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
 <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch>
 <CANiq72nkmL5jEqdnj+OoDk+Vja_jVUdD+EGneF3h+kdFSOJqPA@mail.gmail.com>
 <3dc9a1ea-fb04-4b9e-abf9-08165ea3b8c5@lunn.ch>
 <CANiq72nnX5T4TLVpn9g7_9EDP0gudQAAqOc1oSvotsgKYUs8Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nnX5T4TLVpn9g7_9EDP0gudQAAqOc1oSvotsgKYUs8Jw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 23, 2023 at 12:19:06PM +0200, Miguel Ojeda wrote:
> On Sat, Sep 23, 2023 at 3:36 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > My limited understanding of the Kernel Makefiles is that they all end
> > up being one huge Makefile. So i think in principle you can place the
> > files anywhere, and direct any object file towards any target. So i
> > think you should be able to put the file for the kernel crate anywhere
> > in the tree.
> 
> Files composing a Rust crate are automatically found by the compiler
> following a pattern starting with the root of the translation unit,
> i.e. it is unlike C.
> 
> It could still be done hacking things around, but we preferred to keep
> things clean and then go for the new build system.

O.K. Fine. We can move it later. We seem to be having quite a lot of
useful discussion with this driver, but no new version yet. It might
actually be that by the time it is ready for merging you have the
build system sorted out.

> If everything goes well, I would like to have something for LPC.

I hope to attend LPC, so i will try to pop into some of the sessions.

       Andrew
