Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D944B40860
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Mar 2024 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171938; cv=none; b=W9TWfSf2qV+Dt3l8S/pc6KMfARP/JSDKuzmZlx7MFYHgvLCblkjRWoicubQE33ycFETv6WwGiYcMplgpuDvJwT1kTgwvsMAr28EZcnPpsIC/ug1nBWZgBr1u4WZMMA5mq408phwcrFGZxVnWqa++Jw0rOoLVH3UaJSv4ytq2MYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171938; c=relaxed/simple;
	bh=YmWvNHgeoO2qUzlr8oO4c0XpZFyXwaKL14GKAp7jKoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajh+ZbTz5wZv3WyLvT/eNo3OBcBgEt3dQjaHJ1qWC1bWluOMPYUQB1cX/pxYzpWl6+IzWo0uCWkwLCFORmALLZGGq92PCbMYOLs/vUsgLvTOuGotefSxQnsgbe2KefGf19aNBXAzPK+3Xz09YB3Eh5SmM/AvYfAlmORf5wmD8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qt71fEwr; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qt71fEwr"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7db9694a3ceso1476414241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Mar 2024 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710171935; x=1710776735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l2H+uWp5+4ryc+ja7QawCO/3D+Ky/JNQh3rE/M1g/E=;
        b=Qt71fEwrV4qrwIqxrLBAxnHllEFKqQlQhGsktENdh5UtHhs0IbQdwE7OAZQ1GAndZk
         tPvPDCmldNwrU5X1HN73ijgyqp9kECUN/hir6hfEpF8N+SideH2KC5PKf5vwMBkuboNX
         IDWQFjS1rkT7j2bseWT49rbJt2vedfCMQhPbJuFXBRofL5QjI/JQTIdgCRttXbonlCBd
         Qfb9PNp20e4Oi2UbbjJzoFNaHB/wC1+VUrZFtJXN+i/I1D3CcBg28k1tzq55PdidrIRU
         Wu5HQb0Tzt98VSi71RF4Wib8FHSn7UGg0Awptx0dcCoJQLPvXYLkoLOD+DsgVrvjI7rO
         BnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171935; x=1710776735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l2H+uWp5+4ryc+ja7QawCO/3D+Ky/JNQh3rE/M1g/E=;
        b=D0M3GOzl6M16/yneQ+JUsVGuZJhZye+FWOYYtN3mpdnzs/0GH/Um++ex8JR10+H/Kr
         ZzzroILTvWt0LuDTiKCArB8qiKXx+nyQQEaLaJ82MOQAgNcyW08TBaZxD31Fj9vgeovC
         S5UgQ1hEDPFJFqlAxElxJvs8sjFP2GqOKykyJiMzo0tqK5rrUxF0c+zvZQ8FaFXcdGtK
         4PaI2tk4it0MpIV3nu6kNEv2FCpmGx4Sl/e5OJSOjrAvUJWWkECx76ynhuv21tA0nMeo
         yqDuaVWRNf5oFnwq+997QzcQI/5ehIMSwaLUqqvrGiU6YegCoUEZhsbADrDyRWatYH9L
         jlHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTXD6ZpcAMU2cJEVfIQazrJThkDkdRqDn3KAO+F3XXxhUVU5emTSajtPBVLb6iaH10nMQz9aDoQGG0w1+VyqKSQW83SMG2IJjLkHhuwcs=
X-Gm-Message-State: AOJu0YxW+yg0Z4afu45L7KWn/a6X7DKUe0/iW47WZyrQxdT3HE7TeKkJ
	5XN2jkDhDVFF7to6uaAA57oY3//X63AJNWO6H3ci+1rnF1f/Q2FCi9RRwE1XZHke5XTiEGrR/cf
	gE7HJLtm/PX0TXax99HFUl6352Fy7d9Hb427b
X-Google-Smtp-Source: AGHT+IGbHcSwV0tp9Z7u5q5TuD4gz3pUF9aDonvWzWjiUCNh9u+14/r0E4UHD8HP+FDgq/qNj2CrunBmD3+cpXAD0XI=
X-Received: by 2002:a05:6102:3b8b:b0:473:2d92:dd4f with SMTP id
 z11-20020a0561023b8b00b004732d92dd4fmr2346249vsu.26.1710171935231; Mon, 11
 Mar 2024 08:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-arc-for-list-v2-0-ae93201426b4@google.com>
 <20240228-arc-for-list-v2-2-ae93201426b4@google.com> <d52c5d95-99cd-4bd4-864f-b704299d3b1b@proton.me>
 <CAH5fLggrRANz1GrjEa671Vj0m9=UDeEcGV5vhOxq8XtR6EjUSg@mail.gmail.com>
 <7976d136-3cf7-427d-a047-41c29d25ad32@proton.me> <CAH5fLghFKVBucpLGEXQ9CdRZRreEhT+u8tPFi+A9-+CX9_Mz1w@mail.gmail.com>
