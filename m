Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32A6472094
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195906; cv=pass; b=WjQGFB0fOmwrvqB2FVzvckix14YS+AYdRYY+ITZRzz9Ybu5NL9OLQnU05hNJmVhQBFl666PcT/ObvLFJWBt3Ax8LJlt1bAOPQ5CMoHhw7dXkF0qxsH27cRypI7n8ICmyB27OvcPRjPvcnmT2X1/HN0FaI9NcKQjECx6jY5qRDv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195906; c=relaxed/simple;
	bh=wbusIXCi4IMQab0ryvgkHW5sveBwQ2NlPsvZNTV8bzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQG2o0aXrsD6/H+VQTK3w8UKt5zeV60pWrfV+WTfZiP+tOupdxvWHW4afxRzLPj4HgGjTXWNNltY51ZmOutqJz1EbND71l0iUrREk0k9UKJjVP+VIFFxs3o3CfNZCAySzy8bKWKKgcKIHJkYugBJ0r5KWLuWFRAuYmldUUtQDt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ln9WvdPm; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ln9WvdPm"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66d1447e2b1so163921d50.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 10:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195903; cv=none;
        d=google.com; s=arc-20260327;
        b=ZqJItnUuAO2Ei1CG2zrcekcl43BqIUGW0r9He15o8qVSP/KEXCkk3UpYJraHLw1tJS
         SWLkqgMEK8UMEuYsybDhn9hZLDSlY+BW0jbVNc+dG95qpHgq2HIlZyy0WO1OhaxDG7kT
         A6KOsLB9ZycyiiSVgz4TpIvALb6ZpWvYSYws+11vWfwGH8eRW0/nRg0VLVAV40groI7J
         Xo0wmZLQtsyrEDBh2HQotnhFSVIWVNA285cSIi5VkECAr0g8sbbBxl72NQdyOX226/A+
         zD3lzFyQD/hhcGBRDEyyj4MK9xUjJ19AoGzRJoYpucKGISHpEtgzwSlS1PtpyHcRTCsV
         9lww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GfeSpY1O8MwrGHI//U6PaOM8wrbbu+iKMbpJd9vFVOw=;
        fh=SQ1jGlQXxl8CRZuUABIiAj8GnkIGrq3+0/xlFMw2NZ8=;
        b=kpjOO+vOFjCFOO+3c2iPWNcaffUo3Hhx25O0VKreQlQK0dvYPbvHkEL4c0MYztXRXn
         OBoqigO7kWGcfLTG8EON9UMr8AK9Zy6DM3v2r7MtHqiBPNscmXJhF3N/qv8YKeqbK9kl
         dRP9dCpr54AuGTrrZobMpKg12ytvFpgjNTgMImRNOMxaKQqfnCcgcHBjGaJ4vT9teDBR
         0d44NRrco2z8+HAcX8u4xLu7ISjaawyusxcPZIz4uWhJvXoTsnsy8eeCgQ29F8w2mHWT
         Ki4Vlq9WQ8WdxWQudeDWoLurT3dOycol7qDHALYAg24ZU6kWdfhXhphTwbDLM5rnGaTF
         OPIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788195903; x=1788800703; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfeSpY1O8MwrGHI//U6PaOM8wrbbu+iKMbpJd9vFVOw=;
        b=ln9WvdPmeBNhNUZ6fj/wYeV8PAUd+OOikVvvRh/TvI8UpVlrRIuAPwGrUwSiRT39VB
         1rgL4D8rGyjLT2v+wfQSogdk+ZLRNpcXC3k1R3fEX88fY7O+0BYypBFJCTvYBaUrZqkV
         H0/0xZzWQU3D6cflNxwxjDvWeLr8YbV6hUVP+oXCD7DHiC0tCbCVWe4r0egl41c8OCVF
         xY2bPi6aD1bUlT8l3HVf/hSbaYGz+b5ioXh8zrwieUge3TGl4C0dGJSggeu72Zpllnes
         MyCGPiBiJkSqjT9h7YuiygJNmbf12RMTjzRSpX5vLECVBkLDyCVnL62F6fXpx94itWwS
         dkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195903; x=1788800703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GfeSpY1O8MwrGHI//U6PaOM8wrbbu+iKMbpJd9vFVOw=;
        b=VxN6uSYwf+00aBZSmSARm9iW1l/gj9qBl3bxprbR8ZZxV0tWS8PrLoeBBb765MFFhM
         skfKL3rpfLXpAYoPVAloF6VKDmL8h1cpAYSQMiWm/Al4LNDfq815pEzmZGckhNljOeDj
         SMqztQXkgNsQcsb8CkTgLTIxRjdcMoAXMrE1FgyUcIFv4bg5iSiOnal6Ye8icOG+gWtU
         aReGt6D9I+36WG4aGIC3qg7MZsk31w1CMkA9jRM93qSsGuUJiyq8/5WWyDxNwvWawrZa
         kfU0UCs00bDxkta6eeAeWOknw8aJUxH1ZWeOX97lL0qXH5mFiH2gUBcYrzz5Dw6SRdcW
         LXsw==
