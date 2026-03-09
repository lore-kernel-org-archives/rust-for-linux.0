Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83F3D4115;
	Mon,  9 Mar 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071662; cv=none; b=eSM+ZCWYDD+nDBNiZfEYqLxGqR9KTNLHnT/yd4UE0ikgUfmiaBwRR0/wMdlceLtEq/p0bkMSswJx/kNAHd5wIQXePbT0BIvZj6zVCNLYclfn/FuZCR7FbDbAJyZL9TM7WwqcLPUpXwTA/NgsnKtrW765H/6Z76aRiVYTxSluioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071662; c=relaxed/simple;
	bh=ocMdYWfcp/pmxMibgxaBxKgoTLXfmu/ergtQ+1llIZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYnzvtkUzg0vVXxl7QSDfd8Sf8KrzfLdtNWEOUquW9Psk6tDteFIvsQg/ldtl5iUkB+33dA+edvhG9jpkBU0lpr9oIBmq3N0fq/P/p6Oohxi6dbEKvCQPJaWg/AdfOm0T2KaDJ+MLlAjxyyA3d137BBSPxX0n7hYxVNSwWZRRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPO47+Ug; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPO47+Ug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E87C2BC86;
	Mon,  9 Mar 2026 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773071662;
	bh=ocMdYWfcp/pmxMibgxaBxKgoTLXfmu/ergtQ+1llIZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPO47+Ugn9I0KaSSJTAgmn/ZXbTt6giPJshXINfGmSjy/NLmd7nh5m1gpZB8lpKvL
	 yKsOyl+Af4xxh0NPJ1IzKnDOMjsGMhk8G95Yhwnby7ppc+trLQ4/ek0qUqU1Vi3J4+
	 g2yuCEDa9fo0m6BPchY0TROgMLkAMlOsE0WSxxJKURQ5prMOdjTAfNYOJzWfd1fZxq
	 iYMg4Qpv1Mj9EEwvxTLOQIb9NHNpsfXhgE6/20q0BminNavqVJ5CxN37VW8b7KpgcI
	 YrVlIdfjyu5De+hhWKt40taqFV4AXIZl6NU1Z8s+yv77P1RBxJSWL+IXYgIlPtikSK
	 hvoalv0PZtRKg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9BED8F40068;
	Mon,  9 Mar 2026 11:54:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 09 Mar 2026 11:54:20 -0400
X-ME-Sender: <xms:LO2uaekAurHLgXs-g2ApFHZGPGXoBP4yxKzxtZ83NuqEXEE7E9pB4g>
    <xme:LO2uadaIYQQTsWHL-vfCICQiQQuhuFdyiQK3TrhEq2jQ9j7-CSgQX0UnavSICLtCl
    OzQaxTZgEp1Zyf60QjL62LxFZepx5xSZkUrtPQIebQQDebLleSlDQ>
X-ME-Received: <xmr:LO2uacSRalKEjtWbmtwW0mUaiLDQWU-zItvfo0SY35QESsKATfNwd6bOLZqGniLU9oVgO8fimBiV1QPRRXnNpY0NjPbSFYQ6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeekheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elueehtefhtddtgfejvdejueehhfekteevueeuueekgeetieeggeehvdffhefhhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghp
    thhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoh
    eplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhr
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhm
X-ME-Proxy: <xmx:LO2uafWHueIg0X2WLZVh-2K9FkaXLfGfANt4V6ICvsZw_1qwKpk5Mw>
    <xmx:LO2uaTaJUhmPUbiWHqhyorardJxulCfqfDWlB-CmwJge7E76UvjYlQ>
    <xmx:LO2uaQ4uuSAnjN8qKaWV9DlG_iHJ5p-PfGjp6Z2VxV4ZXWmusgsFFA>
    <xmx:LO2uacxLHV2dNpeqRtwddWcXysnY6nkB2CiOGh50a80c_AdEMao_4g>
    <xmx:LO2uaZrZCJGlTZsOt6_egF5aU_mOqi5IJ-RrM28YQd60u2X423GrTdLI>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Mar 2026 11:54:20 -0400 (EDT)
Date: Mon, 9 Mar 2026 08:54:19 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] [PATCH 00/13] Rust atomic changes for v7.1
Message-ID: <aa7tKy9iVpZjKMVg@tardis.local>
References: <20260303201701.12204-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303201701.12204-1-boqun@kernel.org>

On Tue, Mar 03, 2026 at 12:16:48PM -0800, Boqun Feng wrote:
> Hi Peter,
> 
> Please pull these changes of Rust atomic in v7.1 into tip/locking/core.
> Major changes are the atomic pointer support and a boolean-like
> AtomicFlag type (using a byte if arch support efficient xchg/cmpxchg
> over bytes otherwise 4 bytes). Thanks!
> 

Gentle ping ;-) Thanks!

Regards,
Boqun

> Regards,
> Boqun
> 
> 
> The following changes since commit 3dcef70e41ab13483803c536ddea8d5f1803ee25:
> 
>   ww-mutex: Fix the ww_acquire_ctx function annotations (2026-02-27 16:40:20 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-atomic.20260303a
> 
> for you to fetch changes up to 68d1c8ac7f0b1f0de92a803b9b71090fd1b86d17:
> 
>   rust: atomic: Update a safety comment in impl of `fetch_add()` (2026-03-03 11:55:57 -0800)
> 
> ----------------------------------------------------------------
> Rust atomic changes for v7.1
> 
> * Add Atomic<ptr> support.
> * Add an AtomicFlag type for boolean-like usage with
>   architecture-specific performance optimization.
> * Add unsafe atomic operations over raw pointers.
> * Add `fetch_sub()` for atomic types.
> * Documentation and example improvements.
> -----BEGIN PGP SIGNATURE-----
[...]
