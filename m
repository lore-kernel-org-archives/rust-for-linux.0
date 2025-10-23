Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A0A303A1D
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761214901; cv=none; b=oZlMLzolCspLxTuHbk/ay86xzkEodraTNH+gKldHlQYbRMuifZyi9fn3xSC++DdeJXubFdZ2qMJl0hTN8xT/2aasSzWHVpm51qKjONKRmuplpIP+PvVsC8gK9HvIHjMed+Gvjc3ApvEHYMGv0M7pPgDc8jg9KkdARY/goY+dwgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761214901; c=relaxed/simple;
	bh=Qu5ezQS4KZt4gS/T53hUJlw3TLfcC1axpEoYACdUN/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRMvumxPOx7iUfug6at2Wj5UVy2GVWwzae21HvizTMiAiI9Aafvddq5rsJX6j1b2+yX1MyizoUJhTe3TyYVrdDcKI+/N/D8+vaBENYeulWZF12a1r9E+eSaS/yHoHHnYzWKBOyHBv24MnqLPV5FQ/L5IkYerjgD17ju3jjVG3aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VA2CNkyy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VA2CNkyy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4270a0127e1so404696f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761214898; x=1761819698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwSw9XohcV8SjPUTl/sxIv1p5bvIiKGLRD0+vYZME4w=;
        b=VA2CNkyyusgokUy5/mTkZfzM6z3amyobxPbokETGHxsTvJqAYw6uu0Mh9U6KF4FTzW
         G6VmDolvlu6nB0qm4dXenpvmuTrAIJOewStnMPHz0WzmPUleBykENiEo5iPdNrbP/0wi
         rJFWOtPh0tEhcfzEo+f5AKZNSOVD6euMxTBa1f2m6+xtAvFgzuL3U7sAtqb7YGgMEp8G
         LfgD6GVtxtiPdk0/oB6w8L3t36T38SDDfKPUX69EDa+S49+CyuM7jOmokxjFIG6YwQDc
         WhweddVvYa9fEJzuJn7DizjLJissFIYoduPCbBhgeAda2JhG8swgAXpcOgxW3cshMnKg
         Tylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214898; x=1761819698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwSw9XohcV8SjPUTl/sxIv1p5bvIiKGLRD0+vYZME4w=;
        b=ut2PI/ijfCpPbsRpD//yZwzp8JSStjay+MBlIMMS2QkLpuzOhflX1+aQ06hKLYcZj6
         D0GwBHsO7fNefY0Yms/EPgdjbj9T/SkN4GF0AgugHquZPglGQYT7UBwql7tdtYbp2KRN
         3VmsQyF66NHbawlLZ98ASTcNoQFkPoVkybhy7t+To8B3zszusnOGDmXO8IFC0WRbZWvc
         igKFiY9h0glDa+gAe49sAFqBEUz0mIIzZzWCLmO4e+nRQnjmNZv7FMsrP7AmmKs4Vwjg
         Hfw9g9HonNCUfXmLmK2n/w4w7jp2Bvxp3qX59n5gtVxzrb0jcGP3svkknSPG74SAAeUk
         zuZA==
X-Forwarded-Encrypted: i=1; AJvYcCVScml9en9WKP+1KiGfJd3TpDGu5QODMa4euzE7i3CLCbLinMpcCOJSljz6kmaXZjMgxqJ/mEO1F07TJOwyfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzS0sYXNsNfywM/cq6D1PZ2YR7dWk1/97iT2SI7BJw2kyI1T00
	23UMwgHfapYrgKHDMPL2yTqB0G7Huz8VDPI+dFeKgo8ln2A7yUCAu2q3pvx2eofaRG6GLcqsQS+
	RgZZhS1R+IjhqoBnFh2zqiW+qETrwpi3ixiDfGb19
