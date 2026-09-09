Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7B6581259
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985950; cv=pass; b=lJuqCW3mMfPEqCfDOOZXF5RZTg1WeaBqPvXuCuRgc+vnsB1wGVZB9DzRxaPgZlpT3MklYw3H7vBLPgtWrWmvaJae64gdMKo+2oSudxyheLYGfqLm5r3reD0jBjauG9g71BIC7Udh7bLOXJcUnQTT56GOgYQLAWh9iSf7IAKImvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985950; c=relaxed/simple;
	bh=RDnvDdT3gqyBnSoIqf9qQ2y2LD/nCKQusFnx59PqfCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhNxPh18EMhqOpf+6pNSihIcyO3gW/wq9wNoEMIJmp6gNVctK80/Kg9A5W16XDnDW57/0J1Iv2jAd6gYtYXCMOYNtEjMvA600ck6U27/yKsPLHRoPPB5SrnriDWfmIwgRUYeMcOX1ksCGu1FM2oxKUX/6Ky9/jcJlcbU3YEcGFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJ8pbEpL; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJ8pbEpL"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a30eb3bso1391897b6e.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 13:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985945; cv=none;
        d=google.com; s=arc-20260327;
        b=KjOkBw3UI0PP4PtlqbIfgxEPqh8mEU5u9pe9n4/HERvbA07Ccd9LYyvrI88oWOIq9C
         AL/cRxrn3GgyLoFPf3XR1QZ12zxrSGY7bTv0kLaitiylGZ22dFsBAq/8koH3BFDiL6C8
         Mcii4/ak5oKAyHFyMr5ZFMQ/0WmYRj9TbtR9WPv2Gx2fxvuIarB9DSpq8v62x1f0wdgI
         ln/2hgfKbzHcar/Ntr1ucPQQLz7j+YMsq1JoDaWiy44qtj3SL/9NM8SgdnTlw8P0trUz
         T0Li2Sd13NwQCYv3H9IrNU1sSbaFwAibQDRkyAyMuin8sHwvMWS/KAG8r+AaqPIT3Z2y
         eB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        fh=Pl/kiFTysBJMuzr0JZb5qu6jFA2+FKiwjZwSw3ZCpkU=;
        b=W8UgGElzhqimbKGwryy1Il1n2yR/fUyV0O8xpxfQY7TUzeBTceycmB0S8iOx9UdDBV
         HZYgVz4oU1BfaxsKiylamhTmOnujWwazQtSjf5VQBn7UvitAaB1JPlznw4egP6nTj2NM
         S43xw5JyXTyalpfR16Q5+5WqDu4cWuvHS8IT4OkIkpZyFcxXCAfL7eAeezAyhZUoEQG5
         Ft1xFVB5RZJYcftHTza815a5wSRaKUUXj/zbG1jjZNLcEAuYI/fMy/4Bfi7o9SWOZ7Uu
         AyymtxX5uJOSEtRQfN7J/Edsj0j/Yu//PFtpxrCRHHX1VFaecZ91s3yVhU2+RjzJXDr1
         g97A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985945; x=1789590745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        b=ZJ8pbEpLzPNlcPD1IYu60zMFiWvHJaKQNR+vV+YEI7uzxYHaI3A5mAP9CLoTIiQwrq
         YmMLsS7Bh/9+wTdW62fg/KslN4asUictQ9qeWgRCtadIAbnoF9Gir2R5dTJOij4yK/U3
         NgR6jPaUtr9GybUfrHO3a2gJtJGr14aHx3Y+/CrqaxPpH/LYelnG8D47UbXvi9h4JxC1
         7G4bWPOHAcab0Vgi7lnxrN6twNt3zcJbo22UP+4PfidB0JM2vXQuUMCCjFEDEFd9o5Xh
         775n2038bEhBgJqAdC903eaFfyTa+zh8FiKBvLkzM4JZ5k+Op89y8RbZcKj3Lf1RqE9J
         /K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985945; x=1789590745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGmxbhzdNURowH0NhYZYh+4kKqv4nS/H+afPTxx5XOs=;
        b=IZfrWVy+egE1ke/O7mzcDRU/QwoChL1Q8PjrymBOK6AdC40aQM4qQYBJrbbbzxOcyl
         QzN42MkHdwg2jYhy4bfpPMPGPUm3wweSQnMKqqIOlWpVWY3lar7OOhG/FZGmlRmwOXOm
         K3gxXHgieIe9asaGorX+oG19RnQ8/CVQuhIpEY/18jh+5os9WDK2IloXmN8/7Evea3Aq
         TREzLg1GWEVs41hUQGwC4kJzHGrTzUSRfHxmWQINOghyGkgXSXzn6ZbXpPw0ygNnkgj3
         1lLuqQHxU5l3LDc/1x8RNPzdm3Hki9rgJxTbsr2B6RHrv3QhVH5L1ZnuKnkgs7wwImUH
         fFFw==
