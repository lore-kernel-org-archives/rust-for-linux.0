Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40E2F5461;
	Wed, 11 Feb 2026 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834275; cv=none; b=HOlFZKh5PEESKTupZ/bSvASXdBphs32f2RswYTQO7e1RtiMXJCTRzOizRgRVwTC8l4681W9Xbzd7pDSEy9B9DxWFgL9S1oak/Ktc7GYZuu57zwLdGZaXHi5Lvn4OEkqpxS8qN0E1Qp5n7c8npl21sRV+xlEEaVdj9VYsI1zPJhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834275; c=relaxed/simple;
	bh=HpiSg+mkwqHgx2x64frOPx+L7lBkmxTpS7thY1MR8H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+LX5ZHmiCjpBbRnbQZ3Jg8XH6LMffbJ+z79KeZ/niVxbZzeH8YOqkUMc0LeBInItMznbbzDi4i3mJDw12eCvLIrT2ghdc52jYNHJF7BVTPgjjGI3Cn4F98iV1u05LWYhEaUV7qz0Rxbsw1DyPOeTUgPZaaUGDb4W/wEB0Bex78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSwi50FD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSwi50FD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28370C4AF0B;
	Wed, 11 Feb 2026 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770834275;
	bh=HpiSg+mkwqHgx2x64frOPx+L7lBkmxTpS7thY1MR8H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSwi50FDOsk1M8piqFrSGHTqEtzTxSyhZiXCPiXDV2um4XknRBy9JTiuLBRG+UaBR
	 PaoxsAxaF81vnYM6yDQspUdBCwORgF9i7ifnYPM1PHNyPiC+GBgPeXFkFgMHfUQIgH
	 zt9F7PzzjlutkStzFYa5U+En1y5JyWALfn15c18mWq9NiYYyyRSAl1geZc9saD1UwA
	 gCtdofuUrjwyZ2m8+huGmuGbw/4zIvnTVy9OFE1TLbkhOy3aaAmjDyloG54c5wC+jT
	 mtKB5TC5OLBf50JrCdrzQQvKM+UJVhFO/1Pi+jOSogEZt6r7U9uHOBbO+8pArzRPn2
	 6BuhTa3Ew8jpg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 46457F40068;
	Wed, 11 Feb 2026 13:24:33 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 11 Feb 2026 13:24:33 -0500
X-ME-Sender: <xms:YcmMaXsPKu4C8fwVMBpmz_YXB1komgXe9Z1xKGRHCvUfmGV8c5M32A>
    <xme:YcmMadUMhiP7rNy62978_pU0TBQ0PLdEVjgD3Cs0Ny9rhg6bTfsW8MEabjuu3DYdV
    rVzs8Iknza-eVX5Fw_bHNZIxOdgxNOmfXpaji6vznzZDvKEg_mG>
X-ME-Received: <xmr:YcmMaYXlInLkzrqucIVl0_oP0vvECdZTaR0kagIsSnTeYMqqtMiTHGKyhZOeDQBVk_bPlSUaXro6D_YHBySFr1kYW6E5fuzY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdefvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epteelkeejledtledtvefhhedtfeeghfeuhfeljeevffelgeeltefhieefvdeuteehnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdduieejtdelkeegjeduqddujeejkeehheehvddqsghoqhhunheppehkvg
    hrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvgedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepthgrmhhirhgusehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphht
    thhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrdhhih
    hnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomh
    dprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthho
    pehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhse
    hprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:YcmMaYQHUOxucR5jbTDRgfmIKNOkSlP6eFGjLJ1UIeSXp7L-srXKCQ>
    <xmx:YcmMaXEkzIYMXeXUGXuM44BUwS-TDtJV8poDPC6b3zhxc68GIBiqbw>
    <xmx:YcmMaYRR_zENEXjwshpBzZUAoaDwYzFhbjOnjNJ0iMkaUz8s_vSF7Q>
    <xmx:YcmMaRqNX5MFLBFMC_9fwT-e3Xts55hgf99nzMI8U0BufmbIlZbGrg>
    <xmx:YcmMaeqASKp3Dm0cX16EDAZKK5w2uE65TScbe4pAKAN3TLcSNNxChRD8>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 13:24:32 -0500 (EST)
Date: Wed, 11 Feb 2026 10:24:31 -0800
From: Boqun Feng <boqun@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 05/12] rust: xarray: use `xas_load` instead of
 `xa_load` in `Guard::load`
