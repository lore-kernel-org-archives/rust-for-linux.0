Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F7C1F8EE0
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732707606; cv=none; b=r+NRqlH8T5ZME8Of2LAvv6CD+KAMNHlCRMb0MrgPvwNTB3/vbg2f/3PAMFxdJ8nlKdz8NSkAW9MTar37vwRbDWTPje+P/viTgVcCBH9T/ab/CT9SWai890/d6dBNhoJh+0newISE63W00jT+xW4JO+sCzXFYViji5N7gZPR7uWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732707606; c=relaxed/simple;
	bh=o4nE8wjfnFUpBbQRpANI+Wi2/lAKikDxFPZ7qS/fPGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkzvQhv4s+XVdSGtla6IQuIzfsj2EtKM57qJ2j0CoA8Zm6dGWz4jcJhoTFBSstBbkEi7l3KnZz/XZ0weo4QnNfyRiIvnYqIkRHCw6gSxHz0FFNdMkihwMVYoaq3QTNQGHxXKpbWhwYv7blQ6goIsCBmSU2gdh87jx5viSf4h+js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ffXrAkpl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ffXrAkpl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a766b475so14042535e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 03:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732707602; x=1733312402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeLUdoD4xLFsh9NoqmIjIyZQO4DIDisVAw+MDipGd5U=;
        b=ffXrAkplVejDaObxRHxegsuKwBLaUrFW3NKgy2bn8AzojFxiFMDNVbEe12U4WmnwTS
         BPnzl+CFR5E5nbcjpEY+9gdp1XIM4OekUj2FKyz9/TiyJ8z2zTuh3iWMyrlaIHhgaYJ0
         JB24QYzwTFEHeIhqkZflMMLBs5CDbU3d9gibMI3Zu+DlrcOF85Zrv/7wMLLRZmv6/F/G
         TRaVAgxaztVzMrWd3FOE1oaBgiNvVMu6+ia/fwXKh5VXhZhmxhcY+lY3xx6alw2aoxC3
         QJ/L+nUFZELllQNSd1QJw7KiQ/ZUL/HBPiWdN2lQM5lbNnIsP6ng+N3tgY0zdtRysUg4
         Ctfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732707602; x=1733312402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeLUdoD4xLFsh9NoqmIjIyZQO4DIDisVAw+MDipGd5U=;
        b=gI/eWmOeacPXOzY3bivV24tH+MJd3w3dT0Eb311AMGQaplbtao4eW1yOAJogRiUZMR
         wr684XYw+jd18VnoMuwPW2ShPq73pBmjh0+xDU/anvcrkmRMM31QI3sL0oEwRE+GkgVG
         +jvcr9ynw8xzX6ej8WhaxQiV8laL9zh+cWG05k4dDPULuKEk/ibi051w2LwFLR1Wz6En
         Fm9kZ3/Hoxub5tZAlEwsnNFY8aKfsBRliQ10mERWB5LbuIrcrypn/a+7PvLWAEpJp2El
         AIvnxGB6XwvNJjhFsp747wRYBVv3DiiMgPEE3vTrMJhMY/7DXQIEUM0QBetbQ+Yg/tTO
         XCXA==
X-Forwarded-Encrypted: i=1; AJvYcCX8KP3wogDXomNz/NzcIBk3S632KeIN7BOiDvk5/KFlsNu5knwbHLU/NjKCOfN/1fEpGlkT47VhALajItIb2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqluWmR3H3cw1YqmbWZ5Ra5GKE9GQgB3SCq6bzVRu0CJwg7wgg
	7LzsC60/tH8mKd/nmZ1AH7fNPqMFu4HqgXjOXsCgNGYzToFdv6Fap9eyQ2ndqgQlYBbnSW2SCu/
	p9psxDuPvN9xPOpnCDfQq+Mt4Kx/Y0WOkr0sO
X-Gm-Gg: ASbGncv9CdS1WckbXsRSPpffpGEWLml5BxrIfktYWzbUc/laSqF/WFPEDtocdFIgyeA
	MpCq/XmLQ39/GVHaS9xMwwed1vOmB3IlcaSp3doxOpdIN2EOHquvQ0eX8c92VEg==
X-Google-Smtp-Source: AGHT+IE2us7yWfY+1kczS4KsIvlmVgvswliWrEIl2BCiPKvMLgsZBRMbS9TfEIMWq8DNi4spliLCC7466V6b6w8xKVs=
X-Received: by 2002:a05:6000:1acc:b0:382:4cc3:7def with SMTP id
 ffacd0b85a97d-385c6eb6eb1mr1956832f8f.7.1732707602192; Wed, 27 Nov 2024
 03:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009105759.579579-1-me@kloenk.dev> <20241009105759.579579-2-me@kloenk.dev>
 <CAH5fLggju9ZYPD7LRTZKXJ9dhuLJ0uAS-USAokeoSvjOiN1v=w@mail.gmail.com> <6F3F4134-23FF-4230-9DC2-219FACAF546E@kloenk.dev>