X-Forwarded-Encrypted: i=1; AKwUvBwbegVeNGnRyEHHO4uut9YS2+hLPI/kYXF6goU+ANsyQpDxedS69Tyc+LIGHt8jixzUkR5+6tcoKddKiXAxBw==@vger.kernel.org
X-Gm-Message-State: AFuF++nUQkE29N7RixNUyLyfsQWO9EBAjivfIr0QSdyZptdHwySgPzOZ
	x8+GJ/mvgOKgczvOg41BD9sZwKb+dDiTbYwlG6M7FNiVKzD8IfCRbk4pEiB3FxNQrS7sY6c44EJ
	P3BD+U/xsk8mFS+6LrSier9bZKrYRvNE=
X-Gm-Gg: AYBFou0ORsZ37xtrg4U9mL3crZZGPt/hyiz9bN0Dw52xvMQDii3UgsMJyMCmWj8yVCJ
	bSFR9LThqBz+7Gi+qtpwlgMPofVAhEd8hbHWCfR51Y3+NffrdVkT/MHoIpk7QVwNiOImeHYPpVD
	U3SdPS4SBmUAq82QLvBs5Vsg3uIREdo0L8Z4Y8einxtymZlkUw2OkjmURTHwJWOGHs0EGqey2qx
	4/xrBxm2Nb6c5CRxreSy2iaKpRsMf+IkPvcIqylqLnEnEKX9Y/KT0xwaq0O2RARkg3zFdTIbQNE
	Dpq4ZEuftWC6ubF4C33ISXIrJFfZ8rMhCRKhl2aLgMr6UZ0qO715sc0HUzGuxkAUPeBEy9mEnPs
	IaPraWg19hfaA+w==
X-Received: by 2002:a05:6808:199b:b0:4b3:7a14:6b25 with SMTP id
 5614622812f47-4c0250d649emr9426459b6e.14.1788985944982; Wed, 09 Sep 2026
 13:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh> <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>
In-Reply-To: <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>
From: George Androutsopoulos <georgeandrout13@gmail.com>
Date: Wed, 9 Sep 2026 16:32:14 -0400
X-Gm-Features: AcwNN1UhJN0ysufwaCf-45J3Jdkut3tQFJ3a4uYdflnPIbeGW7A1nWp9glQ99fI
Message-ID: <CAESH5oeL4+rgO1PODjza1PiTzvfOBmCP_WtUoAyaejwSCcQkSQ@mail.gmail.com>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <iweiny@kernel.org>, Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
> It's not actually fixing a bug, so I don't think this needs a Fixes: tag.

Agreed, dropping it in v2.

> I'd rather document that this is only intended to be called within device=
 ID
> table creation; in const context a panic is just a compile time error.

Agreed, replacing the `# Panics` section with that in v2.

