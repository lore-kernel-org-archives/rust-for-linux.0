Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074744;
	b=Nvw/74v7IvtpcQcF7yAb+mNduo3GgYHq6SisRKEj3bNlO95cZEqefuqzFXucVdyMqfGj
	 SvJre2jmflQy5ENgyQa+VuMiIunzqICVrN/npXPUd10PaDBUAtSiAYjCB1RcdgkJ8xNnd
	 0hzFCx4/MLXKvhwIVSgNJvXD/eR/cAlRrU3CbMsHwuqh8KAeUdbUq6ugWrdnIGdWvdttg
	 tPoUmt9BS0NwD152HR3VFO/e+3wsmeAVR6QXxNTB4VQRK9tKYiAEFMqyEcXjcfQZAuvh1
	 ZNyKSfcyx023TrWe2m355BG/iVjFaek3kY0w6xngaR6sOq4mvn46YCebR/+QxxXv3FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MH5XYS106b3lSl3L27DgUDXZlCujEg9uq4RcFrsglas=;
	b=yXVHojh4df78kt2kf93kgohNegeX7Ws7b4IOoU2RnofLerXK1qxQu6hSOiqus3zemfeo
	 3OYzPtqDEwt9iYznILbRNWymq+a9GJX/FDSUS67XPX6I7KncgWg6uvVFqr/1RcwwJx+lK
	 LtPqltudu57On/pvD46jzjrbq3Qvz0zdZckG0Sdsfo4l3fHYkqpggl2yEfOlsBLKAygHc
	 /dgbK1lgUCB3RCNy353eN9Wu6Tk+YpH+R6VoRM9r0jgcCjwcM72iDm7tCzs8uAbqxM9D1
	 xuWTNa8zga3vO6vahGIZkZf2yJBN4hV0c9Dng8ieSXawKiC6Q7ZkeS+AXA9a7o9HIRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oz7fdmug;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3822C606A31D
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 04:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3822C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oz7fdmug
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so3856480a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 21:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793074742; cv=none;
        d=google.com; s=arc-20260327;
        b=CI7YtyUYH26LM5tFRXfDytQrQwFFbkEo9kOTFymuwPQ2T7jFO6mJ4k+0rGqgsxmBbr
         v379ZZSK20ybmNND4nGbBWhIBFP/0DvZm//dQvNjL6G+qaW64jKcX6DThKsgmF8aH2DU
         thKSmVtO5WXjp5VvbHE77hG2UVJS7fV4bRTtj2G0FMyOyzLnh6Dcqj7AUyz82kBkQxHX
         jNd89TulZPHzzNeeqIBxVjwasUtJ4Uxqc8H+7hufYcTUP4htp21dTi9Q9jPBSNvKBUoK
         4EBs9JF8oeZ3fedN24guPkfwrtTc+GI1kpnJsefaepTQsX67Y1utGEaT0F2MsUX1cllS
         xzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MH5XYS106b3lSl3L27DgUDXZlCujEg9uq4RcFrsglas=;
        fh=joId6Tp8XUcvo8skVNe9K4c8mm0GbF75Gif4JR+RPRg=;
        b=E22PWsKyyni7HiniY3BlJdW0qZqL7HYxqJSUSKswOPqkn0Y8nC5X5VO3fcjqquPxbN
         XchhzcQZYluTDUC0FYnDhD+xStc3cLzn9YXrVqez8bNSChvpwXF2393ivYcllwvfbgm6
         U0gEoktYUPDdaIthSy6yv2H/QeD9diQw8/P32As+ah+mOnPCuOsZQ6W2yElLRsPQZuEi
         HSbTLCD4oRaEL5Fpj6x4sNyynv7nGP7yn+MTbdHb/1mEENHdVUy+9cZZElXwnOnNod6a
         ySUTYi4vIY+R8x5hLzqOxa2EeTMzY7axJo1KyTZsL1qWr1hWCCpPxLKOHTYbECx0asBT
         KYQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793074742; x=1793679542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MH5XYS106b3lSl3L27DgUDXZlCujEg9uq4RcFrsglas=;
        b=oz7fdmug9OP/2VPGT1VPsgaqZPpunImrM5jvoi8W9bcA1kUfcsojB62hytWV1r/+H3
         +zLffk2uZBaCPjLFPy2OnY/iq82L/ALlib+SUg0U4vuVteT2LKVjIdnX5wMC2sXA1Q9O
         UQH9kue+MvVF/dToU7QKEyY4tp3FvCOsZEdgCYEK6215ok5HRENUitfOGa1uNnMaBqN2
         S2JejfXICDShwLAy5+QBTebZOCNumyhHE8YD2hic9v/aKyhz3vBZQtB7NdEOYvWnEEIt
         meFjS386QdRFHWFqP+Nqvwx0t7ZZMhVlBr6bqJCL5lK/PVTU4qOktdNoc+W+tS5CWPXz
         BFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074742; x=1793679542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MH5XYS106b3lSl3L27DgUDXZlCujEg9uq4RcFrsglas=;
        b=Db1IzME0NW0caTV42vK+kQrjlpgkC7yQooP7qi1EuQcPdfrYvBcz3tm1GEvc4XTfhH
         gFT7J33VuyIwBZVWScwTH9EfFDtqMu/4K2JafmJFwqnYTOwAjSuD98DV1Xi7oeSdWXlS
         kpQ/FCBZXCUd+f9swyIpcH8LGxWn6tCRxFr9a4FpVuqcesCJIXGFG1g5XOaZ7Xdvwrf7
         Zmi9JI/3F+t6kGLMSx8eBeKFKTXBFrW/Q8y9DVKaPyAhq/xMjI7F/owdXu1QqhOA7jf0
         qHW80sqrJMvR9q2RzTzUBFlJy/szQb9Z5tGQ7xJr+6fopbkabLI6S3qCTGngRF6B8v0R
         +E/w==
