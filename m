Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CBB36B16
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 16:34:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5202B10C0
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=p+XgpmUM3cC3yNOs0seJGfPdPvRaApe0EXK0/W7MYnk=; b=My
	X0+H59hsCZvB8a8/aqCnXb0lENzdZ4+y9pwoTNXMjtrHvlKfCb5bADTQuytVoudFB9KAE3goSQ7mm
	J042hxwI1XnrQeSNprY8idPdC2b8VaXOeC6AkH7LuRjecDhxh22yuyU2SIcPOjnTVvQWXbbIGLO8Y
	RUtsCqIrJgVIh5s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qidfS-006vfy-Bv; Tue, 19 Sep 2023 18:33:42 +0200
Date: Tue, 19 Sep 2023 18:33:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file
 to the ETHERNET PHY LIBRARY
Message-ID: <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com>
 <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
 <20230917.213248.712797486250583805.ubuntu@gmail.com>
 <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 19, 2023 at 02:06:21PM +0200, Miguel Ojeda wrote:
> On Sun, Sep 17, 2023 at 2:32 PM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
> >
> > Miguel, any concerns to put Rust files not under rust/ directory?
> 
> If it needs to be part of the `kernel` crate, then the file needs to
> remain in `rust/kernel` for the time being.

So a question from a none Rust person. Why would it need to be in the
'kernel' crate?

The PHY driver is a kernel module, which optionally can be built
in. My maybe overly simplistic expectation is that the kernel runtime
linker will link undefined symbols in the module to symbols which have
already been loaded in the kernel, be they C, Rust, or assembly. The
symbols just need EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() so they are
visible.

   Andrew
