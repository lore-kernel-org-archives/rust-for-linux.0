Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19A930B518
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413846; cv=none; b=rnBgk56IZ/21O8zJH1dFLQHhWeCjxw/ILBDQjnRQmSWsaIWcf78bxCElrg0sc0yM+34EYxrHjHpJ4GR3dTVOM4CzAuXxxFmgkyfE5bX+yblDvZOmUOH3S1dHTq2Q2+WC3zePgThg9ctrTwRvBKzuOdVIJsXRtBGJRgM0pizHEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413846; c=relaxed/simple;
	bh=YVMv1ptFKNw6kEpdNrlOLxsWiwOQJELFd3S4YAz4D/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TC92vIn9Y7MfJ/FJGXt8qeeux3o3TGoKvGURX6lIPLvstNPoEttV06oZOt+L7iydxhnLKtB96Ih1OuMmaQ9VkePYdQEcsGpfkn+RhM55eGVTEWUceUEsjHx1CaXYvath+gmN85iBDu8s2eoVwqnr5/f2jC8d0AGRrbDeePca/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sas4Ja4l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sas4Ja4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D184C19421;
	Wed, 18 Feb 2026 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771413845;
	bh=YVMv1ptFKNw6kEpdNrlOLxsWiwOQJELFd3S4YAz4D/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sas4Ja4lMC0iAp2bsc+/MKvz4KtmAhZsC8ejKyT2vUbu09628717QvJKpcXLHdEzb
	 SwYg+6qXmHKd/1gN6J/KMKc5WvdfBEjAgAapTw1rn6p5p7IQXpUjqIJoY8/86EOBKY
	 WCRHKZlK6+oav1Xr1hPOPb/wq/lvR5HCKrYJU+1DZHyF6ZQIsfPWkuEmGfEyigDg9D
	 LoJAWMpDDJS5teuqJFswrZGZHu8T/e65wDUCjJ5Lb2Wk44Wy1O0fXVSm7XYF9iuXBW
	 iKJof5st1/XGq5mCp18Bo4CLZxH6AjGRM8ACrSiSEuoM7ZVNjxJb4eWNjeozOAE3L+
	 FJ9yEJUlb7HXg==
Date: Wed, 18 Feb 2026 12:24:00 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, lsf-pc@lists.linux-foundation.org, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, gost.dev@samsung.com, 
	Greg KH <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@inria.fr>, 
	Kairui Song <kasong@tencent.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
Message-ID: <aZWfP-LyMvDsHVnz@macos>
References: <aZRncP-sKLLS2K1U@macos>
 <ix0mR76G9a_ieuQUUkkfHMJIviAsrFaO859172fuFx9Goj7QdIfz1jtnv3ptubGEC7uEFCvVfEoWxcisUnTi1g==@protonmail.internalid>
 <aZR-ItMBkiqyBdKd@casper.infradead.org>
 <87bjhncl7j.fsf@kernel.org>
 <CANiq72naQfG=nSiPJdCXgqM1M_7ynDE5Stt-jiBGPqS9pipQtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72naQfG=nSiPJdCXgqM1M_7ynDE5Stt-jiBGPqS9pipQtw@mail.gmail.com>

On 2026-02-17 21:18, Miguel Ojeda wrote:
> On Tue, Feb 17, 2026 at 6:51 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> > We don't have to wait 5-10 years for gcc to fully support Rust, before
> > we start playing with this.
> 
> By the way, I don't think we will need that many years to use GCC if
> companies are interested on it and support projects like GCC Rust
> and/or `rustc_codegen_gcc`, given their current state (for context,
> the latter is able to boot a kernel with Rust enabled for x86_64, and
> the former is prioritizing Rust for Linux).
> 
> Let me use this opportunity to say: if anyone wants to support that
> work, e.g. hardware companies for their architecture, then please ping
> me and I am happy to help getting in touch with them and figuring
> funding and things like that.

I'm not aware of the official GCC roadmap but LWN covered it in
"predictions for the new year" article [1]. Quoting:

"The gccrs project will deliver a working Rust compiler this year; it
will be usable to build the kernel's Rust code. This ambitious project
...
The availability of a GCC-based compiler will make that transition
easier for many people, especially those working with architectures that
the LLVM-based rustc compiler does not support..."

Link: https://lwn.net/Articles/1052269/ [1]

Whether that becomes true or not should not be relevant for the
discussion, as stated in this thread.
