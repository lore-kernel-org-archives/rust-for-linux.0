Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C519205510
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190548; cv=none; b=dhJZrI2rq0M9CYJz+mO6h3RGZzZFIgMbcPfrpETXV8zdQsqK3LoZbrE3TsHv3Dngbm8PFrN5+sqHRQPuMkgzHucQkJqqtEkirvsry0VAiIAOtxOsBHNjsLrFHrtnQCfZuAEFCCXMiPuMDH/tlawFSnyxLpGAQbNtZQGZQcOMY6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190548; c=relaxed/simple;
	bh=3Br1oOBXKmP6r21RmiF96tHvInjP9/VVfw3J+hCmz0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXFjRCUMHnUbdjHncM7INvDE/rVecjvaWj7r7s+H/Wpa+OTeFDVrasqiACQgF7c0tW5CI9h83yHgPY4vhv4mhZgtTsZzajK1U46Mnnjnfo6swVwK0VMSX4Gl8LTMK9gMVFs3DaEwExtn/BHHC9vlCZTXlLRbyd+PNK2MEFpaJ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Otc7hfMT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Otc7hfMT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390eebcc331so653130f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 08:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741190544; x=1741795344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRGeyMmjLT9xhZCEDTco0UK9N8jHZk67vVV09QPWqR8=;
        b=Otc7hfMTW/RbefjsZ98CV766CBNlXL3DHM+Y00Pv9zOEI7p7nlrsdzKu7JGtwXjLPa
         PnheCc69rAlS522Y2TMT1SkszDbabacpSc0HoL2PZsrL7QGWoAI4w8HvO8V+Qr1vT24H
         QnkPGHSHKgVQtg0SvAgjCxf/0QtUxLX0L0fPnqlDFcBBPuzZjg2eibDeYgRCLiSINm7G
         eamWedwTFO0jumKlT4d+W/ZuN+rhnNWKxVa3CWuFa8gMqk5ECIjguK1X5GgqaFniR8V4
         CKvB4PKTEeO4HRho9qrIoEi/TBqzfFAmJxT22Be+UlgDHlvQcoeBMXvOr9SGEendvIra
         wrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190544; x=1741795344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRGeyMmjLT9xhZCEDTco0UK9N8jHZk67vVV09QPWqR8=;
        b=UJzs6UL/I88+CEbtYKJTzxebFRx44MTY6Pq5KaZ2Oglw0rU1Fs7ye9d/ZJnbEdJmkj
         sdUBvXw4+vzkUoUABOZRrVf1bd8sZS4VKnp7JVouaTTi9bulRb7/AvmLknYn+GExHN54
         265OOKzX0dKfH1bY0PpB6M10rkKgyKgXW5tGsFQ3E/tGouvt7tqBgKLR0u28OuSuE0LK
         7bSri6ybBR/kbLiRZKyVbFzZpOLHEk6cWzdkEwpgE+hRjMh9Voz945peez7Rz9Y9oELk
         LCS3e38kzZnw8Zgc21+9oEI159hJd4RKVJH7Ltufx3X26LJtvMqIgXQTafOUD635qcro
         2YfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWYJFofn2OeQqHGMklsXl5Hh9Iv1OICafMMxFGnaXtzK3yIyjYQZqDI1YzorGohXHqGGvItYZdL34Mz2qrkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMaRYQwL9PWUixD+fRFaheLsvC/h9S7pnewg1lQZuNhLcvIa6c
	RmoGV4IgB7/DHsPMInOoGWtujzhWXzDBd28w1YwuFzIxew4lI+lG8M2kz0oD5GMUCFdnGaRzFpi
	4mk/mmidDXNynIrBPTDLTDdWx/rh7UO2WrUw+
X-Gm-Gg: ASbGncvJmjecnbVp4TZBY2uDuCBdu545oVndC57qscFW44+VSeGoUzBeQPKFe0D/mDp
	J4Eb0TlrICF7nd1JNJG0kUPs1RoRlPIGhndVzplMhQ2y49+FWpFjfV/yWCOrIrwU9nwizPvG7Xa
	ezqbwvH2RMN1cZSWX1DBgN6hF2WBQ=
