Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0877D35F609;
	Sun, 19 Jul 2026 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784455513; cv=none; b=Xw6q+A5Xw5MdHZAw2WBjesSkUG3sl9K0VPO3xZwaUSt9KbYutMHBDByVF2gRtJx3Z921NSmc5PUEPRdEY1MBZWjcgtYj8FRYDhi7+UFHLLPVdlOxKDKIIgQ//pSnKU5N/Iker7lXEttWYuDBgx5QBWjcQFYJibia8HZJzT7mJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784455513; c=relaxed/simple;
	bh=3shPyPn8+cWMEqQTfc1KM6EAc4/VoKtiWuH4pmVbCXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGcz7YeUEf25MTDsm535o33VSB/u0NnQUgRDh9Y46yt3xU0FAfm3NSzBeJdGepHr6sur3HXFmbKU7/YthaTQr8vRZtHUEBjGt+JOzQiC29UAT0FJVjaGJ94+amobsgl/Rskq3CFNucNP+6xG7SzwJ0ru1pwepHNRSl3E3i01J54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HfknqRRX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HfknqRRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4A41F000E9;
	Sun, 19 Jul 2026 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784455511;
	bh=4cosTUVa6aCI3kwxQTz06PTGpT0H9kZ5PGvWSC6j+tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HfknqRRXqXX9x9PIAgyfwCTWDfMCOMp1kV2sp9RCiOcumoL5H0UUnZcj7DsfkloV5
	 uB8reVzEpdQDvGHDijIztgNciLLRgnBUAn+JNLROjbswIML1snHqCNO7oyql8Xb0MD
	 p33788yl0+TScsJ9F1t1IEMAXKt23SkysJLwUAG8=
Date: Sun, 19 Jul 2026 12:03:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: jahnavimn@google.com
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust_binder: Update looper_flags bitmaps to use
 kernel::impl_flags!
Message-ID: <2026071928-tapered-tattered-8433@gregkh>
References: <20260719-b4-rust_binder_impl_flags-v2-0-7a5debdfa39c@google.com>
 <20260719-b4-rust_binder_impl_flags-v2-1-7a5debdfa39c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-b4-rust_binder_impl_flags-v2-1-7a5debdfa39c@google.com>

On Sun, Jul 19, 2026 at 09:56:58AM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> - Define `LooperFlags(u32)` and `LooperFlag` enum with 7 variants.
> - Change `InnerThread.looper_flags` type to `LooperFlags`.
> - Update looper state transitions and checks to use type-safe methods.
> - Convert `looper_flags` to `u32` for hex formatting in `debug_print`.

This is a list of things you did (i.e. what), but nothing about "why"
you are doing this.

Take a look at the kernel documentation for how to write good changelog
text.  It's usually the hardest part of making a patch, and these two
should be rewritten a bit to explain why you are doing this type of
conversion (i.e. the information in your patch 0/X should be in here,
right?)

thanks,

greg k-h
