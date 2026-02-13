Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86281341AC0;
	Fri, 13 Feb 2026 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770985106; cv=none; b=VghcXPV02ILG12kzIYZZSc341nR2MxkkMArFi+BtM9a25F5TqCtj+V2kNnNBFv6heMHZaDrlO7hxwD9NgUKrEzVe/2iOIXSXlC9ZxjCVdzr1NQLlOKyXV//K1JF40vAL0dfaiIW6Ye/NMtXEyhgsx3F/+wL7gcYCUKZx/tcmIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770985106; c=relaxed/simple;
	bh=bA9tPEg6F6cMG3yOPhPfdhdYSRsjB1sk7KG03VOonmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LV9eshw870qrhEJJAebiqGvn68L1UGp33POotnylvkmqbNZCXgqATAdTdgDa58JW+HNGrfVjHY/YO0eOAmi8i3aqlr1CcpPObVCxyX5VCRz8L7jhP5qNotoY7drA/cWCvcAkqLQn0UrsBcmpCkQJiKJZBcLckHfbqzYu0Jn1mOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z9c50Un4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z9c50Un4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A39BC116C6;
	Fri, 13 Feb 2026 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770985106;
	bh=bA9tPEg6F6cMG3yOPhPfdhdYSRsjB1sk7KG03VOonmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9c50Un4muRZPCMs5BvWijkyktP3vyYCSwbHID+YTQkd8/WSGaF1eeWQdjFZQR9OE
	 0zLyIVuNR2oq51nOiiR+twpmf/5QWrAHR2wAY39IX+ov9bW/fGCKtMGqipiWpBEjtv
	 5TkvgfS79LOI0XmGI5yYgNiyopjXp4drKuIoBtzM=
Date: Fri, 13 Feb 2026 13:18:17 +0100
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
Message-ID: <2026021343-germicide-baritone-efe8@gregkh>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213095557.GS2995752@noisy.programming.kicks-ass.net>

On Fri, Feb 13, 2026 at 10:55:57AM +0100, Peter Zijlstra wrote:
> On Thu, Feb 12, 2026 at 03:51:24PM +0100, Andreas Hindborg wrote:
> > When copying data from buffers that are mapped to user space, it is
> > impossible to guarantee absence of concurrent memory operations on those
> > buffers. Copying data to/from `Page` from/to these buffers would be
> > undefined behavior if no special considerations are made.
> > 
> > Add methods on `Page` to read and write the contents using byte-wise atomic
> > operations.
> 
> I'm completely failing to understand. What!?
> 
> There is no such thing as an 'atomic' byte load, nor does it help one
> whit against concurrent modification of the memory you're copying.

I too am totally confused when reading this patch, and the previous
ones.  Shouldn't the "normal" copy_from_user() stuff be used here
correctly?  Why is anything new needed?

thanks,

greg k-h
