Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349C50A84
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 17:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706030889; cv=none; b=cWV67B+aMnsYcTkNJQZJIrzrZhhFJokGg3da3klVgkDQiFJoHq4qjfTLUqof08tPyy7ThvBXaCfqV7L6vuuJNUxKEaDGZeFUUR4kuYdIUozJY9mg9QXn/KorYsDaDbXfHkadTqvSdBf1WFc6J5ohXeYb5jU9JGTJmdtr+JoUxvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706030889; c=relaxed/simple;
	bh=G0vvDDoof+vP2uhA9zjhNoseUNL3kPStIcJ0SqGI5gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lgvMU8liTbjwkQjhikydi/IgyvIT7/XDwV34deGe2U8WCNdW4MklAVdD4VgY36s9LTgO3vukCFnvxYrvi5FxJvdBFsGwJOND53G6Gtp33nV9vKITq4TgJTWe1GCXK4tjCrps3a8jvYOCmcNFiet3PDaRlER+d0CT1Dz6amQc8XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dXUbTG+s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dXUbTG+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706030886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=37DXASSNR87lle+b09IUrlUqS4JJgsnqsvmxnwmD62o=;
	b=dXUbTG+s+HSmvqd5s4WBtNuOPDQKTxeMGMLh0aZg9GTFKu/DrHORhIY2WDr1zvKUWh5CNM
	m6YQ3xdTylYy6ukpEKbwVwi9a9pdukWjZVmb3N5Ddc0INM1bpG5OfNVzTIrD02hQPSnaSC
	ErK5q3vcGA5JuuiqLR83FI4tvDKXN+c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-WDi3WyZQOdWS78GNYQeRrQ-1; Tue, 23 Jan 2024 12:24:47 -0500
X-MC-Unique: WDi3WyZQOdWS78GNYQeRrQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a308fb9128dso122147266b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 09:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706030686; x=1706635486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37DXASSNR87lle+b09IUrlUqS4JJgsnqsvmxnwmD62o=;
        b=icf33WxWJzyHm/AbXv4ZRiL4n23OyWCcYFO54bL2+TjdtA1DLPMzfKGy2hcgO7vAA4
         gAxDKBDIzRUnw58o0rXgon57G0f8VBUVIKy9ika2DOoJQkkU4ie7ovPVeDgGnrSTn+U0
         MU+G4tDcq4M/pZ2LzfC/xUpd9RaE7cHIl9IZnKFtCc7Df6+bSK+vxWm3TFzp/nHSTOea
         G8jhXOKVsl0aBAGxFA5qOp5QfiQWfrFSPsBrPkuqK9Oqlbbhz5l1h2OXtePy9wXue1bT
         cXW9fIwyFbwZnj+qTtK+6YpWKE4NZiS2AFtTO3eCXUQSI+D3FCC4++ex7OlotTbp9zz8
         9BiQ==
X-Gm-Message-State: AOJu0Yw5BIOIawsaDLbOcv8fZMtZ7SZBpjD5EBviFH26elfIA6Pf8oXX
	XUE5DHiBzndhGbpoHKSq9HsgPXJygGLlTOHGH4Nk9k/pH/NzkzxbrJ40ovFZCiujSexG4oRqpJf
	vJDrM7L4bgMxbAKjAf08zupHNhAh86v4bX1hyz6C1rmEaj+wNQ+4BNoWi97gKBXWT
X-Received: by 2002:a17:906:3686:b0:a2d:222d:2c76 with SMTP id a6-20020a170906368600b00a2d222d2c76mr113379ejc.12.1706030685846;
        Tue, 23 Jan 2024 09:24:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGsC+QeNmROh1wvugPSuVwubL4KphHbAu/5q1igozq6ZIItQG/EysGQKAz1Fc3h8xb7i2/Ng==
