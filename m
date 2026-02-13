Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9172E41760;
	Fri, 13 Feb 2026 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770996847; cv=none; b=WIW/O1RzcbIxuUwI9W357Tes+/svLOeMBKOdonp1y6LMKHbE/Zc/yPjPJst/b+GPV10i0qR/Bj4iEsksrxeqy1lcGek9eL3afmwzNNA3gVPUPTdnG6shyr/Vqa5rJ/ZNCUMoVB+QCtqU2gZT6e6LpPseJJV+Sv4O/oiQF/8ppT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770996847; c=relaxed/simple;
	bh=36/Z6rZPm8oNQHcyjYevKW/IjMhRwzkHb/9A18Ph3Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPWoYf7SnM+cbs6uMMZQqgAAbQwMDUoBNAL5/bsTR8DUTgPO1/WY3+DOchnkUyOtSCkPFnAqySQdtwThk5gqCDmGrgfUoEI0Ujxegle4l7+qGxMYAYCpkCdDG2hSLMVOehHd5z6drWQ1zX7BXJx2n7qpV5fQrJ3AeaYeE37A4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EjThWCDg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EjThWCDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98140C116C6;
	Fri, 13 Feb 2026 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770996847;
	bh=36/Z6rZPm8oNQHcyjYevKW/IjMhRwzkHb/9A18Ph3Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjThWCDggdVZsiY4hLoTcNGIfXz4yYtGFQIl5XKl6PmhNjKFq+boUqlEtjuRS+5NI
	 boDwh6BeFOoBqEF7Y5zAq68Qjd4DpZDclyr7OTZ9BFQa7O9Ek4Loq/BfA3JlUCxEmh
	 Y242uqstBw3Mpjf/vED3nv6RAuZEGAodfxzAyWDc=
Date: Fri, 13 Feb 2026 16:34:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
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
Message-ID: <2026021311-shorten-veal-532c@gregkh>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213142608.GV2995752@noisy.programming.kicks-ass.net>

On Fri, Feb 13, 2026 at 03:26:08PM +0100, Peter Zijlstra wrote:
> On Fri, Feb 13, 2026 at 03:13:01PM +0100, Andreas Hindborg wrote:
> 
> > C uses memcpy as seen in `bio_copy_data_iter` [1] and in the null_blk
> > driver [2].
> 
> Right. And that is *fine*.
> 
> > Rust has `core::ptr::copy` and `core::ptr::copy_nonoverlapping`. I was
> > informed these are not safe to use if source or destination may incur
> > data races, and that we need an operation that is volatile or byte-wise
> > atomic [3].
> 
> Safe how? It should just copy N bytes. Whatever it thinks those bytes
> are.
> 
> Nothing can guard against concurrent modification. If there is, you get
> to keep the pieces. Pretending anything else is delusional.
> 
> Suppose the memory was 'AAAA' and while you're reading it, it is written
> to be 'BBBB'. The resulting copy can be any combination of
> '[AB][AB][AB][AB]'. Not one of them is better than the other.
> 
> No byte wise volatile barrier using nonsense is going to make this any
> better.
> 

I'm with Peter, just call memcpy() like the C code does, and you will be
"fine" (with a note that "fine" better include checking the data really
is what you think it is if you are going to do anything based on it and
not just pass it off to the hardware.)

thanks,

greg k-h
