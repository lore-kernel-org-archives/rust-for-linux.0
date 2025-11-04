Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0937F1E991B
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266415; cv=none; b=prhRMfgjI5GdCPpo+lmHBzQ5E14V/iU9pIx909Nx7s3u63uAdXYGpBVxyHeUDI20P2aVzVIEUTmxlxu6VaJOdNbqGioBTGFixEj+H4IhukijXhIhoHhJN6iEDB+dxNED4IWYOKs8U5KGrYNzstqxcgFJvacoRQ3SPOVmybwgNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266415; c=relaxed/simple;
	bh=l17URLcmYdhKdy8lWOx/I166Wxn+aX5InxIu5NF0XuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pC3lP4DlQpFtZFJ4RThSCVI06FxqSpfP89TCZXZbM6ZcftWpE31I7fqh/Nu+iuHyp1AisDHrC1blRpwQxL+GgTgj+nrL/9SrbyDd062fN37x/ybrzjfkNd5m7y7Uc1qlszBtQ6hzSUwDsmw+fRr6NjSP1ThV3U7aeXrGkFt9X7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NP3qdLNV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NP3qdLNV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54791C4CEF7;
	Tue,  4 Nov 2025 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762266414;
	bh=l17URLcmYdhKdy8lWOx/I166Wxn+aX5InxIu5NF0XuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NP3qdLNVmEeXd3oSvGObSOoMtwAKaQb4OTL0lW58F6gRFUZk9Bi5h2ahprFe96sH+
	 XDFTCaBON7ryUELBFABP7Pq1usH4nrHpIUWPYSoWJYo6MfnT8QiiPDc4QJjiCxLguP
	 dpcVo4REwsSbnrVPnxquYsTLSnvKELXC9MD2VhFw=
Date: Tue, 4 Nov 2025 23:26:49 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Subject: Re: ABI mismatch build error for 6.17.y and rustc 1.91.0
Message-ID: <2025110413-universe-aerosol-2e83@gregkh>
References: <2025110452-diligence-share-98d3@gregkh>
 <20a1d4f3-1fa3-4789-aa7d-385d33ea9324@de.bosch.com>
 <2025110402-banister-speech-7228@gregkh>
 <CANiq72mENsw=uVUbMFzOor8ZmoeurX+0hiN49fhzBgqMWMM-KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mENsw=uVUbMFzOor8ZmoeurX+0hiN49fhzBgqMWMM-KQ@mail.gmail.com>

On Tue, Nov 04, 2025 at 11:39:37AM +0100, Miguel Ojeda wrote:
> On Tue, Nov 4, 2025 at 8:43 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Ok, but why am I not seeing this on 6.18-rc?
> 
> It happens in mainline too, so a few possibilities are:
> 
>   - You have the toolchain forced to an older one (can happen e.g. if
> you are using `rustup` and you have an override on a path, even if the
> default elsewhere is another).

I am using:
	make CC=gcc-14 -j32
as my build command line.  Hm, that's a mix of gcc and rustc, does that
even work?

>   - You are not enabling doctests (KUnit).

CONFIG_KUNIT=y

>   - You are not enabling KASAN.

CONFIG_KASAN=y

The full .config can be found here:
	https://github.com/gregkh/gregkh-linux/blob/master/stable/configs/6.17.y

The issue only started showing up when I moved rustc from 1.90.0 to
1.91.0, nothing else changed on my system that I can determine.

> Please let me know if you still do not see it, because that it is
> definitely not expected.

I have those options as set above, so this is not expected :)

> I committed the fix yesterday -- it should be in tomorrow's -next.

Cool, what's the git id?  I'll be glad to try it.

thanks,

greg k-h
