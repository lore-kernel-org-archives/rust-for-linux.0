Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E7314A74
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 18:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770832849; cv=none; b=obFwxHD+9hYIEfU/i1XM9F7MnIUz7LSE1UvONgoQ34nbX0uX4hzhauM66OZAcrasTe2nNnoDCubHWg8lZCG/Bg3W8YLS9qFQ15h5WZBBp/0gSAaLt2GX+WvA9K2s9Hnno27eEzlxgRQVXzkT/9SwsbdkKK2DZxTg313N29RQAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770832849; c=relaxed/simple;
	bh=1WYEHNgPZqycDcwjtC18SrIZuGrOjuIzLtIfXRu9r30=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQCmHVcdz3MBW4qBtHFhYFrEatKeW6G0Kb1Ccb2hZ5Qvv4hej+VHSTVDs4U0OcTn1swUGUu2yWAA+bktG3T54HlpblpEkr9tQaXMjAso6UyRmziIUVTTr7fCuU4QNVkMshbOX+kzLKDE3bktSdjUUExgwNARy5sz4y6sD0fcRGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPAUTwBY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPAUTwBY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FC3C4CEF7;
	Wed, 11 Feb 2026 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770832849;
	bh=1WYEHNgPZqycDcwjtC18SrIZuGrOjuIzLtIfXRu9r30=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=KPAUTwBY+LRo8QEOuMnHrXUKJbZ2NsPdIU7/G1CrIQ/egUNs96yqXfcWFwdYF8WLF
	 w+Ps1VdkByMXpvcDUDuOVenKFv1Q6h0ShJw098vtB+s9Nm0QtyiegPNWcDSbvPXG4d
	 j9+Y3uXFlTODBRLQjh4l1rz6iLlkYw5rcxC1Eyxo8ObIITKsY2sPq2YEIU2CtCd95q
	 yU/JacOSka7WykG0XfiUNTd9N6Xtt3p2pBJTeC/CSDy7wG+Aa1wvXOSZIwmiZKDaOV
	 xUOpgPyJsYi4iMxGYgzoRTDheoLxLNGQXw784aV4bbYoQkHqXbCWTXE/njkJSAPenj
	 j2WYMGW+eM22A==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7F820F40068;
	Wed, 11 Feb 2026 13:00:47 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 11 Feb 2026 13:00:47 -0500
X-ME-Sender: <xms:z8OMaeEHvfGtkevvG62gipz25cRNOxLrRDRJ5FdxKA---xFTfiO25A>
    <xme:z8OMaaWR2JVzgHzy-U_-xtJDBgKIxjQjRcBZzyNV4Rvic9lS8XBM9UHdyiCx-F8kt
    qhGb9AGl7Ca3LRCIcUUaWoASh9nivERKuh8pA3Cxsr9WHQzD7Pc>
X-ME-Received: <xmr:z8OMaeyT9IgoILcAGl59JcrDIT2NnX5oKtePeQZyXYq1AYiJO9a7kNw2kLPZfqzSaVufNvGHRAXxBCSJQcoC9dsUWw7vPNHa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdefvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ffveffuedvleeutdeijeelkeelgfekffeuiedvgeetjeffieduffefgeekheetteenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlh
    gvrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepthgrmhhirhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhih
    hnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthgrmhhirhgusehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihgh
    huohdrnhgvth
X-ME-Proxy: <xmx:z8OMaVsV4hFcGV8P1iyxjGP3LQcu-Au0BOOHhehloEUXgkMMpaECWA>
    <xmx:z8OMafD_R6aJ7hgwBW0BQU5G-R9ycyk7bS_Qyy-97hAsyZTAo_Qitg>
    <xmx:z8OMaRrIe-bwTiNp3Se4HFWM0KbRieu9m5hJ7y6_o1TP-9oVueKkTg>
    <xmx:z8OMaWbbvYRtEwby_KNKxi6cawCeIhG6xvm_6EybhRWVYtdxfz8xjw>
    <xmx:z8OMabGpWGEpN_v9gqS2iRczbLwHAMUKYar2DLGcZFjNruFIxS164nrF>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 13:00:46 -0500 (EST)
