Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB3E79B8E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727165144; cv=none; b=PvugQUrceY2jUKfhUzP/x5el1/Kw4XOqTn35i619fOKBOprQcDDr3X3v2RFF+NkKWmMHmlawslLIyy9Zc5ZQdk6iAvuYQrhZVvoM0ckgRnv3QPywH4Gic9Wu2qqezMt3gL/l9M6lGVvfYpVDvF5DGA1UQSEoc0GVaaBuomIyuf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727165144; c=relaxed/simple;
	bh=YamyxaECwykcVd3PWvt1E8IfgR8jKby0zvsvg6Th8eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlO5cOmUnwDnHEtt0TZSe2kz75KhUDKo9hcGvB+imqZsb4xuzh3Y4YTUg1GKPDLWv1M9DKGgyxCQdtZkdm2acetlARtHt2bZJ1gzr4/4GrGciAB0PhiWh5q5z+7VEfGHl8kaeWqxTJycY1UpVusiZvJkLRZCFVE5h4cFDFboLrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Qmm7YCfQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Qmm7YCfQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c413cf5de5so6957161a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1727165140; x=1727769940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHfI3mxfaZ97439KqpGRwZCYka1MjWE3dOOK8L6BF/g=;
        b=Qmm7YCfQigkxESMqtUsWOrQnRs3VU7UFcsFZKauEACTFDqoVKvFG+v5k0pw4Yg1fsh
         f6W0xMJhLzgYz3FPFPYymg7WAoBtf1WxFi166bjuf1eu6SWSu9lnnqVvTf2LhbIp/9RF
         iBExjHStAu6f5g5AohlIDFPmmIi2fTM6dSIwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727165140; x=1727769940;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHfI3mxfaZ97439KqpGRwZCYka1MjWE3dOOK8L6BF/g=;
        b=cKad/BI+d8wb5XLBe7OWzh/hqn16Y3j6A4XrK8UygAe8fCkm6mLMP6oSSaLEvEb0HP
         md5fpn5Pdep0id/99k7609lBJD2QyqnrMq07tmUG7lJ9Jw/w3vIq0X4t9CdjUc3Joi//
         D5yQYn0wylwWSt8Pv/f8YRFqb7t/5VYyik/3BEWSmmGCiH8ORA+anDb+528OEBo+s37E
         LMB8eE+GN0LKqoxPe6HpH1RqsAuYz/BjEM813gvCB7v5Y288FIk9Ug5tKmB1r04CY7Dv
         ldwRpV4nkDLnWI5En1g+d/UIQ5HytkgVcyDnE2w4ceGgxu0E6aAOHNB6AO1ug+We8hu+
         RJhw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ1Cu7ifz9SyupoaYLOS9VQd8H16xpFVKy//A0XMcvTFb/HfqZ5urQB9uxxlCPtYs86zNFb+eaI6B0+gt0uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWg0d1FCot1zyGEvpSbbcMtaI8pWeY9We5ou0r858nWy9jbRGi
	sFbABciHWtCrsVKQkcvvksfsghfwJEWGgxWIAKoH8CQzf2NcrDoIFE+ogV2DApl+Si2hbJ2wtWr
	L
X-Google-Smtp-Source: AGHT+IEiyAYiAeUrXJnQJvE/P5Ju31KPfilLsrv3bTLlwt9jU46CLtP18JaKqhkWh+4cM8Hk2g7Usw==
X-Received: by 2002:a17:907:1b10:b0:a90:4199:2a73 with SMTP id a640c23a62f3a-a90d4fdea16mr1443215166b.5.1727165139663;
        Tue, 24 Sep 2024 01:05:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9393138ac4sm52190566b.216.2024.09.24.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:05:39 -0700 (PDT)
Date: Tue, 24 Sep 2024 10:05:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: add untrusted data abstraction
Message-ID: <ZvJy0aZL5I339r6j@phenom.ffwll.local>
Mail-Followup-To: Benno Lossin <benno.lossin@proton.me>,
	Greg KH <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240913112643.542914-1-benno.lossin@proton.me>
 <20240913112643.542914-2-benno.lossin@proton.me>
 <ZuRbSxwlz1xWT1pG@phenom.ffwll.local>
 <cf0d6189-e81c-4b7c-ab50-7a297c69b132@proton.me>
 <ZuhTdwCqz61bQEgq@phenom.ffwll.local>
 <3c7b27e3-eedc-44c7-a31b-d927214cc9f8@proton.me>
 <ZvGScCHfprZcymFQ@phenom.ffwll.local>
 <d3b44a97-83db-4bea-b89e-9d631c98ed1e@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3b44a97-83db-4bea-b89e-9d631c98ed1e@proton.me>
X-Operating-System: Linux phenom 6.10.6-amd64 

