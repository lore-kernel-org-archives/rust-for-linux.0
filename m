Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2013EEFD3;
	Thu,  8 Jan 2026 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863361; cv=none; b=mQ9b4VAN/AdFgAMRiHpHtWHC+Fx5k78Q7V1wu6v1hUySnbloUW2c2/j8y8MTNdU9cPQjet/ENHJGIlrF6o/JGpnMLuPzZaVKpHQjIw7KZdWD1YtlxyHSrhJHDvqDSDrpb7nwO3ysqZXJMY5Dc9oXTtFnN14MwUivc3PhAVzNtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863361; c=relaxed/simple;
	bh=ul+qucXcb57Qq+ox1YlCsjn3DBBPXSqzNqXtfJtKEVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRR667lR2vSovp96bA9JbaHxbcTNM4NwbSRA8FrgeQfxKu4nB1mfrcRYLiteQaTw90/zoz68mSZaJdB/exQxhWGLyDLSqMgHxjZOEpeGvdgMKN2TezhpJf+PdXeWPtZHApS8dvBw/4K/IRJEk6EbgfmxnMSdtVFswzG3Fq3rqX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A/ZTyXzg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A/ZTyXzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8CEC116C6;
	Thu,  8 Jan 2026 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767863360;
	bh=ul+qucXcb57Qq+ox1YlCsjn3DBBPXSqzNqXtfJtKEVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/ZTyXzgTIv5U+rDYNZwj1ZrindrX04x9RrW8K6cTOnz6FxDmr3V+VykE7d8tIPnX
	 OrMARay/xnFn1GmLqGbdEFjUekLlTlaa9KQ8xMApj8K0zAM+7KAUHgWtCmuU08rnIW
	 ceCNEWoujAbE5k6RkQGND3hW3bue/cQ50lrQqFT0=
Date: Thu, 8 Jan 2026 10:09:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pengfuyuan <1064094935@qq.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	pengfuyuan <pengfuyuan@kylinos.cn>
Subject: Re: [PATCH] rust: device: add platdata accessors
Message-ID: <2026010819-zone-impotency-21f1@gregkh>
References: <tencent_C135881D822B4C6C12E841516893C774A805@qq.com>
 <2026010858-yonder-seventeen-361f@gregkh>
 <tencent_7AC5B74D51D3BA562D760B2E583115A06B07@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_7AC5B74D51D3BA562D760B2E583115A06B07@qq.com>

On Thu, Jan 08, 2026 at 04:51:54PM +0800, pengfuyuan wrote:
> Hi Greg Kroah-Hartman,
> 
> 
> Thank you for reviewing my patch.

Great, but please don't send html email, it doesn't go to the list :(

> Regarding your points:
> 
> 
> 1. **About the real name**: My real name is indeed Peng Fuyuan (彭福远).&nbsp;
> &nbsp; &nbsp;I apologize for the confusion - I was using my personal email (1064094935@qq.com) with `git send-email`,&nbsp;
> &nbsp; &nbsp;which didn't properly include my name. I will resend the patch using my corporate email&nbsp;
> &nbsp; &nbsp;(pengfuyuan@kylinos.cn) with proper git configuration.

Ok, but then it should be a "v2" patch, not what you just sent again.

> 2. **About the actual user**: Yes, this API has a real user. We are currently developing&nbsp;
> &nbsp; &nbsp;a minimal display driver for the Rust for Linux kernel project - similar to simplefb,&nbsp;
> &nbsp; &nbsp;a minimal framebuffer driver. We need this platform data accessor API to retrieve&nbsp;
> &nbsp; &nbsp;platform-specific display configuration data.

Great, submit this accessor when you have that driver ready and then
send it as part of a patch series.

thanks,

greg k-h
