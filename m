Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CA62080E8
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 12:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422336; cv=none; b=o3+MK+//0bPnWN1hE9by/DAsIRBZzH4KA1gHcyOXhek4xTYuMP+ly5pwPYHaqMtwmM9qGCdYoctI06r130GYkpSVvK9nKmjyJZkr/3aJTspfIIdpVqLXz7C/bsFDPvIS59G7cElgKTgrslGXpI1wW81k+gYXDsm25CP+BJSkqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422336; c=relaxed/simple;
	bh=PrMLeEjPIpMrzq/C0ktbg597Zu1KpregEgWDJ2HYTJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apvBIxLrUV+ufM6A2tjQBvCdeSQVnQp/NBlzUYnTDl3nZfG0GVFGLxjtgS7U+hEuBhZRrA+0TINCjVXlOnYe0f2S7FO01UohWNr20kD5uZ5O0aP+96eFLzCgcXyI5psTTaUuU4JgaCoRCIGdvWYZMRzYvinBPD8tS2apYBJirPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF4FE16F2;
	Fri, 20 Jun 2025 05:25:14 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8D043F58B;
	Fri, 20 Jun 2025 05:25:30 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:25:26 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org,
	alex.gaynor@gmail.com, aliceryhl@google.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFRi8cqkIzOAIbeR@arm.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux>
 <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
 <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>

On Thu, Jun 19, 2025 at 03:17:31PM +0200, Benno Lossin wrote:
> On Thu Jun 19, 2025 at 2:26 PM CEST, Daniel Almeida wrote:
> > Hi Benno,
> >
> >> On 19 Jun 2025, at 08:01, Benno Lossin <lossin@kernel.org> wrote:
> >> 
> >> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
> >>> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> >>>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> >>>> index 445639404fb7..12b296131672 100644
> >>>> --- a/rust/kernel/drm/ioctl.rs
> >>>> +++ b/rust/kernel/drm/ioctl.rs
> >>>> @@ -139,7 +139,7 @@ pub mod internal {
> >>>>                             // asserted above matches the size of this type, and all bit patterns of
> >>>>                             // UAPI structs must be valid.
> >>>>                             let data = unsafe {
> >>>> -                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
> >>>> +                                &mut *(raw_data as *mut $crate::uapi::$struct)
> >>> 
> >>> I think we have to document the guarantees we rely on to create this mutable
> >>> reference.
> >> 
> >> If the C side is using pointers to read/write the value concurrently,
> >> this is wrong, it needs to be wrapped in Opaque.
> >> 
> >> ---
> >> Cheers,
> >> Benno
> >
> > How can this happen, exactly? Can you provide an example that corroborates it?
> 
> I don't have the context on this, I only saw a raw pointer being turned
> into a mutable reference and that's only possible if there are no shared
> or other exclusive references for the duration of its existence and no
> raw pointers are being used to access the value.

In this particular case, that conversion should be sound, as the raw pointer
originates from kernel's drm_ioctl(). The memory is being either allocated
dynamically or provided on the kernel stack for the sole purpose of serving
the handler. It's being exclusively owned by the handler for the duration of
the call. There is no concurrent access nor shared references, unless the
handler decides otherwise, but I do not see the reason why it would.
Within this strict scope, it should be safe to assume exclusive access to the
memory. This should align with Rust's aliasing rules ?

---
BR
Beata
> 
> ---
> Cheers,
> Benno
> 
> > The general pattern for drivers is to fill an uapi type and then wait on an
> > ioctl. The kernel then copies that using copy_from_user, so we're safe from
> > that perspective (i.e.: from the perspective of concurrent access from
> > userspace).
> >
> > In kernelspace, we usually extract arguments from the uapi types to then
> > dictate further processing inside drivers. In what way are these shared with
> > "the C side" ?
> >
> > If the result of this discussion is that we agree that this Opaque is not
> > needed, then we definitely need this patch, because using Opaque<T> complicates
> > all ioctls implementations by making it harder to get to the inner T in the
> > first place. We would have to needlessly add a lot of unsafe blocks for drivers
> > that wouldn't otherwise be there.
> >
> >
> > -- Daniel
> 
