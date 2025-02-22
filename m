Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740B14037F
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740237707; cv=none; b=j3OYOE26GxYyqVfTCXDl2hxR4PihleEvBc10uUFz2KS+B8vRv00XPX1rnUzUiflKRi1GdL+2wWq6Hs7DgQ48jIv56ukPiXXz1EqbqWihZ2yjSAFAW6Gzgbtgik8z9BD565S72H150io3ZgaGvvmXRAs93QkbCmr/1mvnGnXazcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740237707; c=relaxed/simple;
	bh=0RQL9RDIa/a10b73LeMPQ07MYqfKsWcK7om94Ma9j3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5Rj0d9gidnTTwJzzkull2+CEu/agi6ca3JSScdLPjo7+Kc+sBxk03/ImRegAjNQqzmQeLbPN1qdXGZtrUEMhE96PyyXsnSCfa01V/AKkslM8/Uwg0nR94U1fMPZXk0HTR6QbYZt973KmqwwMSJtOdiGdYTR89yclHB8wixRBKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uxCA2qTa; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uxCA2qTa"
Date: Sat, 22 Feb 2025 10:21:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740237703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFVisseoGUDFJLItKPqXUKJ5q5lMT6Dx6imnkdSreQQ=;
	b=uxCA2qTaWEvAo6Je5Wz2xpLD1bnSSDYfoDlgUibR4iU6QvfC+u/WpcluUiwtubAJXRD8M1
	wO82fMVIdNVg4w2op6nHJLmasIHInjEh0AtCgmOBcqLIoVxdScd1v++stszLZT+UwOsTct
	Nto0UaYnfI+tHSgDb6+UpIj7NRD3bw4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <nptg4kade7gjjggphsbltu6t42wpqhppvgmraezcuhqvt2plnw@pjgwgwtmwovs>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <202502191026.8B6FD47A1@keescook>
 <785A9F60-F687-41DE-A116-34E37F5B407A@zytor.com>
 <CANiq72nwouotAqJh_cm=9RG3Ns4wxX0LWXcVwp_bswE29kCrYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nwouotAqJh_cm=9RG3Ns4wxX0LWXcVwp_bswE29kCrYA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Feb 21, 2025 at 12:42:46AM +0100, Miguel Ojeda wrote:
> On Wed, Feb 19, 2025 at 8:34 PM H. Peter Anvin <hpa@zytor.com> wrote:
> >
> > a. The apparent vast gap in maturity required of Rust versus C. What is our maturity policy going to be? Otherwise we are putting a lot of burden on C maintainers which is effectively wasted of the kernel configuration pulls in even one line of Rust.
> >
> > This is particularly toxic given the "no parallel code" claimed in this policy document (which really needs references if it is to be taken seriously; as written, it looks like a specific opinion.)
> 
> There is no "no parallel code" in the document, and I would like a
> clarification on what you mean by "toxic" here.
> 
> I tried really hard to avoid misrepresenting anything, and the
> document explicitly mentions at the top that this is our
> understanding, and that the policy could change depending on what key
> maintainers and the community discuss. (If it is put into the kernel
> tree, then that solves that.).
> 
> Anyway, I can only guess you are referring to the "Are duplicated
> C/Rust drivers allowed?" point. If so, since you want references, here
> is one:
> 
>     No, don't do that, it's horrid and we have been down that road in the
>     past and we don't want to do it again.  One driver per device please.
> 
>     https://lore.kernel.org/rust-for-linux/2023091349-hazelnut-espionage-4f2b@gregkh/

I think we need a more nuanced rule there.

When you're rolling out something new of a nontrivial size, you always
want to stage the release. You don't want everyone to start using
10k-100k lines of new code at once, you want it to first hit your power
users that can debug - and maybe the new thing isn't feature complete
yet.

If a big driver is being rewritten in Rust (e.g. if we went all the way
with the nvme driver; that was one of the first prototypes) I would want
and expect that we ship both in parallel for a few cycles and make sure
the new one is working for everyone before deleting the old one.

And tends to be what we do in practice, where appropriate. blk-mq was
incrementally rolled out. No one's even contemplating ripping out
fs/aio.c and replacing it with an io_uring wrapper.

Wholesale rewrites of entire subsystems in the kernel are rare (because
we can refactor), but with Rust we'll be seeing more and more of that -
because most of the really tricky safety sandmines do occur at FFI
boundaries.
