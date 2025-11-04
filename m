Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC2230AAAD
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241975; cv=none; b=CGBfB5CbWkIYEdSJHyshXBCGB4u4e00+YJvgQZYd+UjlO4huTN0Kzc9YN3RvUFAvxx4i+mXx0EgaNZhs57O3yn6wWSmyChIaYCoBm5DY5QtGPh5XAg4pOw5UTcoY9HKdYa8CoDR+pqXywARvdQ2ri1xlCNTY9Y8gSVn7sbMdHyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241975; c=relaxed/simple;
	bh=Nso5yHJybJIz0gwCb9zziLnBUhaIu88X6JH2qlHpwLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwxPEj7UlBycGAZe98H9HVzCHQJeZ1fcLuiUD4a83LWeyfF5d8puFb7xbONLdLystiUlLCQsp++uMXs9aPTDjj5dxLe5i5+uBsknwNeY3a2iFJLmd/RHuKYVpcGkygsl1yyKXTTaX7MxSfNnp+4VNHqgXbnB5nv2wQASscyG+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qKDNLGL6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qKDNLGL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ED7C4CEF8;
	Tue,  4 Nov 2025 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762241974;
	bh=Nso5yHJybJIz0gwCb9zziLnBUhaIu88X6JH2qlHpwLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKDNLGL6nc+x0iOCHwblSAVCB0lxwkFytejHk8lnAlMUq8d0sm1I+0j21cBW8+1i3
	 l7dtWmi6Ta04ac6E9NSA3E4k7s6IgWI66LhtqDyRABhv59dYtlV/2sOOgsanEwT1Pv
	 VJjKnLkb/RL+p8nREgyJz92FDeyEEzd+WlXkkQnw=
Date: Tue, 4 Nov 2025 16:39:30 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: ABI mismatch build error for 6.17.y and rustc 1.91.0
Message-ID: <2025110402-banister-speech-7228@gregkh>
References: <2025110452-diligence-share-98d3@gregkh>
 <20a1d4f3-1fa3-4789-aa7d-385d33ea9324@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20a1d4f3-1fa3-4789-aa7d-385d33ea9324@de.bosch.com>

On Tue, Nov 04, 2025 at 08:07:13AM +0100, Dirk Behme wrote:
> On 04/11/2025 06:27, Greg KH wrote:
> > My laptop just upgraded rustc to 1.91.0 and now I get the following
> > build error in 6.17.y when doing a 'allmodconfig' build:
> > 
> >    RUSTDOC TK rust/kernel/lib.rs
> > error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `kernel`
> >   --> rust/kernel/lib.rs:3:1
> >    |
> > 3 | //! The `kernel` crate.
> >    | ^
> >    |
> >    = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
> >    = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-address` in dependency `core`
> >    = help: set `-Zsanitizer=kernel-address` in this crate or unset `-Zsanitizer` in `core`
> >    = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error
> > 
> > I don't see that on Linus's branch, but maybe I don't have the same
> > build options enabled there.  Is 6.17.y missing a patch that is in
> > 6.18-rc to resolve this that I just can't seem to find?
> 
> This one
> 
> https://github.com/Rust-for-Linux/linux/commit/16c43a56b79e2c3220b043236369a129d508c65a

That is not a valid git id in linux-next :(

> https://lore.kernel.org/rust-for-linux/CANiq72=0JJz5XDHGpiyQBd9AmPCr4veJ=2oJywyyqQB8iMxqvA@mail.gmail.com/

Ok, but why am I not seeing this on 6.18-rc?

thanks,

greg k-h
