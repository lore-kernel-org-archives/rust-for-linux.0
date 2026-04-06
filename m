Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006472E1722
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775474401; cv=none; b=tyeLPZHEW6RG5GD2Q6QprLwCmEkaD9u06fAccnGNRvvfTgu3nRWSdZcnJNtMOZOMWc4P47gojWiQEe+bwDGkcmzqyaRDQhSA4FpgYITQ2ZdYAovOBNvFGmUmoqU2gyJxVRZqoPx/fesQ4VfqZ6VQFV/nkENDEg8G+dfZkN7kBVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775474401; c=relaxed/simple;
	bh=8W6dliAdZGai8cHVEu0mRsOFxfgGVNfAHtM2D/GSsng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFyjKO9PSohFrIbqc39Gz6GtkdxLQ0ZEd83Y6kF/NbBCbfKnNTgCCrzJjg8V66Jw/j/cPR93er2SYoUfQP1X/osmrfD5sY2K96a/pmdsjyHirZhvMIKqMS3skzrKkT8NAVB9+geAoncbaTvQ/N7QDgKA2uJhb3El5HGws0yDNck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PJ6oxWz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PJ6oxWz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B63C4CEF7;
	Mon,  6 Apr 2026 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775474400;
	bh=8W6dliAdZGai8cHVEu0mRsOFxfgGVNfAHtM2D/GSsng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJ6oxWz5koyCHSIY/gaPLdz8hJ/Re/XoZgkPeJjbx26EnbVBh5Hn7mGaMsobVnMjC
	 9M+ih5+HNfmRKWVOIKv2L+0DRNbHOYqIU3SaIFAMYk46XIkUDf9DcjyS01CK8l8qdA
	 yzuATgaQakJn96xAVZpho+s4ugyTrf09f/MVS2Us=
Date: Mon, 6 Apr 2026 13:19:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <tomo@aliasing.net>, adarshdas950@gmail.com,
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 4/4] rust: time: add `pr_warn_once!` for clamped delta in
 `fsleep`
Message-ID: <2026040601-unmasked-tattling-67a2@gregkh>
References: <20260226120848.82891-1-adarshdas950@gmail.com>
 <20260226120848.82891-5-adarshdas950@gmail.com>
 <20260226.215923.1020202093931415612.fujita@bee>
 <2026022602-audition-utopia-f7b9@gregkh>
 <CANiq72=tKVD13GD2Bzmt_LnC4SiOX1nkHQPcz2BS=P=b23e0Yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=tKVD13GD2Bzmt_LnC4SiOX1nkHQPcz2BS=P=b23e0Yw@mail.gmail.com>

On Mon, Apr 06, 2026 at 12:39:12PM +0200, Miguel Ojeda wrote:
> On Thu, Feb 26, 2026 at 3:36 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > WARN_ONCE() also will panic the machine if panic_on_warn is enabled.  As
> > it is done in a few billion Linux systems right now :(
> >
> > So be very careful about that.
> 
> Coming back to this...
> 
> I think we should settle for cases like this (i.e. "Erroneous
> Behavior") to use `debug_assert!` plus `pr_warn_once!`.
> 
> That way in normal builds, we just print a warning once, no risk of
> `WARN_ONCE()`. And in truly debug builds, we assert.

Who would ever build a "truly debug build"?  That's the overall problem
we have tried to fix up, no user will do a new build for things, so we
have dynamic debugging now.  I think only the mm core still has an
overly-strict debug mode that only the mm developers run, and even then,
there have been arguments it should be removed.

> This should make it easier to add such EB in most cases where needed,
> and if someone really wants `WARN_ONCE()` or similar, then they can do
> it explicitly.

Sure, that's fine, but note that this will crash and should NEVER happen
if it can be user triggered.  And if you are warning, well, why not just
handle the issue, print out a message, and continue on?  Why reboot
anything?

thanks,

greg k-h
