Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F15834DCC8
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437621; cv=none; b=o8DNnPk45Fg8veI2P2W3CRiPNTlHF3+oliM2HuwuQabRE2snMri6Lsv6IHxCFRB9FYQRxaz669eGfNNxi6sQ68TlehEuPptbaIc3uc6s0twdSMuH0qI0TzDEahwo9a94ZyO2hH7vMjri3JHn3UZ7aaRM2hrdQu1yeTjtq68K/M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437621; c=relaxed/simple;
	bh=s65KxCyR5EuV+k9xrYjFUiz46fHXPXLBIgsyTCK3ptk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r39pVltC8CiZSFLPpyBYFIi67UrUu7gZDPw7Dt82rIghgcL7qgqtQ3VyPL4gmJsAcJADrYhK96EqOiTJTTzIjxgrwjeur9We0P+YpyvhhSt6JBIibeIV30HFvpudvZhUKPoDj0SwKFZuqjt4BzXVLu1kO10TJ2iLtuH2XpPStDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mfyevu9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mfyevu9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90501F000E9;
	Tue,  7 Jul 2026 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783437613;
	bh=bhS5XwPh/2irfExaTH6TRgyt9BNmPmeLWGLWb858l8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mfyevu9MwMzeGcabPfgEUs6sqZYevaFRbxQ/1Dt0a4+nZZj/xUn4dvzETdJBIjEFi
	 /3emG3ESlrPLFdWX7cpTL9M9FxABbTRtzeENC6gGYYZLv1bUE/qBPesySlYMyg//ml
	 wSKn7ooBYDSoMGgpujy52xfdDiyT205IDD9yWIu0=
Date: Tue, 7 Jul 2026 17:20:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: FUJITA Tomonori <tomo@aliasing.net>, ojeda@kernel.org,
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, boqun@kernel.org,
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: bug: Add bug_on macro
Message-ID: <2026070746-roulette-catfish-57d6@gregkh>
References: <20260707143026.2774023-1-tomo@aliasing.net>
 <DJSF9IBYP207.2UQXDE9IVSRUF@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJSF9IBYP207.2UQXDE9IVSRUF@kernel.org>

On Tue, Jul 07, 2026 at 04:51:40PM +0200, Danilo Krummrich wrote:
> On Tue Jul 7, 2026 at 4:30 PM CEST, FUJITA Tomonori wrote:
> > Use of this macro is heavily discouraged. Prefer warn_on() macro with
> > recovery code where feasible. See the documentation for C's BUG_ON()
> > for guidance on when it is rarely justified.
> 
> Given that, can you please spell out the motivation for this patch?

I agree, this should probably NOT be added unless there is a real user
for it that requires it and we all agree that crashing the system is the
only way out.

thanks,

greg k-h
