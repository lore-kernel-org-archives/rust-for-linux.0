Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22381FFC49
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 15:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964560; cv=none; b=PmqoVe/bLpmhY//z0NrkuZjaTbuyHLPRb20Fx4LJb77KWpUR6AjjpfbWvnKOzNdQ18eAafUtsiB9DY/50cM4Ie2HAEO74U4gnAhTq8+xhTqOOm7gXFy5aNtUF2UXlxhN0eDLNmkGDMU6Hegsyohurkv7W5Z+te+x1OPcZ1hVbg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964560; c=relaxed/simple;
	bh=oVTWb/iSf8zd5q71b+0aDp2MfQ1jwkV4CJwJ7ZKwr3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNSO2QQHR75cenghoPMtaBGZzFSOwoyJSceX8WmVFt2gppMBAzUd6kdRvQxwLxsZp76FrWS53cOQaBD8OQCGfXgu3g2L8g459Pb7SV5Qek8ETJVkS4b2918SYFqleJWxCyYw2XKJrpFXQpkq3IEDwisV5uUonlj84oM755BY3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xRKv00NP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xRKv00NP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E9CC4CEE3;
	Fri, 14 Mar 2025 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741964560;
	bh=oVTWb/iSf8zd5q71b+0aDp2MfQ1jwkV4CJwJ7ZKwr3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xRKv00NPTJ6FbFDg3SMgutO70tCDtfRsWXUfvfhH9jJ4hE+ociFwdIjl9ZVkncfly
	 +8SVYrU5cKJ03auiiJCQUfQMB5ohwHVhrwcLzogoVYoWac2zjRUVJEUZHZRhgH/ECr
	 xcw+71z8RSU5hIz3S5thSJpxSsDZG5JZTlTMFttI=
Date: Fri, 14 Mar 2025 16:02:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	felipe_life@live.com
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
Message-ID: <2025031444-acre-boxlike-8af1@gregkh>
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
 <2025030439-sharpener-overkill-ada2@gregkh>
 <1A434368-6B92-4C64-8B5A-17499C8E2F1B@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1A434368-6B92-4C64-8B5A-17499C8E2F1B@collabora.com>

On Fri, Mar 14, 2025 at 11:18:56AM -0300, Daniel Almeida wrote:
> Hi Greg,
> 
> > On 4 Mar 2025, at 11:09, Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > Nice, but why not use the same api/names that are already in the kernel
> > for this type of functionality in the C .h files?  That way we have
> > consistent names everywhere?
> > 
> > thanks,
> > 
> > greg k-h
> 
> IIUC, there is already someone working on that [0].

Great!

> Can we just leave this macro somewhat as-is as a mere convenience for driver authors?

Why have multiple apis for the same thing?  That just makes reviewers
confused as well as developers.  We don't do that for C code :)

> My latest review comments include a name change to make it less confusing in this regard.

I would just like parity where ever possible to make things easier for
everyone.

thanks,

greg k-h
