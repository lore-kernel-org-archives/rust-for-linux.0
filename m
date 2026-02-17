Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26737416C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354045; cv=none; b=Il4TTHMI69YuNXdV/nMLU8HyY5qA8YP+nT6gK2Fh4x8kADEjvq2jKsu6lCwh7ZaHM5bmkPu5B2bUgJ7VzMXAqSAxVXk4TmvIYi3u6J6lguF4RMKs8fbbq0//UzEL4c139aPU6KLd1F/1GP3F7wpBFNpb2B1vAHZdpbtiZ+lY3Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354045; c=relaxed/simple;
	bh=WcoLwLQKYqFYG7eyApsHhIbnKT4ueo5I7JT+p13FMtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VK49ykNK/oUq9Fi9x/RwUf5wVHhiwSHnXEzO3cOvDk6jfjSehF7uqiFXlE28cEwT6O8Zbw7Cp5spmrYVJIDLDhUbTz8z/O8di2SH9KF58yD/CC/qSsOLVIYeBUuVI5CKtcZj1si8qjzvORsE5d1424o05l7C2V6N0XIEfGea7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBwuAYlG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBwuAYlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76187C19421;
	Tue, 17 Feb 2026 18:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771354045;
	bh=WcoLwLQKYqFYG7eyApsHhIbnKT4ueo5I7JT+p13FMtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBwuAYlGgaGgsXA8Kkz5XVMh4SNzoiNDdwIkW52Vg/PRJdbFPFMFfmn1C4HjoFTcI
	 uq+zMXMh964YKFyzEnmCSDZHUxdCFNey8lZJdk2KtsmyRGJc3p1jL7bfjBQoAmkxEU
	 uHsaxdpaVO4HaQHzDRJEg4hEFajrJa9VP5YhEeh1Yia6NFA7qrD8oqflt3tiYtztTT
	 Rqr2SCWSnLCSDag3MEey3M9t3kgrzom/7n2ut1oyFTxU99mRFn00sTnBFmwnxpYClO
	 JoxvIiBTV4ektIPPLuqxKluU2SARTkZEN9wWXXsNpGDHfa+J1zej9s8CQt+abyhGlh
	 gwo2IfH5H78cw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 923A6F40068;
	Tue, 17 Feb 2026 13:47:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 17 Feb 2026 13:47:23 -0500
X-ME-Sender: <xms:u7eUaVNW-zWqtufYm9_LbeoOK1VromChNjDcUBAW8I3bwd2B1IFtsg>
    <xme:u7eUaT4SW6NZX3j99UYQhc2NJ8x9cjq5B9nZcQ7jped--K8bAF-ZWDj9QF_ljy1LE
    F02a2U1m2cQhbtxB1bWTRHR2BbcB_qc8Fkhr0xikbMbqIxmLj1s6g>
X-ME-Received: <xmr:u7eUaaYUNLhd_WjDsNX8xyhwt42FWb5fIi_JEUGCCUNXCZf677UwHqLKue_CV7kBE-N982Zc06tQOfwjvoPxroZ9IgRiUzHv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvddthedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtghlvg
    drtghomhdprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhm
    pdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqh
    hunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihg
    uhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrd
    gtohhm
X-ME-Proxy: <xmx:u7eUaYHHZ1hdyNaGFbqped33ByQXLYmhXkkV4XV9IxW_2HeQnsq39w>
    <xmx:u7eUabmKGbemH6hcxaxU0gmEln0S9et69XEBG6TX5TM9k7O2E6L-HQ>
    <xmx:u7eUaXniNtY1V4eWfiyACqYVVr6e-FtqrzgNJck-k5hMYQr0w1hX0Q>
    <xmx:u7eUaQVDAoWoL3673wK80s4XD7vMixwUO4-ekyOUtuRgTqAfLOIY0Q>
    <xmx:u7eUaV-e4ypgAY3Xrj2taoTe95VfGFSpAKHW3Klica3fTMlrlxht7Va9>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Feb 2026 13:47:23 -0500 (EST)
Date: Tue, 17 Feb 2026 10:47:21 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aZS3ubEjQo8cycdu@tardis.local>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <20260213112837.GT2995752@noisy.programming.kicks-ass.net>
 <aY9UedlaCmagVmzh@tardis.local>
 <87tsvjsppz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tsvjsppz.fsf@kernel.org>

On Sat, Feb 14, 2026 at 09:18:16AM +0100, Andreas Hindborg wrote:
> Boqun Feng <boqun@kernel.org> writes:
> 
> > On Fri, Feb 13, 2026 at 12:28:37PM +0100, Peter Zijlstra wrote:
> >> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> >> > When copying data from buffers that are mapped to user space, it is
> >> > impossible to guarantee absence of concurrent memory operations on those
> >> > buffers. Copying data to/from `Page` from/to these buffers would be
> >> > undefined behavior if no special considerations are made.
> >> > 
> >> > Add methods on `Page` to read and write the contents using byte-wise atomic
> >> > operations.
> >> > 
> >> > Also improve clarity by specifying additional requirements on
> >> > `read_raw`/`write_raw` methods regarding concurrent operations on involved
> >> > buffers.
> >> 
> >> 
> >> > +    /// - Callers must ensure that this call does not race with a write to the source page that
> >> > +    ///   overlaps with this read.
> >> 
> >> Yeah, but per the bit above, its user mapped, you *CANNOT* ensure this.
> >> 
> >
> > First, this safety requirement is actually incorrect, because of the
> > user mapped case you mentioned. I believe Andreas put it to prevent
> > others from racing with memcpy(), e.g.
> 
> Since context is a bit washed out here, let's make sure we are talking
> about `Page::read_bytewise_atomic``.
> 
> There are two buffers in play. `src`, which is provided by the `self:
> &Page` and `dst: *mut u8`, which is passed as a function parameter.
> 
> The requirement for `src` is:
> 
>     Callers must ensure that this call does not race with a write to the **source page** that
>     overlaps with this read.
> 
> This requirement is different than the requirement on `dst`. I do not
> want to enforce that all memory operations on `src` be atomic, simply
> that they are synchronized. This is a weaker requirement than the
> requirement on `dst`. As we hold a shared reference to `self` and there
> is no internal synchronization, I think this is the correct requirement.
> 
> For `dst` we have:
> 
>     For the duration of the call, other accesses to the area described by `dst` and `len`,
>     must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
>     function. Note that if all other accesses are atomic, then this safety requirement is
>     trivially fulfilled.
> 
> Which is also requiring no races, but is specifically mentioning atomic
> operations, which I did not want on `src`.
> 
> With this in mind, do you still think they are redundant?
> 

I see, I've overlooked and I was confused and I guess Peter was too. The
`dst` could be a user mapped page, but the `src` cannot be. I.e. it's
function that copying a public `dst` to a private `src`, of course you
can request no concurrent access to the private `src`. So his objection
is invalid.

It's not redundant, but probably we can make it more clear. Maybe we
start by saying:

/// Notice this function is guaranteed to performs an atomic byte-wise
/// memory write to the `dst` side but it may only perform a normal
/// memory read from the [`Page`] `self`.

Then

/// # Safety
///
/// Callers must ensure that:
/// 
/// - `dst` ..
/// - For ..
/// - No concurrent write to the source page `self` that overlaps with
///   the read.

or anything else that could care out the difference between `src` and
`dst`.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
