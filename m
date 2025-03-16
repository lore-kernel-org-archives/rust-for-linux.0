Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8F8635D
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742160053; cv=none; b=KZQ/gBL2IHXAXUGViEJyRiu91Gx1t+kZJrNwg5703B9oePOxA/iB+uai74tJipQTtx1ntdZZzGlEcwD5E3QY2hWqO6qck7pbeUfcq+TKeEVLmhHp4ppxMvZp4JecuGsmJbUedMe8hgKeoYGeZkLmXbsCxGUr4paxwZ8Rbwndrbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742160053; c=relaxed/simple;
	bh=F8AQVegGrIoJjJ8P838yK4cA6zlYCwXI9JB9dD4xCiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExoavDBIs5zekgV4OJFONGi/4N2ethgtDxD6yUx7pHJsei4W0mfC7zgedMM/7+OyKwkiLSwbHXYIDeFri9SIukeKErtT19PtLaNGU8LKCcucEYxQ4WPpJzLPwbUPa+yqB/maxPz6dVyXXIcpEqmTtktLFEWh4unRYi9Ox29CcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+wWwXyv; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+wWwXyv"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-307325f2436so36466031fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 14:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742160049; x=1742764849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzT7NmmST39mhQTx8mV/T8iCRdUnJhR0d88S1/EJVW8=;
        b=h+wWwXyvNKCf/7ioanKkjGufB8QXCqC5JxJIQRZ/PMtGaZYzGJwsmFs9MPSbe3UaMY
         uGQAnuP6bDGGaghTFg9DCZwbWdjc0KcStXQgH0A+SXoZdaeLvjqKXZ6Ns4bq9lWqAVsF
         8iW+7IbaRRBW7BRrjk6MAxWifUpKAI9byemeXj1XWCUUjVSjjFuNmXk4GyVQLVzCql7E
         QaSzjwGC5oBE5fZX3p73r7LMHW/Kceu+/WtZucbuL+ZcjrxABXZM2ZxuDzpCxriC7Gte
         CGLMWl1KAc75oNYbSya1fw1Y2wzKwbsij1MhcMypzmBWMUKAPUrnn1aeKOGOZ4xNIDSy
         AgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742160049; x=1742764849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzT7NmmST39mhQTx8mV/T8iCRdUnJhR0d88S1/EJVW8=;
        b=bp2jW5KeCXmXpEjVL4gXApewOLpxJ7NXWHimGSzItxjYyhTUGaihI28safzIF+Ko1c
         sd8g6YbRytBAd5wpXtTx5GZZgn4xSwk5LLPfWkKH47bvXtvMzJrBvrZCzof7JbDvRLnv
         xcromFkxgt5mhLOWB4U/1G338RwL7Dd+2taRtHUTXkfjs+OuAvqKqS2liL9zOIneOgo0
         crR/UCOCvsQSN4eD+ayFv00lwKzSuy6GVBUbnPZKnSiqElhtoZka4oqfgrfQ3pX0jHNm
         7wkqNOSsZovFpGs/HGQpx6GtH7dlW0HcMmhsiNvqrBys6nrLzLg+s1AD3nnBQFFucAZg
         TMmg==
X-Forwarded-Encrypted: i=1; AJvYcCXj1Q+Jk/iVvBf9S7vYG8KKC+QOBO6/jDx1Qv7NW8X06lyXiD5+FO24Do6/CcG8jLUTNNtSNutzRvn334gAlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqIx6I5V0DR/P+fQSHWPWNAKDYoEd2b19JCScV8IuPcWjUmwgo
	schwTOcLA+uUgZcLCyfvpGwWcSVlyrhOEdYmNmzS6RZMMABktWlvNim8CEOHlSjR9uviktqW7ig
	1oOyAZ/Xpw0WD5RBD7ciFpruDT5s=
X-Gm-Gg: ASbGnculUqtPCannyf+f++j0sXnRz3h4UI8rALKp1tzTv8Pq3XqUlQeogtzSESxkUnA
	frG3tmI6CQ9yPru/gkQ7cYxG/yKaGehUlCe80TCk3mioBwIZ0K4pz5xZdeQlZd0v4hirHd0WS+T
	ZAmCFOMieTvkz/a3nihhVZ9fPVzSolgfio4KgY4v5HWytW/YxdnxiukThtX8GH
X-Google-Smtp-Source: AGHT+IG2muDRmsKkMMo0fbH9p6Yzji9cSI6nAV21MfG3TtwfIq6F44sSvf29mQv7u4FMFnJvD9YKY61v/+ZEUYJCoxQ=
X-Received: by 2002:a2e:8ec9:0:b0:300:26bc:4311 with SMTP id
 38308e7fff4ca-30c4a875e97mr47510531fa.18.1742160049054; Sun, 16 Mar 2025
 14:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
 <Z9bLtgJa3PNB0bkf@pollux> <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux> <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux> <Z9ch0fgUI-V-rlGr@pollux> <CAJ-ks9=b-uMCLMMKT-9emgrrUXeaA50DBSEAWjSD+uHHZu-i9Q@mail.gmail.com>
 <Z9c6e8cbdFMTT6K0@pollux> <CAJ-ks9=J1hsnFvKzAOwi918UiP49-mmSki=aH2dhiSr7WAqrPQ@mail.gmail.com>
 <Z9c_8AQWgW70XH1U@pollux>
