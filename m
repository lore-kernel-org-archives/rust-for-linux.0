Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5660344DAA;
	Thu,  1 Oct 2026 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857869; cv=none; b=AUrPS1zu/aLzMMxPGzoPecVm0X7vmexiXgbslcEqCNEjy55TiBACbKt5+7uu/e2b5SCVus/IOlkj/5Rzt1Q2FcYEfQhw+lnQQ/PhVlbBXEp1bKLEt90TRjxVoVKDuYbZ5/jcGmDKMtJsZxahHZ5K6QYO+ciNAcgwAREQd+X4rdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857869; c=relaxed/simple;
	bh=yLxO/KKDs4CszGrMMzLILdfYsgN3l862z4Hgk+NA4E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3oFnQqBNSYIi97Ia1deFHyb9KAq9KD5nGJxseh22Frd90wtWI/aNbRuBCtlCzS0Q/4PQphtnvc596XO31ChGgPWFL4F+6dUs8+Le4iuHw+qeco/DDCin15haT1IX2JiDnT1tHzmyNOdgNlan7haTMahlgjUecZ8s2fT7b5ME1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wF1gVnpN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wF1gVnpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAC71F000FF;
	Thu,  1 Oct 2026 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790857867;
	bh=P21uTXU2HI+xJWnn1WNKTkjw5jEkTGmiulUoU7Yy7+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wF1gVnpNM1z8wRAbjpsDGF76ODOcqqdxOCpVwnqUSHpqIX2wj5mCcN2EDf8cRzmby
	 cD+iRorXgg/2Qn3d3LDM5rUVnFm+Int56VwSenK/CIDobYv4w0EKaGPvX8gsevkAbi
	 dh0MiVAuixTExtmWoq4OjpD0J3lb2xiwskmypWs0=
Date: Thu, 1 Oct 2026 14:31:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniil Detkov <d4n11l@proton.me>
Cc: Todd Kjos <tkjos@android.com>, Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] rust_binder: enforce delivered death process ownership
Message-ID: <2026100132-recollect-crabbing-bcac@gregkh>
References: <20260805-fix-rust-binder-death-ownership-v1-1-a89594c3b5db@proton.me>
 <2026080523-mothball-giant-c5a5@gregkh>
 <LkLJ6kna_XlfWWj0zhJ4JNfzildMiCWFyD-Nfn2iFVvRINHEiDhrWZ2kXEPSz24jcoIGquTtxQDxnPxcULgZY10H4Usp6PGd5NkIu7ho5lk=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LkLJ6kna_XlfWWj0zhJ4JNfzildMiCWFyD-Nfn2iFVvRINHEiDhrWZ2kXEPSz24jcoIGquTtxQDxnPxcULgZY10H4Usp6PGd5NkIu7ho5lk=@proton.me>

On Wed, Aug 05, 2026 at 02:28:38PM +0000, Daniil Detkov wrote:
> On Wednesday, August 5th, 2026 at 6:13 PM, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, Aug 05, 2026 at 05:50:56PM +0500, Daniil Detkov via B4 Relay wrote:
> > > From: Daniil Detkov <d4n11l@proton.me>
> > >
> > > The delivered_links field of NodeDeath may only be linked into the
> > > delivered_deaths list owned by NodeDeath::process. The existing safe
> > > ProcessInner::death_delivered method does not enforce that relationship,
> > > so safe Rust can violate the invariant relied on by a later unsafe list
> > > removal.
> > >
> > > Move the insertion boundary to Process and validate both the supplied
> > > guard and the NodeDeath owner before mutating the list. Keep the existing
> > > lock order and duplicate-insertion behavior unchanged.
> > >
> > > Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> > > Closes: https://github.com/Rust-for-Linux/linux/issues/1238
> > > Assisted-by: Codex:5.6-Sol
> > > Signed-off-by: Daniil Detkov <d4n11l@proton.me>
> > > ---
> > >  drivers/android/binder/node.rs    |  6 +++++-
> > >  drivers/android/binder/process.rs | 23 +++++++++++++++--------
> > >  2 files changed, 20 insertions(+), 9 deletions(-)
> > 
> > Cool, how was this tested?
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Hi Greg,
> 
> It was built and checked against rust-fixes with:
> 
>   make LLVM=1 CLIPPY=1 O=... -j32 drivers/android/binder/
>   make LLVM=1 O=... rustfmtcheck
>   make LLVM=1 O=... -j32 bzImage
> 
> I booted the resulting x86_64 kernel with
> CONFIG_ANDROID_BINDER_IPC_RUST=y under QEMU/KVM, mounted the binder
> filesystem, opened the binder device, and verified that BINDER_VERSION
> returned protocol 8. The boot completed without a BUG, Oops, or panic.
> 
> This covered the valid Binder open/ioctl path. The issue report contains
> an in-kernel PoC for the mismatched NodeDeath/Process insertion; I had
> not run that PoC when submitting v1.
> 
> If it would be useful, I can also set up and run the in-kernel PoC from
> the report against both the pre-fix and patched trees.

You are going to have to at least exercise your new code changes, just
doing a version number isn't that much of a test :)

thanks,

greg k-h