X-Forwarded-Encrypted: i=1; AKwUvBwcY1k7OQNY5wJ1TYtB55Qe59ccEF/5yyqWP5eOcpxhIvmzgJI3JkHtX2YeTdPBaykO/xy2/gzH/e1lFuF52g==@vger.kernel.org
X-Gm-Message-State: AFuF++np44DD/fQZz/A+b7At0rRx4f7vQgAw4thuKx3l2zsrIe9kBMBV
	FohGwxgjjowqewWvc5c+1QnwJVRiSeVtBwZc//+pIE1YaLGuTNlXfWhb647sm9gMjIk665IKb0Z
	/tYssWd0sfOcSvphV8isaN9pzzckNGCAX09Kfrm4I
X-Gm-Gg: AYBFou0LbZoytZNM+IzZXarSQucjopRn+iQeHWh1MXFwfpVG7uzFm/f/AQbfnOkY2Of
	B7efDLdAMcfNsdo0M3CUnVHUOCK0yLR+B6JwM+4avJib717Qu77ANDFeIuwQ3SPrEVnAHniFdYY
	olKk36d1l4jw8YT1AXKFElRF4CE1a6neRQYBwRP8s2YmMXGwYq45dEciYY9+ztry8lWVh8WAqxC
	jXLHu2spqxg+iPv3LSSCY0iBoa5VuyPp54XYbRKo6GpEof2B/kalNExfVkwExAk5lcqDvWJPw/U
	lheVOw53Xzcfl8tEWgold9bI3rTFXrJ3xLWUKvqfeA6vCvZAfL90fakKEffRtra7hUK2x1Wf38D
	UKTjhuLoC6NQmD+lYm3dCpDbwSgOyZuNTl2/3db3cEOkmvg==
X-Received: by 2002:a05:690e:4512:20b0:66f:8594:b85e with SMTP id
 956f58d0204a3-66f8594c483mr815185d50.2.1788195903415; Mon, 31 Aug 2026
 10:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-3-mike@fireburn.co.uk>
 <20260827030352.GB2327@sol>
In-Reply-To: <20260827030352.GB2327@sol>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 31 Aug 2026 18:04:51 +0100
X-Gm-Features: AcwNN1XRUTonc9UtClpJ99JQyGyLSWDpm68a2GF558801nidk82gsfB0bRqsHB0
Message-ID: <CAHbf0-G7aHw5HMCMfpABnFUpvLHz5R6d7zmyite9xAqzMXJGvQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: crypto: add synchronous RSA akcipher support
To: ebiggers@kernel.org, linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, Jason@zx2c4.com, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, lyude@redhat.com, gregkh@linuxfoundation.org, 
	lina+kernel@asahilina.net, bqe@google.com, ljs@kernel.org, 
	joelagnelf@nvidia.com, ynorov@nvidia.com, david@davidgow.net, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026, Eric Biggers wrote:
