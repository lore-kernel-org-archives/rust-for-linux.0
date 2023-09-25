Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129111095B
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 16:54:06 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BF9BE
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=vkkaL5TElRILLB1Y9pYtnPi8v2BI6Yw6/PGI6h7mqao=; b=xu
	ZxnTCyxZlyln5tqSncoKPjIVxX0HPdViNHd0GtfRA1JN1YbiKrS3JzG/nY16+KAkDMyBkMGT+Cdnb
	448GMk0wRgt7Zs0ig4qgbrj6dfzIbhdOo1/4TjdLL98QykFfI4FmRE4rP0g1Tvrju4IGKEWEhYxlv
	ZnA123scXIBVUts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qkoqM-007TWr-0R; Mon, 25 Sep 2023 18:53:58 +0200
Date: Mon, 25 Sep 2023 18:53:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <98bc5ab9-890c-4163-8a50-01ca6d07a60b@lunn.ch>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com>
 <97600770-f800-473a-af5c-870d4f8ce152@lunn.ch>
 <CANiq72mQ6NWr=t=eCcr11oO6kEyZ-45=h27fiUBdVU7xZw9NWQ@mail.gmail.com>
 <da479834-a649-4a93-9083-9ea59d519cbd@lunn.ch>
 <CANiq72nB+7P8Pby-_Vxq0Fq_g0L8tC2XG6UT-T4kPqhMnKqLnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nB+7P8Pby-_Vxq0Fq_g0L8tC2XG6UT-T4kPqhMnKqLnQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 25, 2023 at 05:42:51PM +0200, Miguel Ojeda wrote:
> On Mon, Sep 25, 2023 at 3:43 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > I think the end goal should be that if there is no Rust PHY driver
> > module loaded, the Rust PHY abstraction should also not be loaded. I
> 
> Agreed, that is the goal.
> 
> > think best practice would also be, if the kernel configuration does
> > not contain a Rust PHY driver, don't even build the Rust PHY
> > abstraction.
> 
> I am not sure about this one: a user may want to have abstractions
> built-in but the drivers as loadable modules.

Kconfig should allow this. A module with a DEPENDS ON, just ensures
that the option it points to is available in the configuration in a
way it is usable. The Lack of a DEPENDS ON on an Kconfig symbol does
not force it off. The user can enable it, even if there is no user.

> One also needs to consider out-of-tree modules even if we know
> everything that got built as a module in-tree.

At least in networking, out of tree modules are towards the very
bottom of the feature list. I would be quite happy to break them if
they prevent in kernel features, bloat the kernel, or make maintenance
harder.

> > This 'always built-in' is the issues i was trying to point to. phylib
> 
> Yeah, we are aware of the limitation. This was another consequence of
> the way we had to build things in a simple way given Kbuild does not
> map well to Rust, and thus the need for the new build system.

So i think your need to add a DEPENDS ON PHYLIB for the moment, until
the new build system is available. Otherwise we are going to get
broken builds reported by 0-day, and the randconf build bots, assuming
they even try to build Rust at the moment. But at some point, they
will...

       Andrew