X-Forwarded-Encrypted: i=1; AKwUvBzkFSktgLMe3ybw6fo4VfD7UGzdhLXGOMvl34szBl9v3kvXQyuGxsJGfPDLgh47v0GDwjbDf3XWa6l4sEA5Aw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6i0kLJwrZk9MXj7vZkYLxa7TwQSRZkpb82vMalTyAYwkJhZek
	Kgo4LQVyzjzLkrgsF0mdUR+v0wDJ7Gc+ay1V9keW99N4/bmW4klTni56XsBSQsMlwkPaRAzC6KA
	MbKdL37oh4A0nTFjWoons912Y/tFeXO4=
X-Gm-Gg: AYBFou3J40VjjR+gdgZVF4VqG7Dqaw1yOwRKYXe2dviYafeA5iMVMxGTQOp6mXMFEZL
	kTt/hi/UzSDLjumCwI9KSTOSQqgucWgPlybCbmlGtcIaScVcOwfg+QIFhFBWApK5KzrWsXZkWg2
	NzMmabc3fc/4ULDTOLvWyjFposfujXGuaAMumLb6ybvtQBgptmVIXwamxp1WkMxdqhyrUpA85WE
	RABANpay3ijoRnU1dSpSfZVO4jChEkwUqLUiLmwdbG1outa+m2IICWlwX5xFfWDmQwl6Qlhcr10
	M1+iH6UhxG4SX29TJC6eAnxvaEWP3WCkL2VZHpE41c8DtBwDXi/j/azG2NKTE9+Q5nJqJFSkQ/W
	29BBmk3ab8XmcxFo5IUG7XxHzSiINuxDxGm/p8UbUAlPd+hb3ASSm/uQrN0+Q9EDjjZY=
X-Received: by 2002:a05:6402:4144:b0:6af:a64f:bd44 with SMTP id
 4fb4d7f45d1cf-6b443116103mr8562370a12.45.1793074742014; Mon, 26 Oct 2026
 21:19:02 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <20260928011123.450800-11-alistair.francis@wdc.com> <DM4NT7TFX4X9.1GFI128LI5ZQ4@nvidia.com>
 <CAKmqyKNEup=x+bwmPD_8x0s4ssPkqFnQtSGqJ_82z9oDP=A6cA@mail.gmail.com> <DM58HRC3DHSS.1YC0E53ZXANT4@nvidia.com>
