Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A723C9
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Dec 2024 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094120; cv=none; b=RoZIm+LrqFAT+38SBOAcKY/K3rrRKsELRVVUTmND7QjOcwypuOLWGBTdakPUej8zFY97y6bYLED3FH/atDyDr1VxA2e++NNioNEnhCIdcwQcwf+3oTFHXCGt3PGFP6I3EKBlNjqitDrP7y2HcLZSQq2IJ+LSIVKF/y49NxnFrbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094120; c=relaxed/simple;
	bh=lethxNSS8EAyNyjFkm2pBuuwojYh8oVRmh80d1A3DX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSw5wMr08szbxXKrG2QRdC8c9+lxHmpjC1VVcRnz+sGWNf3s8mFDy8AwO1YQpzI9ooY4117gZy0UArLbw7hxj+t7Mcz3+IY3pERJu8Ed5QB6UJl3jL9/TT5fOnwbHRG3fX7+d3TiWGCpLgJbeq9/stK1gNyMIXchMCEWeOaHMHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gREh2xjm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gREh2xjm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862d6d5765so1141689f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Dec 2024 04:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734094117; x=1734698917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lethxNSS8EAyNyjFkm2pBuuwojYh8oVRmh80d1A3DX0=;
        b=gREh2xjmlLP11JXhJd1CdpbKXTdqiprPxIgFKDxfB1Hvp3ui+rmMUNn+cb7zV5HdWI
         sf6t8JwVqNzSIg4whDQWTrab7z8eqG5XUilKLs5lPovbByYt9QwOMQOsoqgTVlnWrkAS
         cemNtM+j5lvMlcli4gdBmoDlnv/7p7U4hEoh8SVoDBoM8u9VRF+THcxhycFKGOafuAj2
         N141xH3ekUw65YRy/oYUr7bQldWoGYAw9Basz8noRN8d+ckf46PRhd0PGM7ptk5pIrFx
         MltX3LPIGHUqunprn5DFzRhXXN3O3zPjsLdfIXMru6JiS6IbL+MgCxxajiVzDdiLn915
         dZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734094117; x=1734698917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lethxNSS8EAyNyjFkm2pBuuwojYh8oVRmh80d1A3DX0=;
        b=eOBLVg7lDB2hyBVTa0bXv70e4sjVBxN9lWuKNooMYQhhMHfjg0ybBmJ3GgxPEh3W8U
         wtORAgJTkm/JaJTBZ9ZGX38uN4BiPP7bVzyMLpt8daEil8hYTDvs8kqFkJH+GxLt01gt
         Y8aq5pV9Zg3hu+SG4GM4gg97ayPj92qM4UB/5qTAa+RtvCdIl9HxzoC4+8tHCIo44B1N
         tWweICjRtRGkqjCPSowuSouV0WIVb9JR2LVWdnNkyZSqHLKS0HNXySVO1z/vGuYpfcMo
         eKwmKzl0GXu7xP+4vWCqr7Pkkco7V4ba4sp/ZUWWOqTmhYTrYOEbz9RAVQi9z56VcBF1
         nd8w==
X-Forwarded-Encrypted: i=1; AJvYcCVxs22cmDKTvne9Zkh42zYuHcrfUxHcTjauHXulW4eGB/s5G3gqzvD8CAfzlhNwaLam/b3CqIVTiP/l6PwolQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzazC37KWYk3NlrP9KRFBiM+/aeb/ic181gsmaqfIaaqEr7CKi7
	j1EYKzHXHJCW1vf15CvooTlHmQSlfTIXpsQfp5jBC8Ia6isNCw04Wz34T+Qsz3tHoe2AxgRaVhv
	NYwgmP7ksQpeKHzapKiM2kufiaDzpx8RjsYR+
X-Gm-Gg: ASbGncuBsao3phZeLhwI23XWCP4jpkBRbsGdaVrUYFASlZkdrhOgkiYOaJjsfS+VL0C
	XcfAPZqOYM9WbnKMHqh5nXrwrrUfRemRfnU6iWiQ=
X-Google-Smtp-Source: AGHT+IH0dpfDtOwGlnb2C6mIuU/5tSY4s4rjRlEZpLi8EzftkJqd7mRISCvo5vQa2rNmSwXyxe3wzmOuHV6dQFuozXc=
X-Received: by 2002:a5d:6da2:0:b0:386:2ebe:7aeb with SMTP id
 ffacd0b85a97d-3888e0b887dmr2002637f8f.44.1734094117119; Fri, 13 Dec 2024
 04:48:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
 <2024121324-overdue-giggly-bdb8@gregkh> <87frmrepo5.fsf@kernel.org>
In-Reply-To: <87frmrepo5.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Dec 2024 13:48:25 +0100
Message-ID: <CAH5fLgh+iOefU3vG=e8aAFhcKh0W=6M0odUt3s_wfDKW+rGNOg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 1:24=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Greg KH" <gregkh@linuxfoundation.org> writes:
>
> > On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
> >> This series extends the `module!` macro with support module parameters=
.
> >
> > Eeek, why?
> >
> > Module parameters are from the 1990's, back when we had no idea what we
> > were doing and thought that a simple "one variable for a driver that
> > controls multiple devices" was somehow a valid solution :)
> >
> > Please only really add module parameters if you can prove that you
> > actually need a module parameter.
>
> I really need module parameters to make rust null block feature
> compatible with C null block.

Instead of providing module parameters to Rust code, you could
implement that part of Rust nullblk in C. That way, you discourage
future Rust drivers from using module parameters without making it
impossible to have them in Rust nullblk.

Alice
