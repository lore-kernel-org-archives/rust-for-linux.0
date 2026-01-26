Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4889A2F691A;
	Mon, 26 Jan 2026 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769432136; cv=none; b=hPGsifdUcQ081YorMeB5cZHyhTiNXPZldduf6zm9R36grFgll0i0okLyeAYqKPizrmt+y6+oh6qHci5CVP8hbuWF9sD9IyTSwkRbS7u+8SbNkLgSxK/6Qi7IpJpDlcVBcSoLintEBaye88SMC9EhEkOzCl4Dpvz4WJyBpiotgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769432136; c=relaxed/simple;
	bh=/3FDSqpe13eYoePtAPrhXHerdpUKhLRlxj3FnwL5W5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnKyHZVSG/KIWUgGY13k8uUM+IvPFnA7nfQb8xKG8JwAdVbp2umoFYqMrTEA+zUrVFuBOMIaO/GVfnijpYgsQVUVxwBzOFzph9F6U43ieUB41vBwKuy+AVQT6VccXG8Rz1YoFpZAJTidPyQD6JgcDHxbNq+fIkPLQac3QnkOwTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kdEf9LSO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kdEf9LSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93265C116C6;
	Mon, 26 Jan 2026 12:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769432136;
	bh=/3FDSqpe13eYoePtAPrhXHerdpUKhLRlxj3FnwL5W5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdEf9LSO1DqI0bn0hL/XLHoYHQU2tT4IZZCHMLZQI2A9FVp8Ic0nkQZw5CLjV8JtI
	 LtjPRTzlYvLd3nMLDxls2YhyEVkJ1IUQ8nDeduQH+YN5wXQeqgWNtwGMQRylJvXJU4
	 zQU1y0c8+HByhlNu68nGgJ7JjomR62gbldjFIHPE=
Date: Mon, 26 Jan 2026 13:55:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: engineer.jjhama@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] rust: tty: add TTY subsystem abstractions
Message-ID: <2026012648-pungent-wackiness-0242@gregkh>
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
 <20260126-rust-tty-printk-driver-v1-2-28604e7e100e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-rust-tty-printk-driver-v1-2-28604e7e100e@gmail.com>

On Mon, Jan 26, 2026 at 12:22:09PM +0000, SeungJong Ha via B4 Relay wrote:
> +/// Major device number for TTY aux devices.
> +pub const TTYAUX_MAJOR: i32 = bindings::TTYAUX_MAJOR as i32;

This does not belong in the rust bindings as something to export, sorry.
I see you wanting to use it in your example driver, but if you do need
it elsewhere, just declare and use it there, the rust layer should not
be the one exporting it.

You also are exporting lots of other stuff with these bindings that are
not needed or used.  Are you sure that's the right thing to do?

thanks,

greg k-h
