Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D930BB82
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218418; cv=none; b=Z8MJQvVmjBxy6N8giMn+DVaJk+Vy9oFD6s48fi3JzPi7AHI7wMnh6Zh+OsTuJ2i8k/Ea1h1tzCHcDg6lGMhpDSTqy64jkJ7RBXE2VNsys6tR7EQpFjDjZavuQyktw46CV6q6PgNILJ5NBSzrhY9MGG5SoJGOMW2TfLBMBFR/EGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218418; c=relaxed/simple;
	bh=h40p5k5+pElZQOdviKgfoGMd48LzDGMWUjhCF++upVQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B2r81V7qCZ2lM1cZlUOEjWGDjvLLJXTYiXmcVU4njX5ZN08aZMkAvREtxGuiVeWrgZl3Bsc+GmyvRSwPcSvSV+hpeGvGfsGipvNzlVqCMB6JXeGKzT9vHisQv4CQq6ZXsM405Oe9tnGGkALO38q1rtXacBplldVJpS825KM/GtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jf4KXGQU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jf4KXGQU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-470fd59d325so2824925e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761218413; x=1761823213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VbiRN7dyfbR5k4LKjwiKuRphvzhFq3uU84mIhjYZi0=;
        b=jf4KXGQUfocjvesuOS/cBro9PAQ7U1DkNwf3cTcGEBS/iUnlBeyK/99uVEkKeB8JWI
         Su4Q6ROMrOovmhQjLr6gjUCCQeaL2XSfFdtEXqJIuqARe+jxZzalRP0hjJxvfaW/E5Wq
         JAaN+hg9myDsiTIC6gLi3hAJzMpKUoYWmSxVbQXLqUXNV1XC09YRHj+C5zTfStZEeZc2
         KoMd80i2rf4aR4FBY0YEodlTFuE656s9mIpk4GniBtQqbFg0Fe3ebkaNG+7lM+vGzNyl
         ae50DlMsjt+aQ0D4tdM/5levyMt0qEQaaGmTR5b6Du7kBf/uwXZUoWv9IWjcSTTV41vY
         CRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218413; x=1761823213;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/VbiRN7dyfbR5k4LKjwiKuRphvzhFq3uU84mIhjYZi0=;
        b=OxXIB0kb3TuMKho0drXKE7yjFl0wS6BT2ZcLyviqSAzLSWxSRCAVxw/UjC2C9sFzbO
         bILE4UWsfiyp6IaGBm7sNcs8j2VAkwFASvME3/PJ3Mn1b1i3TEUYkkLEvxHXDODrDdVe
         +tudqC0kzR1M2uMFvUfPQFJeeOpXRBKsKFLInUGLugbVBjVCNPht1gY9YBx1xXZBWVaH
         QJfldxU2hijT+/HfYvJm+ExZTfCm6Viwmf3zZarFDgXeorpozx0jzb7CcuQBDkCaFM7c
         ihPfWgv1rC7VuiShCfd6Sc1UjdiAR0+qCUC62/pxQymyG4O6auEco/u0KVgAphL93h40
         zT5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhD57N2ar5UI8qAzwzMwh2LSEBJd7gDum4ayoHMqyGaNHhU8d402cuf/AOnj3BgGGG83v57vJCeheYcYtI9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcCTW50YHKRYbXw81OtqPCUrcxDPf2M+piEE39PaRItqQq/F6
	fB63fEZcXe/N0vLC26X0vF3hHCoLqBgxk5plEXYL08J9p6rauk7V4sstWZ+tpeg/NX6Qzs0vb88
	f14xhrUcSkWgl5j7isA==
