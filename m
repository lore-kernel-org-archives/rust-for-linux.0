Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E67288B1;
	Sat, 17 Jan 2026 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768651679; cv=none; b=P5Jon7/cJ/w1JaBjB2eQ6PfP8cHhpHwpHnDxxVki5baMrXug3igAPpheVQlcNvSWYx/hh/rbu4ZwLXAruBgDQGViJ0hy8E+mI+o59cP5JYQ/ABGDTQsGpqFpuAqD3v9VxBpcfyRWGMnvRcN3H2IGNoui0VTYXh1StIa9Se33MzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768651679; c=relaxed/simple;
	bh=YFDmJOZXPg9+lwxyexc3704uh9a049DRLpQcVHf0ZOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx5Qh6kSz4+nD02ZCFZUFca4+frp0TbJ9I7+gEoPROIqTeU/IA73Vx92Stm3Ed28dLiHSaF8tlQ12EmRaj9GBozfWR7NDcwl2PvVRkG192TRRiT+rveF7d8378UR4aNInDWxgHyHG3I2UxqX6RJ7W8blWmSFe/3U6Q2hwZL0TrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KPeZqiBg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KPeZqiBg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D27C4CEF7;
	Sat, 17 Jan 2026 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768651678;
	bh=YFDmJOZXPg9+lwxyexc3704uh9a049DRLpQcVHf0ZOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPeZqiBgVecwl1DROq3utXjSu3tYdnmSwRCYha1+FI2GKMmPyZG0zH7QrXKcUp7LA
	 1ONB/Fqouu3J0edS3z62j2mW/zYFRFqdIqkjbJU4qETTDBbeTrQBfhQGolrU40DPbw
	 e1XTZiS261kSdtFc1yXzSBEY13Ff7Cs1Nb4ldBT8=
Date: Sat, 17 Jan 2026 13:07:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, rafael@kernel.org, dakr@kernel.org,
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
Message-ID: <2026011703-bony-unloader-9099@gregkh>
References: <20260117094710.24301-1-work@onurozkan.dev>
 <20260117094710.24301-2-work@onurozkan.dev>
 <2026011725-contour-salary-d3d1@gregkh>
 <20260117140240.15d1120c@nimda>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260117140240.15d1120c@nimda>

On Sat, Jan 17, 2026 at 02:02:40PM +0300, Onur Özkan wrote:
> On Sat, 17 Jan 2026 11:00:11 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Sat, Jan 17, 2026 at 12:47:10PM +0300, Onur Özkan wrote:
> > > id_info() checks ACPI first and falls back to OF.
> > > 
> > > This replaces the unnecessarily verbose approach with a
> > > simple or_else() chain and drops temporary variables.
> > > 
> > > No functional change intended.
> > > 
> > > Signed-off-by: Onur Özkan <work@onurozkan.dev>
> > > ---
> > >  rust/kernel/driver.rs | 12 +-----------
> > >  1 file changed, 1 insertion(+), 11 deletions(-)
> > > 
> > > diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> > > index 649d06468f41..6cef792d54e4 100644
> > > --- a/rust/kernel/driver.rs
> > > +++ b/rust/kernel/driver.rs
> > > @@ -307,16 +307,6 @@ fn of_id_info(dev: &device::Device) ->
> > > Option<&'static Self::IdInfo> { /// If this returns `None`, it
> > > means that there is no match in any of the ID tables directly ///
> > > associated with a [`device::Device`]. fn id_info(dev:
> > > &device::Device) -> Option<&'static Self::IdInfo> {
> > > -        let id = Self::acpi_id_info(dev);
> > > -        if id.is_some() {
> > > -            return id;
> > > -        }
> > > -
> > > -        let id = Self::of_id_info(dev);
> > > -        if id.is_some() {
> > > -            return id;
> > > -        }
> > > -
> > > -        None
> > > +        Self::acpi_id_info(dev).or_else(|| Self::of_id_info(dev))
> > 
> > Have we already started the game of "rust golf" on the kernel?  The
> > original code here is much easier to read, and the compiler should
> > produce the same thing for both, right?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
> I don't know what "rust golf" means, the main motivation here was to use
> a more idiomatic Rust pattern.

I was referring to this:
	https://en.wikipedia.org/wiki/Code_golf
sorry for not being explicit :)

> Functions called in Adapter::id_info already return the same Result
> type and it's quite annoying(IMO) to do "if x.is_some() { return x }"
> in cases like this. Clippy would argue on many cases similar to this.
> Readability is subjective, but to me the new code is slightly simpler
> to follow (as it does the "try X, then Y" thing in a shorter way).

Does clippy complain about this one?

> That said, I don't have strong feelings on the new code. The main
> motivation was to drop the "annoying" code with more idiomatic one,
> but seems like not everyone agrees with it. Feel free to ignore the
> patch if you prefer the original code.

I don't have strong feelings either, but the original is "easier" for
those of us used to C code.

thanks,

greg k-h