In-Reply-To: <CAH5fLghFKVBucpLGEXQ9CdRZRreEhT+u8tPFi+A9-+CX9_Mz1w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Mar 2024 16:45:24 +0100
Message-ID: <CAH5fLgj-CH+DmvUjPe2Kacs6QQUQ0qj8ctFrx_jjJg-w1Xrc_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: sync: add `Arc::into_unique_or_drop`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 4:35=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Mar 11, 2024 at 4:15=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
> >
> > On 3/11/24 10:03, Alice Ryhl wrote:
> > > On Sat, Mar 9, 2024 at 2:02=E2=80=AFPM Benno Lossin <benno.lossin@pro=
ton.me> wrote:
> > >>
> > >> On 2/28/24 14:00, Alice Ryhl wrote:
> > >>> +        // SAFETY: If the refcount reaches a non-zero value, then =
we have destroyed this `Arc` and
> > >>> +        // will return without further touching the `Arc`. If the =
refcount reaches zero, then there
> > >>> +        // are no other arcs, and we can create a `UniqueArc`.
> > >>
> > >> This comment is not explaining why it is safe to call
> > >> `refcount_dec_and_test` on `refcount`.
> > >> It dose however explain what you are going to do, so please keep it,=
 but
> > >> not as a SAFETY comment.
> > >
> > > I'll reword.
> > >
> > >>> +        let is_zero =3D unsafe { bindings::refcount_dec_and_test(r=
efcount) };
> > >>> +        if is_zero {
> > >>> +            // SAFETY: We have exclusive access to the arc, so we =
can perform unsynchronized
> > >>> +            // accesses to the refcount.
> > >>> +            unsafe { core::ptr::write(refcount, bindings::REFCOUNT=
_INIT(1)) };
> > >>> +
> > >>> +            // SAFETY: We own one refcount, so we can create a `Un=
iqueArc`. It needs to be pinned,
> > >>> +            // since an `Arc` is pinned.
> > >>
> > >> The `unsafe` block is only needed due to the `new_unchecked` call, w=
hich
> > >> you could avoid by using `.into()`. The `SAFETY` should also be an
> > >> `INVARIANT` comment instead.
> > >>
> > >>> +            unsafe {
> > >>> +                Some(Pin::new_unchecked(UniqueArc {
> > >>> +                    inner: Arc::from_inner(me.ptr),
> > >>> +                }))
> > >>> +            }
> > >
> > > The from_inner method is also unsafe.
> >
> > Ah I missed that, might be a good reason to split the block.
> > It confused me that the SAFETY comment did not mention why calling
> > `new_unchecked` is sound.
>
> I don't mind splitting up the unsafe block into several pieces.
>
> > > I think that using new_unchecked here makes more sense. That method i=
s
> > > usually used in the case where something is already pinned, whereas
> > > into() is usually used to pin something that was not previously
> > > pinned.
> >
> > I get your argument, but doing it this way avoids an unsafe function
> > call. I think it would be fine to use `.into()` in this case.
> > Splitting the unsafe block would also be fine with me.
>
> If you are okay with splitting the unsafe block instead, then I prefer
> that. I don't think avoiding unsafe blocks is always the best answer;
> especially not when you're already using unsafe right next to it.
>
> This reminds me of NonNull::new_unchecked(Box::into_raw(my_box)) vs
> NonNull::from(Box::leak(my_box)). The latter is safe, but I don't
> necessarily think that makes it the better choice. It's also important
> that your code carries the right intent.
>
> Another way to go around it could be to add UniqueArc::from_raw or
> from_inner methods, as well as from_raw_pinned and from_inner_pinned,
> and then use those here.

After looking at the code, I've changed my mind. I will write it like this:

Some(Pin::from(UniqueArc { inner: ManuallyDrop::into_inner(me) }))

With an INVARIANT comment. Does that make sense for you?

Alice
