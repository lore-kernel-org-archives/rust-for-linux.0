Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB2426EAE;
	Wed,  8 Jul 2026 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512713; cv=none; b=a2uD5+Hnzna4cFh7t8WjwpFKrhGCqF5b0/3o4F2PidLvmLPn58R9x1WsPO/dL2x9O/r2llN1ygFuJ4zH4st8Zb13NG6cnuE5hW/zQFqQNKoSktmSJ+cxxEK7lzafHq+/s41ID3M1X9ZfTY+Tvko+qUSNQKoqgqly9IVojXxWBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512713; c=relaxed/simple;
	bh=YuVg/A8nzbR1vzy0BVnG94qB5k4N0tm9uyq1MkxAyOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxMoj2Vd82KZZDVYe0gqoXhZiud8JvAZf+45PD7/YlpX9bwdhmv8G9REbNq3ir8p2U1atuadVRUs86JUzaRCjSTIL5m5rGQlQC6r9dfJjECQqeqdcG0GFciCyv39DW0a+QuS0Jy0nR8b9U0ytBm7JKlX3GP5F6p6Ye0UHvIZylI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CqNufpfn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CqNufpfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E561F00A3A;
	Wed,  8 Jul 2026 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783512712;
	bh=lOEKoGrPdbGEP0PG5ifUz/gaynrGE8HN3ZFwVGtxRxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CqNufpfnknqItvJjJ/nWpdJ9HwB93gO/jZGcvgTJRPJRaqJNiLsUPUV+JI4F3+pGE
	 i/aara5ISG8l9oHCAJ+w2q+rEKks9YbySyDVx6RFEA587F+z+OCXfxemdBF4zy0zl7
	 bN4yK/9FcrB388W9BP8qbrwtNNzBNL0F6n6jduyA=
Date: Wed, 8 Jul 2026 14:10:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?iso-8859-1?Q?Nicol=E1s?= Antinori <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] usb: rust: Use pin_init::zeroed for usb_device_id
 initialization
Message-ID: <2026070828-sedan-unisexual-b1d6@gregkh>
References: <20260625224927.404258-1-nico.antinori.7@gmail.com>
 <CANiq72mx1EDo4EYLUMN63_MtScJjobbPH3QCZ50oJCnZ9vc27g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mx1EDo4EYLUMN63_MtScJjobbPH3QCZ50oJCnZ9vc27g@mail.gmail.com>

On Sun, Jun 28, 2026 at 12:08:56PM +0200, Miguel Ojeda wrote:
> On Fri, Jun 26, 2026 at 12:50 AM Nicolás Antinori
> <nico.antinori.7@gmail.com> wrote:
> >
> > All types in `bindings` implement `Zeroable` if they can. This enables
> > using `pin_init::zeroed()` for `usb_device_id` initialization instead
> > of relying on `..unsafe { MaybeUninit::zeroed().assume_init() }`.
> >
> > This change improves readability and removes unnecessary unsafe blocks.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1189
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> 
> Looks fine -- if needed I can pick it up via `rust-next`.

I'll take it, thanks.

greg k-h
