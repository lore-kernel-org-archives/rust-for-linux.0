Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980A26CE0F
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 05:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762579703; cv=none; b=fK4A8u6JssYFCocbzSdtDgE7QkJbwtsUBHDWndkd1Y3uS39YbGLGfqGEtVo4fI08VFn8JxW5PmAFbp9JLl0b/ZnbhBHrBmxUPdBM9TWyTtXE6O1gcTVfErCjP5Swil0F1Ys/N6Mta+KO8UuuDbEpGo/Cn9Wr8juyP6ardX+r9Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762579703; c=relaxed/simple;
	bh=LeFnh/o3go7lZxyiAx/GlW8/nYvunBFgWp/ejJKf5h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbM8Gq9P0fkIsHDln1Xo2dH3HmLhcIgXoEjZYG6QER/CdQxVpqKB2Tq43JjBkiyF3t6dYrczZUTbVnyZTnuT6zy49376Fu1CHcXPRyd4H/pRJZQZ0cKKNAC+fiS3F9Kn2ftDmlXQL7P+g/YdI8eCHqvdyen3cQBODTcnNw6nGX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vcmbs0+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vcmbs0+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313E8C4CEF7;
	Sat,  8 Nov 2025 05:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762579702;
	bh=LeFnh/o3go7lZxyiAx/GlW8/nYvunBFgWp/ejJKf5h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vcmbs0+BznLRjOJL5u5Y0cx1LgyYONwk0MvbNqEDBRkoo4P453tdWKPb1jOVKHaJo
	 t6NqOTGOjv+DOAkbLGBzEtMrrHIh0DZnVxqTt+daxQnFQ/gmljiV+3b2VQEUBDqCZw
	 bsmuGTsoGzLIBxOVTEZAtLKd87pVaobFnjd4yyEU=
Date: Sat, 8 Nov 2025 14:28:20 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Subject: Re: ABI mismatch build error for 6.17.y and rustc 1.91.0
Message-ID: <2025110856-down-hypnotic-8490@gregkh>
References: <2025110452-diligence-share-98d3@gregkh>
 <20a1d4f3-1fa3-4789-aa7d-385d33ea9324@de.bosch.com>
 <2025110402-banister-speech-7228@gregkh>
 <CANiq72mENsw=uVUbMFzOor8ZmoeurX+0hiN49fhzBgqMWMM-KQ@mail.gmail.com>
 <2025110413-universe-aerosol-2e83@gregkh>
 <CANiq72nXfq8EJ+-ib044+zGbr2N4hJ_Ygte-4a_dmx4A3S+dng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nXfq8EJ+-ib044+zGbr2N4hJ_Ygte-4a_dmx4A3S+dng@mail.gmail.com>

On Tue, Nov 04, 2025 at 04:10:29PM +0100, Miguel Ojeda wrote:
> On Tue, Nov 4, 2025 at 3:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Hm, that's a mix of gcc and rustc, does that
> > even work?
> 
> It "works" -- it is a best-effort hack as we always warn, but some
> distributions do use it.
> 
> GCC being used is unrelated to this issue though.
> 
> > The full .config can be found here:
> >         https://github.com/gregkh/gregkh-linux/blob/master/stable/configs/6.17.y
> 
> I picked this one and run it in v6.18-rc4, and I see the issue as expected:
> 
>     git clean -xdf
>     git checkout v6.18-rc4
>     curl -o .config
> https://raw.githubusercontent.com/gregkh/gregkh-linux/refs/heads/master/stable/configs/6.17.y
>     make olddefconfig
>     make
> 
> What is the config where you do not see the issue (after it gets
> sync'd, not before the build), i.e. the one for 6.18 that does not
> fail your build?
> 
> > The issue only started showing up when I moved rustc from 1.90.0 to
> > 1.91.0, nothing else changed on my system that I can determine.
> 
> Yes, the issue starts with Rust 1.91.0, so that is expected.
> 
> > Cool, what's the git id?  I'll be glad to try it.
> 
> It is the one from the rust-fixes branch:
> 
>     fad472efab0a805dd939f017c5b8669a786a4bcf
> 
> It is the top one in the rust-fixes branch at either:
> 
>     https://github.com/Rust-for-Linux/linux.git rust-fixes
>     https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git rust-fixes
> 
> (Dirk gave the parent commit of that one, but in your case you need
> the top one too)

This is now fixed up with the patches tagged for stable, thanks, and
sorry for the noise, I didn't know it was already queued up.

greg k-h
