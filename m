Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482B41EB5E1;
	Fri, 13 Feb 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770997523; cv=none; b=QHiXw7pxgpDphoeb7pxs7GqMR6vOfajRmO7tdvtJ4R7FnUa2gR4vSDSTlQyfeqPvvBsGXu4TFbi3oduBpoebnIKojSB8Ko0DrIdQ6pMHi9fU3zRSERIwUMVEZl47idb+LzkppRkdLlaNoqbnYKSzXyU7P4QR8kB3LjlnWjgg87g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770997523; c=relaxed/simple;
	bh=fuTx15yFTxhe4W7/BhW2RKNzR0Hi3SfXJnorfKREQ2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaQ2ZY1aKjXoEuiad5tnv3hIAvz6Ld5XMZr41GqiWefHhG+RAd5iNhbVJ13txEb2M7eWtv/L2FydpIyr+ABNnjyV4tUiS5nILR3S2eEV2SylohH49cKBj0sHQL+6MtYjufNK+N+DAb1chfBwjBAS57l6dF4Kn+HWx/Z/0/Q/hao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3MM4zxv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3MM4zxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2C3C16AAE;
	Fri, 13 Feb 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770997522;
	bh=fuTx15yFTxhe4W7/BhW2RKNzR0Hi3SfXJnorfKREQ2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l3MM4zxv0MiTo2wKJ2i2NRNGrE/BCDraT1jV4ykLKDU2yJSucCYFxF6c4xQ9DCb1V
	 jWw2yPJVNWXwq1VZt1cNEm3IWoDS6EMBApo6cHQ8EljV7u10ScG1bh7yN+MfQ8fVIA
	 iuHzWSQEYmn16Ey+cf9n7xypHJkH0945tOC7ly5HsI6CUM2AkLtVYTnA6oWfuWxoq9
	 WJhs7XOOEzfXN4XlaFzlFk7m6K6DpzdHiFRVAg17QJas4qo7gM8ql7VbJ14H/v61Qj
	 9WEfbADg16d7YeRQGDWTUvoEBQqgjCuAvNHKSbUVRR9iTf5UrjCa+gWG4CoCHGYFUr
	 4tgaERAk0YbWg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5574DF4006D;
	Fri, 13 Feb 2026 10:45:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 13 Feb 2026 10:45:21 -0500
X-ME-Sender: <xms:EUePaY1KvQ4JLY5gmtQg1EFdqHnBHLkmQYx7y3_8kUKOrpTGSKIX3Q>
    <xme:EUePaUcDqrn25Lg23j85d7w_pP-YFObnZfkYF8EQ7E9ZJGar87fSdQtWuYpzsHZnk
    5pR4KacO0pUX9BAJbuZ_EHtS9GgKX5cI3f8Af_OcTfoo33WXARPtw>
X-ME-Received: <xmr:EUePaaLuf__dT1BHzdPzOOyox4eFyAfCLlQKHk9bNpQSrF8b2aMWaxckBcaLfzr2_hSDlGBf8BlIWN4TX9jmezgDgA3sLp2J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdekieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehkeeijeeggeehkeehtddthfdtgfejueefleeutdefjeegvefhhffgueeiteekfeenucff
    ohhmrghinhepohhpvghnqdhsthgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkh
    gvrhhnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudelpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhho
    rhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheplhhirg
    hmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:EUePaaHdLDclBdO7klwUFy4R70iYRyeIP9AuXIesLeN_ms_q7n3hZg>
    <xmx:EUePaR4NS9Ho_VOpJ8PS4cUlKTMXu2gAQMdhWoflzs2772DQbG9Sng>
    <xmx:EUePaV3nSLss3CIbLXyVt7nG4EVheKzWDlVNjpv1zKHejqFUN4vWNQ>
    <xmx:EUePadhik9-Jbu1xdhvU6wB-_-xh9zACzcPooyk-2qDENPCpbGoMEQ>
    <xmx:EUePaRReZTDK5S5mHAWUiURtVaqRz8LnbwcwJmEJHM-Mdt8E7LSYVPFa>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 10:45:20 -0500 (EST)
Date: Fri, 13 Feb 2026 07:45:19 -0800
From: Boqun Feng <boqun@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
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
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aY9HD7nH5A-DtgmR@tardis.local>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021311-shorten-veal-532c@gregkh>

On Fri, Feb 13, 2026 at 04:34:04PM +0100, Greg KH wrote:
> On Fri, Feb 13, 2026 at 03:26:08PM +0100, Peter Zijlstra wrote:
> > On Fri, Feb 13, 2026 at 03:13:01PM +0100, Andreas Hindborg wrote:
> > 
> > > C uses memcpy as seen in `bio_copy_data_iter` [1] and in the null_blk
> > > driver [2].
> > 
> > Right. And that is *fine*.
> > 

Yes, that's fine because memcpy() in C is volatile and per-byte atomic.

> > > Rust has `core::ptr::copy` and `core::ptr::copy_nonoverlapping`. I was
> > > informed these are not safe to use if source or destination may incur
> > > data races, and that we need an operation that is volatile or byte-wise
> > > atomic [3].
> > 
> > Safe how? It should just copy N bytes. Whatever it thinks those bytes
> > are.
> > 
> > Nothing can guard against concurrent modification. If there is, you get
> > to keep the pieces. Pretending anything else is delusional.
> > 
> > Suppose the memory was 'AAAA' and while you're reading it, it is written
> > to be 'BBBB'. The resulting copy can be any combination of
> > '[AB][AB][AB][AB]'. Not one of them is better than the other.
> > 

The idea is if using Rust's own `core::ptr::copy()` or
`core::ptr::copy_nonoverlapping()`, you may get `CCCC`, because they are
not semantically guaranteed atomic per byte (i.e. tearing can happen at
bit level, because they are not designed for using in case of data
races, and there is no defined asm implementation of them, compilers can
do anything).

> > No byte wise volatile barrier using nonsense is going to make this any
> > better.

It's byte-wise atomic [1], which should be guaranteed using asm to
implement, hence at least at byte level, they are atomic (and volatile
in our case).

[1]: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p1478r5.html

> > 
> 
> I'm with Peter, just call memcpy() like the C code does, and you will be
> "fine" (with a note that "fine" better include checking the data really

We are. See v3, we actually use `memcpy()` for the copy (as I already
pointed out, Andreas made a mistake in this version), it's just
because it's per-byte atomic. What this "byte-wise atomic" does is
clearing things out.

Regards,
Boqun

> is what you think it is if you are going to do anything based on it and
> not just pass it off to the hardware.)
> 
> thanks,
> 
> greg k-h
