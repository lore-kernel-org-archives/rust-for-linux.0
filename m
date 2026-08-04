Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652331F3B85
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 02:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785809920; cv=none; b=Lr8URD4qV854mJlW0vmJJ5sPslN7L0MUY7dxub7MNvO3fy8YMO9mQYysXGYCw3X2Cgll4bkxXKM2Fn953x24WQiJzSRZKv+79gsr5bAKfiEZiyITIALozzX77HDGXt1Gk/UbrFt4ni5bk9Q0Pktf7IlwSZ+JogCKYNvZF13Z25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785809920; c=relaxed/simple;
	bh=+0YWcmsVTy379jOId4ITg5DrYEYN/aWR9RmhPJDX4Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0O2boHZUjHr+WHT8OesS9wCSF4Dgy5Ca46HR3ZUPd4uuJR9EhXGBDWrLKGFvf3NxfbfEn+vKqZn5lZxh8d68qurRQSrSZQ6VzMXJnH1+7PT2bxNCUZCI1tjW8STjW6o+ILvfpE+afnNx8b7HuXNBIw13IMjJAQxfJh8wXXR1Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHqeAz6U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHqeAz6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470EE1F000E9;
	Tue,  4 Aug 2026 02:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785809919;
	bh=X/e8VfGjWFsnUsuoG7ShElDN3ZycmSqss7gVem/UxIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fHqeAz6UsSqdjKOaf52847EDHwqB6lWsbasrABwOw3rvQmKcxIVZN47RC+xTrJyoE
	 LQKB0aVm2PO/WpeEqasXbntOi9D6GDK6lp8+oDD8s/fu3fyZxYP7OIBJiB6JJm86fu
	 rO4otjsDxRUDzjPCnSCs5aTSR/Owu2EZW6iYBnbhzPz4o1U6a7EzgZlkz7RqFYIpBj
	 Jahu7AJgs2Q2x1oBxZl5yqzhpkyTm6C6G7KC/3kD5MCZ7rTwTKcZBWVW75Z5FzPVK4
	 bqmaVU4QK7DpN/GKz1H/fevxQOuui8bgbcl+83t0MOlXFjfLR0uvllyFQl0KE6dS44
	 W6rkCX2mVsVHg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5B8ADF4006B;
	Mon,  3 Aug 2026 22:18:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 03 Aug 2026 22:18:37 -0400
X-ME-Sender: <xms:_UtxauSACHvZor8YLMJp2J4bIqSjxveHs3aGbVF4wlMss7kE4UEn2Q>
    <xme:_UtxalFqbS57xgv6Me2JUcwdo_jZrA3W7ld71nAJKy7gplrvuL7iFnPNukdeLbOFq
    HVzi_6dGQlvFFLZkLcrh3j0OdGADUVSo7Q299tCdVsdutbCsuYQ4Yw>
X-ME-Received: <xmr:_UtxagcP9u0tzj8lqRkLlkC0Q6q63CFTvzpGcDnafOYUdTwlDESUMBQuZQ0zdbCY90Nz_slLJXXY1zTnG3y57v6tlnMEEZaw>
X-ME-Proxy-Cause: dmFkZTEhPEKvSEggqM4yF8fEfaf9rcGPwMWlwUs4V2DeGpqmRCZumpBmmsJy08E/MoioOa
    5kP4a1CBCWFO9Y7Jq9tXPifABiuqHQXbfg57ckdxk1nurpNKjBDHsvoPRkg0EtthrF6o9H
    QsejqLonLXKcgwqwiJtX6zk23qhsxSKxKII8SQwjuGi2Wwiaw92eZtQ5esznLakm63bxld
    Cg2PLfjDRB86d/8O0F/wmsVEeFnWo0DS7TxxQ5/hRHtCzPcUgIyLKTLadfJLPRyseMtm9P
    4vCKD99OkoxG3DuTlUQp39TUrznY2qUO35IzXXmgzCb+WCqqgAescsSK1JfiTKWgoVUpIl
    pnZR/PrZ1PJqgvAOKFXtRsJ8X2BQA8/7wc5bdJjPU2bHBYuL5MtsXcimFt3R3VNW8mH9sv
    8M8nmalvaQVPxZ7LziYFrxoPTQeFO1jUA/x1rKesdYfTHm96ogcbQ8NO7xItWAq3xIIMaa
    iFFoTxjVDhEFBIbK5u3jp1hHDZLzgjJAmRt9B+lUVOfUZhc2EzpRsJiVxuq3RnS8RtUcPj
    Ii/p7dYwJvlPyFXJHcEQFoxx5ytNu8UaQYUX8nchA3mYpN0SH0jW/eGlRxqxz8F4Vy3qsr
    nNU0ZqKvawkHlGxjn+iMwmcUzWJ/+6Ng5sUFgEdFWp+XTUSGWuijxY5kTrjA
X-ME-Proxy: <xmx:_UtxastXdPqQZ4RLH5-H3mrLHY236cxGVmG8qFW3Fef9fsHZBPKUPQ>
    <xmx:_Utxaudgs2nSv23UEZmPusiieEZYZBCsuOMbswqKQvfBX5LfvThoxQ>
    <xmx:_UtxaoqT0OyZKTuiQlxgMdTpAtUSmCOyi1vZNnCcEIvuOVtkIHKdjg>
    <xmx:_Utxak8RU705DuDXk3zTeSKegJsrKELZ-bsiG3iQsDHL2W9EE79DuA>
    <xmx:_Utxap6v98p-7TR37qqpGGuCrghlj2Uf39UzvN6nw0jkQmb0N0Ke4CDR>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 22:18:36 -0400 (EDT)
Date: Mon, 3 Aug 2026 19:18:35 -0700
From: Boqun Feng <boqun@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v4 0/5] Rate limited printing for Rust
Message-ID: <anFL-74hn6QZjZGd@tardis.local>
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
 <2026073148-cushy-mocha-2ecf@gregkh>
 <CANiq72ksdfw57QE1+FsMW3uE5p056tTn=xxK1m3fg-ABhHU8cQ@mail.gmail.com>
 <CAH5fLgjZuKGBX7R4O1fat1s__mR2LHhQWD7tWdz6F_FxECFOGw@mail.gmail.com>
 <CANiq72kuB3dHDcsw0WApcVOrJJs3kS_BWt9ELqm8YmcEz6yeSg@mail.gmail.com>
 <2026080337-careless-viper-7a1f@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026080337-careless-viper-7a1f@gregkh>

On Mon, Aug 03, 2026 at 08:24:16AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 03, 2026 at 06:56:50AM +0200, Miguel Ojeda wrote:
> > On Fri, Jul 31, 2026 at 2:20 PM Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > It's not too long until the next cycle so going via Rust tree is ok with me.
> > >
> > > I'd appreciate if at least the first three could go together so we
> > > don't have split it over three release cycles, though.
> > 
> > Ok, Boqun: I think you didn't pick the first two for your tip PR,
> > shall I or Greg do it then?

Yeah.. I didn't find the time to pick these up, sorry about that.

> > 
> > Greg: should I pick all this through Rust, i.e. including Binder's, or
> > leave the Binder ones out, or do you want to pick them all?
> 
> I'd love to just take them all at once if no one objects, as odds are
> there are going to be binder merge conflicts due to the printk() changes
> in that codebase in the char-misc-next tree.
> 

Thanks a lot!

Regards,
Boqun

> thanks,
> 
> greg k-h
