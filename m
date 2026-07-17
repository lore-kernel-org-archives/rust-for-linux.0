Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783BC429CFB;
	Fri, 17 Jul 2026 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298922; cv=none; b=ByWnA6hAYJ2A5ayuHnKzSX9nYfMabNwKn5HsyYRNonuNqoz7avk2sRjDh9x81NFl5W/YE1DtPd94fmC4++C1MXJqVJXTFPOPI9VGcuYi3DkB4YXyGVMXYBJvpTww8pyRXJ2ysB5CjjM7QtLrvzv1J0Jb5B18Z2W2GcqpmhKPcrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298922; c=relaxed/simple;
	bh=3QD4liklG29fA/4OxUAMVAU7+OG0IQcIFzskydz3FZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzF6U2+lPqKzp+gvI1M9Ymvc5D0BsNag8CmKPu/U2oJU4jEIknR/s1I2JxhN1u6dB/pmWLEVwPN07HVtvk89jW61LOSQhsyB6rA1iZ0KhEcEsAujN3MxxcAon+edShgPR/u1YXMeLSMhbh7H48vFjMutSylBflUG2DurwZLNdGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A/Xufx7C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A/Xufx7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A030D1F000E9;
	Fri, 17 Jul 2026 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784298921;
	bh=Ttg3gnsDom3czoU01ODutbajemkq0LzLfWdWhESk8IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A/Xufx7CbJVvXWf5KlpgOe40JhtJumMzWpGOMvgzmmogNczbTnngXmW+hYr6sU7KY
	 hx0OysFwG+NOVlaYCi3V3OffbxO4MZT1e3oGt9xb/NS99gO714jKQC0ouzjpaZn37d
	 Isn874VD7KqX5niLUn/DS5B4XQa4tTKyPY7xM3D4=
Date: Fri, 17 Jul 2026 16:35:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] rust_binder: avoid allocating under node_refs for
 freeze listeners
Message-ID: <2026071704-acorn-backstage-e0ba@gregkh>
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
 <20260707-binder-noderefs-spin-v4-1-7c3c8bc16339@google.com>
 <2026071755-covenant-shining-6910@gregkh>
 <CAH5fLgjNm_aHLTE-XH=S+nukEW0o5MLe8Uih1nmn6io7e7fDZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjNm_aHLTE-XH=S+nukEW0o5MLe8Uih1nmn6io7e7fDZg@mail.gmail.com>

On Fri, Jul 17, 2026 at 03:48:07PM +0200, Alice Ryhl wrote:
> On Fri, Jul 17, 2026 at 3:20 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jul 07, 2026 at 10:28:51AM +0000, Alice Ryhl wrote:
> > > The node_refs mutex needs to be changed to a spinlock, so in preparation
> > > for that, update freeze.rs to avoid allocating under the node_refs lock.
> > > This is done by adding a retry loop so that if add_freeze_listener()
> > > requires reallocating the KVVec<_> of freeze listeners, the caller will
> > > allocate a larger vector and retry.
> > >
> > > Analogously, the remove_freeze_listener() function is updated to return
> > > the empty KVVec<_> when it is no longer needed, to avoid calling
> > > kvfree() under the node_refs lock.
> > >
> > > Reviewed-by: Matthew Maurer <mmaurer@google.com>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  drivers/android/binder/freeze.rs | 65 +++++++++++++++++++++++++++-------------
> > >  drivers/android/binder/node.rs   | 41 +++++++++++++------------
> > >  2 files changed, 64 insertions(+), 42 deletions(-)
> > >
> >
> > This doesn't apply against my tree now, given all of the binder patches
> > now added?  Can you rebase against char-misc-testing and resend?
> 
> I believe this is already in char-misc-next as commit b9d17aa74ddd
> ("rust_binder: avoid allocating under node_refs for freeze
> listeners").

Ok, sorry about that.

I've now gone through all pending patches that I saw on my side for the
binder code.  There were 2 that needs review from you:
	https://lore.kernel.org/r/20260618121202.6258-1-iganschel@gmail.com
	https://lore.kernel.org/r/20260616170956.2580772-1-georgeandrout13@gmail.com

and then there's the ratelimit patches outstanding too.

If I've missed anything else, please resend.

thanks,

greg k-h
