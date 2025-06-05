Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9659D86337
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Jun 2025 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103563; cv=none; b=jweC3TRAR9w1EGuf5VH5G78eYtfuwrMfiYFRMjH39gfZ/luY58brjk8WbjicQ9ynGJ2nwbEbSTJSDkmyhfprey/GLULswBQFhAgOy+DhN7Dej/yXEoPtgr36LPbxSs8ToGTHk2liCc5esAp1/dIw4CC1Kfe4IddR4utEdCZteMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103563; c=relaxed/simple;
	bh=YnjVex58uNHSq/C+Hhx+GFdi7fn5Uo67tx/Et7MvhEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doqBgcvXLiV7uA9rojby/GtKy56iQAbdq9DAZKtugZKvakJOUxmPI5E3trZSFvzTlj4mOzT87aVy70EIjkZvQcyzCITuUnIsiXvwJf+rgkUFZeiAWquvJ8wlkvJRdqjnzPNovm8u1U1SrD25UofxVmYTSEtduB10dSGyCvuAyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QK9ldLXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QK9ldLXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859BBC4CEE7;
	Thu,  5 Jun 2025 06:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749103563;
	bh=YnjVex58uNHSq/C+Hhx+GFdi7fn5Uo67tx/Et7MvhEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK9ldLXfgOJkIzRBEh9h8d+CUOzUwusbnjsjNrCS8dw/MdpjOOguEXwzd9/FbQ1wC
	 Pl5GSCmOfHLVkr4lIIW7XzUNoNbUyaqLO7gtyPF6j8qWMiGKkdUR2r7FQiAIDHmDVl
	 ahJmtOqpFwHIsow3VUTfct/i1S8uMlaQYOkkgzeE=
Date: Thu, 5 Jun 2025 08:05:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Timur Tabi <ttabi@nvidia.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Message-ID: <2025060520-sinuous-sequester-613e@gregkh>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
 <DADUK09NUMP6.3Q5UVROS0QDYF@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DADUK09NUMP6.3Q5UVROS0QDYF@kernel.org>

On Wed, Jun 04, 2025 at 05:16:54PM +0200, Benno Lossin wrote:
> On Wed Jun 4, 2025 at 12:28 PM CEST, Miguel Ojeda wrote:
> > On Wed, Jun 4, 2025 at 1:29 AM Timur Tabi <ttabi@nvidia.com> wrote:
> >>
> >> I didn't want to change the existing behavior of any other macro or function.  This is my first
> >> significant rust-for-linux contribution, and I didn't want to be presumptuous.
> >
> > No worries -- things can be changed, and in particular the behavior of
> > `dbg!` wouldn't be too bad, in the sense that calls are not meant to
> > be committed anyway. A CI checking for the message from the sample
> > could break I guess, but that is not the end of the world.
> >
> >> I could add a sdbg!() if you think it would be useful.
> >
> > Yeah, that was what I was thinking, though it is sadly one more letter.
> >
> > We could also shorten a bit more by not printing the column like
> > `dbg!` does, which I suspect many may not care about.
> >
> > I wonder if we could make the `dbg!` the one with the longer name
> > instead, i.e. to keep the functionality in case someone really needs
> > it. Sadly, that means making it not match the stdlib name, but it may
> > be worth it if we expect everyone to end up typing `sdbg!` all the
> > time, and only very rarely `dbg!`.
> 
> Why not control the amount of path segments with a kconfig? That way we
> can have both worlds.

Ugh, no, please no.

