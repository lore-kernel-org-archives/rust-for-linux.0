Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE469547066;
	Thu,  8 Oct 2026 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485391; cv=none; b=Q+29wrJHP931PozemUC7BAgAGRTsFqd+p1BcyjZ39doeULwr7GThJKw8OWA8vJvcCl4ubRrdupmESFZDNAJ1syz0ymSYsz2zPIpdEdqvyCsM5nyyuxNZY03dp4dlZ6G5GYG+fJU8ZMY1+ttcQWqvNnspfWTUlLzgwQj+yxYyU1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485391; c=relaxed/simple;
	bh=JROvVu6hVd77dekB9TPC/Sbdopydje9qpTj9YmZ67p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiz/DiWZC/ux0NV0es4G1H29C5iNPitGALa3cR5+lh0qaApbazUfek3Ay6QwdWAWwa2pkW2bKVRm5ncKgmCO6ZbfmFhtrAxk3CYa1oheNheLlX65I1G+H3FI0xUWVLd3JjDziCjf1hnohvWrYrqQFP2pPKkcZ/+K7vCRhM3i4eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlvaAFwm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlvaAFwm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6F11F000FF;
	Thu,  8 Oct 2026 18:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791485390;
	bh=JzQP7+k4YwtRhfjPdk5QdMpgrCw6IS5s2CFawQA0TrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VlvaAFwmXcXZGfvJKLcidRO8UX8QO716WlfzMLJh6GdTGD7mu8zNgf8EOv+kRxHC3
	 FnNeg/0tylGJ+8atDa0f6kqY8eqC4JrlI7JZb3k8NKt41zLtLOmkfM4EAtschV0FI8
	 LkgYRIAST1sSusG9nZlBCVBwNhz6T2TkBqV8OxKNfPP8lVRiy+bYN+5FX0Wom1vp7e
	 TgqUWH+ho52dPlAUM5zpiCQpAJUGI9uR9KFhstYQ5fiPSD0SwfnKo8hHlJrRJiavvC
	 UOfQHnxvKvXdK530WjgMfRosNYeXfrRLQJBQVhPBAZER1QdAi9fIY+nndFvF2F2O63
	 1eQI1eJPgnpnw==
Date: Thu, 8 Oct 2026 20:49:43 +0200
From: Thorsten Blum <blum@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in
 strcpy_into_buf()
Message-ID: <asflx_blsGkQ7Obn@kernel.org>
References: <20261008061326.177841-2-blum@kernel.org>
 <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com>

On Thu, Oct 08, 2026 at 10:15:49PM +0900, Alexandre Courbot wrote:
> On Thu Oct 8, 2026 at 3:13 PM JST, Thorsten Blum wrote:
> > Since strcpy_into_buf() already rejects empty buffers, use ok_or()
> > instead of unwrap_unchecked() when NUL-terminating the buffer.
> >
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> >  rust/kernel/uaccess.rs | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 5f6c4d7a1a51..2a0af795e75d 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -422,9 +422,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
> >              // This means that we filled the buffer exactly. In this case, we add a NUL-terminator
> >              // and return it. Unlike the `len < dst.len()` branch, don't modify `len` because it
> >              // already represents the length including the NUL-terminator.
> > -            //
> > -            // SAFETY: Due to the check at the beginning, the buffer is not empty.
> > -            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
> > +            *buf.last_mut().ok_or(EINVAL)? = 0;
> 
> I am not sure this gives us much - we are trading an unsafe statement
> that is well-controlled (enforced by the first two lines of the method)
> for a runtime check. I'd say this is working as intended here.

I checked the generated code before and after the patch and it is
identical since the compiler is able to remove the additional check.
Therefore, this removes an unsafe block without adding runtime cost.

It also avoids relying on the buf.is_empty() check to prevent undefined
behavior.
