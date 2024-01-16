Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F395911181
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O0eUNXtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29067C433C7;
	Tue, 16 Jan 2024 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705389635;
	bh=BoexUhJCZuFDAmKxp8h5z5OxgxSYBBBbC0h4xciXqy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0eUNXtGBbHX/cVBqvdX3g1zW5WCH+tV5M0sqwWrBvNEs0bR/QDNlYdPIDWjQ6NCC
	 jomWhhuhkJsMMgnSRjjuwTJD+K/E4BLU22snGvnGxHy9lk1RxYDPlDn5ICE6Ibdmr3
	 f9guIQ1m75hGbEBUauWUaB2Cmv7W4XkBsNJbB8M8=
Date: Tue, 16 Jan 2024 08:20:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Antonio Hickey <antoniohickey99@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: task: add `as_raw()` to `Task`
Message-ID: <2024011656-acetone-canine-fed8@gregkh>
References: <20240116022823.64058-1-antoniohickey99@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116022823.64058-1-antoniohickey99@gmail.com>

On Mon, Jan 15, 2024 at 09:28:22PM -0500, Antonio Hickey wrote:
> Added new function `Task::as_raw()` which returns the raw pointer
> for the underlying task struct. I also refactored `Task` to instead
> use the newly created function instead of `self.0.get()` as I feel
> like `self.as_raw()` is more intuitive.

Nit, this says _what_ you are doing, but not _why_ you are doing it.

Why do you need "as_raw"?  Who is going to use it?  What is it good for?

thanks,

greg k-h