> >>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> =
Self {
> >>          let name =3D name.to_bytes_with_nul();
> >>          let modname =3D modname.to_bytes_with_nul();
> >>
> >> +        assert!(
> >> +            modname.len().saturating_add(name.len()) <=3D bindings::A=
UXILIARY_NAME_SIZE as usize,
> >> +            "auxiliary device ID is too long"
> >> +        );
>
> Isn't this missing to consider the separator and NULL terminator?

I believe both are covered. `to_bytes_with_nul()` includes each string's
terminator, and after the copy loop `modname`'s NUL is overwritten
with the `.` separator, so `modname.len() + name.len()` is exactly the
required capacity.

At the boundary, `DeviceId::new(c"a", <37 bytes>)` stores "a." plus 37
bytes plus the NUL, which is 1 + 1 + 37 + 1 =3D 40 and is accepted; one
byte more is rejected.

> Unfortunately, we can't enforce that is function can only be called from =
const
> context, so technically it could also be called outside of the device ID =
table
> in non-const context, but it would be odd to construct outside of a devic=
e ID
> table.

Ideally that would be enforced rather than documented. Miguel pointed at
Gary's `#[const_eval_only]` [1] in the other branch, and `DeviceId::new()`
looks like a good candidate for it: it exists only to build device ID
tables, so a non-const call is a mistake rather than a supported use.

For v2 I will document the intent, and the attribute can be applied as a
follow-up once that series lands.

[1] https://lore.kernel.org/rust-for-linux/20260903-cv-v2-0-e93b1613e40c@ga=
ryguo.net/


On Wed, Sep 9, 2026 at 7:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed Sep 9, 2026 at 9:19 AM CEST, Greg Kroah-Hartman wrote:
> > On Tue, Sep 08, 2026 at 11:32:46PM -0400, Georgios Androutsopoulos wrot=
e:
> >> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
> >> `auxiliary_device_id::name` array without checking that they fit. An
> >> oversized name is caught by the array bounds check, but the error
> >> reports an out-of-bounds index in the copy loop rather than the
> >> constraint the caller violated.
> >>
> >> Check the invariant explicitly instead, so the failure states the leng=
th
> >> limit rather than an array index.
> >>
> >> In a constant context exceeding the limit leads to a build error; at
> >> runtime it panics, so add a `# Panics` section for it.
> >>
> >> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver a=
bstractions")
>
> It's not actually fixing a bug, so I don't think this needs a Fixes: tag.
>
> >> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> >> ---
> >>  rust/kernel/auxiliary.rs | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> >> index 60dfbec8f330..1f3ba86d6d96 100644
> >> --- a/rust/kernel/auxiliary.rs
> >> +++ b/rust/kernel/auxiliary.rs
> >> @@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
> >>
> >>  impl DeviceId {
> >>      /// Create a new [`DeviceId`] from name.
> >> +    ///
> >> +    /// # Panics
> >> +    ///
> >> +    /// Panics if the combined module and device name, including the
> >> +    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` byt=
es.
>
> I'd rather document that this is only intended to be called within device=
 ID
> table creation; in const context a panic is just a compile time error.
>
> >>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> =
Self {
> >>          let name =3D name.to_bytes_with_nul();
> >>          let modname =3D modname.to_bytes_with_nul();
> >>
> >> +        assert!(
> >> +            modname.len().saturating_add(name.len()) <=3D bindings::A=
UXILIARY_NAME_SIZE as usize,
> >> +            "auxiliary device ID is too long"
> >> +        );
>
> Isn't this missing to consider the separator and NULL terminator?
>
> >
> > We really shouldn't panic, we should error out and fail the creation
> > instead.
>
> This is only ever used from const context to construct the device ID tabl=
e, e.g.
> as in
>
>         kernel::auxiliary_device_table!(
>             AUX_TABLE,
>             <NovaDriver as auxiliary::Driver>::IdInfo,
>             [(
>                 auxiliary::DeviceId::new(NOVA_CORE_MODULE_NAME, AUXILIARY=
_NAME),
>                 ()
>             )]
>         );
>
> and a panic in const context makes the compilation fail, so it works as
> intended.
>
> Unfortunately, we can't enforce that is function can only be called from =
const
> context, so technically it could also be called outside of the device ID =
table
> in non-const context, but it would be odd to construct outside of a devic=
e ID
> table.
>
> > But what is placing the constraint of the name size here?  The C api
> > just takes a pointer, it doesn't care about the size, why does the rust
> > binding care?
>
> I assume you were thinking of something else? This struct represents
>
>         #define AUXILIARY_NAME_SIZE 40
>
>         struct auxiliary_device_id {
>                 char name[AUXILIARY_NAME_SIZE];
>                 kernel_ulong_t driver_data;
>         };
