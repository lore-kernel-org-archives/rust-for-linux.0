Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4842DA75A
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215863; cv=none; b=V0c6+VwHHZLms9am40UAZaiTPvPBAF2iSY23cIBwwDtk3iv4ZH0FQvHHPba1GToieEoEkeycKQa6Qpdcpr4V4quLTYuxg613C9XvRfPMv0tQt/B8ZvpUmJRpX0gQA6ZUxkwPJ42jdkaWsetBtDv5ncrA6ocjhqtMsNLtmCZwHFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215863; c=relaxed/simple;
	bh=YYxfUPdfLOOxl7Euu9zdXiMarVpXjjOUqwtysvwPqAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGOKs46OJdRV7vqqR+vCxCDGTLUsngHtnpCHH7x5rRwUbSFNlMYw5Re7wwOgkfMW9Glb8gbHDIyrx9KK0mDTSRx7K6XyxQ1OP7iw7Zp6i2aebpozixkjKzAxoJfNpn0aMYkdYTq/yN+ll0T+Vnp5Dd5iMyfuldNL4p7PFPFenNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JiaADP40; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JiaADP40"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso633128f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761215859; x=1761820659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlbOJJaTUJl2R9AS5ER+G1wmL9urQDFVZkUedb+ly68=;
        b=JiaADP40+cdDUse3X8lkAmhG/cK7DQllg6z2yNIapco8KiopK+kDSldASAADjDL0t8
         3WD90uo635LI0L7l4X7Ody6moFNC9bEligxs5KZ+4CZ/bA8hORhbLCIIhxeh6KXwp+yi
         iQKi3cqNgdCly5TLF1MypNGocpERPCg3b/hj/XPKjTC10sUOobS9UyCKXT2FOxDkDpkq
         Gy3bQRcVWfBvGtKWLHbiyPabsFCgT3FVa7RWKiKds8I3aBC2dfhq6Rf1y/COWJmR+rTN
         It5PvSEZZ3SJCfO84lmYe0ijJTHXOZTn21Wkfq+0gFGrFDAM6fyglraBoArWwsBkI+TY
         SOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215859; x=1761820659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlbOJJaTUJl2R9AS5ER+G1wmL9urQDFVZkUedb+ly68=;
        b=PH36JMC4RXjK8vdk9yJxOKoQXQLH9+QbLg7JKjMVqhed2lqRSSr/y1ca3NRL8HvNxr
         SaDyV0MAibmwXUfaiDHT1ufz9eUBdyYFSf2XQMsCq/GNK1Vy3Id86T76BK/DZ86yVmwC
         MG62LsflBdewpKP+uN7eqYO1lGx0VUS1OTvZwznJl3ZdZZMxN+IJw0ZRvrczPSQuBF/c
         Ypdl/SVoSxUWwOgKGG2p9P7M3cBqMz9XnwqbV2kXc414+Ir+a0LP1WlstDw+YA2I/Mw9
         /eMtBSDsYkfNLSn/XhBa9YGntWcmCoz68DWlxgIrXQ2XKfr6WGDw/WWKkVuy0TKbJ7o+
         +d3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMiAJL6ejZhdcYSEBE6JlbVELcQat4j8/N7ocHV4/PUXdpgj29WJN8vWveithbS9BoZemVXnrjl213SQtFEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZ+rUOc+AmmGa8IBdUs4jueWJT/5xbokbvnBqqVYk7gcutdI8
	z/1O+sTVoPjJKk74AaUHEPMFPOwGayd0o5TH8EkPzYRwLSGwE9OCu3B68AMRaXYJHHjwd4YINLs
	1023erhd9qrGfA81OY8RwuOPcOZrqCdUyfL+x9Qan
X-Gm-Gg: ASbGncv1MaGowxOtYbPiac7cOY9fCckc6QzlCn8Rseilxzuli6D/y20XIhNt0uxgbvq
	UAILYBRdRcq/gAfTxDzLaH+ltTkFYwnomuVavacZcU4LCRXmlHjaf2N+Cd1gWfyVIxf6No9PC9m
	/qJOki6mEgqjnOnjD0wUilr/RKDQeKbtTAUA0tRZJYCWjivFTKeAqUlulLq4CuoZNooHCVPsLAh
	lTLiJIoYe9LMB9zsQ30WNil3IIMLCt3WKjgRd++sWYDwFjMWwCJyPUU9d5kkQ==
