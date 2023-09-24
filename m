Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197ADECB
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 15:31:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEA8C2
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UI6dQMeYSNDCx/rcDFNqgGzGN+IDtSgpZp2yNCJoVFA=; b=h0y04jf3m07EaiO36oC1BKUWsc
	yxOI9d61XZu64O6muu1SoAVrs1rKeXzuaKvYj/28CD0GlBxOTPg3G2PScA4u5mjnmGlZV7u+2sgBp
	2WrJuqdlBszjHf6PdGVJtBVSyrFt8IoCIiNBBZeMJXxgm0ZVrIbBm12CwhPBvK5YgQ5o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qkR5M-007MGe-3C; Sun, 24 Sep 2023 17:31:52 +0200
Date: Sun, 24 Sep 2023 17:31:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <b6afe2b8-6d85-4b05-9b5f-7a3b2c402a16@lunn.ch>
References: <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch>
 <20230918.173527.1946752214085636243.ubuntu@gmail.com>
 <964973ce-84ee-4ce1-b060-cdc0d46868e1@lunn.ch>
 <20230924.181243.1273348818055860481.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924.181243.1273348818055860481.fujita.tomonori@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> > Ah, that is going to take a while to get used to. It is also going to
> > make reviewing the error paths in drivers more interesting. Good
> > practice is that when something fails, you need to undo what has
> > already been done in a function, particularly resource allocations. So
> > you see the pattern:
> > 
> >     err = foo(bar):
> >     if (err < 0)
> >        goto out_foo:
> > 
> > Where the code at out_foo: undoes anything which has happened so far.
> 
> Indeed, this is an interesting topic; different from C's way.
> 
> fn probe(dev: &mut Device) -> Result {
>    // heap memory allocation; kmalloc
>    let a = Box::try_new(MyDeviceData::new())?;
> 
>    foo(dev)?;
> 
>    dev.driver_data = a;
> 
>    Ok(())
> }
> 
> With the above example, if foo() fails, this function returns
> immediately due to '?'. When this function ends, 'a' is dropped since
> nobody has reference to it. The destructor of 'a' calls kfree().

This works for resources which are simply allocated and freed,
assuming order it kept.

But not all resources are allocated and go out of scope on error. Just
picking a simple example:

static int __maybe_unused fec_runtime_resume(struct device *dev)
{
	struct net_device *ndev = dev_get_drvdata(dev);
	struct fec_enet_private *fep = netdev_priv(ndev);
	int ret;

	ret = clk_prepare_enable(fep->clk_ahb);
	if (ret)
		return ret;
	ret = clk_prepare_enable(fep->clk_ipg);
	if (ret)
		goto failed_clk_ipg;

	return 0;

failed_clk_ipg:
	clk_disable_unprepare(fep->clk_ahb);
	return ret;
}

If clk_ipg cannot be enabled, the error path undoes the enabling of
the clk_ahb. 

So clk_prepare_enable(fep->clk_ahb) could have a ? postfix. But at the
moment, it is not obvious to me how clk_prepare_enable(fep->clk_ipg)
can have a ?

    Andrew
