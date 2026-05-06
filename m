Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AB25776;
	Wed,  6 May 2026 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778044759; cv=none; b=UOTynifL9N5bqsgNYh7dEMrf4J2JroMRKqAXwxMcSYnji/V5zi2pwqnluA31mWYkItwAxHSPj414pWX69yak1mtLqJjZSBd+C+mzRgdRR7qcNncOb2QFXX/9RwMkeaV7IIf3VQt8s+v5zpKfCco+IFNHlb+cVfJOfaB148y8AhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778044759; c=relaxed/simple;
	bh=/6HzevzmWkZ3iBt8WgOrKRUQugWcdSRwD40U8bGrsrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSACsQDUnevI9AAhflkttPYljjIZKLLH07lrtNAxWb2QcFuFI2NOsvVStIapJ9+VSxol6Lt6tHSd+AAY8EelXoYrh6AZ1to6VJ2p07YsnVdjYv89mJby52LyjLdUWtTPJGWiKjMQsiovuqxCip0Gnmu/4oNqXlTlGF9JO2kLTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LPoIOdmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LPoIOdmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12986C2BCB8;
	Wed,  6 May 2026 05:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778044758;
	bh=/6HzevzmWkZ3iBt8WgOrKRUQugWcdSRwD40U8bGrsrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPoIOdmJtYJK4r0AWKzFkG1cxOm5QYDdlWxCB6KtOTbbLe1HV8u9l6G4+0uMUqJcp
	 SKM44I1yhqsf0dp5hiB6YHTaINVOIC3iL/c0wu7/93qG/z/X/isQKGc6j1VQ3qgPfy
	 HFwtvRWVECdgzkEQomnWDKS98ZcmH/HVNeC1YNUA=
Date: Wed, 6 May 2026 07:18:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Raymond Newman <raymondcharlesnewman@gmail.com>
Cc: linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] lib/gcd: Convert to Rust
Message-ID: <2026050647-eternity-either-08bb@gregkh>
References: <CAC5penpL_yet9HHqC=BNV_EP2wDe3zpsjFw77T8356veNV0rsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC5penpL_yet9HHqC=BNV_EP2wDe3zpsjFw77T8356veNV0rsw@mail.gmail.com>

On Tue, May 05, 2026 at 09:37:26PM -0400, Raymond Newman wrote:
> >From 96902ad2caf167ca0377e0b2063973e2183465b4 Mon Sep 17 00:00:00 2001
> From: Raymond Newman <raymondcharlesnewman@gmail.com>
> Date: Tue, 5 May 2026 21:29:29 -0400
> Subject: [PATCH] lib/gcd: Convert to Rust
> 
> Convert lib/math/gcd.c to Rust. The binary GCD algorithm is preserved
> exactly, including both the efficient-ffs fast path and the even/odd
> fallback for CONFIG_CPU_NO_EFFICIENT_FFS targets.

This says what you are doing, but not why.  Why make this change?

> -static unsigned long binary_gcd(unsigned long a, unsigned long b)
> -{
> - unsigned long r = a | b;
> -

<snip>

whitespace is damaged and this does not apply.

thanks,

greg k-h