> > +config RUST_CRYPTO_LIB_AES
> This is being added in the wrong patch.
[...]
> Likewise.

Sorry I'll get that sorted

> As I've been commenting on other of these bindings patches, it also
> doesn't really make sense to have the kconfig symbol be in lib/ but then
> have the actual code be in rust/. They should be in the same place.

That one isn't specific to these two patches, so I'm following Miguel's
reply on it and I'll go with whatever comes out.

> If you need RSA, then please just create an API for RSA specifically.
> The crypto_akcipher abstraction has never worked well, due to
> differences between the algorithms and various other reasons.

Will do. The generic akcipher wrapper goes and v4 has an RSA-only API.

The only operation I need is RSAES-OAEP-SHA256 public-key encryption
with a caller-supplied seed. The seed is explicit so the driver can pass
the kernel CSPRNG while the tests pass published deterministic vectors.
Would you rather that was a narrow Rust wrapper over the existing rsa
transform, or something in lib/crypto?

> > +__rust_helper void rust_helper_memzero_explicit(void *s, size_t count)
> Isn't there a standard Rust solution for this?
[...]
> > +__rust_helper void rust_helper_aes_enckey_zero(struct aes_enckey *key)
> Similarly, isn't there a standard Rust solution to zeroize memory?

There isn't one in the Rust standard library, so the memzero_explicit
forwarder stays -- Miguel covered that in his reply.

The aes_enckey_zero one was just wrong: it could have called the
memzero_explicit helper instead of existing at all. Miguel said the
same. v4 has one safe zeroize() in the kernel crate, used by Secret and
Aes128, and that helper is gone.

Mike


On Thu, 27 Aug 2026 at 04:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Aug 26, 2026 at 05:29:49PM +0100, Mike Lothian wrote:
> > +config RUST_CRYPTO_LIB_AES
> > +     bool
> > +     depends on RUST
> > +     select CRYPTO_LIB_AES
> > +     select CRYPTO_LIB_AES_CBC_MACS
> > +     help
> > +       Enable the Rust bindings for the synchronous AES library functions.
> > +       The selected C libraries are built into the kernel because Rust
> > +       abstractions are part of the built-in kernel crate.
>
> This is being added in the wrong patch.
>
> >  config CRYPTO_LIB_AESGCM
> >       tristate
> >       select CRYPTO_LIB_AES
> > @@ -216,6 +226,15 @@ config CRYPTO_LIB_SHA256
> >         Select this if your module uses any of these functions from
> >         <crypto/sha2.h>.
> >
> > +config RUST_CRYPTO_LIB_SHA256
> > +     bool
> > +     depends on RUST
> > +     select CRYPTO_LIB_SHA256
> > +     help
> > +       Enable the Rust bindings for the synchronous SHA-256 and HMAC-SHA256
> > +       library functions. The selected C library is built into the kernel
> > +       because Rust abstractions are part of the built-in kernel crate.
>
> Likewise.
>
> As I've been commenting on other of these bindings patches, it also
> doesn't really make sense to have the kconfig symbol be in lib/ but then
> have the actual code be in rust/.  They should be in the same place.
>
> > +__rust_helper void rust_helper_memzero_explicit(void *s, size_t count)
> > +{
> > +     memzero_explicit(s, count);
> > +}
>
> Isn't there a standard Rust solution for this?
>
> > +#ifdef CONFIG_RUST_CRYPTO_AKCIPHER
> > +__rust_helper void rust_helper_crypto_free_akcipher(struct crypto_akcipher *tfm)
> > +{
> > +     crypto_free_akcipher(tfm);
> > +}
>
> If you need RSA, then please just create an API for RSA specifically.
> The crypto_akcipher abstraction has never worked well, due to
> differences between the algorithms and various other reasons.
>
> > +__rust_helper void rust_helper_aes_enckey_zero(struct aes_enckey *key)
> > +{
> > +     memzero_explicit(key, sizeof(*key));
> > +}
>
> Similarly, isn't there a standard Rust solution to zeroize memory?
>
> - Eric
