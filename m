Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BE030B514
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767816456; cv=none; b=QyHJFzn2RF339k87CFKoOz+NpGwE3J+YpJ8id3t4y9VtoeBGB9vzrpHMxIj0QZD9urSKWgwAbMJ1u374Y7a5YjfGrfpvDdTAzlVDB0iMFPmr4rKbqr3GKbuh843Y+a2VwzzE2hlPkhAkkH5r8uPbdpUA0sMG2O316akQY+8H0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767816456; c=relaxed/simple;
	bh=k7H8QMrM69p65+VoyiSQ+8BS3shQ8c0+7skkRap8nGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHC86QLEyO4cVz1h+AALE2LyJnAVEgVpWPt66HRrySZ+R//s0JRSMQOwMRGYUfqAEvsTp2vsAiVt9xr1NEaluGhpEaVWuAjm2TmEpQ7NoRnpBWrLQuWqw3mQqQowjsnD+Zv5+Kb4SOAybzfeDvitUV2dpKOcYla2a68xgitNxuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gW3drZXr; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gW3drZXr"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fb275271so13012671fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 12:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767816451; x=1768421251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2ryc+mQqltUGMEZzZot1094pRezfUf2ubOijkgkexE=;
        b=gW3drZXrJNzA3lB9A5MJ41WfpsghvdUyv8QeChqs62hJ5ZDuHOSrDrQsCu3Y4r9GIq
         XWhJAMQzpTEH78JCsZ0kcRpcN/jXMuabWxNT3PjuiYfEjRNnOJdSgBeBCA16XI0TSZuL
         2bNL5rSjfQTg9YBvqfy5nbkFm2xryGAFpRNQFPavi5Re8C4txBZec2cP3aWn0UKjMtiD
         eFMp8oFYcBvscMpCErNL7TFRbDAOyMdtGSDu3iuFDIqY85i4AXt7qZEb9flS49UERmXf
         G+GeoHHTD86CTmNA8jZ1A56A0vXA7/M+Yd/ZyrOxuvND9r3SGbIP4nBT1M/kVYvX8+wd
         pZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767816451; x=1768421251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q2ryc+mQqltUGMEZzZot1094pRezfUf2ubOijkgkexE=;
        b=hvs9RWi3jClw7s59vavFHY/mAsvl2aFgAHgyunZfVz+ybJqfbJ3cUB/OP7zbPOwNtN
         ++GuFx54wWlxw0s/dZWivEIczIR5zFysZulHWSSDSfr5BABMg2fabR6Ei4qn81sp5oNc
         zRO1+cv2YhUB5Cw5vm6HBTuAcvg2N7lSMDJmW1PyGW9ObV6REPXjGz6UXBJfEnn8NK+B
         9Db/LHDLfo03d1qRc9wftdMvVslB2Efmrq3iQpyH/ieDf7mopm5j6x04u9jxawWKNPav
         9m27BLV24GNusCgbxAB5Z1t+ExayUeMGN9+HERKZwn1CzeOogM1am4kkR894CFHpYSkK
         EMUA==
X-Forwarded-Encrypted: i=1; AJvYcCUTBXG44GhP6fuN3guUK2hZuj2C35GmfLnPfJ37fKEDr427feECLTUKrqMUuTp/ozoaDOkalMWn2Mn6nmgSJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50kPLSM8tlUkP8cLB8/I4gu6XkcIfr23vDj1cofY3M++RIUOX
	LNq8oZfdrK80UayEyoNVyGnlv8H3ay+ukFHRCBMQ9NVwkjSWN3vPjI5wdHdS+X8Pd9LrNXwerc9
	UCa1cla4DZLt/MJCKp6BlC/uMk6Sl9TVCdYWI