Message-ID: <aYzJX5OML418GYsg@tardis.local>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org>
 <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
 <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
 <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn>
 <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
 <CAH5fLghKwNEdVeRi3H3LQ9NTPYprpAeY41-jgfq8YEST9PaGdw@mail.gmail.com>
 <hq46fcdy6zvwcwlbtbjynqadiwy3wjs7raxioime2et5amzez6@wvzzlkiijwvf>
 <aYzDzeh1cTN2TEVz@tardis.local>
 <CAJ-ks9n0-Uy0n7CsZwPr37PSc_wo5qYG2YGVsGN50oPZN4MrSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9n0-Uy0n7CsZwPr37PSc_wo5qYG2YGVsGN50oPZN4MrSg@mail.gmail.com>

On Wed, Feb 11, 2026 at 01:19:23PM -0500, Tamir Duberstein wrote:
> On Wed, Feb 11, 2026 at 10:00 AM Boqun Feng <boqun@kernel.org> wrote:
> >
> > On Wed, Feb 11, 2026 at 09:32:36AM -0500, Liam R. Howlett wrote:
> > > * Alice Ryhl <aliceryhl@google.com> [260210 16:34]:
> > > > On Tue, Feb 10, 2026 at 10:23 PM Tamir Duberstein <tamird@kernel.org> wrote:
> > > > >
> > > > > On Tue, Feb 10, 2026 at 12:59 PM Liam R. Howlett
> > > > > <Liam.Howlett@oracle.com> wrote:
> > > > > > Is this a temporary limitation?
> > > > >
> > > > > Maybe? I don't think RfL has good abstractions for RCU yet. For
> > > > > example, exposing load directly on the xarray using xa_load would
> > > > > require a way to guarantee that the returned pointer's target isn't
> >
> > Well, if we only return a pointer, we don't need to guarantee that,
> > right? Because it's up to the user to provide that guarantee. So we
> > could have XArray::load() (not Guard::load()) that just calls xa_load().
> > Also see below.
> >
> > > > > being concurrently mutated (e.g. under the xarray lock). I'm not aware
> > > > > of anyone asking for this, though.
> > > >
> > > > It's relatively easy to add an rcu-backed load using the RCU
> > > > abstractions we have today. I already shared an RFC containing such a
> > > > method for the maple tree, and it would not be much different for
> > > > xarray.
> > > > https://lore.kernel.org/all/20260116-rcu-box-v1-0-38ebfbcd53f0@google.com/
> >
> > I need to point out a difference between xas_load() and Alice's usage
> > (also what Tamir mentioned above) there, what Alice needs (at least from
> > her patchset) is the existence of the object is protected by RCU, i.e.
> > if there is someone else dropping the object, a RCU read lock would
> > still guarantee the access to the object is valid.
> >
> > However, the internal RCU usage of both xarray and maple tree is to
> > protect the *internal* data structure if I'm not missing anything, i.e.
> > an writer may change the array or the tree while a reader is reading,
> > the internal structure itself is still consistent and valid. But the
> > nothing guarantees the object you read is still valid. For example, you
> > can have an xa_erase() racing with an xa_load():
> >
> >         <writer>                        <reader>
> >         ptr = xa_erase(xa, idx);
> >                                         ptr = xa_load(xa, idx);
> >         reclaim(ptr);
> >                                         use(ptr); // <- object may be gone
> >
> > the users of xarray needs to use other mechanism to guarantee the
> > existence of the object.
> >
> > In Alice's case, she in fact used an RCU read side critical section with
> > a larger scope to protect the object as well, which is definitely nice
> > to have, but not only way of using maple/xarray.
> >
> > > >
> > >
> > > It would probably be worth having two loads then, one that does
> > > rcu_read_lock()/unlock() and one for writer/advanced users like we have
> > > on the C side of things.
> > >
> >
> > Agreed. But we may need more ;-)
> >
> > Here IIUC that Andreas does is adding a `load()` for `Guard` of
> > `XArray`, which is the load for a writer and most certainly you won't
> > need to take an RCU read lock for that. The load of a reader can be
> > added as I suggested above (similar as your "rcu_read_lock()/unlock()"
> > suggestion above), but no object existence guarantee. We likely
> > need a third API that can provide the object existence similar to what
> > Alice had in maple tree.
> >
> > > Or at least name the load() function to indicate which is implemented
> > > today?
> > >
> >
> > It's a namespace thing ;-) , the function in this patch is
> > kernel::xarray::Guard::load(), and as I suggest here
> > kernel::xarray::XArray::load() should be the same as xa_load().
> 
> Just to clarify: `kernel::xarray::XArray::load()` does not currently
> exist and no one has yet asked for it.
> 

Yeah ;-) I meant to say we can add it if there is a user and we can use
xa_load() to implement that.

Regards,
Boqun

> >
> > Regards,
> > Boqun
> >
> > > At least on the maple tree side, we have both interfaces and users for
> > > both.  I just found the change to remove the rcu safety odd because I
> > > assumed both are needed.
> > >
> > > Thanks,
> > > Liam
> >
