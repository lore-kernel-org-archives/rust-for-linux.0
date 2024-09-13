Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D11D86EC
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229421; cv=none; b=YkwOgIOqNai+ofRtEgHvqHQnPAF7URulNiVlECcJMq39vG5RnIh2r59p8Hnn8zwMAFRijdD+lOL0H/qFK9MpTJmhO97z7xQpvzPffBP4DfI5qepn0BXKTik0EFXOvUmfmEAKpPpquMoDhxVbfylnWpLAxKDQqCNyyur9TTLQwa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229421; c=relaxed/simple;
	bh=LsF7aDp47R65Gut1LMT7e1GKuZAXNTr9GCJZP8KFUNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYarpC4WCQ+GCXRMau/W62q2skc9ue2OvKZGUBcTZnm+jtsHlt6CwkP9FO1Zue1mAnLrrgX4xCzJb1APtCcJslEnvPJJYKjiw0826OXeIrKv0MRfaO9nztzvigcU+4Bjau1UtaN9/8UUvAq1RdPWICQJxzql3Ti2eztRS6YXKpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yA9i1QGS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yA9i1QGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3D5C4CEC0;
	Fri, 13 Sep 2024 12:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726229421;
	bh=LsF7aDp47R65Gut1LMT7e1GKuZAXNTr9GCJZP8KFUNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yA9i1QGSJN4j6+KlyetGlI2gApFmi0S6qD7h/7UHWLI4ACPMhXZrTXdADTFa0b1Zg
	 AP+pJOSgNop2srrLa5HzW6zRDEzJKjfohxjR3ao0VmFrn5QWcP6TOQef+souIeq5Nh
	 WBwdE9eAMhawAn/87Gghh7QkW5oLoFfKUO1Y3BoI=
Date: Fri, 13 Sep 2024 14:10:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/3] Untrusted data abstraction
Message-ID: <2024091313-uplifting-hardcopy-395f@gregkh>
References: <20240913112643.542914-1-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913112643.542914-1-benno.lossin@proton.me>

On Fri, Sep 13, 2024 at 11:26:54AM +0000, Benno Lossin wrote:
> Enable marking certain data as untrusted. For example data coming from
> userspace, hardware or any other external data source.
> 
> This idea originates from a discussion with Greg at Kangrejos. As far as
> I understand the rationale, it is to prevent accidentally reading
> untrusted data and using it for *logic* within the kernel. For example
> reading the length from the hardware and not validating that it isn't
> too big. This is a big source for logic bugs that later turn into
> vulnerabilities.
> 
> The API introduced in this series is not a silver bullet, users are
> still able to access the untrusted value (otherwise how would they be
> able to validate it?). But it provides additional guardrails to remind
> users that they ought to validate the value before using it. As already
> stated, they can access the value directly, but to do that, they need to
> explicitly call one of the `untrusted_*` functions signaling to
> reviewers that they are reading untrusted data without validation.

As you say, this is NOT a "silver bullet", but it IS something that will
help squash so many kernel bugs it's not funny.  I've been wanting
something like this for C code for a while (much like we have __user
markings), and it will help call out exactly where we are doing "is this
data valid or not" calls, and where we are NOT doing those calls, which
is also important to know (as many data streams are not touched by the
kernel.)

It will also help with the detection of where user and hardware data can
influence code logic, much like the spectre work has highlighted needs
to be tracked in order to help catch "gadgets" and other places where
it is not intended for userspace to be able to control cpu registers in
malicious ways, but it happens too often.

Thanks so much for doing this work, and I can't wait to tie this into
many driver subsystems going forward.  I'm sure the "vfio" people will
want this, given their preoccupation with the marketing idea of
"hardening" a vfio driver :)

> There are still some things to iron out on the Rust side:
> - allow better handling of `Untrusted<T>`, for example allow comparing
>   `Untrusted<[u8]>` for equality (we should do this via a trait
>   extending `PartialEq`)
> - rebase this on Gary's patch to enable arbitrary self types. This would
>   allow me to remove one `untrusted_mut()` call in `inode.rs`. I would
>   expose the `cap_len` function even if the underlying data is
>   untrusted.
> - get more feedback as to what `Untrusted` should make available
> 
> In addition to adding the abstraction, I also provide very experimental
> RFC patches using the API in tarfs by wedson. They are based on his
> vfs-v2 branch [1] and I will not aim to upstream these patches. They should
> give you some idea as to how the API is intended to be used.
> 
> Open to any suggestions and improvements!

I like it!  I'll see about tieing it into the miscdev patches and any
future code that has ioctl handling once they show up on the list for
inclusion.

thanks again!

greg k-h
