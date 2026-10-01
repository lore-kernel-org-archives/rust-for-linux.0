Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA329E10B;
	Thu,  1 Oct 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857969; cv=none; b=iACL6zClrX3DTxNkju1oY5px/2cwfgPBjxXC6XsW06SRo/usqD6y2yCI+Pct79FFPAuVFDT/cFRvsIpjYY/nlvrFiUH0fZTLfNXGMJ7CCMJMQRZGG6VlNCtwICXCVa3+iTfn384yAsNot5IBm+RE2CH3Rw8V+qWtlssa8yKfJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857969; c=relaxed/simple;
	bh=hjofdRnQL47CMjOSKL5ec3jVQHHPgQqmOdwEFpg9POc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOSY6wZS03DMrWJ/8FOFoDFM+NWfW4HMKmoYn8RN0ijF6gD4h2KnM7mSnJtIfjDXJuGRMTMghL4Rxm1ddplOUclZaYIm8A9tRe6QH8tLX2bWubLx75VbHobug0l/K0ndR4huLc5PUl8vRcKJWPQpka+qXcnEzKpsRdWd/dTz3Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jDFaq5vN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jDFaq5vN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2861F000FF;
	Thu,  1 Oct 2026 12:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790857967;
	bh=ylWAN7T3Q5wC7Zm4CynqN1Zmf2AkZx/EcWboGHR+P+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jDFaq5vNAQzHs6Wh8aG5/AnNApXIYG1/mWLX2ki45XUA2qhC5PxlcOK8BYUNRXwTd
	 pNG9cRQMKjqNEmPXfV5GMabvAhXw1xevDNhi+i+V+B3oR7o9JS70i5JMSt3YiMblu6
	 2JUWor+dS6zAgKK86dIH63KA8CzmD+P7FrKJCVHs=
Date: Thu, 1 Oct 2026 14:32:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 4/5] rust_binder: consolidate transaction failure
 prints
Message-ID: <2026100130-perjurer-frisk-4af2@gregkh>
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
 <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
 <CANiq72kb=X1igu+pK=KmAxqDncGYF9zpxrihSuSD3WaCUm336Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kb=X1igu+pK=KmAxqDncGYF9zpxrihSuSD3WaCUm336Q@mail.gmail.com>

On Tue, Sep 01, 2026 at 06:15:52PM +0200, Miguel Ojeda wrote:
> On Mon, Aug 3, 2026 at 9:30 AM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> > index a56ba6309594..380cd3f7276b 100644
> > --- a/rust/kernel/error.rs
> > +++ b/rust/kernel/error.rs
> > @@ -135,7 +135,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
> >      /// Creates an [`Error`] from a kernel error code.
> >      ///
> >      /// Returns [`None`] if `errno` is out-of-range.
> > -    const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
> > +    pub const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
> >          if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
> >              return None;
> >          }
> 
> Generally speaking, one should know from the context whether an
> integer is supposed to be an error or not, and thus it is rare to need
> this function instead of the public one (this one is private, and the
> two callers are here, not elsewhere in `kernel`).
> 
> So I wondered if Binder needs this -- I noticed the change when doing
> my usual go-through-the-ML exercise and asked Alice about it, since it
> seemed to me like Binder could perhaps avoid using the fallible
> operation (and maybe even define an `enum` for `BinderError` instead
> of a `struct` to be more precise about when a `source` is needed).
> 
> Alice told me that the `Option` in `BinderError` is just meant for the
> zero case, i.e. the raw integer there should not be a random value.
> Thus, since the `if` already covers the zero case, it does look like
> this could use the infallible operation since we do know statically it
> should be an error (modulo a bug).
> 
> So it sounds like the change can indeed be avoided, which should also
> improve the code.
> 
> In any case, if we keep it, then the `error.rs` change should be
> mentioned in the commit message.
> 
> By the way, I am still happy to take the first three patches unless
> Binder is picking this up.

I'll just take them all now, thanks.

greg k-h
