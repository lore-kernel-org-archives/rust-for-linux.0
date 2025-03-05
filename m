Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3701A24A07E
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184335; cv=none; b=lzVKO1hPnEqbMUahtvx026aOhiC3Z492TBgiEB+yZ3+NhBRbBH5hbVgzsEaNzuA0ik5BqI4LMfbaolHxu1TfTXsfMPoHZHkYUyO2iy4RWyfoSkmD6tbB0e1S5huhUcPIe60u8RPz7nudGWVcL5pM3ndAmCpz0U2GKguKy1810Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184335; c=relaxed/simple;
	bh=BAAgKgR4xIIcvdll89c0wd4FSu3s2iavQ44YkGjwmqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biVUlBq41NmXyQX25PN5bP/JdDTa0lCnXvDlORsn1VZW0xFXMo78gNL7Ga3sBhTOSibYtK7AS6MNEb1Hhe/8pGBlOYBP7+pBfD40BKkadslqdb5o2BuIzgqJ1rD9IAWVOeC4glTvCU2p1sjtV4sLjNBWVxiF6v77loV6VMer4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rIe7HIIG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rIe7HIIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5ECC4AF0B;
	Wed,  5 Mar 2025 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741184334;
	bh=BAAgKgR4xIIcvdll89c0wd4FSu3s2iavQ44YkGjwmqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIe7HIIGaPr03+Cfmw1kA/eAMZG5uHtNyLqJW/GKaMFxA/Z2xGjt2Nr+0f5M2fa0c
	 1CkuZOeVQ7Tv9E4VHOpA24zUX/GwZPigZImeQaC+hqERjA05PgE4pf/GCs+soxvonA
	 KOfpr9nWxSRq0aAZUhgL0Q3npE76NeMyobO5W2rY=
Date: Wed, 5 Mar 2025 15:18:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org, felipe_life@live.com
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
Message-ID: <2025030550-confront-unjustly-b6ce@gregkh>
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
 <2025030439-sharpener-overkill-ada2@gregkh>
 <51800499-e91e-48f5-b7ee-08a4d488add3@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51800499-e91e-48f5-b7ee-08a4d488add3@gmail.com>

On Wed, Mar 05, 2025 at 09:46:16AM -0300, Filipe Xavier wrote:
> On 3/4/25 11:09 AM, Greg KH wrote:
> 
> > On Tue, Mar 04, 2025 at 09:55:11AM -0300, Filipe Xavier wrote:
> > > We have seen a proliferation of mod_whatever::foo::Flags
> > > being defined with essentially the same implementation
> > > for bitAnd, bitOr, contains and etc.
> > > 
> > > This macro aims to bring a solution for this,
> > > allowing to generate these methods for user-defined structs.
> > > With some use cases in KMS and VideoCodecs.
> > > 
> > > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> > > Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> > > ---
> > >   rust/kernel/bitmask.rs | 171 +++++++++++++++++++++++++++++++++++++++++++++++++
> > >   rust/kernel/lib.rs     |   2 +
> > >   rust/kernel/prelude.rs |   1 +
> > >   3 files changed, 174 insertions(+)
> > > 
> > > diff --git a/rust/kernel/bitmask.rs b/rust/kernel/bitmask.rs
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..8d26a541c693a2cb60096059ecb708d895bb3ad1
> > > --- /dev/null
> > > +++ b/rust/kernel/bitmask.rs
> > > @@ -0,0 +1,171 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +//! Bitmask utilities for working with flags in Rust.
> > > +
> > > +/// Declares a bitmask type with its corresponding flag type.
> > > +///
> > > +/// This macro generates:
> > > +/// - Implementations of common bitwise operations (`BitOr`, `BitAnd`, etc.).
> > > +/// - Utility methods such as `.contains()` to check flags.
> > > +///
> > > +/// # Examples
> > > +///
> > > +/// Defining and using a bitmask:
> > > +/// ```
> > > +/// bitmask!(Permissions, Permission, u32);
> > Nice, but why not use the same api/names that are already in the kernel
> > for this type of functionality in the C .h files?  That way we have
> > consistent names everywhere?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Makes sense, my mistake, I didn't know...
> Could you send me the reference of what already exists in the kernel so I
> can change it?

Look in include/linux/bit*