On Mon, Sep 23, 2024 at 04:56:08PM +0000, Benno Lossin wrote:
> On 23.09.24 18:08, Simona Vetter wrote:
> > On Sat, Sep 21, 2024 at 07:45:44AM +0000, Benno Lossin wrote:
> >> On 16.09.24 17:49, Simona Vetter wrote:
> >>> On Fri, Sep 13, 2024 at 04:49:29PM +0000, Benno Lossin wrote:
> >>>> On 13.09.24 17:33, Simona Vetter wrote:
> >>>>> On Fri, Sep 13, 2024 at 11:26:57AM +0000, Benno Lossin wrote:
> >>>>>>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
> >>>>>> @@ -532,3 +533,248 @@ unsafe impl AsBytes for str {}
> >>>>>>  // does not have any uninitialized portions either.
> >>>>>>  unsafe impl<T: AsBytes> AsBytes for [T] {}
> >>>>>>  unsafe impl<T: AsBytes, const N: usize> AsBytes for [T; N] {}
> >>>>>> +
> >>>>>> +/// Untrusted data of type `T`.
> >>>>>> +///
> >>>>>> +/// When reading data from userspace, hardware or other external untrusted sources, the data must
> >>>>>> +/// be validated before it is used for logic within the kernel. To do so, the [`validate()`]
> >>>>>> +/// function exists and uses the [`Validator`] trait. For raw bytes validation there also is the
> >>>>>> +/// [`validate_bytes()`] function.
> >>>>>> +///
> >>>>>> +///
> >>>>>> +/// [`validate()`]: Self::validate
> >>>>>> +/// [`validate_bytes()`]: Self::validate_bytes
> >>>>>> +#[repr(transparent)]
> >>>>>> +pub struct Untrusted<T: ?Sized>(T);
> >>>>>
> >>>>> I think we could make this a bit more strict and instead of encouraging
> >>>>> people to put all their validation code into a Validator<T>, force
> >>>>> them to. Which means assuming apis wrap all untrusted stuff in
> >>>>> Untrusted<T> reviewers only need to look at validate implementations and
> >>>>> nothing else.
> >>>>>
> >>>>> If I'm not too wrong with my rust I think this would work with slitting
> >>>>> Untrusted<T> into two types:
> >>>>>
> >>>>> - Untrusted<T> is just a box you can't access, and the type returned by
> >>>>>   apis for untrusted data. It doesn't have any of the functions except
> >>>>>   validate and new_untrusted so that you can't get at the data at all.
> >>>>>
> >>>>> - UntrustedUnsafe<T> does have all the accessors needed for validation,
> >>>>>   but you can't construct that outside of this module. Maybe simplest to
> >>>>>   just nest this within the Untrusted<T> box.
> >>>>>
> >>>>> - Untrusted::validate does the unboxing and passes a reference to
> >>>>>   UntrustedUnsafe<T> to Validator::validate, to guarantee that all the
> >>>>>   validation code is in there and nowhere else. Similar for
> >>>>>   validate_bytes.
> >>>>>
> >>>>> Of course people can still bypass this easily, but it gets a bit harder to
> >>>>> do so, and easier for reviewers to verify everything.
> >>>>
> >>>> This is a great idea!
> >>>> I think we should also remove `validate_bytes`, then you really must
> >>>> implement `Validator`. If we figure out later that people need it, we
> >>>> can add it later again. I added it because I thought that implementing
> >>>> `Validator` for something very small might be very annoying, but it
> >>>> seems like you actually want to force people to implement it :)
> >>>
> >>> See further down, I think there's a real use-case for validate_bytes, or
> >>> something really close to it at least.
> >>
> >> Could you point me to it? I wasn't able to find the use-case you are
> >> referring to here.
> >>
> >> If I remove the `untrusted()` function, then I would think that I also
> >> should remove the `validate_bytes` function, since you could just do:
> >>
> >>     untrusted.validate_bytes(|_| true)
> >>
> >> Which would give you access to the untrusted data without validation.
> >> (of course one could also do this in the `Validate` trait, but I feel
> >> like if we have exactly one place where this can happen, it will be a
> >> lot easier to catch. We could even have some tool that looks for
> >> `Validate` implementations that just return `Ok(untrusted)`)
> > 
> > So the use-case I've meant is the in-place validation, without copying
> > stuff around. So it wouldn't be the specific validate_bytes, but a
> > validate_inplace. In my original email I did directly call it that, but it
> > took me a w/e to realize that validate_bytes is really just a special-case
> > of validate_inplace when T = [u8], and so really we only need
> > validate_inplace for every case where we do some in-place validation.
> 
> Ahh I see, then we don't need `validate_bytes`.
> 
> > And yes validate_inplace would be a very easy minimal escape hatch to just
> > unbox the unvalidated data. But fundamentally we can't prevent that, all
> > we can do is make sure that the validation code is concentrated in very
> > specific places reviewers can easily catch, and |_| true probably not
> > being correct validation code is rather easy to spot.
> 
> I don't think that it necessarily has to be an escape hatch. I think I
> can design an API where you can choose if it will be done in-place vs
> copied, while still using the `Validate` trait.

Yeah if you can put both copy and in-place validation into the Validate
trait then might be cleaner, I just didn't come up with a way to do that.

> > I do think we need inplace validation for the fairly common case where the
> > copy_from_user is split from the validation, e.g. when you copy a big
> > chunk of memory which is composed itself of variable-length objects that
> > reside within: You'd do one big copy_from_user and then a pile of inplace
> > validations for each thing that's in there, maybe with the assistance of
> > alice's Range module to make sure you don't split up the overall memory
> > area badly into individual pieces.
> 
> Yes, will definitely add it.

Sounds good!
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