X-Received: by 2002:a17:906:3686:b0:a2d:222d:2c76 with SMTP id a6-20020a170906368600b00a2d222d2c76mr113365ejc.12.1706030685533;
        Tue, 23 Jan 2024 09:24:45 -0800 (PST)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id tz5-20020a170907c78500b00a30dcbd4254sm466180ejc.119.2024.01.23.09.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:24:44 -0800 (PST)
Date: Tue, 23 Jan 2024 18:24:42 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: str: add to_ascii_{upper,lower}case() to CString
Message-ID: <Za_2WuQh9vr2Na7S@pollux>
References: <20240122184608.11863-1-dakr@redhat.com>
 <2024012252-attempt-tables-e3fc@gregkh>
 <Za7uampZiG2IP8dE@cassiopeiae>
 <2024012251-geriatric-morphine-a275@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024012251-geriatric-morphine-a275@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 03:12:04PM -0800, Greg KH wrote:
> On Mon, Jan 22, 2024 at 11:38:34PM +0100, Danilo Krummrich wrote:
> > On Mon, Jan 22, 2024 at 11:35:29AM -0800, Greg KH wrote:
> > > On Mon, Jan 22, 2024 at 07:45:57PM +0100, Danilo Krummrich wrote:
> > > > Add functions to convert a CString to upper- / lowercase assuming all
> > > > characters are ASCII encoded.
> > > > 
> > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > ---
> > > >  rust/kernel/str.rs | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> > > > index 7d848b83add4..d21151d89861 100644
> > > > --- a/rust/kernel/str.rs
> > > > +++ b/rust/kernel/str.rs
> > > > @@ -581,6 +581,16 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
> > > >          // exist in the buffer.
> > > >          Ok(Self { buf })
> > > >      }
> > > > +
> > > > +    /// Converts the whole CString to lowercase.
> > > > +    pub fn to_ascii_lowercase(&mut self) {
> > > > +        self.buf.make_ascii_lowercase();
> > > > +    }
> > > > +
> > > > +    /// Converts the whole CString to uppercase.
> > > > +    pub fn to_ascii_uppercase(&mut self) {
> > > > +        self.buf.make_ascii_uppercase();
> > > > +    }
> > > 
> > > How are you handling locales?
> > 
> > For ASCII only? Not at all, I guess.
> 
> Ah, this is ascii, yes, sorry.  So this is a replacement of
> toupper()/tolower() in the C api?

It's not a replacement, but it's kinda analogous to that, since the CString
module is mainly used for interoperability with kernel APIs that take C strings.

And I say mainly, because there is no other string implementation in kernel
Rust, hence it might be used independed of whether interoperability is required
or not.

> 
> > However, std::slice::make_ascii_{lower,upper]case() doesn't seem to handle the
> > extended range, which tolower() / toupper(), according to _ctype[], does. Do
> > you mean that?
> 
> You should support whatever those functions in the kernel support today,
> otherwise why add it?  And why not just call the kernel function to be
> sure?

Well, given that CString serves as interoperability layer for kernel APIs that
take C strings, I agree that seems natural.

On the other hand, CString and CStr are designed after the implementation in the
Rust std library and there were requests already to align those functions as
well.

We also need to consider that simply wrapping tolower() and toupper() would make
slice::make_ascii_{lower,upper]case(), str::make_ascii_{lower,upper]case(),
char::make_ascii_{lower,upper]case() and CString::make_ascii_{lower,upper]case()
inconsistent. The former ones already only consider 'a' to 'z' and 'A' to 'Z'
respectively.

As already mentioned in [1], it might just depend on whether we see CString only
as interoperability layer or as the way to deal with strings in kernel Rust in
general.

Just to clarify, personally I'm not worried about whether we consider the
extended range in this specific case or not. I think it's more interesting to
generlly figure out if, for such modules, we want the caller to expect C
bindings to be called or C logic to applied respectively, or if we want the
caller to expect that everything is aligned with the Rust std library.

[1] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/String.20manipulation.20in.20kernel.20Rust

- Danilo

> 
> thanks,
> 
> greg k-h
> 