X-Gm-Gg: ASbGncvu7I9i6yM9TpHyDxnUCcoGgZ8TIfzTOUC7BkBsfSli5LdRzKeCmf5opxA5f/h
	hYmh/C/mfYNNlUZVeb4abPtS4ec15tt7Q0Sw4IC3nn3BLJ3HHZ9o3h5/mMh+4cG62LSKCuM60Re
	8BKPPeyQ3M0jcpunNfqcvgqAEVJmNiXsB6pIXbyxrKZ7kuFrLOpCapXWhQYaBBMLgmtGnADjr5Y
	CfhrXTsWks1VWOWkiGwA3Bg7k2QT8JD+iUkTlHPSM0M2gWenVcEU/cEXvX4hqJrNEd2xo2Q
X-Google-Smtp-Source: AGHT+IFLDhOLNuSegdUPm81Yq0CjIZ1l+FCrC2+tNMd6VE8o2hy/t+zBizqWs3Y8kdD0gj4e3g9Q32zbdZJh/hgiTMw=
X-Received: by 2002:a05:6000:178e:b0:427:241:91c2 with SMTP id
 ffacd0b85a97d-42704d963cbmr14859523f8f.30.1761214897852; Thu, 23 Oct 2025
 03:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-7-dakr@kernel.org>
 <aPnmriUUdbsQAu3e@google.com> <DDPMBR9EUYJ6.23AYG1B27BUEN@kernel.org>
In-Reply-To: <DDPMBR9EUYJ6.23AYG1B27BUEN@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 23 Oct 2025 12:21:24 +0200
X-Gm-Features: AWmQ_blZjh9RfWntbP8mSS9aGUvEtZhlLJ652Y3NHwlru1u3c7sSo8Jq4WXN3O0
Message-ID: <CAH5fLghiEqqccH-0S9-GD7pJaNuVpuo_NecMMmGVF+zR7Xs_dA@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] rust: debugfs: support for binary large objects
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 12:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu Oct 23, 2025 at 10:26 AM CEST, Alice Ryhl wrote:
> > On Wed, Oct 22, 2025 at 04:30:40PM +0200, Danilo Krummrich wrote:
> >> Introduce support for read-only, write-only, and read-write binary fil=
es
> >> in Rust debugfs. This adds:
> >>
> >> - BinaryWriter and BinaryReader traits for writing to and reading from
> >>   user slices in binary form.
> >> - New Dir methods: read_binary_file(), write_binary_file(),
> >>   `read_write_binary_file`.
> >> - Corresponding FileOps implementations: BinaryReadFile,
> >>   BinaryWriteFile, BinaryReadWriteFile.
> >>
> >> This allows kernel modules to expose arbitrary binary data through
> >> debugfs, with proper support for offsets and partial reads/writes.
> >>
> >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> Reviewed-by: Matthew Maurer <mmaurer@google.com>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> >> +extern "C" fn blob_read<T: BinaryWriter>(
> >> +    file: *mut bindings::file,
> >> +    buf: *mut c_char,
> >> +    count: usize,
> >> +    ppos: *mut bindings::loff_t,
> >> +) -> isize {
> >> +    // SAFETY:
> >> +    // - `file` is a valid pointer to a `struct file`.
> >> +    // - The type invariant of `FileOps` guarantees that `private_dat=
a` points to a valid `T`.
> >> +    let this =3D unsafe { &*((*file).private_data.cast::<T>()) };
> >> +
> >> +    // SAFETY:
> >> +    // `ppos` is a valid `file::Offset` pointer.
> >> +    // We have exclusive access to `ppos`.
> >> +    let pos =3D unsafe { file::Offset::from_raw(ppos) };
> >> +
> >> +    let mut writer =3D UserSlice::new(UserPtr::from_ptr(buf.cast()), =
count).writer();
> >> +
> >> +    let ret =3D || -> Result<isize> {
> >> +        let written =3D this.write_to_slice(&mut writer, pos)?;
> >> +
> >> +        Ok(written.try_into()?)
> >
> > Hmm ... a conversion? Sounds like write_to_slice() has the wrong return
> > type.
>
> write_to_slice() returns the number of bytes written as usize, which seem=
s
> correct, no?

Yes, you're right, I think usize is the right value. The cast is
unfortunate, but it can't really be avoided. In practice it should
never fail because slice lengths always fit in an isize, but isize
isn't the right type.

Alice