In-Reply-To: <6F3F4134-23FF-4230-9DC2-219FACAF546E@kloenk.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 12:39:49 +0100
Message-ID: <CAH5fLgivWoo=FpKAhTsHPOot7ptWvezrgsB8YoHKsRobXok4MA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rust: LED abstraction
To: Fiona Behrens <me@kloenk.dev>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 10:47=E2=80=AFAM Fiona Behrens <me@kloenk.dev> wrot=
e:
>
> On 18 Nov 2024, at 11:22, Alice Ryhl wrote:
>
> > On Wed, Oct 9, 2024 at 12:58=E2=80=AFPM Fiona Behrens <me@kloenk.dev> w=
rote:
> >> +impl<'a, T> Led<T>
> >> +where
> >> +    T: Operations + 'a,
> >> +{
> >> +    /// Register a new LED with a predefine name.
> >> +    pub fn register_with_name(
> >> +        name: &'a CStr,
> >> +        device: Option<&'a Device>,
> >> +        config: &'a LedConfig,
> >> +        data: T,
> >> +    ) -> impl PinInit<Self, Error> + 'a {
> >> +        try_pin_init!( Self {
> >> +            led <- Opaque::try_ffi_init(move |place: *mut bindings::l=
ed_classdev| {
> >> +            // SAFETY: `place` is a pointer to a live allocation, so =
erasing is valid.
> >> +            unsafe { place.write_bytes(0, 1) };
> >> +
> >> +            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
> >> +            unsafe { Self::build_with_name(place, name) };
> >> +
> >> +            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
> >> +            unsafe { Self::build_config(place, config) };
> >> +
> >> +            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
> >> +            unsafe { Self::build_vtable(place) };
> >> +
> >> +        let dev =3D device.map(|dev| dev.as_raw()).unwrap_or(ptr::nul=
l_mut());
> >> +            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
> >> +        crate::error::to_result(unsafe {
> >> +            bindings::led_classdev_register_ext(dev, place, ptr::null=
_mut())
> >> +        })
> >> +            }),
> >> +            data: data,
> >> +        })
> >> +    }
> >> +
> >> +    /// Add nameto the led_classdev.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// `ptr` has to be valid.
> >> +    unsafe fn build_with_name(ptr: *mut bindings::led_classdev, name:=
 &'a CStr) {
> >> +        // SAFETY: `ptr` is pointing to a live allocation, so the der=
ef is safe.
> >> +        let name_ptr =3D unsafe { ptr::addr_of_mut!((*ptr).name) };
> >> +        // SAFETY: `name_ptr` points to a valid allocation and we hav=
e exclusive access.
> >> +        unsafe { ptr::write(name_ptr, name.as_char_ptr()) };
> >> +    }
> >> +
> >> +    /// Add config to led_classdev.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// `ptr` has to be valid.
> >> +    unsafe fn build_config(ptr: *mut bindings::led_classdev, config: =
&'a LedConfig) {
> >> +        // SAFETY: `ptr` is pointing to a live allocation, so the der=
ef is safe.
> >> +        let color_ptr =3D unsafe { ptr::addr_of_mut!((*ptr).color) };
> >> +        // SAFETY: `color_ptr` points to a valid allocation and we ha=
ve exclusive access.
> >> +        unsafe { ptr::write(color_ptr, config.color.into()) };
> >> +    }
> >> +}
> >
> > This usage of lifetimes looks incorrect to me. It looks like you are
> > trying to say that the references must be valid for longer than the
> > Led<T>, but what you are writing here does not enforce that. The Led
> > struct must be annotated with the 'a lifetime if you want that, but
> > I'm inclined to say you should not go for the lifetime solution in the
> > first place.
>
> The `led_classdev_register_ext` function copies the name, therefore the i=
dea was that the name only has to exists until the pin init function is cal=
led, which should be the case with how I used the lifetimes here

In that case you should be able to get rid of the lifetime like this:

impl<T> Led<T>
where
    T: Operations,
{
    /// Register a new LED with a predefine name.
    pub fn register_with_name(
        name: &CStr,
        device: Option<&Device>,
        config: &LedConfig,
        data: T,
    ) -> impl PinInit<Self, Error> {
        ...
    }
