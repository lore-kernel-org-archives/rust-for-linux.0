Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149871DF970
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621254; cv=none; b=E76qGw83DxX9Rk4df/tM+bFfDqsUagt/vCUmGQk7PVi/9OFp2iZOcxVCkmi2NbHBoPARvdriMOTiw9uXpCPiy3cdE+kxgKQnwy9/vRlub03iLETAL/3yrsmtzHVfTVymTyqX+xIR1q0iYNvJ7t8Z0GCYEKL3/ZSLhbM8oNKl3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621254; c=relaxed/simple;
	bh=OOx1aSDh5EiVSbBc5YiN9y7VVrEHpzgp1NaNWMod68c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXqy7ZcZLYseL+a0vdeffVW3nDvlkUwaBBFK4NScvTrs4RFOAHlZxAECoanaUpDUzNaxcZiLv5k8hTrnswTbCSWSxiIYuz8YN7Wt7KCSPSDAf1py6IWYzEdJGJYeFOalYPHMu0gQc31XsQwhRkpSXShsxwNYjZZyjUCUm8hfDWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hp5guqQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hp5guqQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE53C4CEDD;
	Wed,  2 Apr 2025 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743621253;
	bh=OOx1aSDh5EiVSbBc5YiN9y7VVrEHpzgp1NaNWMod68c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hp5guqQgaZItAKhPQwGhpwL0neWt7uXRnQczsBH+OSsnr9sdzy4eg3hJzqSflv5/x
	 qGyReEGbhfYTIrP9ook1xgiDtGEsloOzYsn/YNGQ4P0nlmHwKRB2RUaH20v25XfDM7
	 f9iyKw2YGSs77BDxwz7OG8aTIgHsZJ5fIOr4P7hA=
Date: Wed, 2 Apr 2025 20:12:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Daniel Wagner <wagi@kernel.org>, Boqun Feng <abstractionfbq@gmail.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: ABI stability and Rust
Message-ID: <2025040256-immature-winking-c062@gregkh>
References: <87iknmv1xs.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87iknmv1xs.fsf@metaspace.dk>

On Wed, Apr 02, 2025 at 06:44:10PM +0000, Andreas Hindborg wrote:
> Hi Daniel,
> 
> I just wanted to mention that we discussed ABI stability in our
> bi-weekly rust subsystem meeting today [1].

Linux, for C, does not support "binary api stability" not at all, UNLESS
you build with the same exact toolchain (i.e. your build will be
deterministic that way only.)

I don't see why Rust would be any different here, if you want stability,
don't change the compiler, it's that simple.

Yes, we all know how people/distros have gotten away with changing
compilers over time and the binary api does not change, but that's due
to how the c compilers work over tim.  It's NOTHING that the kernel can,
or should, do here.

So if anyone really cares about this, put the work into the compiler
side, it's not a kernel issue.

> a) Ship a blessed toolchain for each kernel image you ship. Users
>    building out-of-tree modules must use this toolchain.

That's what the enterprise distros, and Android, does today, why is this
not a valid option for them to continue to do?

> b) If users cannot use the blessed toolchain, they must link all rust
>    code into their module and ensure no rust symbols in vmlinux are called.

They are not guaranteed compaibility if they change their C compiler
either, so why would Rust be any different?

> Outside of those options, I don't think there are any other solutions. I
> would not hedge my bets on rustc getting ABI stability, ever.

Then just stick with the same toolchain for the lifetime of the release
they wish to keep stable.  Not anything that we need to worry about,
this is on the external users to care about if they want something crazy
like this.

thanks,

greg k-h
