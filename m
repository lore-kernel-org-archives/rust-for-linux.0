Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C501624E9
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151574; cv=none; b=LKK6KE+BiRAFp/QFU+gDQvpYF0k9snY/+bPbtSrTTflqdQOmxmJnHL88KD0550mpM/OaNNDOBbD3daDcjAYeBMjwvgoxZv/iyJ1iSpL1q2VShCFb68JSmfkCebI9hy4J8zTVTM3eaiEEtjSyKL0LXjz95QzXQIfAvNUO1kM/OWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151574; c=relaxed/simple;
	bh=7vkgR6mIhb/g7L/MF9ymFfcrIi1ZBnbb/FR0MPoHe3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3+9o4lSX2GPmPhsRGYffvOaaP1goOMuRBRglwJkvrrOvnEmrhYK+5YZvdnOnOie17Ayed1vTmaqffzjiFhe100Ry44N+NT15Un0j6/CgrEKhA+Aw5gYc34CODBHWbDOxQFbB9Kr1sREJ2FMUcH7amTO1RQx39eHLWzUxIJZx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMI+abfd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMI+abfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B6BC4CEDD;
	Sun, 16 Mar 2025 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742151574;
	bh=7vkgR6mIhb/g7L/MF9ymFfcrIi1ZBnbb/FR0MPoHe3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMI+abfdA0cSgUIRoWZ0m56TLgJdu1xRJsH58jzzBU8tgVsDoajMT8uWNSnyD1t7x
	 IoGNwn10DBQYQAaNvc8izZcDzoqiylTuLAI6jvul0ajogxuXP6s5GvlYBI3iIDT0Aj
	 bd7Is3XVdhOQ0Y0mjAtcUPvIs3doU1RWgwwjrFw90rMmgoLqvTiJW97hvMs/mjvAwY
	 hckhitPIcfxRgGCJCuxt1/hgNgR1OT+DBKN+NwlobziBCZP4EqbyrFhOgcG5tu0F+Y
	 R5t15nJBYbWtvBqlsT0D60Y/XbkhKUskgDq7WPRuZyWioRNU+VOCXgNl9hIBdjSVH9
	 fulCPi6Na4J3w==
Date: Sun, 16 Mar 2025 19:59:28 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9cfkKTVKtc3imyK@pollux>
References: <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
 <Z9XIk3WpzruUfh6O@pollux>
 <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
 <D8HL95D099MI.2N779RERY6DAE@proton.me>
 <Z9bEosVk8-0sgSbw@pollux>
 <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
 <Z9bLtgJa3PNB0bkf@pollux>
 <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux>
 <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>

On Sun, Mar 16, 2025 at 05:40:29PM +0000, Benno Lossin wrote:
> On Sun Mar 16, 2025 at 2:46 PM CET, Danilo Krummrich wrote:
> > On Sun, Mar 16, 2025 at 09:13:50AM -0400, Tamir Duberstein wrote:
> >> On Sun, Mar 16, 2025 at 9:01 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >> > On Sun, Mar 16, 2025 at 08:42:43AM -0400, Tamir Duberstein wrote:
> >> > > On Sun, Mar 16, 2025 at 8:31 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >> > >
> >> > > > Let's go with just "must be taken ownership of" then. Unless there's subsequent
> >> > > > feedback, I won't send a new version for this, since you both already gave your
> >> > > > (conditional) RB for this.
> 
> I didn't realize the `forget` argument immediately, so I sadly have to
> take my RB back.
> 
> >> > > What does it mean to take ownership, if not to run the destructor?
> >> >
> >> > Taking responsibility over the decision of what should happen to the value, i.e.
> >> > forget about the value, drop it right away, keep it alive at a different memory
> >> > location.
> >> >
> >> > > Given Benno's insight, I think the safety text is correct as it
> >> > > existed before this patch.
> >> >
> >> > Without the addition there's no requirement for the caller to take ownership,
> >> > but that's what we want here. Without the requirement it would be on set_len()
> >> > to take a decision on what should happen with the value.
> >> 
> >> It isn't a safety requirement, right? I think it's fine to document,
> >> but given that neglecting to run a destructor is safe, it doesn't seem
> >> to affect safety.
> >
> > I don't think there's a rule that safety requirements of unsafe functions must
> > only be used to guarantee memory safety, etc.
> 
> Well that's their only point. Safety documentation should only be
> concerned with memory safety.

Oops, I wanted to say "must not only be used to *directly* guarantee memory
safety, etc.".

For instance, it is also used to justify type invariants (that exist to prevent
UB).

So, what I wanted to say is that setting self.len by iteself is never directly a
safety critical thing.

> You can still put it in the normal documentation though.
> 
> > But you're right, if set_len() guarantees a default of what happens to the
> > value(s) when the caller doesn't take ownership, we could avoid the safety
> > requirement.
> 
> Yeah the default is to forget the value.

It's not really a defined default though, it's just what ultimately happens as
the consequence of how Vec in general and set_len() are implemented.

But let's define it then; what about:

"[`Vec::set_len`] takes (or kepps) ownership of all elements within the range
[0; `new_len`] and abandons ownership of all values outside of this range, if
any."

The caller may take ownership of the abandoned elements."

I'd argue that giving up ownership, while offering someone else to take it means
that it implies that otherwise we'll just end up forgetting about the value.
