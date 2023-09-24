Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D7D280
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 17:44:23 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74AE3FE
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QQlOGtDsIWemadr3Krwt4muvf37a0U6uxlp4GfbOrxY=; b=su0JTXcdpoNik6v02jesN8bGDY
	e5VEINY66KXrp2rl+wI/zHUPA9NuFvGLFU7j93+6UQgUBASLjDWARkgMsL6lM82vW3CVZsCKW24KS
	z4ui7LbSjdlrs1FAdEmQ2f7mcqi7luwRI2mrEwQQf4eekff47ACQ1HPH9XG3y0Q1sSgs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qkT9X-007Maa-Mt; Sun, 24 Sep 2023 19:44:19 +0200
Date: Sun, 24 Sep 2023 19:44:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <057cc481-01bc-475e-95d6-abdad5465801@lunn.ch>
References: <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch>
 <20230918.173527.1946752214085636243.ubuntu@gmail.com>
 <964973ce-84ee-4ce1-b060-cdc0d46868e1@lunn.ch>
 <20230924.181243.1273348818055860481.fujita.tomonori@gmail.com>
 <b6afe2b8-6d85-4b05-9b5f-7a3b2c402a16@lunn.ch>
 <CANiq72mcd7QfEh1ojBKSKQBNYAhqhfAkYRr=J6nG_D2Dj6bgdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mcd7QfEh1ojBKSKQBNYAhqhfAkYRr=J6nG_D2Dj6bgdw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> All those allow to still use the `?` operator, but of course, one can
> write the logic by hand too, and in some cases, it could be more
> convenient.

As somebody who does a lot of code reviews, i like C simplicity for
this. I don't need to know for each method if it has some implicit
undo when something else fails. I just need to see there is a full
collection of goto out; statements calling what looks like reasonable
undo methods.

This could be an interesting research project in a few years
time. Which way results in less bugs in kernel code error paths, and
how does reviews affect this.

	Andrew