In-Reply-To: <DM58HRC3DHSS.1YC0E53ZXANT4@nvidia.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2026 14:18:35 +1000
X-Gm-Features: AclHuK9kjsCjDqeZn6m7ZYE5QD1xRJb3Onc684I95UaVij7BIqpZYDqDTzrRMkQ
Message-ID: <CAKmqyKPwirjmeBQvXgheY8Lh-M-RRq5pdbv=5mB4duhw9aCbGA@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] lib: rspdm: Initial commit of Rust SPDM
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: lukas@wunner.de, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
	Jonathan.Cameron@huawei.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jic23@kernel.org, bhelgaas@google.com, 
	alistair@alistair23.me, djbw@kernel.org, linux-pci@vger.kernel.org, 
	wilfred.mallawa@wdc.com, a.hindborg@kernel.org, gregkh@linuxfoundation.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	gary@garyguo.net, ojeda@kernel.org, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 5:30=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Thu Oct 15, 2026 at 12:06 PM JST, Alistair Francis wrote:
> <...>
> >> > +/// The current SPDM session state for a device.
> >> > +///
> >> > +/// Concurrent access is serialised by wrapping the whole struct in=
 a
> >> > +/// `Mutex<SpdmState>` at the FFI boundary, so `spdm_authenticate()=
` callers
> >> > +/// run one at a time and the locked `&mut SpdmState` is the only w=
ay to
> >> > +/// reach the inner fields.
> >> > +///
> >> > +/// `dev`: Responder device.  Used for error reporting and passed t=
o @transport.
> >> > +/// `transport`: Transport function to perform one message exchange=
.
> >> > +/// `transport_priv`: Transport private data.
> >> > +/// `transport_sz`: Maximum message size the transport is capable o=
f (in bytes).
> >> > +///  Used as DataTransferSize in GET_CAPABILITIES exchange.
> >> > +/// `validate`: Function to validate additional leaf certificate re=
quirements.
> >> > +///
> >> > +/// `version`: Maximum common supported version of requester and re=
sponder.
> >> > +///  Negotiated during GET_VERSION exchange.
> >>
> >> Field documentation should be their own doccomments before each
> >> individual field (see [1] for an example and general good practices wh=
en
> >> writing Rust doccomments).
> >>
> >> [1] https://doc.rust-lang.org/rust-by-example/meta/doc.html
> >>
> >> > +#[expect(dead_code)]
> >> > +pub(crate) struct SpdmState {
> >> > +    pub(crate) dev: *mut bindings::device,
> >>
> >> This makes me very nervous. I see this is passed to C callbacks. We ne=
ed
> >> to maintain the guarantee that the device still exists, so an
> >> `ARef<Device>`, from which you obtain a pointer to pass to the C
> >> callbacks, should be the minimum here. Does the device also need to be
> >> bound? Looking at `drivers/pci/cma.c` it seems to be. Then this needs =
to
> >> be a `&Device<Bound>`, with a lifetime to `SpdmState` so callers only
> >> use it while the device is bound.
> >
> > Good point, I have converted this to use a `&Device<Bound>`
>
> Another related point of feedback is that this code seems to be
> designed to interact with C drivers exclusively - i.e. I don't see a
> publicly exported Rust API.

There isn't a public Rust API, but `SpdmState` and its functions are
more or less the Rust API.

>
> That's probably what has guided the current design of storing pointers,
> as that's what the C functions expect; and the C side is also
> responsible for taking care of lifetime and bound device status, so in
> that context using a `&Device<Bound>` will be of little help as it will
> need to be forged by trusting that the calling C code knows what it is
> doing.
>
> I think it would be helpful on the contrary to design things around a
> Rust API, on top of which the C FFI is built. That way you would have to
> work with properly bound references, and have a proof that the model is
> viable before exposing it to C. Also I guess Rust drivers will want to
> use this at some point, so better design with that in mind from the
> get-go.

That was kind of the goal with `SpdmState`. The issue is all of the
drivers calling this (PCIe, NVMe, SATA and SCSI) are C drivers and
won't be Rust for the foreseeable future. So there aren't any Rust
users.

I have improved things a lot with v5, let me know if you still want a
Rust API. It just feels a bit silly to add one that will probably
never be used.

>
> Also related, what is the reason for having this code in `lib`? Why not
> make this a regular kernel module?

That's just where the C implementation was as well, so I followed
that. It felt right, as it's a helper library. But I'm happy to move
it if that's prefered?


>
> >
> >>
> >> Just storing a C pointer and passing it whenever a function needs it
> >> cancels the purpose of using Rust and make the safety requirements of
> >> the callback you pass it to impossible to guarantee, as nothing enforc=
es
> >> that the device still exists or is in a valid state when they are
> >> invoked.
> >>
> >> > +    pub(crate) transport: bindings::spdm_transport,
> >> > +    pub(crate) transport_priv: *mut c_void,
> >>
> >> Here I also suspect we want to define some kind of ownership model for
> >> the private data instead of hoping that the pointer is still valid whe=
n
> >> we use it.
> >
> > Any ideas here? It's just a pointer that we pass back to C when
> > calling the `transport_function()`, I'm not clear on what we could do
> > to ensure it's still valid.
>
> I suspect something close to what `fwctl` does? Basically `SpdmState`
> would store a reference to a generic type, which outlives the SPDM
> driver bound time. That's also why having the Rust API first is helpful,
> as it will provide the lifetime that needs to be outlived.
>
> Looking at the example in `cma.c`, the private data appears to be
> `host.doe_mb`, which exists before `spdm_create` is called and is still
> there after `spdm_destroy`, so that seems to be the correct model, i.e.
> there should be no need to transfer full ownership of the private data
> to the SPDM driver - a reference should be sufficient.
>
> Actually thinking some more about it seems like the `fwctl` Rust
> bindings could be a good model to follow. They are simple and adopt a
> similar pattern of a sub-component of a larger driver that never
> outlives its parent.

Ok, I think I have done something along the lines of this in v5

>
> <...>
> >>
> >> > +impl<'a, 'c> Validate<'c, Untrusted<&'a [u8]>> for SpdmHeader {
> >> > +    type Err =3D Error;
> >> > +
> >> > +    type Context =3D &'c SpdmState;
> >> > +
> >> > +    fn validate(unvalidated: &[u8], _context: &'c SpdmState) -> Res=
ult<Self, Self::Err> {
> >> > +        Ok(SpdmHeader {
> >> > +            version: *unvalidated.get(0).ok_or(EIO)?,
> >> > +            code: *unvalidated.get(1).ok_or(EIO)?,
> >> > +            param1: *unvalidated.get(2).ok_or(EIO)?,
> >> > +            param2: *unvalidated.get(3).ok_or(EIO)?,
> >> > +        })
> >>
> >> Here you will definitely want to leverage zerocopy's `FromBytes` trait=
.
> >
> > I was hoping not too actually.
> >
> > The SPDM responses are a bit complex. For example NegotiateAlgsRsp has
> > multiple dynamically sized arrays, and the fields change based on the
> > version.
> >
> > Using zerocopy means we need packed structs and even then I'm not
> > clear on how we can handle the KVec<u32> or even the
> > KVec<RespAlgStruct> nicley.
> >
> > The current approach has the obvious downside of copying the data, but
> > as the data is pretty small in the scheme of things and not part of a
> > hot path, I think the tradeoff of copying the data with much cleaner
> > and easier to understand code is worth it.
> >
> > Maybe in the future zerocopy could be a performance improvement, but I
> > think right now it's a large complexity overhead in this case.
> >
> > Note that obviously SpdmHeader is not complex, but I think they should
> > all follow the same pattern.
>
> For more complex structures sure, but in the case of `SpdmHeader`
> zerocopy looks like it would work nicely? It also supports performing a
> copy (see `read_from_bytes` and `read_from_prefix`).

You convinced me :)

Fixed in v5

Alistair
