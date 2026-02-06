Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4322652D;
	Fri,  6 Feb 2026 01:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340454; cv=none; b=E/Ytk6GIjK4AuRbAo2UzgLTRk8WpOgDWpR/hVD10OvcrURHXTNMB6rq4lIZUd1Or278MZwCGm+Pk1jhqg5MzezCujNPbnrJfKTp2r2dnDRCRRlJkJ8QOyZrtOH54tSWpnDfoamjUFH0UYbnHzRtlMOEYXNYKns/CSl55Ok7UeXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340454; c=relaxed/simple;
	bh=4UpTdyrkiGXHLFaMnkI07hwEnr+ztKXXmWkYzgoIFfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZGmPvt9vVyXW5FzW7je4LeYjsyMUVVL8kI4BjeGvLhTdGBtRaNkODEi75k0Ol8NYyIs6ctY8yxJ3/IZUaNqAWHNMN3iFN9cj5NCXpD6ngngdDcmIJUJZMLrJUAHEnbm69gKYQWTkhzOiNw9DUAP9dFagEfJx8UQ/HnKF/wajwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diXUQUgi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diXUQUgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88982C19421;
	Fri,  6 Feb 2026 01:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770340454;
	bh=4UpTdyrkiGXHLFaMnkI07hwEnr+ztKXXmWkYzgoIFfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=diXUQUgira0IDhJDKcYMpMTtviqg2WZ+mi02MeNkeyCUR/WibOhkYS9NVubMPQkGQ
	 mFcKsTaZ5bKTWk6z/YIowpdazV1hjl86BkhyQMi43Jz4GNGjWqlCWuhyBgUSgSEQJb
	 cWcqnKDGlsVafW/K7DJQPHQvE949jBqA39c4WfmnCua+2EVqOdiCO/kiuKi/a9L/SK
	 cKG3D3ZZTnQi8GmygJq9woyCi7Hk0XiwFxz7r90N5FBSCbdijtfvPoHb8HiyO9Imd7
	 CoGO9otLdF/GjOM+LCtLRpNC6E/nd2heY5K2gnuBaWS2urid/DMIJZOXE38Op/GzjE
	 29yQq7Bg9UMVA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7F3C7F4006A;
	Thu,  5 Feb 2026 20:14:12 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 05 Feb 2026 20:14:12 -0500
X-ME-Sender: <xms:ZECFaetZLCZ4stShInvfg29DOdQvaMICmmf1-fUKe2AfHErYKhMdng>
    <xme:ZECFaUwcIWZ-6MAbJ8nzoauzw983sjTjZ2KcOvpoLgjDX_oAO3YXc5gxIMHsM3Awg
    gwrpwC0qGAsd05BPGoh0pb-lGGC2v3DmWTvzWdq0VdMLnnDcG1P0Q>
X-ME-Received: <xmr:ZECFaeZYxNQ6P-_ujDcN9yXRhIYRcLbMYRBmD3PcdVfqIQ6Ok88OyOnXm6JWCtu8LJl14aZlaazCeLITDZdRGpKUTBqKf_VP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeeikedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elueehtefhtddtgfejvdejueehhfekteevueeuueekgeetieeggeehvdffhefhhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrd
    gtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhushhtqdhfoh
    hrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZECFab4lPBLNZ4iuzCWmx0DKajuXwyXgagksZIcO13tLCBLWdJ9q3g>
    <xmx:ZECFaV5j0qJDk7PaoOW7bnNr11I7q8o87oDXDHNH6FcqryTmpIV4eQ>
    <xmx:ZECFaTWK75Ljk3pGWlQpA3VDNz9SnJa2NPpvhf_e3jZIHm0xpF6vEA>
    <xmx:ZECFaR66w_l_Spqml_nmSJVDGNMIfuKangE9QkfmEHKUClglmO4AVQ>
    <xmx:ZECFacGJbd8_ZVcjkMjN7L5AnSik-YYuu3GA5w2S9ycZSirvGKMNbfOZ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 20:14:11 -0500 (EST)
Date: Thu, 5 Feb 2026 17:14:10 -0800
From: Boqun Feng <boqun@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <aYVAYq1oM78glL7w@tardis.local>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
 <aYUOME2XV_ZmRk3F@tardis.local>
 <1a332333-0706-4548-8fbe-d65956f70f99@nvidia.com>
 <44507281-87bc-4548-b542-addf3477921c@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44507281-87bc-4548-b542-addf3477921c@nvidia.com>

On Thu, Feb 05, 2026 at 07:50:03PM -0500, Joel Fernandes wrote:
> 
> 
> On 2/5/2026 5:17 PM, Joel Fernandes wrote:
> > 
> > 
> > On 2/5/2026 4:40 PM, Boqun Feng wrote:
> >> On Wed, Feb 04, 2026 at 12:12:34PM +0100, Peter Zijlstra wrote:
> >>> On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
> >>>> But I'm really somewhat sad that 64bit can't do better than this.
> >>>
> >>> Here, the below builds and boots (albeit with warnings because printf
> >>> format crap sucks).
> >>>
> >>
> >> Thanks! I will drop patch #1 and #2 and use this one (with a commit log
> >> and some more tests), given it's based on the work of Joel, Lyude and
> >> me, would the following tags make sense to all of you?
> >>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> > 
> > I don't know, I am not a big fan of the alternative patch because it adds a
> > per-cpu counter anyway if !CONFIG_PREEMPT_LONG [1]. And it is also a much bigger
> > patch than the one I wrote. Purely from an objective perspective, I would still
> > want to keep my original patch because it is simple. What is really the
> > objection to it?
> > 

PREEMPT_LONG is an architecture-specific way to improve the performance
IMO. Just to be clear, do you object it at all, or do you object
combining it with your original patch? If it's the latter, I could make
another patch as a follow to enable PREEMPT_LONG.

> > [1]
> > +#ifndef CONFIG_PREEMPT_LONG
> > +/*
> > + * Any 32bit architecture that still cares about performance should
> > + * probably ensure this is near preempt_count.
> > + */
> > +DEFINE_PER_CPU(unsigned int, nmi_nesting);
> > +#endif
> > 
> If the objection to my patch is modifying a per-cpu counter, isn't NMI a slow
> path? If we agree, then keeping things simple is better IMO unless we have data

I guess Peter was trying to say it's not a slow path if you consider
perf event interrupts on x86? [1]

> showing that it is an issue. This is code is already quite convoluted, let us
> not convolute it more with 32-bit specific things.
> 
> I had tried moving it to DEFINE_PER_CPU_CACHE_HOT, but ISTR that did not work
> out (I think something about a limit to how many things could be moved to cache
> hot).
> 
> Happy to revise patch again with any other suggestions,
> 

[1]: https://lore.kernel.org/rust-for-linux/20260204130027.GE3016024@noisy.programming.kicks-ass.net/

Regards,
Boqun

> --
> Joel Fernandes
> 
