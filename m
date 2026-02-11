Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ECF224F3;
	Wed, 11 Feb 2026 19:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770839162; cv=none; b=sjjfY6jootrpw7Y9iOqVdcasTP+ygVIGBEHez01Bw9sVEMORs4Y+PEL8bQPsato5GlyNcIFwByvySQB17sS5B1ctBeLkWfRlsvDn7snn/uw7amet+zmi+izXh8JL8N2KMPq5Wt2+YD/NNUhstOBiKO7IBhh315IYeNcMCYATm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770839162; c=relaxed/simple;
	bh=HaxVebRUVDnlA69yJZ31bR4UMU60zYr0ZNnrO2CdKa8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ms5XVsAX0941vtu1zaJLNzsIw0G4sp0TvCmJE/udweF9binswZK2U4+ZoUho7CrdI0EucG7Ax4uAleS2EjrS0v3y5dGyvDo+4Jz9/OAt3sap4WWERVr+N04cLgHODg48H6lFQFuSZJSxSwX+PmFdN9/1h1njlD7HXxoBgkxV45g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoAVf92+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoAVf92+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBF6C4CEF7;
	Wed, 11 Feb 2026 19:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770839161;
	bh=HaxVebRUVDnlA69yJZ31bR4UMU60zYr0ZNnrO2CdKa8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=VoAVf92+flHHG9etFTngOAiULtwcdVtLv5rskVpY5yUkBmx7VZ7Roi9GwABICq27f
	 kgFZeyoY7D7A1Tdf3vCqKudnIrNzZHV+ziMnQCmWLOWeQBi7eFsPoKeo3jh88msYDm
	 LFJHd+UOwh81HXe3zbhM9gCcFksLiHU/FeQ0D7euedFSaR9wIEepgnZLzQ9jvt9Tgi
	 apT4iTq7oO9JEoZzJfaSTwO79w6abnJEMtZbIGOyTqxYOfFlhpDYnCTmnpgROjWPTH
	 8ZD9ssdo4Y+KeVyMdQctEa9FWfTSeOTJzm6AMDWolNnq+fxwNOwIFq+NwCwoBeMUX1
	 B5TjeHCFNRNWg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 57657F4006E;
	Wed, 11 Feb 2026 14:46:00 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 11 Feb 2026 14:46:00 -0500
X-ME-Sender: <xms:eNyMab3Cq8HUvmOl61nU1w4hI_a4h7HwEIaoRKhDhfBDyMJA2-B8fg>
    <xme:eNyMaVHJL6Wj4ii1RATklZDxnu2ZTpI_gAf0YBK89PD2cB-m4Au2YyoUOfJss-AZb
    tDZhsM8mZ5Rg0EQqLMGSIdCywJ0Lm5JtMHzYWUo4hOuPgNHQeYhYw>
X-ME-Received: <xmr:eNyMaSjQq-ePJBXJbQjHdr6L6YPaz6EjLr9W5a0a61qL1NukpvW10SvONI9j9ezzubb_Yv1PB2fMeONdJ1P0-1awxMZJYtvH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdefgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvffukfhfgggtugfgjgesthekrodttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ejieehffdvveeuffevieeigeehkeehgfevhfeivdetudefhfetieelgedtvdetffenucff
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
X-ME-Proxy: <xmx:eNyMaeeiVJWEwxzv3VRxZUmOMg1T14Jsl9roVWXypW4YdyT3EaN_yg>
    <xmx:eNyMaYwMSm7ZQvgNtZxJMxEsJ07uDn-dVec2OK18izYnlB4HocDkKA>
    <xmx:eNyMaYZOf86EVdJOpd3kQMz3Xm1f6FAkO39cRt7Udy1w8B7FDGY0Xw>
    <xmx:eNyMaWIfkwwyhR2qAZ9P8wV3EgG9pO8fG1TtJ5SuZeF7nDAbYCxI-g>
    <xmx:eNyMaf0DiwZRdikJ0WB5P-Sr96s-IAbbwe9RNVtZaDaEIIdBi2DV2IaZ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 14:45:59 -0500 (EST)
Date: Wed, 11 Feb 2026 11:45:58 -0800
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
Message-ID: <aYzcdqiNMtCSOlxA@tardis.local>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org>
 <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
 <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
 <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn>
 <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
 <CAH5fLghKwNEdVeRi3H3LQ9NTPYprpAeY41-jgfq8YEST9PaGdw@mail.gmail.com>
 <hq46fcdy6zvwcwlbtbjynqadiwy3wjs7raxioime2et5amzez6@wvzzlkiijwvf>
 <aYzDzeh1cTN2TEVz@tardis.local>
 <55jeqjcqqldnvkpnmigc5pbys5ee5xfdo3in7fhbxe7uqnm634@xsykemyms4sy>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55jeqjcqqldnvkpnmigc5pbys5ee5xfdo3in7fhbxe7uqnm634@xsykemyms4sy>

On Wed, Feb 11, 2026 at 01:55:43PM -0500, Liam R. Howlett wrote:
> * Boqun Feng <boqun@kernel.org> [260211 13:00]:
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
> > 	<writer>			<reader>
> > 	ptr = xa_erase(xa, idx);
> > 					ptr = xa_load(xa, idx);
> > 	reclaim(ptr);
> > 					use(ptr); // <- object may be gone
> > 
> > the users of xarray needs to use other mechanism to guarantee the
> > existence of the object.
> > 
> > In Alice's case, she in fact used an RCU read side critical section with
> > a larger scope to protect the object as well, which is definitely nice
> > to have, but not only way of using maple/xarray.
> 
> The lock surrounding the ptr is only useful if your ptr is rcu
> protected, which isn't always the case.  So having the rcu read side

Right, so what Alice had in her patchset linked was introducing an RCU
protected type wrapper for an object, so that is particularly for the
case where the object is under RCU protection. (I would like to arrange
the implementation and API in a slight different way for that patchset,
but the idea is solid)

> critical section extended to the life of the ptr means you've extended
> the rcu window for no reason when the ptr is protected in another way.
> This may perform poorly, depending on the situation.
> 
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
> Ah, okay.. this might be hard to follow in code, but I guess the
> compiler will catch the wrong user.  That is, Guard::load() would not be
> written out, we'd just see array.load() in both cases?
> 

For `Guard::load()` case, you will need to write:

	let ptr = xa.lock().load();

or

	let guard = xa.lock();
	let ptr = guard.load();

for `XArray::load()` case, you will need to write:

	let ptr = xa.load();

> It's also more confusing with the borrowck false positive issue in play.
> That is, using Guard::load() will do more work than necessary, I believe?
> 

I'm not following that thread closely, but seem so.

> It is odd that only one of these exist, especially considering we have
> users for both on the C side.  I guess the other one will be added once
> it's needed.
> 

Yeah, this is the place where I don't agree with the "you must have a
user to upstream an API" rule ;-) A reader's `load()`, even with no
user, would completes the concept of what an XArrary is.

Regards,
Boqun

> Thanks,
> Liam
