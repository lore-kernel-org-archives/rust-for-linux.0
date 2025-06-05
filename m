Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D7C18C031
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Jun 2025 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749136867; cv=none; b=F9vqL8LeTyygOZBe1HsRADn6BGgYerKSSuAO/ey4s1FUhTSMi9t4zv/MA1AJkqoQD3nS7FoAu2/rEIrZvBHfdmd5/3d6a8c6qO9gp3sSTgtRnd8r+UDvIjYg0h+HcMmDgO6CTEZTgkFUxuuZY0Tua1J6Qr0Sn3LdiHS4mH2MmAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749136867; c=relaxed/simple;
	bh=p3iIjtUqZSQDmdZMgNu1zZhSYbeOUfnLNeZXJOh8lEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxuMXP3EOB4YSR0jRpO8LbDnxvYeyycieizC0o2KHj3A+IxzzihINUifyX2H4/HS6QvwbqXggTMMz2rPRpAxD8xqAgL7Km5wi1JAW0H7+KlnRAy+mvjcxFNkv8xvg6tAnWAPehrN09A5l2Nojr2dhWfvUnnzanvGfuNXbY0mV3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IfPAVUav; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IfPAVUav"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782C3C4CEE7;
	Thu,  5 Jun 2025 15:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749136866;
	bh=p3iIjtUqZSQDmdZMgNu1zZhSYbeOUfnLNeZXJOh8lEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfPAVUav/JV8j3srHt9GTUudRwv4MmK7MUDe4yWKHSrGz7oOw2yVvvwmsJsfukVEY
	 UYDwnxfY91P0/wp+sIJMCehB/0t8+YyfC9BpFSK1E4a7OpgY5WTiS4J6MgjiLEFYz2
	 yFmKrpdiZLq3rc4iy4QuiZWwlmu73wIIl5v5CzoY=
Date: Thu, 5 Jun 2025 17:21:04 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Message-ID: <2025060511-surcharge-overfill-a721@gregkh>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
 <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>
 <2025060508-spool-twistable-66af@gregkh>
 <7faac30f75f2ba651995d9667c463706b61ffca5.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7faac30f75f2ba651995d9667c463706b61ffca5.camel@nvidia.com>

On Thu, Jun 05, 2025 at 03:02:03PM +0000, Timur Tabi wrote:
> On Thu, 2025-06-05 at 08:07 +0200, Greg KH wrote:
> > > Maybe dbs!(), or just d!() ?
> > 
> > Wait, why are we trying to reimplement the existing pr_dbg() code in a
> > non-standard-way?
> 
> pr_dbg() is not changing.  We're talking about the standard Rust macro dbg!()
> 
> 	https://doc.rust-lang.org/std/macro.dbg.html
> 
> the "problem" with dbg! is that it uses file!(), which outputs the full relative path of the
> source file, which can be quite lengthy.  IOW, I think dbg!() is often too noisy.

And I'm saying "don't use dbg!()" :)

Or, better yet, have it do exactly what pr_dbg() does, as we don't seem
to _have_ to have dbg!() follow anything other than whatever we want it
to follow.

> And we're not talking about changing dbg!() either.  In cases where a given Rust driver has
> multiple source files of the same name but in different paths, you probably want dbg!() to use
> file!().

Again, just do what pr_dbg() does, nothing more and nothing less.

> But in situations where you don't have that file layout, maybe you would prefer the output of my
> sfile!() macro.

Nope, use what pr_dbg() does please.  It will provide the needed file
info if the user asks for it through the standard user/kernel api that
we all know and "love".

thanks,

greg k-h