X-Gm-Gg: AY/fxX5iUbQItAKcI7sf4ZiXxInq6mL8zNhVkRRKOgoY6jo6rBTh6iQYAE0WSrRsMLR
	mdHvF5HcHPhj7LWzORzj5b8z4viN6gqLzXYiIqU0lo8EiuMbekGNvTIXNk6R4aOVP7LuzLOBbZq
	GwYJGTQ3W/5ckZPkL4q+zjCR6ZyvhCO9Tz9Ju2B+fwU8MblTutzVLIfdx8Dpi8qznayl1Vg0pGp
	nONIZagybC/GG20mBVQ8H/YzD5JdmI8E1qOZOm2YrbiDxaMcMiZutvpZSWVp8xtmRbVo1L4Yvcm
	CnMC39Oix9s71ac/jK6RBsYuKnXSRH3E3yv+mrwNVXhZdy2B6lQl9Fhk9wIX1ixR4FCuhh/3QDM
	o1rydVQ==
X-Google-Smtp-Source: AGHT+IEOxiHM50FEJ1pRQhP8BL/NSXCE6s/5MD5UBWSV18YfV+kOjI4Wrm0s1IfyjG07/q4Akv+Q4CS37pA+f7pzzag=
X-Received: by 2002:a05:651c:1b08:b0:37b:a395:fd68 with SMTP id
 38308e7fff4ca-382ff678b13mr10352491fa.10.1767816450714; Wed, 07 Jan 2026
 12:07:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-5-9e5ffd5e3cf0@kernel.org> <CAJ-ks9mXoTdOO+Zb9F=cpTrwa+XZ2mLb3NDH9pyd_GZhD2TVRQ@mail.gmail.com>
 <87eco1grin.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87eco1grin.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 7 Jan 2026 15:06:54 -0500
X-Gm-Features: AQt7F2p3Rp3M-mvDwJLJ_3J-bExRbvUa0hohuftFlb3TOgS-ZWZkqfMOTKYqXcY
Message-ID: <CAJ-ks9nBRfYpQKkzuM84TWsXSEccUXxxwQNUPxZHZZxrnXUbCQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] rust: xarray: use `xas_load` instead of `xa_load`
 in `Guard::load`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 2:37=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Tamir Duberstein <tamird@gmail.com> writes:
>
> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
> >> `xa_load` function takes the XArray lock internally, which would cause
> >> a double lock since the `Guard` already holds the lock.
> >
> > This is not correct. `xa_load` takes and releases the RCU lock only,
> > not the XArray lock.
>
> You are right. However, we do not need to take the RCU lock either in
> this case, right?

Seems reasonable, but the language mentioning double locking should be
removed please.

>
> >
> >> The `xas_load`
> >> function operates on XArray state and assumes the lock is already held=
,
> >> which is the correct API to use when holding a `Guard`.
> >>
> >> This change also removes the `#[expect(dead_code)]` annotation from
> >> `XArrayState` and its constructor, as they are now in use.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >>  rust/kernel/xarray.rs | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> >> index f6e610b059625..0f69a523b72bf 100644
> >> --- a/rust/kernel/xarray.rs
> >> +++ b/rust/kernel/xarray.rs
> >> @@ -215,8 +215,10 @@ fn load<F, U>(&self, index: usize, f: F) -> Optio=
n<U>
> >>      where
> >>          F: FnOnce(NonNull<c_void>) -> U,
> >>      {
> >> -        // SAFETY: `self.xa.xa` is always valid by the type invariant=
.
> >> -        let ptr =3D unsafe { bindings::xa_load(self.xa.xa.get(), inde=
x) };
> >> +        let mut state =3D XArrayState::new(self, index);
> >> +        // SAFETY: `state.state` is always valid by the type invarian=
t of
> >> +        // `XArrayState`.
> >> +        let ptr =3D unsafe { bindings::xas_load(&raw mut state.state)=
 };
> >
> > Can this be a method on XArrayState?
>
> OK.
>
>
> Best regards,
> Andreas Hindborg
>
>
