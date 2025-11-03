Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FDD2E6CD7;
	Mon,  3 Nov 2025 22:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762210610; cv=none; b=nbEiC8VbRdYcNjB8W3Qo74J2A7Y/stfQyNbLnYP8iKfB8lJz3+PlKd/OK3VlHj37M5oFQ62l6/mTFQ2TiwFIL3Rw/sA2GXz/njSCb8cU5o0Cb/QiZxbLNkGuA6g1PFObMSykdLz3jBlG4Cb4yBcqQhfRmiC5EEdS0kyz+ethIl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762210610; c=relaxed/simple;
	bh=kBSQuQaccg5Qh0Xy8cIaqRbglLmVLW1HoYw7SoIodBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L95fhVxucKvNy/ct6xFZsUhPZnhUCR8NIcHIWWX/AFCLnmD0tlaiSKh7o/HEPFJwgjsTO+e0xrBSlA+34IHfxeUPhjJRi70gQptZ/Qgr69nYP3YtJr0SAEL7DCZFCzTDRio3duCzBRl7NYo+qXyn/muUWdNOo2NHhqXKF3H9vDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ueEa7lWd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ueEa7lWd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B861C4CEE7;
	Mon,  3 Nov 2025 22:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762210609;
	bh=kBSQuQaccg5Qh0Xy8cIaqRbglLmVLW1HoYw7SoIodBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ueEa7lWd0st/Q7g//5sQNqDuaOKDJFGHIG9luktVM4nYLJ0Ry3Am6O93nnMVijCbR
	 2DpW7HlGp82w3MfgQbr86MviL8SOazG2852uosetj1h8BOs4a7Yt2gptGdziztzJlT
	 CnrD4GSCvpa/MsIjzh6M5p7Ear/lU6pYRxIDb0B0=
Date: Tue, 4 Nov 2025 07:56:47 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH] rust: usb: fix broken call to T::disconnect()
Message-ID: <2025110425-anew-squall-2ac8@gregkh>
References: <20251103110115.1925072-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103110115.1925072-1-dakr@kernel.org>

On Mon, Nov 03, 2025 at 12:01:03PM +0100, Danilo Krummrich wrote:
> A refactoring of Device::drvdata_obtain() broke T::disconnect() in the
> USB abstractions.
> 
> """
> error[E0599]: no method named `data` found for struct `core::pin::Pin<kbox::Box<T, Kmalloc>>` in the current scope
>   --> rust/kernel/usb.rs:92:34
>    |
> 92 |         T::disconnect(intf, data.data());
>    |                                  ^^^^ method not found in `core::pin::Pin<kbox::Box<T, Kmalloc>>`
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0599`.
> make[2]: *** [rust/Makefile:553: rust/kernel.o] Error 1
> make[1]: *** [/builddir/build/BUILD/kernel-6.18.0-build/kernel-next-20251103/linux-6.18.0-0.0.next.20251103.436.vanilla.fc44.x86_64/Makefile:1316: prepare] Error 2
> make: *** [Makefile:256: __sub-make] Error 2
> """
> 
> This slipped through, since the USB abstractions are globally disabled.
> However, the USB tree recently enabled them, hence it showed up in
> linux-next.

Sorry about this, should we also enable it in the driver-core-next tree
as well, to catch these types of things?

greg k-h
