Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC451117
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 13:28:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF56E109
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 06:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ApRV7XWuMBJYnIpb1zTBgbSe6TsSGDvqm+a42vCKEFM=; b=vB
	luUHlfbB4xhyNe7LzUOxf7O0MpYpbHY9ijbRFieFPD8etKVwPsnAleGHs7GZxXkQATLXdJp2k2ViG
	pR2B5TzM+qtF+kTpz6/2rBuBl85O8ogEWC1/4v6f9kPYySP7x2AV39CEu9jdl60uW3MESi4Xis3GP
	WL4Q+uMQ+S1Eao8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qkldn-007Sct-7H; Mon, 25 Sep 2023 15:28:47 +0200
Date: Mon, 25 Sep 2023 15:28:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <3ac54189-f4c4-4e66-89a9-d5b8abd50f4a@lunn.ch>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com>
 <97600770-f800-473a-af5c-870d4f8ce152@lunn.ch>
 <CANiq72mQ6NWr=t=eCcr11oO6kEyZ-45=h27fiUBdVU7xZw9NWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mQ6NWr=t=eCcr11oO6kEyZ-45=h27fiUBdVU7xZw9NWQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 24, 2023 at 08:03:06PM +0200, Miguel Ojeda wrote:
> On Sun, Sep 24, 2023 at 7:00 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > Has there been any discussion about Kconfig and Rust?
> 
> Yes, of course :)
> 
> What we do so far is only include `phy.rs` if `CONFIG_PHYLIB` is
> enabled, using conditional compilation. That is the code in
> `rust/kernel/net.rs` in the patch above:
> 
>     #[cfg(CONFIG_PHYLIB)]
>     pub mod phy;
> 
> That is, enabling Rust gives you abstractions for everything that the
> configuration enables.

And this has some magic to solve modules vs built in problems?

    Andrew
