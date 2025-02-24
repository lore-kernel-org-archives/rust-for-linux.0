Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6856F23BCE7
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740401927; cv=none; b=GXyFRsZGs7Odc/WS4+e2A77GoHX3An2LmXLafv8tj+xklfAufwwHHdlYg0DX3uILFljlc6oQCymqyRLtJoxKTA8Bbi8SXhQUBrxpbAjZiucbdSoTWt3j+eoESbRfVICyXEeoVX5DKnqCWZ7KC8ec74ETjEBq9PtfsumTojBVxf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740401927; c=relaxed/simple;
	bh=iId1Db8PjY2Oaef1qiwFX4D8BeJwIQWLyEI8Zp99plw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfaEi8NvGIVlTU0lGcyCT5cdUYj1iUjKuq53tiEe5WCMrjuIDOad0SmtzwUL4oMjtgGns0FJba/76QBGtvbozVrcO8QVhWWebzEFUHaUB0GvDr2la94L3Sot6B0wFnwnP5GUzBvS5P/0QnWxzciEMx+p3A/YuaSwIhyZTXEiK0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-113-172.bstnma.fios.verizon.net [173.48.113.172])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 51OCw50M018389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 07:58:06 -0500
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 3927C2E010B; Mon, 24 Feb 2025 07:58:05 -0500 (EST)
Date: Mon, 24 Feb 2025 07:58:05 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ventura Jack <venturajack85@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com,
        david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org,
        hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev,
        linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
        rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250224125805.GA5729@mit.edu>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo>
 <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>

On Sun, Feb 23, 2025 at 08:30:06AM -0700, Ventura Jack wrote:
> Rust aliasing:
> - Is not a keyword.
> - Applies to certain pointer kinds in Rust, namely
>     Rust "references".
>     Rust pointer kinds:
>     https://doc.rust-lang.org/reference/types/pointer.html
> - Aliasing in Rust is not opt-in or opt-out,
>     it is always on.
>     https://doc.rust-lang.org/nomicon/aliasing.html
> - Rust has not defined its aliasing model.
>     https://doc.rust-lang.org/nomicon/references.html
>         "Unfortunately, Rust hasn't actually
>         defined its aliasing model.
>         While we wait for the Rust devs to specify
>         the semantics of their language, let's use
>         the next section to discuss what aliasing is
>         in general, and why it matters."

Hmm, I wonder if this is the reason of the persistent hostility that I
keep hearing about in the Rust community against alternate
implementations of the Rust compiler, such as the one being developed
using the GCC backend.  *Since* the aliasing model hasn't been
developed yet, potential alternate implementations might have
different semantics --- for example, I suspect a GCC-based backend
might *have* a way of opting out of aliasing, much like gcc and clang
has today, and this might cramp rustcc's future choices if the kernel
were to depend on it.

That being said, until Rust supports all of the platforms that the
Linux kernel does has, it means that certain key abstractions can not
be implemented in Rust --- unless we start using a GCC backend for
Rust, or if we were to eject certain platforms from our supported
list, such as m68k or PA-RISC....

						- Ted
