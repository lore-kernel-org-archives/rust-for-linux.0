Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535E2BE63F
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234890; cv=none; b=AuLmDS17g9ynV+vtyg8bclvqB6LgA0YFjkEXxO++jG2M9f/p8qgie27uAu+EgmvSibKYMW2Uc3WdbtnK5ahBYdjsrdP4zQDrQUju3jiF4886ilj2w+WjDJ+96GAVRhCYVADcnJRAaXGQ64MNfg0M8AyFP9lC6ly05gydzmKaGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234890; c=relaxed/simple;
	bh=Ic+5hS8IUxD7NMQdIwMB08GF68cO8FfaSGTr6xykDBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0IN71BeOc9eaXD9ZxMhA+Fu+oBdDE2TWXE/gbTHLzGo/hIZVVj6dQ16DwBw834XmHeMMzFPATTDUcVhPxdxkKj6JX+FYC9pTO2m2LBjxJSTLPr0tCg8HjWp3gWhO9EXICmcXsiPy1SfsOat6jbP2cGSnp6tAZuBPHePjBK6UXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eslfDRW8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eslfDRW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EB1C4CEED;
	Fri, 11 Jul 2025 11:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752234890;
	bh=Ic+5hS8IUxD7NMQdIwMB08GF68cO8FfaSGTr6xykDBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eslfDRW89d8bO3kKJ3G8NssXHPaDWb8Fyzzvga2cAYzpJUPQLCqujc7JXvQIU+XBr
	 LvR8EduXQ2ghtgQpYdZ6RtkF4W/ZYO+Pa9wCWZGVmDQxjkQWK7jj7w+i2qkAffvbAt
	 bNVWZC1UqutSF5b5KbnxWHIvi6acrmLJ49SuZImA=
Date: Fri, 11 Jul 2025 13:54:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Quaternions <krakow20@gmail.com>
Cc: acourbot@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In
 PmuLookupTableEntry::new, data is sliced from 2..6, but the bounds check
 data.len() < 5 does not satisfy those bounds.
Message-ID: <2025071114-unknowing-childlike-4969@gregkh>
References: <20250711113327.39201-1-krakow20@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711113327.39201-1-krakow20@gmail.com>

On Fri, Jul 11, 2025 at 04:33:26AM -0700, Quaternions wrote:
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I know I can't take patches without a changelog, but perhaps other
maintainers are more lax?

Please don't do this...

And fix your "From:" line in your email client?

thanks,

greg k-h
