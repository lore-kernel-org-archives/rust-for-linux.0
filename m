Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAFB3FD140;
	Fri, 17 Jul 2026 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294587; cv=none; b=jbNW6jahHXuRBJj5NDxYWZ6dlwhEpP0RONUIO10vwLy89RIZvlfMBBNIct+yORTDNogXFMLxo3tvzkIYw0BXGRV5ACXio4JA944N2wNx/MV5dp5wnZRKnVNaVKJCL9Ds7YoRvvJiMYNqKUoO7QMlhylLM/she+V8VJY5i2MUyok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294587; c=relaxed/simple;
	bh=Il9UILCALjju8GRJPz2z1S8+hFXDJIDnUwRA7HLYBcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRlc6KVHU7Mlqe8AcMtlsCJFobQAlSoZZpCjg13jbap3TaK9k508DtbZtqCDvyUQD+HdUqI1TYxN8XzbiI9tSzzdf/GQDyvV4JE4lgH5NnCwj9ezvxzFz8ywwaAbqfXwqhLaoZ8g2tvxOFCjzWMFN3QvZlb84bFy6K8SS9Ybec8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p7wJahjK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p7wJahjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9EE1F000E9;
	Fri, 17 Jul 2026 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784294585;
	bh=+88XkvfkaMBqk6mqxAwVYZf0/M2dsMMx9wCZWU8vgYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=p7wJahjK5Ytt8ZYEuv/nrLPO63xBAqXsuE9oXVWuY1Js7KB3vojqL9BsURWFVclnP
	 8MqxvG9Fww4/qtdcOcP4m7KPW0b+W62hcjyhKTyHpZ9xbWNQhoTpeffzgIpdCuyLAj
	 g8ruJgpNM1ovUTO4BvITY6cvF4Zt7YUudA61KqGc=
Date: Fri, 17 Jul 2026 15:22:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: jahnavimn@google.com
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] rust_binder: Update defer_work bitmaps to use
 kernel::impl_flags!
Message-ID: <2026071741-aspirate-foothold-6645@gregkh>
References: <20260716-b4-rust_binder_impl_flags-v1-0-b4201d3f15b3@google.com>
 <20260716-b4-rust_binder_impl_flags-v1-1-b4201d3f15b3@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-b4-rust_binder_impl_flags-v1-1-b4201d3f15b3@google.com>

On Thu, Jul 16, 2026 at 01:02:34PM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> - Define `DeferWorks(u8)` and `DeferWork` enum using `bit_u8` offsets.
> - Change `ProcessInner.defer_work` type from `u8` to `DeferWorks`.
> - Update `Process::release()` and `Process::flush()` to check for empty
>   states using `DeferWorks::empty()`.
> - Update the workqueue runner to inspect flags using `.contains()`.
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---
>  drivers/android/binder/process.rs | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)

This is the only patch in the series that applied.  Can you rebase and
resend the other 2?

thanks,

greg k-h
