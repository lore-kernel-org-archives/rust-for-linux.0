Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D138D;
	Fri, 13 Feb 2026 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770998338; cv=none; b=Cz1Rg4Aomvuamny6km9LWIOPhRM/lEy3q3rToVf+RjukokMRvqpiEncd/GMHJmVOnCn/LYPhODClYweWbXy2HKxcRTHjwUUANiHKPpY7z9PXgp9eM30trWxhISrOZZicwaWSO62zriTYNowlNIXhEoBL2gWFpFbcWy+emM5iBEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770998338; c=relaxed/simple;
	bh=rS3uQKruYn5xMp4W6xkGEzUFoQUuS95ZgMsB6z8EJJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocZD+0Bbs3AvN9vQ8CrU1Td6i3ECA4fY9N00G30cclY3/MMnLEeChOMgf1uzHmqgNayItMjl97Ap7oYdFPvcukvrKll6RILw41Dox/SDoqEODtdVECleYX5x0z9TFJ2hurepBK24qyrf+BfwZFWHY8VXV5elBKGa1n473BSoX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nuGspXNl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nuGspXNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3083BC116C6;
	Fri, 13 Feb 2026 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770998337;
	bh=rS3uQKruYn5xMp4W6xkGEzUFoQUuS95ZgMsB6z8EJJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuGspXNl5QtW1RDbpCeV70r18D2R/Qpb2j7Y3E7STlPudOv5+oFQOBRcCGScX5srb
	 s+q3hxoEaHoMcRWndgCot9AH71ybpaQ1cm2oqu5U+FBn0nH2sEA0vNBxjOlRHIJ291
	 JBoBETTmxdN4ZSgDVJcusWztbxBAcoqODP09IUgI=
Date: Fri, 13 Feb 2026 16:58:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Boqun Feng <boqun@kernel.org>
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
Message-ID: <2026021326-stark-coastline-c5bc@gregkh>
References: <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY9HD7nH5A-DtgmR@tardis.local>

On Fri, Feb 13, 2026 at 07:45:19AM -0800, Boqun Feng wrote:
> On Fri, Feb 13, 2026 at 04:34:04PM +0100, Greg KH wrote:
> > On Fri, Feb 13, 2026 at 03:26:08PM +0100, Peter Zijlstra wrote:
> > > On Fri, Feb 13, 2026 at 03:13:01PM +0100, Andreas Hindborg wrote:
> > > 
> > > > C uses memcpy as seen in `bio_copy_data_iter` [1] and in the null_blk
> > > > driver [2].
> > > 
> > > Right. And that is *fine*.
> > > 
> 
> Yes, that's fine because memcpy() in C is volatile and per-byte atomic.
> 
> > > > Rust has `core::ptr::copy` and `core::ptr::copy_nonoverlapping`. I was
> > > > informed these are not safe to use if source or destination may incur
> > > > data races, and that we need an operation that is volatile or byte-wise
> > > > atomic [3].
> > > 
> > > Safe how? It should just copy N bytes. Whatever it thinks those bytes
> > > are.
> > > 
> > > Nothing can guard against concurrent modification. If there is, you get
> > > to keep the pieces. Pretending anything else is delusional.
> > > 
> > > Suppose the memory was 'AAAA' and while you're reading it, it is written
> > > to be 'BBBB'. The resulting copy can be any combination of
> > > '[AB][AB][AB][AB]'. Not one of them is better than the other.
> > > 
> 
> The idea is if using Rust's own `core::ptr::copy()` or
> `core::ptr::copy_nonoverlapping()`, you may get `CCCC`, because they are
> not semantically guaranteed atomic per byte (i.e. tearing can happen at
> bit level, because they are not designed for using in case of data
> races, and there is no defined asm implementation of them, compilers can
> do anything).

Then why not just call the proper, in-kernel, arch specific, patched and
tested to the end-of-the-earth, memcpy()?

> > > No byte wise volatile barrier using nonsense is going to make this any
> > > better.
> 
> It's byte-wise atomic [1], which should be guaranteed using asm to
> implement, hence at least at byte level, they are atomic (and volatile
> in our case).
> 
> [1]: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p1478r5.html

Again, just use memcpy() please.

> > > 
> > 
> > I'm with Peter, just call memcpy() like the C code does, and you will be
> > "fine" (with a note that "fine" better include checking the data really
> 
> We are. See v3, we actually use `memcpy()` for the copy (as I already
> pointed out, Andreas made a mistake in this version), it's just
> because it's per-byte atomic. What this "byte-wise atomic" does is
> clearing things out.

clear what out?  It shouldn't need anything special for a memcpy.

thanks,

greg k-h