X-Google-Smtp-Source: AGHT+IF7maTSQiS4kZPLIabukQBdn/rZWFtqT50NtIAJr4GO0YjV9vbHGhXIn7kavPdqJnen7ikTwzQkeGILfRe8wuI=
X-Received: by 2002:a05:6000:25fd:b0:427:587:d9ae with SMTP id
 ffacd0b85a97d-4270587d9c1mr13312291f8f.9.1761215858529; Thu, 23 Oct 2025
 03:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-6-dakr@kernel.org>
 <aPnnkU3IWwgERuT3@google.com> <DDPMUZAEIEBR.ORPLOPEERGNB@kernel.org>
In-Reply-To: <DDPMUZAEIEBR.ORPLOPEERGNB@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 23 Oct 2025 12:37:25 +0200
X-Gm-Features: AWmQ_bnHmpaGJ5SXvKhXy7BPOYeRX2L2uNppxAQX8TK3YbD6TWoOM-Pb_fLGRa8
Message-ID: <CAH5fLgiM4gFFAyOd3nvemHPg-pdYKK6ttx35pnYOAEz8ZmrubQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] rust: uaccess: add UserSliceWriter::write_slice_file()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 12:35=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu Oct 23, 2025 at 10:30 AM CEST, Alice Ryhl wrote:
> > On Wed, Oct 22, 2025 at 04:30:39PM +0200, Danilo Krummrich wrote:
> >> Add UserSliceWriter::write_slice_file(), which is the same as
> >> UserSliceWriter::write_slice_partial() but updates the given
> >> file::Offset by the number of bytes written.
> >>
> >> This is equivalent to C's `simple_read_from_buffer()` and useful when
> >> dealing with file offsets from file operations.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >> ---
> >>  rust/kernel/uaccess.rs | 24 ++++++++++++++++++++++++
> >>  1 file changed, 24 insertions(+)
> >>
> >> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> >> index 539e77a09cbc..20ea31781efb 100644
> >> --- a/rust/kernel/uaccess.rs
> >> +++ b/rust/kernel/uaccess.rs
> >> @@ -495,6 +495,30 @@ pub fn write_slice_partial(&mut self, data: &[u8]=
, offset: usize) -> Result<usiz
> >>              .map_or(Ok(0), |src| self.write_slice(src).map(|()| src.l=
en()))
> >>      }
> >>
> >> +    /// Writes raw data to this user pointer from a kernel buffer par=
tially.
> >> +    ///
> >> +    /// This is the same as [`Self::write_slice_partial`] but updates=
 the given [`file::Offset`] by
> >> +    /// the number of bytes written.
> >> +    ///
> >> +    /// This is equivalent to C's `simple_read_from_buffer()`.
> >> +    ///
> >> +    /// On success, returns the number of bytes written.
> >> +    pub fn write_slice_file(&mut self, data: &[u8], offset: &mut file=
::Offset) -> Result<usize> {
> >> +        if offset.is_negative() {
> >> +            return Err(EINVAL);
> >> +        }
> >> +
> >> +        let Ok(offset_index) =3D (*offset).try_into() else {
> >> +            return Ok(0);
> >> +        };
> >> +
> >> +        let written =3D self.write_slice_partial(data, offset_index)?=
;
> >> +
> >> +        *offset =3D offset.saturating_add_usize(written);
> >
> > This addition should never overflow:
>
> It probably never will (which is why this was a + operation in v1).
>
> >       offset + written <=3D data.len() <=3D isize::MAX <=3D Offset::MAX
>
> However, this would rely on implementation details you listed, i.e. the
> invariant that a slice length should be at most isize::MAX and what's the
> maximum size of file::Offset::MAX.

It's not an implementation detail. All Rust allocations are guaranteed
to fit in isize::MAX bytes:
https://doc.rust-lang.org/stable/std/ptr/index.html#allocation

Alice
