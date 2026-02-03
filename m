Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEEDE55C;
	Tue,  3 Feb 2026 01:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770080880; cv=none; b=Gg85L2WTX9EQaNN692zT7hT/i1X1bkm0mhPMZva0+dZ4gC+GRCTGxMIRwCZg4Ux1Lm88W4KJGQTJzwBbd5y14M1QVllDCAx/TE3rxvYgzljYP1dOjX5+ln5cNm+vTpDAqSQFvid0gIWUQSrovzCwa+OphpW0qcvtZnhC98YftYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770080880; c=relaxed/simple;
	bh=Lxv8UzOQzU0hdXe1SMCeEUPqA0rLHi/CHvbVzHJtmmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXtoehQGpAH8B42NFOR9z1PKZ1Bax048u96eIxwjRhkTnPTUV+vIcvKEEZ8aL6Fdpe3bPO1zIgvUOzWK4v3f115Ec4VlW9w65lVOsiaJaHirO7XKvnSPp47YbO7JrQ1JC3n6EBfDDThcCqBemfB6Y55k0KXSvV+ihisRwSdOh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfeQ7DxL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfeQ7DxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532E2C19421;
	Tue,  3 Feb 2026 01:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770080879;
	bh=Lxv8UzOQzU0hdXe1SMCeEUPqA0rLHi/CHvbVzHJtmmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfeQ7DxLGWwVh9J3Q/pdW7E5dDWg7Z0Q44LLKtN+r5gJGE4iOYrS8cxB0IgO0s2hh
	 3fC5OP/W0WQWmFqpD0v1MF6WRye6y/WPjBjJNl65a/txRw4EoWq04ZIgT9onuhB9+t
	 2CnmwCxKUXBgaExTERYYUP+VxqHHDlc5ghOPkPXxv8+ROVsuc3ortqwOvT3NzK7mv2
	 cKT/60zGCu/7P58YJXBwuoJhc70oIfaQr1McGAdZQgFHNSyGkUvFle+Jo3kknFMR8f
	 grbROcTiZ/3mStKTQ5gvM8vpz19oq3fMHzioUiS3qNbN6fQ7+fM+PejsfkLRITMaNL
	 OdZ+eeaRkP9uA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 607D1F40068;
	Mon,  2 Feb 2026 20:07:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Feb 2026 20:07:58 -0500
X-ME-Sender: <xms:bkqBaSIIzc9CiBpspt8UhCoUtDgnoWXvTa7ZZfrw_XJmkmmBonA0vg>
    <xme:bkqBaUgXKDLua8HTwBnDAip1stjhYjirNxQvt5249q-w5ulGII7aYdBDdetBz9Uo8
    X7V83KPWtF6w_NmQuYJn4c64tYRVYL-bsZM0YMnT8lqzR3uebwJGg>
X-ME-Received: <xmr:bkqBaY05I_OKjVrTwTShSNOsIzF_nGh4NasNUJ8MvEZHazPTE-cXr-9MiHq7ANO0cg4xH3bEygsfT4S5fvg-dltKY09IDiNB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeeludeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehkeeijeeggeehkeehtddthfdtgfejueefleeutdefjeegvefhhffgueeiteekfeenucff
    ohhmrghinhepohhpvghnqdhsthgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkh
    gvrhhnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhorhgvnh
    iiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheplhhirghmrdhh
    ohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdp
    rhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtph
    htthhopehlohhsshhinheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bkqBaShTF5tlaJntCfmXlvSAgPCe5HMcV3NnFEo81xeA2sraB0a98A>
    <xmx:bkqBaR9dr-qnQ7G2wBqCX_0bTLM8d0PInNyNB8GHRBduKlWwXYzA3w>
    <xmx:bkqBaWLzkmixNEwSeZo8yVC1ZS-sHIgckaHLhzbVMkWeLJFhVmC_xA>
    <xmx:bkqBaewcd0hqWG56bd1dFiJgAlAh7zBh7gfPvoXE9nxHG-H2xkvYDA>
    <xmx:bkqBaR0o1YbFxMuSpT12D16E_9w8l6Al8tEVaVZ31CW8odarUlu-lc_S>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 20:07:57 -0500 (EST)
Date: Mon, 2 Feb 2026 17:07:57 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
Message-ID: <aYFKbWfQmTInYy91@tardis.local>
References: <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <aX0lcVngRcRwqgd5@tardis.local>
 <SEV7bR_nyQNtvtgoO8X80HMkMTPLW_6roBSxJ-MpKHHNmkZQyVxSS9k1iFV7-bgAlHSLM566L8EqtRBnht65uA==@protonmail.internalid>
 <aX2tyn9nBUEKM-SN@tardis.local>
 <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
 <gKLHFGuJqzRyjCupif-LFYn2ZY6OmhkyYj6idYTOnN4zMmNacFLBD1G9zzsYpTJn13GGvL0i-7JA-lIlBgakgQ==@protonmail.internalid>
 <DG2WLWJD8V5W.2I24LZKS6JG6Q@garyguo.net>
 <87bji9r0cp.fsf@t14s.mail-host-address-is-not-set>
 <878qddqxjy.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qddqxjy.fsf@t14s.mail-host-address-is-not-set>

On Sat, Jan 31, 2026 at 10:31:13PM +0100, Andreas Hindborg wrote:
[...]
> >>>>
> >>>> For __user memory, because kernel is only given a userspace address, and
> >>>> userspace can lie or unmap the address while kernel accessing it,
> >>>> copy_{from,to}_user() is needed to handle page faults.
> >>>
> >>> Just to clarify, for my use case, the page is already mapped to kernel
> >>> space, and it is guaranteed to be mapped for the duration of the call
> >>> where I do the copy. Also, it _may_ be a user page, but it might not
> >>> always be the case.
> >>
> >> In that case you should also assume there might be other kernel-space users.
> >> Byte-wise atomic memcpy would be best tool.
> >
> > Other concurrent kernel readers/writers would be a kernel bug in my use
> > case. We could add this to the safety requirements.
> >
> 
> Actually, one case just crossed my mind. I think nothing will prevent a
> user space process from concurrently submitting multiple reads to the
> same user page. It would not make sense, but it can be done.
> 
> If the reads are issued to different null block devices, the null block
> driver might concurrently write the user page when servicing each IO
> request concurrently.
> 
> The same situation would happen in real block device drivers, except the
> writes would be done by dma engines rather than kernel threads.
> 

Then we better use byte-wise atomic memcpy, and I think for all the
architectures that Linux kernel support, memcpy() is in fact byte-wise
atomic if it's volatile. Because down the actual instructions, either a
byte-size read/write is used, or a larger-size read/write is used but
they are guaranteed to be byte-wise atomic even for unaligned read or
write. So "volatile memcpy" and "volatile byte-wise atomic memcpy" have
the same implementation.

(The C++ paper [1] also says: "In fact, we expect that existing assembly
memcpy implementations will suffice when suffixed with the required
fence.")

So to make thing move forward, do you mind to introduce a
`atomic_per_byte_memcpy()` in rust::sync::atomic based on
bindings::memcpy(), and cc linux-arch and all the archs that support
Rust for some confirmation? Thanks!

[1]: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p1478r5.html

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