Date: Wed, 11 Feb 2026 10:00:45 -0800
From: Boqun Feng <boqun@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
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
Message-ID: <aYzDzeh1cTN2TEVz@tardis.local>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org>
 <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
 <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
 <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn>
 <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
 <CAH5fLghKwNEdVeRi3H3LQ9NTPYprpAeY41-jgfq8YEST9PaGdw@mail.gmail.com>
 <hq46fcdy6zvwcwlbtbjynqadiwy3wjs7raxioime2et5amzez6@wvzzlkiijwvf>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hq46fcdy6zvwcwlbtbjynqadiwy3wjs7raxioime2et5amzez6@wvzzlkiijwvf>

On Wed, Feb 11, 2026 at 09:32:36AM -0500, Liam R. Howlett wrote:
> * Alice Ryhl <aliceryhl@google.com> [260210 16:34]:
> > On Tue, Feb 10, 2026 at 10:23 PM Tamir Duberstein <tamird@kernel.org> wrote:
> > >
> > > On Tue, Feb 10, 2026 at 12:59 PM Liam R. Howlett
> > > <Liam.Howlett@oracle.com> wrote:
> > > > Is this a temporary limitation?
> > >
> > > Maybe? I don't think RfL has good abstractions for RCU yet. For
> > > example, exposing load directly on the xarray using xa_load would
> > > require a way to guarantee that the returned pointer's target isn't

Well, if we only return a pointer, we don't need to guarantee that,
right? Because it's up to the user to provide that guarantee. So we
could have XArray::load() (not Guard::load()) that just calls xa_load().
Also see below.

> > > being concurrently mutated (e.g. under the xarray lock). I'm not aware
> > > of anyone asking for this, though.
> > 
> > It's relatively easy to add an rcu-backed load using the RCU
> > abstractions we have today. I already shared an RFC containing such a
> > method for the maple tree, and it would not be much different for
> > xarray.
> > https://lore.kernel.org/all/20260116-rcu-box-v1-0-38ebfbcd53f0@google.com/

I need to point out a difference between xas_load() and Alice's usage
(also what Tamir mentioned above) there, what Alice needs (at least from
her patchset) is the existence of the object is protected by RCU, i.e.
if there is someone else dropping the object, a RCU read lock would
still guarantee the access to the object is valid.

However, the internal RCU usage of both xarray and maple tree is to
protect the *internal* data structure if I'm not missing anything, i.e.
an writer may change the array or the tree while a reader is reading,
the internal structure itself is still consistent and valid. But the
nothing guarantees the object you read is still valid. For example, you
can have an xa_erase() racing with an xa_load():

	<writer>			<reader>
	ptr = xa_erase(xa, idx);
					ptr = xa_load(xa, idx);
	reclaim(ptr);
					use(ptr); // <- object may be gone

the users of xarray needs to use other mechanism to guarantee the
existence of the object.

In Alice's case, she in fact used an RCU read side critical section with
a larger scope to protect the object as well, which is definitely nice
to have, but not only way of using maple/xarray.

> > 
> 
> It would probably be worth having two loads then, one that does
> rcu_read_lock()/unlock() and one for writer/advanced users like we have
> on the C side of things.
> 

Agreed. But we may need more ;-)

Here IIUC that Andreas does is adding a `load()` for `Guard` of
`XArray`, which is the load for a writer and most certainly you won't
need to take an RCU read lock for that. The load of a reader can be
added as I suggested above (similar as your "rcu_read_lock()/unlock()"
suggestion above), but no object existence guarantee. We likely
need a third API that can provide the object existence similar to what
Alice had in maple tree.

> Or at least name the load() function to indicate which is implemented
> today?
> 

It's a namespace thing ;-) , the function in this patch is
kernel::xarray::Guard::load(), and as I suggest here
kernel::xarray::XArray::load() should be the same as xa_load().

Regards,
Boqun

> At least on the maple tree side, we have both interfaces and users for
> both.  I just found the change to remove the rcu safety odd because I
> assumed both are needed.
> 
> Thanks,
> Liam
