Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6381DF963
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116617; cv=none; b=JwfmVXcsEnQwrpmFrhWr6ds193lKxon6m00M/gbazUB4vJgvkbugvICdsH492h/X17ZlQSSlu09kF9WMC6gFVNjeqAs1p3p3kTqqgR12lOhCdUM5rLV7df6BE78Whki75Ose3HS0Db6dYyojkVFnONexj361FnxJx0FEDTvca0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116617; c=relaxed/simple;
	bh=OiZf1kv6a/22A3Gq9G7B+E2tmm8mdDOW9jYmuzc5PPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjyTwKj9CKfVWwtcowWgnXmPTPpKc0SpwgNeowYE4B5gKBNVoL5y4rhEIVuEuit8ZIneMAVVxCw6IFPmdLnfISSJGhZrTzZxvsRVyJz3jguY8ouqNBEkuUSXbZIvfNHb98hlMxjTYwg5ZWXP8rYo4BUCjneD/7BIb+HdCgP92Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wk0u0HEG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wk0u0HEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732B7C116C6;
	Thu, 26 Feb 2026 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772116616;
	bh=OiZf1kv6a/22A3Gq9G7B+E2tmm8mdDOW9jYmuzc5PPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wk0u0HEGWEedSUg6Na4O2VhhR8qg/GyMQ+kfoPaxJ5VK8gyw8WnpKEmyPESOJtXu4
	 3MAeOVgZL0aFohehO/0WetATts27VX8m3O31rQsOAklnZQRDMwp7jyZys4guQfyRwR
	 4yR5vibw+trkBFPC/4vvatuTPqpe1vTQxy4ScmIQ=
Date: Thu, 26 Feb 2026 06:36:47 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: adarshdas950@gmail.com, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 4/4] rust: time: add `pr_warn_once!` for clamped delta in
 `fsleep`
Message-ID: <2026022602-audition-utopia-f7b9@gregkh>
References: <20260226120848.82891-1-adarshdas950@gmail.com>
 <20260226120848.82891-5-adarshdas950@gmail.com>
 <20260226.215923.1020202093931415612.fujita@bee>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226.215923.1020202093931415612.fujita@bee>

On Thu, Feb 26, 2026 at 09:59:23PM +0900, FUJITA Tomonori wrote:
> On Thu, 26 Feb 2026 17:38:48 +0530
> Adarsh Das <adarshdas950@gmail.com> wrote:
> 
> > Add a warning when the delta is clamped to the maximum value and remove the TODO comment.
> > 
> > Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
> > ---
> >  rust/kernel/time/delay.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
> > index b5b1b42797a0..0965fcb6eb80 100644
> > --- a/rust/kernel/time/delay.rs
> > +++ b/rust/kernel/time/delay.rs
> > @@ -35,7 +35,7 @@ pub fn fsleep(delta: Delta) {
> >      let delta = if (Delta::ZERO..=MAX_DELTA).contains(&delta) {
> >          delta
> >      } else {
> > -        // TODO: Add WARN_ONCE() when it's supported.
> > +        crate::pr_warn_once!("delta out of range, clamping to maximum\n");
> >          MAX_DELTA
> >      };
> 
> pr_warn_once() and WARN_ONCE() are different; WARN_ONCE() also dumps a
> stack trace, which is more appropriate here, I think.

WARN_ONCE() also will panic the machine if panic_on_warn is enabled.  As
it is done in a few billion Linux systems right now :(

So be very careful about that.

thanks,

greg k-h
