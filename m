Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C935DA77
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 16:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773852430; cv=none; b=hPRIEbE3cxbzd6TXokyyHDuwxqYoTWRUR6PnV5FStEzWfV9rSxpTPMOwolXH+yRJSIlBAD73rTzA8lrF9ZuomafElCbawRx+CtLCqAIT5Ca3Ryqv2EKSiklPNUV4Vcuyzc/0mreQmaTJ3eQ1HgdJGS+5HPLq5yS/nyz0ZSZ7/F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773852430; c=relaxed/simple;
	bh=XHzqEMf3DkqRSy6VnKHu1Najbv2105kUs4VnPfk/SmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obhO69j4uELeTc25L4NBxgDE/weQouTFxUR137y3qDSKuunDy2wm3jKRt0xKIV14C73PjkKtl/WTVCqy/srP+avrxTNlCX5ZLd0D7gv7RA4gLKbEaLgDSRwRW1YhJnnQG7Uv+L019cdeY2XBUFbyed8a3pGVEzhq3ZWkjyUJPVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1v+8CEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1v+8CEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA566C4AF09;
	Wed, 18 Mar 2026 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773852430;
	bh=XHzqEMf3DkqRSy6VnKHu1Najbv2105kUs4VnPfk/SmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1v+8CEPQU8nZNdDxq4Bx+9kVX/BRjRD7sZQyvJ/5XnaN2wQ/SnpMD59tdxyHHRCP
	 IIjkHWajMPqZ8+CgpiQobbwGUXwOIgLcaN9sALh0A6VxzjbO9lmjw4f1V7VI3EtkYT
	 t4ab34ecsF78Ntk8LrrM7HFPHjiLjR/ssyptgaxkmNJjE1bfeWcKb4CudaUv3bzFPD
	 UR2clyfKN0maAZZhhYxDMaKOwZLhktXhtgBL13EnbI0cnSztxcHKuhJgO5+crHXil+
	 0JXLxI/2ARumBjHSNLdKHw7o+xXJwiQcZziGqWs1g+rTFmz5I0AGdGQW0ikcaoo2Mq
	 qCzgTl1E9Youw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7FD50F40080;
	Wed, 18 Mar 2026 12:47:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 18 Mar 2026 12:47:08 -0400
X-ME-Sender: <xms:DNe6aQ2ZeDzXbFDzY9LSEL1juLDrvxj8qfuzx_DZbIU08u8eXU0IHw>
    <xme:DNe6acoVhakdQHckwWM0Z1MLYQQVv6QH3ZFJ9jFljeITVjUIRm_31XaiTquUYF0F9
    WU7exdP-jMrIYdpdvK17MdutruLTBcgwJ2Cm-zL2J0mXEp2hOZxqg>
X-ME-Received: <xmr:DNe6aYJZAEgb72g0N_ARxqzB_U0lyKKYfhgSh8z3EJU8BywOB44ZMEEtqBc30FkSwXjJyXcfwe5oImu_9u4P3ZcAow-hevmm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    duveetffffvdekleevtdejvedvkeetteelgeekgfejgfejtdetteffgeekhfejheenucff
    ohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprh
    gtphhtthhopegrsegrlhhitggvtddrtghomhdprhgtphhtthhopehojhgvuggrsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilh
    drtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitg
    gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhi
    tghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:DNe6aQS6Z2PxkaseqNtXkR4pTAlZ8H3p2a7k9KoO9cvxKu6wbSQSZg>
    <xmx:DNe6aYPZkkGIEfeElts3szdYaCMESMQvF2aKg0347quAKTc8t7TOrQ>
    <xmx:DNe6aVXNIExzzp9ImNLxvuQS6ZuBJYsWgWyjfgo4SHVrW7KxsxrNSA>
    <xmx:DNe6abjsvV-3hq5VdVIFpX1tBJvDIfbgeZ7MGCBbIWhnyiNRZtErJQ>
    <xmx:DNe6aei5mJWS_rN_xEV2E3l0-2vgzmm41PD05pn25Zzkhx325zsSsvrb>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 12:47:07 -0400 (EDT)
Date: Wed, 18 Mar 2026 09:47:07 -0700
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Fabricio Parra <a@alice0.com>, Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: completion: mark inline complete_all and
 wait_for_completion
Message-ID: <abrXC3qXPBZZU3ku@tardis.local>
References: <DH45DQFO909K.1JK6IKMX51ZAV@garyguo.net>
 <20260316151056.287-1-a@alice0.com>
 <DH4B17PQCNI6.9D1TIDB6ALGS@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH4B17PQCNI6.9D1TIDB6ALGS@garyguo.net>

On Mon, Mar 16, 2026 at 03:16:50PM +0000, Gary Guo wrote:
> On Mon Mar 16, 2026 at 3:10 PM GMT, Fabricio Parra wrote:
> > When building the kernel using the llvm-22.1.0-rust-1.93.1-x86_64
> > toolchain provided by kernel.org with ARCH=x86_64, the following symbols
> > are generated:
> > 
> > $ nm vmlinux | grep ' _R'.*Completion | rustfilt
> > ffffffff81827930 T <kernel::sync::completion::Completion>::complete_all
> > ffffffff81827950 T <kernel::sync::completion::Completion>::wait_for_completion
> > 
> > These Rust methods are thin wrappers around the C completion helpers
> > `complete_all` and `wait_for_completion`. Mark them `#[inline]` to keep
> > the wrapper pattern consistent with other small Rust helper methods.
> > 
> > After applying this patch, the above command will produce no output.
> > 
> > Link: https://github.com/Rust-for-Linux/linux/issues/1145
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Fabricio Parra <a@alice0.com>
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> 

Queued in rust-sync, thank you!

Regards,
Boqun

> > ---
> > v2:
> >   - Fixed malformed email header (RFC 5322) in the From line.
> > 
> >  rust/kernel/sync/completion.rs | 2 ++
> >  1 file changed, 2 insertions(+)
> 
