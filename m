Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342F61C8604
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182284; cv=none; b=npbfGmPN53vVzu9pwaboV8hqefZ1/FXOEdqg1G4h9hfcjmD7uvemoJ4MTA+4veG2+MoPsySIe6QWcano5McxEa2zBgRhc9jQDk9UVB8T5Faiwc/MXWQp2zXX5BLETgqrDT/3cVuw9IlmdnvEJSh+zhOMf0czYUVxYg80/xsCIFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182284; c=relaxed/simple;
	bh=Ug4RrIT0MeWvXEHA8TMTBxva6Pyuc/K1fiLoFVvLvXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pz8WDbaycvqToE5LuaS5mTXW3a1pqACoedb4YMY+SfaczFzcX+CL8yVMiq8w+zVSV9ay3iqStVD+Qb2MDH3xSp+l3uz4hnAeaTrv5gwcVqs1BAM0/x1WkcNkuqatWpEZn13G2G4QmjFIAxuwCM3fpxlfu4EGYIGSnJpVPlT2Qqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VlPfU20t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VlPfU20t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B1FC4CEEF;
	Thu, 14 Aug 2025 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755182283;
	bh=Ug4RrIT0MeWvXEHA8TMTBxva6Pyuc/K1fiLoFVvLvXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlPfU20tw2USqeMgK/M+eVEru4v8t/opvYtb5MTC4alYrB333aoRdDs9RzafqcIfi
	 1vpKG+bJOKKmQzuzEyuP1Xg3p5gb1Do0TklIOSKppJpEMyJGIHPug/yvFD3tf7ugfe
	 ycFMKy/GA+sPfBouyDMhyCvqQk1gMXGw/xwdRm5U=
Date: Thu, 14 Aug 2025 16:37:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Untrusted Data API
Message-ID: <2025081416-sufferer-economist-3f00@gregkh>
References: <20250814124424.516191-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814124424.516191-1-lossin@kernel.org>

On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
> I didn't have too much time to spend on this API, so this is mostly a
> resend of v3. There are some changes in the last commit, updating to the
> latest version of Alice's iov_iter patche series [1] & rebasing on top
> of v6.17-rc1.
> 
> I think we should just merge the first two patches this cycle in order
> to get the initial, bare-bones API into the kernel and have people
> experiment with it. The validation logic in the third patch still needs
> some work and I'd need to find some time to work on that (no idea when I
> find it though).

Nice, thanks for reviving this!

And we should at least add an example using it, otherwise it's not going
to help out much here.  Add it to the misc device driver api?

thanks,

greg k-h