X-Google-Smtp-Source: AGHT+IGgFDXdkbchdyD6FyA3f9D48Q6TJhqelFimolj3xmlXkCLl5F1WZy4r/uAtjiwVz/IxjL5J8cPMbOJgKxU=
X-Received: from wmwn22.prod.google.com ([2002:a05:600d:4356:b0:458:bdde:5c9b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5029:b0:46f:b32e:4af3 with SMTP id 5b1f17b1804b1-471178784efmr150564155e9.1.1761218413141;
 Thu, 23 Oct 2025 04:20:13 -0700 (PDT)
Date: Thu, 23 Oct 2025 11:20:12 +0000
In-Reply-To: <DDPNGUVNJR6K.SX999PDIF1N2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-6-dakr@kernel.org>
 <aPnnkU3IWwgERuT3@google.com> <DDPMUZAEIEBR.ORPLOPEERGNB@kernel.org>
 <CAH5fLgiM4gFFAyOd3nvemHPg-pdYKK6ttx35pnYOAEz8ZmrubQ@mail.gmail.com> <DDPNGUVNJR6K.SX999PDIF1N2@kernel.org>
Message-ID: <aPoPbFXGXk_ohOpW@google.com>
Subject: Re: [PATCH v3 05/10] rust: uaccess: add UserSliceWriter::write_slice_file()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 01:03:35PM +0200, Danilo Krummrich wrote:
> On Thu Oct 23, 2025 at 12:37 PM CEST, Alice Ryhl wrote:
> > On Thu, Oct 23, 2025 at 12:35=E2=80=AFPM Danilo Krummrich <dakr@kernel.=
org> wrote:
> >>
> >> On Thu Oct 23, 2025 at 10:30 AM CEST, Alice Ryhl wrote:
> >> > On Wed, Oct 22, 2025 at 04:30:39PM +0200, Danilo Krummrich wrote:
> >> >> Add UserSliceWriter::write_slice_file(), which is the same as
> >> >> UserSliceWriter::write_slice_partial() but updates the given
> >> >> file::Offset by the number of bytes written.
> >> >>
> >> >> This is equivalent to C's `simple_read_from_buffer()` and useful wh=
en
> >> >> dealing with file offsets from file operations.
> >> >>
> >> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >> >> ---
> >> >>  rust/kernel/uaccess.rs | 24 ++++++++++++++++++++++++
> >> >>  1 file changed, 24 insertions(+)
> >> >>
> >> >> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> >> >> index 539e77a09cbc..20ea31781efb 100644
> >> >> --- a/rust/kernel/uaccess.rs
> >> >> +++ b/rust/kernel/uaccess.rs
> >> >> @@ -495,6 +495,30 @@ pub fn write_slice_partial(&mut self, data: &[=
u8], offset: usize) -> Result<usiz
> >> >>              .map_or(Ok(0), |src| self.write_slice(src).map(|()| sr=
c.len()))
> >> >>      }
> >> >>
> >> >> +    /// Writes raw data to this user pointer from a kernel buffer =
partially.
> >> >> +    ///
> >> >> +    /// This is the same as [`Self::write_slice_partial`] but upda=
tes the given [`file::Offset`] by
> >> >> +    /// the number of bytes written.
> >> >> +    ///
> >> >> +    /// This is equivalent to C's `simple_read_from_buffer()`.
> >> >> +    ///
> >> >> +    /// On success, returns the number of bytes written.
> >> >> +    pub fn write_slice_file(&mut self, data: &[u8], offset: &mut f=
ile::Offset) -> Result<usize> {
> >> >> +        if offset.is_negative() {
> >> >> +            return Err(EINVAL);
> >> >> +        }
> >> >> +
> >> >> +        let Ok(offset_index) =3D (*offset).try_into() else {
> >> >> +            return Ok(0);
> >> >> +        };
> >> >> +
> >> >> +        let written =3D self.write_slice_partial(data, offset_inde=
x)?;
> >> >> +
> >> >> +        *offset =3D offset.saturating_add_usize(written);
> >> >
> >> > This addition should never overflow:
> >>
> >> It probably never will (which is why this was a + operation in v1).
> >>
> >> >       offset + written <=3D data.len() <=3D isize::MAX <=3D Offset::=
MAX
> >>
> >> However, this would rely on implementation details you listed, i.e. th=
e
> >> invariant that a slice length should be at most isize::MAX and what's =
the
> >> maximum size of file::Offset::MAX.
> >
> > It's not an implementation detail. All Rust allocations are guaranteed
> > to fit in isize::MAX bytes:
> > https://doc.rust-lang.org/stable/std/ptr/index.html#allocation
>=20
> Yeah, I'm aware -- I expressed this badly.
>=20
> What I meant is that for the kernel we obviously know that there's no
> architecture where isize::MAX > file::Offset::MAX.
>=20
> However, in the core API the conversion from usize to u128 is considered
> fallible. So, applying the assumption that isize::MAX <=3D file::Offset::=
MAX is at
> least inconsistent.

I would love to have infallible conversions from usize to u64 (and u32
to usize), but we can't really modify the stdlib to add them.

But even if we had them, it wouldn't help here since the target type is
i64, not u64. And there are usize values that don't fit in i64 - it's
just that in this case the usize fits in isize.

Alice
