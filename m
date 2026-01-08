Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C563E9581
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870483; cv=none; b=e7aAhv/OswtNMGtaAKuVI2Lmyvufai+7k3+oT2Z6INjunVYkAB9UaZrN3Uf3kxQh7pxcLr7ekrIecTST8UUSdV0rvgs8fKSOfl7HVpwr3VVRYZ+nN/tfWSk301JJ+2E15qMuh/rWMRHk/1y1bd9VGKUK1atF4tThJpath3A3Lck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870483; c=relaxed/simple;
	bh=5xtY89OpEnbJmQZ2K7Qpnb376FiSQ6njonU7Y3hphfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVSzic9PyxsKIvp4xEtj502KQLiEA87eSm5eCFKSdZcF2y/yJdDh2Suq8V6cI3//O2ceoovYL03wF0JadKeeHAKr4S0U64s2CDRgx6XbrH5pFJ1MDl0Pv4twg21q/YwIzFraXJRRoBEjna4HVbGe8+eHmowrFXm3mV/rJNIyN28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5mBUtnA; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5mBUtnA"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so16243451fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 03:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870471; x=1768475271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xtY89OpEnbJmQZ2K7Qpnb376FiSQ6njonU7Y3hphfk=;
        b=Z5mBUtnAnrQ321juzp5uFoj7nwkdlniwDjsEGcSKRiSScOMGwVcgtYpNIorO3nDiDI
         L3jSMtVgABr4GvPwEKo1w2O4kfIJaBY1h9SRuTDwDRPeOh0P2SWn3pVKFYkqEyk9XLKY
         RDAE51DNI1uTmUInl9dpGJvZ98kwqgVvVMhLlDfTUqHS88+LNlxDz3W/+LIHsq61m6++
         t+Nvy6U9Wg83iKOTcdxXRfq97POz7ixQuah4aEnXBcaF40vfpXIbrsR7enlZ6ZcMOGk0
         Ebx0xvs1KrR9Yl9XLwcxcLDt3EyRcBAy5birURYDFtKWd8jGQYdt1llmGjLJDrhIy0vh
         khOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870471; x=1768475271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xtY89OpEnbJmQZ2K7Qpnb376FiSQ6njonU7Y3hphfk=;
        b=dh2VUlBMdFnVoK5XYpGyt0keXIg3bwpO1lFY+4o/Tzcv6NOEpgkYEMKbs0KOeWwADG
         Qy1nSddl2SZQWAQ9IzZrjWmZ0072iys1ubgwnCMmNVfZsPZgrPpcrhANjhOL0cROpW48
         a3FI+WQocSEh/3dkQqjcfP7vX3N4e1Dj4O5GgfsH56ELdpH1kJqp0ZrNTh9JoFEgrLEM
         gHRA6m3t0IdusIxh56aidYaKFys4pZAEfBJIlw7/aOJwRJgGCvxo6KM4MtPlIyGaOv10
         ApOP5wrymdMJkZS3Y6otrZ+8nlMSDIlxtI4YALvjcc3z4npenm+ecXTS695OYmmwtPjg
         GNnA==
X-Forwarded-Encrypted: i=1; AJvYcCWNAdJ7IwXDhIC+MtZOiGtp9H3yDgyN/zhr0UYjYzc+szq47h0s+cOmwJHXjU4GNgbCIJc8s7HsyOTAJbOhug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHP8lVkM6WeBS47Ra+I5BL7gmIK3AakkeufZMruvEa4oU0CVu7
	TXXTwxdvGwS6XQIrvs7PcLRLnu/BhOTpiudlU/n5DJniVuHl2u8frUcngsl4u4Aa+d10dAhxj16
	+GdUTSCkndmkFim2+y5m02QMZKXIy5eM=
X-Gm-Gg: AY/fxX70BPtNDrMKVNrVp1lQQ70jG36FPnfo8ejeaX3sJ6pfxF33/lNowgGW8UyQEq9
	MQUe8SL6P1/hTvQZvliop7sHgiWh8kbwH/t15GWVCORPHVtC5L2vFw5m2ITMhKwMNooeuh/kh+n
	ZXSDxvKLui7qdyqIFdQh9CVWsLIEoXsuAgH246xAvcASQb18RXyKAxViavZkOmssk9bI41zTHiJ
	Zmn2NMIb69bFUOc9yq5rxm2LxlVT9TvOcrDbVsa7JIFeOJqDaFbj32Vl6BGTxVK7xrlKs49Mf0+
	IS7oxX/WPFHAyjjid106eZXvIhF7pQioY+eaJDUbjBHlAen2Jzk42phGnspggsDNVS1beDgrot2
	DeeMAAKSZHfUSrBbEJDLBlDhaa2Maq2yF/w02uG1o4w==
X-Google-Smtp-Source: AGHT+IGkVl0iqlVB8D+8RdflRsaYf8UYOSJ4zK8pkY6M2twX1nMSM5Dro1AbYUuAXZotu8cykNbTPHBg36Dl3xMMBLM=
X-Received: by 2002:a2e:be92:0:b0:382:6067:a239 with SMTP id
 38308e7fff4ca-382ff704d49mr18827881fa.30.1767870471225; Thu, 08 Jan 2026
 03:07:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-6-9e5ffd5e3cf0@kernel.org> <CAJ-ks9=VO1nypKFtOaGWxOUqzzJ7-Wb5qLd9pzQuFCSfk8PkZA@mail.gmail.com>
 <87bjj5gr7h.fsf@t14s.mail-host-address-is-not-set> <CAJ-ks9m6Pv85Y-Dfxgf7HxpKdrXsgY4jdpkFX+oYfrLevvd3hg@mail.gmail.com>
 <87wm1sfnra.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87wm1sfnra.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 8 Jan 2026 06:07:14 -0500
X-Gm-Features: AQt7F2r5hf5-IaRdVURsDUcgPlsd90i6dUqNeT_7IGXVJk3i2b2PxOY2NgDowZ0
Message-ID: <CAJ-ks9mJJ+Rsmwa3zYq=1kLCox0tKvbKu6FBOJH4S3ed0hdjwA@mail.gmail.com>
Subject: Re: [PATCH 06/10] rust: xarray: simplify `Guard::load`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 4:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Tamir Duberstein <tamird@gmail.com> writes:
>
> > On Wed, Jan 7, 2026 at 2:37=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Tamir Duberstein <tamird@gmail.com> writes:
> >>
> >> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
> >> >>
> >> >> Simplify the implementation by removing the closure-based API from
> >> >> `Guard::load` in favor of returning `Option<NonNull<c_void>>` direc=
tly.
> >> >
> >> > This is not sound. The returned pointer can now outlive the guard an=
d
> >> > mutation through that pointer is trivial.
> >>
> >> I don't think this is unsound. If we returned a reference instead, it
> >> would be, but we are returning a raw pointer. Dereferencing the pointe=
r
> >> is unsafe and requires proper safety comments.
> >
> > You may be right, strictly speaking, but it is most definitely a
> > footgun. This is a special pointer that requires more careful handling
> > than other raw pointers.
>
> I would disagree. Dereferencing any raw pointer requires the same
> checks, and knowing this one is valid and satisfies lifetime
> requirements is no different than others.
>
> It is also a private method that is only used in this particular impl
> block.
>
> At any rate, I'm fine with dropping the change. The reason I did it was
> because I had to double take when I read the previous code. I think the
> original code is has some unnecessary complexity with the closure.

Simplification is always welcome. The current shape of this code was
guided by the desire to avoid the footgun we're discussing here.

>
> Best regards,
> Andreas Hindborg
>
>
>
