Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064FB1684AC
	for <rust-for-linux@vger.kernel.org>; Mon,  5 May 2025 05:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746423377; cv=none; b=OvuKU+GG1aIKHzAq6nHcl9g1aVwgwYg2a/mPNSyFD7ToWF+XhRUorVKvdG+4FMAiTx3dlfAvz+pD+tt0lG9aFj4wcUzb/xiNWhShYoQyHhc0PCw78o4mRNy4752ACADQL7yem0sNu3qZQWPot2tSn0NrPt7gRUKSN0/0SX3r57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746423377; c=relaxed/simple;
	bh=mHeaxDr6z8xBsncG1M+oep/fPRLHj+9qKCryJu2VuBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASbYlH5LCEXEBdIq1rRVPIA7ZfghgaJdcbcN88y19gymnJjd6XtCjo6mDWkGBC8scRL8O3jI9PAXyQYlXSEIW+LLzkiwIVAFuktwAyKGIOsifuZLmSoM16gWkrvEmn84r59StO3kKPoD42Y5kaFK/KToxJCjC+Jmwsq/jlbQPoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VHDjhjF1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VHDjhjF1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30F8C4CEE4;
	Mon,  5 May 2025 05:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746423376;
	bh=mHeaxDr6z8xBsncG1M+oep/fPRLHj+9qKCryJu2VuBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHDjhjF1x1n9wyU2FCIhSbunsj645B2Bh7GRmzIoVrYqx10T65HnX8A9093vJCNop
	 zUNnKyS3GHqWrGjFR1I6xHREkFyNqydoGhCnBkMJSF7vlOHVlzshSoR0hqgNUnXysE
	 jnAS7H2uySJpgFwzbuDCAuSNuvQZ3dts+nCeM8eY=
Date: Mon, 5 May 2025 07:36:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/1] rust: kernel: create `overflow_assert!`
Message-ID: <2025050529-bronco-janitor-d796@gregkh>
References: <20250504164349.84149-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504164349.84149-1-contact@antoniohickey.com>

On Sun, May 04, 2025 at 12:43:48PM -0400, Antonio Hickey wrote:
> This patch set introduces a macro for overflow assertions, the use of
> this macro will avoid local `#ifdef`s by encapsulating the conditional
> behavior to the macro. In addition this macro allows us to document
> the intent of the assertion more clearly.
> 
> I also intend to add patches that add use of the assertion and 
> transform any existing asserts that could make use of it. I just
> wanted to get the ball rolling on the review of the macro itself
> before getting started with these patches.

An example of how this will be used is best so that we can see if it
really does make sense to have such a macro :)

So an extra patch in the series doing this is very good to have.

thanks,

greg k-h