In-Reply-To: <Z9c_8AQWgW70XH1U@pollux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 16 Mar 2025 17:20:12 -0400
X-Gm-Features: AQ5f1Joqb2HtU7UcfWB6A3ywDNouPgPNIBmy3xOw_sFOhsueb_FQ9DxGGYNixOQ
Message-ID: <CAJ-ks9mBJUReOCbF-ar+Scoo8RAqYu-mc-Ej8UMHoyGHs0H7sw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 5:17=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun, Mar 16, 2025 at 05:10:30PM -0400, Tamir Duberstein wrote:
> > On Sun, Mar 16, 2025 at 4:54=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Sun, Mar 16, 2025 at 03:30:27PM -0400, Tamir Duberstein wrote:
> > > > On Sun, Mar 16, 2025 at 3:09=E2=80=AFPM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > >
> > > > > On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
> > > > > > But let's define it then; what about:
> > > > > >
> > > > > > "[`Vec::set_len`] takes (or kepps) ownership of all elements wi=
thin the range
> > > > > > [0; `new_len`] and abandons ownership of all values outside of =
this range, if
> > > > > > any."
> > > > > >
> > > > > > The caller may take ownership of the abandoned elements."
> > > > > >
> > > > > > I'd argue that giving up ownership, while offering someone else=
 to take it means
> > > > > > that it implies that otherwise we'll just end up forgetting abo=
ut the value.
> > > > >
> > > > > Btw. I'd still prefer if we could enforce that the caller has to =
document what
> > > > > should happen to the abandoned value. But I acknowledge that the =
safety comment
> > > > > isn't the scope for it.
> > > > >
> > > > > It'd be great if e.g. clippy would give us a tool to do something=
 analogous to
> > > > > safety comments.
> > > > >
> > > > > It think it would be useful to enfoce some additional safety docu=
mentation. For
> > > > > instance, I think the kernel would much benefit if we could enfor=
ce that
> > > > > mem::forget() must be justified with a comment, since as mentione=
d ina previous
> > > > > mail, it can cause fatal bugs, for instance when used on lock gua=
rds.
> > > >
> > > > There are other examples; ManuallyDrop and Box::leak are two that
> > > > immediately come to mind.
> > > >
> > > > But focusing on Vec::set_len again, could we return a mut slice to =
the
> > > > tail when new_len < old_len? Something like:
> > > >
> > > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > > index c12844764671..e5f857d723ec 100644
> > > > --- a/rust/kernel/alloc/kvec.rs
> > > > +++ b/rust/kernel/alloc/kvec.rs
> > > > @@ -191,9 +191,16 @@ pub fn len(&self) -> usize {
> > > >      /// - If `new_len` is greater than `self.len`, all elements
> > > > within the interval
> > > >      ///   [`self.len`,`new_len`) must be initialized.
> > > >      #[inline]
> > > > -    pub unsafe fn set_len(&mut self, new_len: usize) {
> > > > +    pub unsafe fn set_len(&mut self, new_len: usize) -> &mut [T] {
> > > >          debug_assert!(new_len <=3D self.capacity());
> > > > -        self.len =3D new_len;
> > > > +        let old_len =3D core::mem::replace(&mut self.len, new_len)=
;
> > > > +        match old_len.checked_sub(new_len) {
> > > > +            None =3D> &mut [],
> > > > +            Some(len) =3D> {
> > > > +                // SAFETY: ...
> > > > +                unsafe {
> > > > slice::from_raw_parts_mut(self.as_mut_ptr().add(new_len), len) }
> > > > +            }
> > > > +        }
> > > >      }
> > > >
> > > > Would that sufficiently communicate to the caller that they should
> > > > deal with this memory?
> > >
> > > I think that is a good idea. I'm not sure I like that this is useless=
 when
> > > new_len > self.len, but it also doesn't hurt too much, I guess.
> > >
> > > Feel free to send the corresponding patch. Also, feel free to add the
> > > corresponding comment about ownership while at it.
> > >
> > > I'd just drop this patch then.
> >
> > Looking at the usages of `set_len` that we have today (excluding the
> > pending nova patches for truncate and resize), they all amount to
> > `v.set_len(v.len() + n)`. What do you think about replacing this
> > method with `inc_len`? In the nova patches the only need for
> > decrementing the length would be in `truncate`, so `dec_len` can be
> > introduced there or the length can be decremented there directly.
>
> I think splitting it in inc_len() and dec_len() is good. Note that other =
methods
> need dec_len() too, e.g. [1].
>
> [1] https://lore.kernel.org/rust-for-linux/20250311-iov-iter-v1-4-f6c9134=
ea824@google.com/

Ok, I'll send a 2-patch series that adds `dec_len` as a private
helper. I see no need for it to be pub at this time.
