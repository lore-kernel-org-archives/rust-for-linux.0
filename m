Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0C35F8D1;
	Fri, 13 Feb 2026 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988856; cv=none; b=Wnr3zvK5afUEBbRr94p4jwLzgmTziIo1/DDYfu8+jYm30q2wEVSRgjzkRNO+tUuiYVHHWig8NCjoF8xRfW2yAghnmL+BWhLakCIrYgzGFJxLI+/aJ9J5gn6Vt7xdYo9V7ri/a8Ayiibn+6eXoCmiPvp0DYZbC6sdZESs84n49BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988856; c=relaxed/simple;
	bh=hF4hv4U8p+fXcqD0HeUigo1N9WJ/LrK0qTkc3d8CqZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dU2op2GSEnZX86HNIQ1Of14HLiATDDYv9obRAirrkcARFFN9hiORiNAb2dxAga9Hvi39++EWf/e2TRm3RIXYT/GwuyAmICKgTJYYuirpLypQULEntxFv5HUV6W2M4vv3o2nMyyZZtQZS0QjD/d5GiPtd2MH26M94AfIXvv1aMdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WZl+2gWG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WZl+2gWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CDEC116C6;
	Fri, 13 Feb 2026 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770988855;
	bh=hF4hv4U8p+fXcqD0HeUigo1N9WJ/LrK0qTkc3d8CqZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZl+2gWGc93SuLHD4CnWD+hQssKxOpcWz9hcZ32PuaKgxz1X4V2R+kvwXaHkSmVqd
	 tlG9L7jzsE6KO7eA0Zlpxy/9ko7W7SlARnrVZcnZ2hZgxW0pd4kr1ZZw1EZiu1r9hN
	 sKNGN/L3asPmz45cndh8BcLCSDv7YqlXGATM7MdQ=
Date: Fri, 13 Feb 2026 14:20:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
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
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <2026021313-embody-deprive-9da5@gregkh>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bsgu7fb.fsf@kernel.org>

On Fri, Feb 13, 2026 at 01:58:16PM +0100, Andreas Hindborg wrote:
> "Greg KH" <gregkh@linuxfoundation.org> writes:
> 
> > On Fri, Feb 13, 2026 at 10:55:57AM +0100, Peter Zijlstra wrote:
> >> On Thu, Feb 12, 2026 at 03:51:24PM +0100, Andreas Hindborg wrote:
> >> > When copying data from buffers that are mapped to user space, it is
> >> > impossible to guarantee absence of concurrent memory operations on those
> >> > buffers. Copying data to/from `Page` from/to these buffers would be
> >> > undefined behavior if no special considerations are made.
> >> >
> >> > Add methods on `Page` to read and write the contents using byte-wise atomic
> >> > operations.
> >>
> >> I'm completely failing to understand. What!?
> >>
> >> There is no such thing as an 'atomic' byte load, nor does it help one
> >> whit against concurrent modification of the memory you're copying.
> >
> > I too am totally confused when reading this patch, and the previous
> > ones.  Shouldn't the "normal" copy_from_user() stuff be used here
> > correctly?  Why is anything new needed?
> 
> One use for this is copying data out of a `struct bio_vec`. As far as I
> know, there is no way to know where the pages backing a bio_vec are
> mapped. They could be mapped to user space.

And how does C code do this today?  Surely there's a function that is
used there that we should also be using here, right?  Why do we need
something different?

thanks,

greg k-h
