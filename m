Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C4B1BDDB
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 01:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711503094; cv=none; b=oi62qKkw1Y4y7axjLg4gNBoT1TCrWYlYukZq1fiYjrbCx9NUyL1OTppeAL4bCgMFGuQPH7TvrkdqhUWgF+UOyvU93f1GtOtdYZAqshPyeAwG7FC4JLSPV+LvoFHdyh4o5iQ7Hw7Wzz+naAFZis41JqHK7+gZAZT2rtwWjmdAjwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711503094; c=relaxed/simple;
	bh=3hNH44z9nVEvAkQYy0UxnX7N+jtm0U4Xq3yhi2IGfEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvJ8+jfdj5J9ZdiMq2W29JFiJXw0knuSH8tOKgVCjWiZDE2IecqnmJ5YhM7Ji8GbirWnAcBREsRZrN7bCzcFCowDUnowc4WlXf0jYZG/OsUkvt1gF/oqqkmE7xZFHgWj/EvQHa1Z9KD4d23VYeT0U9XFfgWV2ZI63PTlNcrwIGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm8pbuZp; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm8pbuZp"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a3c48e70fso63684217b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 18:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711503091; x=1712107891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GKu54wtpPQFTQ+RK7KZ5rKB0MBquAEnE8G/JqaN0u8s=;
        b=Sm8pbuZpcYLOOQu9QHwacApqci1P5ylPqepGhL6pEhEXyA+iqurE2yvU059/sU2W6h
         eN9Ep0ClrIFxLokFzNaCVpvhC6fcBZpNzNWYV/t1ESZRXuZj5Xw8pZrGx6s3tKIdAmCe
         yrwJN/z1QX3ngvBYDkUF3MSAoyzjJ0ahM/S3NozbOwfvYqywCNT83LIazKxIeqlGSRI+
         L6RYLNrbjV99C8PPos2azI9+/erR1L3EfkStQGRdeT/bH+mQg9wNFQVM9/5xZwg4css1
         AncSfdD+eh2pSh79LIr72nXWKoDWEkfZO24QbGeGAXI4oYaelr6qY2nV2t2RdXsVXZDj
         +exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711503091; x=1712107891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKu54wtpPQFTQ+RK7KZ5rKB0MBquAEnE8G/JqaN0u8s=;
        b=F84GEVZy1UrhhTS2CHHXJ/Qm0wkuXxBuF68j7wWkfTc12g/+xXbFUMKLZ4wLMxs9LZ
         9Zn+2EYQyXYXKul11pQwySzq68asP7WqrtgzbqeSST8METuRm8uH2K1TUR90qIkbxhhn
         SQwKdlQZST1uhteNpkeqnRQj9SH59BF2RURx+hCsbULEZzCkP5K+6Ng9sM+DNyJlhE0I
         tJieVhzKq3/xrk2/CWp7HGCiirYOrJahF5kXq4ku6QWc2396I0az6mGvHqxDha6J/qzS
         fZU0xtZXKiE6VcC42AQ4PBD8ZBFdcN9S3SILAtjd3F1bPbK/IiXmrFGYtEDgYD+Qg4Es
         oOLw==
X-Forwarded-Encrypted: i=1; AJvYcCUM0BwsRSvIEq4exmFJIWA8cEwqVY3tOJUrJh0F3KQvwUVPsn1aclSNnY9i+Qc30lhkxL3cUyghwx81V9i72lCBSmOTMLYjZ8/gjTVq3I0=
X-Gm-Message-State: AOJu0YysO1JeL1dYdO7DIqiFE3IIgVolPfUJNd5tFFUyEPoAEJLwjW4R
	zuyi7DQS7tmcdniPBwk3/AdGL//PfM7RPF85OeFI5JBzCyVZJvw89sX/jQiK11TZVZMrFIo17nM
	4NBD7VnjFAmlKgk5ipKYBtXs3kx8=
X-Google-Smtp-Source: AGHT+IGvm/x+APAl3Ok2HsqhAtz7iwkyx3PJIUj6k03/csf1g2gs1A2J+vBgxuHWPEkRtMjjE1m0X9bw8TjD34Zx2n4=
X-Received: by 2002:a0d:df4d:0:b0:610:f5ca:8ac with SMTP id
 i74-20020a0ddf4d000000b00610f5ca08acmr11770137ywe.11.1711503091386; Tue, 26
 Mar 2024 18:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-8-dakr@redhat.com>
 <2024032514-happier-hazelnut-4b50@gregkh>
In-Reply-To: <2024032514-happier-hazelnut-4b50@gregkh>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 26 Mar 2024 22:31:20 -0300
Message-ID: <CANeycqrdBVJhAiGZdv2NSnz2SUCuDC=04D_JiTF6vfs8iLvjrA@mail.gmail.com>
Subject: Re: [PATCH 7/8] rust: add revocable objects
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, rust-for-linux@vger.kernel.org, x86@kernel.org, 
	lyude@redhat.com, pstanner@redhat.com, ajanulgu@redhat.com, 
	airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 15:21, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 25, 2024 at 06:49:11PM +0100, Danilo Krummrich wrote:
> > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> >
> > This implements the Revocable and AsyncRevocable types.
> >
> > Revocable allows access to objects to be safely revoked at run time.
> >
> > This is useful, for example, for resources allocated during device probe;
> > when the device is removed, the driver should stop accessing the device
> > resources even if other state is kept in memory due to existing
> > references (i.e., device context data is ref-counted and has a non-zero
> > refcount after removal of the device).
>
> Again, device removal is different from unbinding a driver from a
> device.  Please fix this all up.

I wrote the paragraph above.

When a driver registers with a bus, it provides (among other
callbacks) probe and *remove*: pci_driver::remove,
platform_driver::remove, amba::remove are examples of such callbacks.
Even the callback used by core is called remove,
device_driver::remove. And even buses that don't provide an explicit
remove callback still implement device_driver::remove (e.g., usb calls
its remove callback usb_unbind_device).

When a device that is bound to a driver is removed from the bus, the
driver's remove callback is called. When they're unbound manually (say
due to a write to the 'unbind' sysfs file), the driver's remove
callback is called.

So it's seems fair to say that from a driver's pov, it _doesn't_
matter why remove is called. Once it completes, drivers should not
touch resources related to that device anymore.

You seem to dislike the term but I don't see a good explanation for that.

Cheers,
-Wedson
