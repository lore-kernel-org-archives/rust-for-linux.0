Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD89F4BEE3A;
	Fri,  2 Oct 2026 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949343; cv=none; b=K2xroikkRkYdXmdUgI5gLVtWphhu6HAOktUGyO1ojJc6XNUT7WFTNh67o1icf2P1Q0B3uhCIDAsvRXGebtINmVTDQZsHjZl6mPlX58xcCiO9jy7waaMlZzHoDzM5H2YmLIH4imzQU7UTRWtt5AsCCRK41CArGeawb2WFfjakEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949343; c=relaxed/simple;
	bh=XGl9/4B0AC4QzIfpy6TTmO8HFeANmnCZoqLfz2TLN7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgoUe/Bl7jcxwqxpu22pj4L3mce5lxabrFCw0fcIWP4nxYD/1mPXTS1iHisSvsBCasTTra4K31VR6uFlnFFiCw5Hun4php9XOgN0/IyKA9EbVnUdMF4j2zlXAsrtdFeajnkNy/iTpVW0GkJ/RTy4E7FZ16XhJVFXhcUNM494/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e5uzEsnN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e5uzEsnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA201F00893;
	Fri,  2 Oct 2026 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790949341;
	bh=syRqJi39MobVuFgnAfjessK14/9PENQjEyrEnkPiu5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e5uzEsnNvq8Cn7XpTdV3MTPU3r4O7ZffJ6BaQd2x6EcEKW3E36rzW0PPJsEJAKPW6
	 77/4ir6Wm4AQhdsRqXlBljYhVveR4HbkdQ757BrpXpb+6jFuYJygTXde113GtHquUN
	 cfNe6vTMemhtD1ObRDliIvCPvZ6CjNdDD4lQ69I4=
Date: Fri, 2 Oct 2026 15:55:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: misc: use `#[optional]` attribute of
 `#[vtable]` macro
Message-ID: <2026100227-ambiance-stellar-f378@gregkh>
References: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
 <20260811-vtable_macro-v1-3-50c5aab3c211@garyguo.net>
 <CANiq72nU8LgH7jYtFRQGdwvNvbdmLNxcP0-5PgMWFUvQ26KRCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nU8LgH7jYtFRQGdwvNvbdmLNxcP0-5PgMWFUvQ26KRCA@mail.gmail.com>

On Fri, Oct 02, 2026 at 03:17:13PM +0200, Miguel Ojeda wrote:
> On Tue, Aug 11, 2026 at 3:56 PM Gary Guo <gary@garyguo.net> wrote:
> >
> > Replace the `build_error!(VTABLE_DEFAULT_ERROR)` boilerplate with the
> > `#[optional]` attribute.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net>
> 
> Arnd, Greg: may I get a quick Acked-by on this patch?
> 
> It is a change that simplifies boilerplate -- no "real" change for
> you; miscdevice is just the example for the series.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
