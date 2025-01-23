Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1FD14AD19;
	Thu, 23 Jan 2025 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627695; cv=none; b=lgYAvsgPZSfGv8aw4d1rFFEfwwWF5dXqMJ5Qgohr9f6j2UnEA7iAfu7qvfjYwd6X+Ifwnp8fF88Sw/i4WJrghZqPlN96zPwQyUOs25mpd6Wx+gRge9o+w0skRchelvC41LUo3IujKgfSV6pMeONwWwSaLvelgNCqqJ7JYs6gqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627695; c=relaxed/simple;
	bh=fXmaqthyPy6H28netOr1SkZEYmxmzQVHVmxUKV3Sx/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T38lpg7hzYlTe3F65PzT4MvIbMDPYC/prjnBYD3DlkfPiAj+kX6NSjHfh809Gv9nNbzdvI9/KaWmyHEvQYpRo7NFt/s+J78+4qWJMiLwLVkoIYjaRb9Leu/l2qia1G6L6FNLzH2ztxy3mp+6D85G7xEpmocrvKBv4Cnn9eNFN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKiIO5ec; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKiIO5ec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6C3C4CED3;
	Thu, 23 Jan 2025 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737627694;
	bh=fXmaqthyPy6H28netOr1SkZEYmxmzQVHVmxUKV3Sx/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nKiIO5ecgdAyC1blwXXJIZ6n2Cd7mXeRx+1ZULqGa8m17ZtLjKkm/A4ZrDjXMJVSi
	 KspbQa4MLgzXhaMi8nrGKJxCYeAJeh3wBaHQGU9qVUpLjxB2Fcsxl3hzKjld94o8Xk
	 yK1x4GMtj9UzvgAkxPkGKYirB3JM/DKGhMPHBXvSVcPG8sFeD+/m8uBBtFH09Wh9LE
	 rqmloLqHpLG9QVS9aJW1QTH6Z/slxLgtzftajfNT1PhkD0IlawxCZtK2S5TbYwRH8V
	 LAGkpranaic+fEojSAFfXu4N1PWjpY4GG1RTnFMSwyP4EKMQP2xVZD+4smoc94dt0x
	 w2PrTo/aesY5Q==
Date: Thu, 23 Jan 2025 11:21:28 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 2/2] rust/kernel: Add platform::ModuleDevice
Message-ID: <Z5IYKJXuk1vcs4Xo@pollux.localdomain>
References: <20250122235340.2145383-1-lyude@redhat.com>
 <20250122235340.2145383-3-lyude@redhat.com>
 <2025012329-candied-walk-f57d@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025012329-candied-walk-f57d@gregkh>

On Thu, Jan 23, 2025 at 07:23:08AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 22, 2025 at 06:49:22PM -0500, Lyude Paul wrote:
> > A number of kernel modules work with virtual devices, where being virtual
> > implies that there's no physical device to actually be plugged into the
> > system. Because of that, such modules need to be able to manually
> > instantiate a kernel device themselves - which can then be probed in the
> > same manner as any other kernel device.
> > 
> > This adds support for such a usecase by introducing another platform device
> > type, ModuleDevice. This type is interchangeable with normal platform
> > devices, with the one exception being that it controls the lifetime of the
> > registration of the device.
> 
> Sorry, but a "virtual" device is NOT a platform device at all.  Platform
> devices are things that are not on a real bus and are described by
> firmware somehow.
> 
> The kernel has "virtual" devices today just fine, look at
> /sys/devices/virtual/ so why not just use that api instead of making up
> something new?

I think we briefly discussed this in another mail thread [1] for the example of
the vKMS driver [2] in the past.

In [1] you mentioned that with the virtual device API, things are a bit
inconvenient and that you want to follow up on this.

I can't speak for Lyude, but I assume that she would also be willing to help
out getting to a better solution than what drivers like vKMS currently do and
then have a Rust abstraction for that, but your previous reply didn't indicate
there's already one ready to grab.

[1] https://lore.kernel.org/lkml/2024071106-handed-oversleep-2377@gregkh/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/vkms/vkms_drv.c
