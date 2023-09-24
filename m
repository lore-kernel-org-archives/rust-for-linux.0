Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAC879C5
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 17:00:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A056CF
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iOkXahsl43U1Wuw4dXWdXt7Ml1TyCC6fJoY4pJnlpfA=; b=EFfxk6EFCeI/n9wTC+Dt5EkXJR
	OpxnmdOximrnuI1Qo2gVQ78mvHry9uBTS8eEy11IzhKtyOoseeMjnVLQLMOLUkxiRGNKyntmCYkWA
	gFqgewudXQ5goOZQvwG5W0TDGKjO0XbPdIvwUssTyCzPfht84asb2q2WnOs7YJ97gn5U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qkSTS-007MUl-FN; Sun, 24 Sep 2023 19:00:50 +0200
Date: Sun, 24 Sep 2023 19:00:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <97600770-f800-473a-af5c-870d4f8ce152@lunn.ch>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 24, 2023 at 03:49:00PM +0900, FUJITA Tomonori wrote:
> This patch adds abstractions to implement network PHY drivers; the
> driver registration and bindings for some of callback functions in
> struct phy_driver and many genphy_ functions.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/Makefile                   |   1 +
>  rust/bindings/bindings_helper.h |   3 +
>  rust/kernel/lib.rs              |   3 +
>  rust/kernel/net.rs              |   6 +
>  rust/kernel/net/phy.rs          | 760 ++++++++++++++++++++++++++++++++

Has there been any discussion about Kconfig and Rust?

I would expect to see some Kconfig changes here.

menuconfig PHYLIB
        tristate "PHY Device support and infrastructure"

tristate means it can either be built into the kernel, be a kernel
module, or not built at all.

If it is not built at all, you should not build phy.rs, you are going
to get undefined symbols when you try to link it.

If phylib is a module, the only way it will work is if phy.rs is also
a module, so it can be loaded after the phylib module is loaded.

If phylib is built in, there are no restrictions.

There are different ways to solve this, and i'm not a Kconfig expert,
but maybe you need something like:

rust/Kconfig

config RUST_PHYLIB_ABSTRACTION
	tristate "Rust abstraction for PHYLIB"
	depends on PHYLIB
	depends on RUST
	help
	  Provide a Rust abstraction for phylib, which Rust PHY
	  drivers can use.

and then in Makefile something like:

ifdef CONFIG_RUST_PHYLIB_ABSTRACTION
obj-$(CONFIG_RUST) += phy.rs
endif

And the Rust PHY driver would then have a

	depends on RUST_PHYLIB_ABSTRACTION

When you have something which you think should work, we can maybe ask
Arnd Bergmann to run his randconfig build bot on a tree and see if it
finds any instances when the build breaks.

	Andrew