X-Google-Smtp-Source: AGHT+IGXsU6iHlzbjfdGvONdrAxxnWT5Jku/GmfhFvqCyGadUbe8YQk2pcu9aOsta+2T+o0fSE1Nvn+P11NZHJWW75Y=
X-Received: by 2002:a05:6000:154b:b0:390:ff84:532b with SMTP id
 ffacd0b85a97d-391155ffda2mr5638169f8f.7.1741190544159; Wed, 05 Mar 2025
 08:02:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305-unique-ref-v4-1-a8fdef7b1c2c@pm.me> <Z8hUIPtE_9P60fAf@google.com>
 <Z8hmCkeZGPwc5MuU@mango> <mE_To6ll96gFJQD9YKkT-mwa2KCHFCgOaZFxxczeDVJd0hr1rZCKFHD-vHQfm6deCjlUJIu4U-reNMtrwfyT7w==@protonmail.internalid>
 <CAH5fLgjFBknTmhxQBPUdB-iNMjEkcyuLiu22-Nj-DGB1Gb7NkA@mail.gmail.com> <87ldtj8p2m.fsf@kernel.org>
In-Reply-To: <87ldtj8p2m.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Mar 2025 17:02:10 +0100
X-Gm-Features: AQ5f1Jpn2dPfC4OJR5PvW7DtHct6kAg-LyuJv2fra08BknIv3fu4SG7GXw66Rx8
Message-ID: <CAH5fLgirYTV6K2QoH9LLwhHxJzz=h1R0jB4G2kpKQ_pBtBgePg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: adding UniqueRefCounted and UniqueRef types
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Oliver Mangold <oliver.mangold@pm.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 4:39=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Wed, Mar 5, 2025 at 3:56=E2=80=AFPM Oliver Mangold <oliver.mangold@p=
m.me> wrote:
> >>
> >> Hi Alice,
> >>
> >> On 250305 1339, Alice Ryhl wrote:
> >> > On Wed, Mar 05, 2025 at 11:31:44AM +0000, Oliver Mangold wrote:
> >> >
> >> > > +impl<T: UniqueRefCounted> Deref for UniqueRef<T> {
> >> > > +    type Target =3D T;
> >> > > +
> >> > > +    fn deref(&self) -> &Self::Target {
> >> > > +        // SAFETY: The type invariants guarantee that the object =
is valid.
> >> > > +        unsafe { self.ptr.as_ref() }
> >> > > +    }
> >> > > +}
> >> >
> >> > What stops people from doing this?
> >> >
> >> > let my_unique: UniqueRef<T> =3D ...;
> >> > let my_ref: &T =3D &*my_unique;
> >> > let my_shared: ARef<T> =3D ARef::from(my_ref);
> >> >
> >> > Now it is no longer unique.
> >> >
> >> Oh, indeed. That's a serious problem. I see 2 options to deal with tha=
t:
> >>
> >> 1. remove ARef::From<&T>
> >>
> >> I checked the users of this, and it looks to me like there is rather
> >> a limited number and they are easy to fix by replacing the &T with ARe=
f<T>.
> >> But I assume that wouldn't be welcome as it is intrusive nonetheless
> >> and of course there is ergonomic value in having the function around.
> >
> > Definitely not an option. There are many users of this function that
> > are in the process of being upstreamed. The ability to go &T ->
> > ARef<T> is pretty fundamental for ARef.
>
> Not having `impl From<&T> for UniqueArc` seems to work out fine.
>
> It would be unfortunate if `impl From<&T> for ARef<T>` would prevent us
> from having a unique version of `ARef`. I would say that is a valid
> reason to consider removing that impl.

I think the impl is really important. It's required to do things such as:

let mm =3D ARef::from(&*current!().mm());

Without the impl (or something equivalent), it's not possible to
increment the refcount of the &Mm returned by `current!().mm()`. There
are many other examples of this.

Alice
