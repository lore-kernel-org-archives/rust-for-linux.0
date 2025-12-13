Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF613D891;
	Sat, 13 Dec 2025 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632276; cv=none; b=DPuKCpf0P9IyYPVGUEDgp1MgDVphXiuxTzJQalO0ytvY+fUI9VW9D9FLPLTju2G/7YweD0lEpVG5FiSPYW6ujt1LSFfSeAwabG/OvLUpMA8m/w5Eohdk85M1gHP30JivwE9RGN5t8NiD4j3+Qi9NjTltm1viQ4fg57o72Qrarrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632276; c=relaxed/simple;
	bh=dveIrqykB5q/PryBVKvvG3bB8sUw0zDImqERMSpzhgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNS8O3HJMAM/WIVVt7XWSioOLlFRXbo9SOgr51eV/03JtubKNs0t3cA6GtPW4fP2L19l+Vo6O+GzTIUBmf0p7SHVT+jNC7yJerJRfsClorQdFsoIKk48X1uVdDOKJ17FirwbNRbEdw78HfUmVxDm7vTASKHM/adkHmqJglyDUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mSMmu1R6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mSMmu1R6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A1DC4CEF7;
	Sat, 13 Dec 2025 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765632275;
	bh=dveIrqykB5q/PryBVKvvG3bB8sUw0zDImqERMSpzhgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSMmu1R6I5bYssbhXiRv/VUjaHV2+dFJcHdWwSRX0Zxsg3oP84Zaw5TdUm/ZOO5DO
	 5V+5EJmk4M6cj6snCFhkLO1iKeZHjTUVaQnt0hvqM/xM/joflmmImcaVhD0UUzbJkF
	 wmCpVtVGf0WsZ1AQwhlgyqHh/cxRCuAgwhUZt8rY=
Date: Sat, 13 Dec 2025 14:24:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: conclude the Rust experiment
Message-ID: <2025121321-hate-tweezers-5332@gregkh>
References: <20251213000042.23072-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>

On Sat, Dec 13, 2025 at 01:00:42AM +0100, Miguel Ojeda wrote:
> The Rust support was merged in v6.1 into mainline in order to help
> determine whether Rust as a language was suitable for the kernel,
> i.e. worth the tradeoffs, technically, procedurally and socially.
> 
> At the 2025 Linux Kernel Maintainers Summit, the experiment has just
> been deemed concluded [1].
> 
> Thus remove the section -- it was not fully true already anyway, since
> there are already uses of Rust in production out there, some well-known
> Linux distributions enable it and it is already in millions of devices
> via Android.
> 
> Obviously, this does not mean that everything works for every kernel
> configuration, architecture, toolchain etc., or that there won't be
> new issues. There is still a ton of work to do in all areas, from the
> kernel to upstream Rust, GCC and other projects. And, in fact, certain
> combinations (such as the mixed GCC+LLVM builds and the upcoming GCC
> support) are still quite experimental but getting there.
> 
> But the experiment is done, i.e. Rust is here to stay.
> 
> I hope this signals commitment from the kernel to companies and other
> entities to invest more into it, e.g. into giving time to their kernel
> developers to train themselves in Rust.
> 
> Thanks to the many kernel maintainers that gave the project their
> support and patience throughout these years, and to the many other
> developers, whether in the kernel or in other projects, that have
> made this possible. I had a long list of 173 names in the credits of
> the original pull that merged the support into the kernel [2], and now
> such a list would be way longer, so I will not even try to compose one,
> but again, thanks a lot, everybody.
> 
> Link: https://lwn.net/Articles/1049831/ [1]
> Link: https://git.kernel.org/linus/8aebac82933f [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
