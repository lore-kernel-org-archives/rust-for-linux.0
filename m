Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7863F1F76A5
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 21:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742161993; cv=none; b=qq9D8WaQN+VreC/7vCtfk5LQvch13nFEGeQZDjJvEBxshnZtOyJEuYyaDcdF5Ce1OgLiqpngximeyx4KjzErQ2VvKCrZNu745szBQ6iPSjwyhWorfbbUZX6Z5ghwimHs6qgqulowNPQRoNTVLryhhFEZHcyq0OqRvLvjTos9hJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742161993; c=relaxed/simple;
	bh=SmDbV0CDJGHnQBNYdhyx/PMW+r79mOvtAT2niWgqUJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=siJ5sGdOE1IGGl+HnSggYvAGlVpzc2Gautrq/wt9ZC12e/MUpffOyffDPk9RtPhiI6BVVRTDsZxRJNMPJw54pFrpiIqgYpY41cAnxKaMUJRx1DRCqEUPx0ddqJK/rHnhd5df8/A2h3gUBiRCqE8v0feZfW5iab2cYjyESqnm6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSpxTOoR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSpxTOoR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54991d85f99so5001832e87.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 14:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742161989; x=1742766789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7pdR5eNbutxvQYMPq57mChL3pxlP6OUiJJZatUBtR8=;
        b=MSpxTOoR2fOwZg2fIadwMYSIjw1emRY+mtW21kEC/AP8+bymVLeuTtFdzUPZiIHrlI
         cDYpZJgjFEqXyPKE0ri2e1uS+edhs93xRzDlMsoy9yuiur3ORM4FXau2IZDrMfVRTEhQ
         Thg6pu+wSxvhVBqteCNxiuMbeOUyxC2xdPJo2Kt+ILaeSaANnVChkEwfL25BNUbk9cyU
         gGrhLdrD2kr4I9+9RGE0EvN8pVXGezYqItY/yDtZelYAS07PcBo0LlhiMmmJwtL0N11d
         eSaNvgrZQaZ/zHdE6IoDVpWkFpva5powNeCNl065/Uv9kY660jlozGv6KG3wAKk3P8Tq
         YmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742161989; x=1742766789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7pdR5eNbutxvQYMPq57mChL3pxlP6OUiJJZatUBtR8=;
        b=DX17MT1fuUPIMtkH3flr9V52t65olfUD40RhZpY6IghLcwbVsS/Sf/l6fydAcCuI9X
         WcGyYfYOc7McpU3F99EtAOWdjyEh4H4nXAsJu4LGFXK1t5KE5OT2NmgVBmoEbUJJj52I
         h69WEZtxFhje5lUDWokFF89y8jrE0clFar5M6G9RDqnea42wUEU56/0LiCG4VE57C8xw
         axYbcgFDLwg9CbTjBa8bPdtIUGoV/dIc4ilb6s8stiroIK2iw38qIilyC3nD8KtHuFc8
         +zA2PEzZdYiZrq/U1qRn/61P2Dv3mQIgkl4hEcEERqUXP3QpW/Tn9Rj1r+9z9yo9yOND
         mg6g==
X-Forwarded-Encrypted: i=1; AJvYcCX5RmQ8GdzMbKEJYprxS+d4EqIooq3bddLzlH0K2lwNi6w+SEb3kbkfk6WtH1F0ungVdpX/ec3tty+oMxcq6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGtkxQ9fU2lfGxjU5wB3EbzuzcPbl78durYYMse46KKGG8H6Q
	fM4b+uk8acF9w1nMUVQnwFa64WoPCNfSQesVl72zBr21t1ZUJ/NT1AxjL0W7PSyVgMZfhZgKB1F
	vDTy7Dza+I4ELvUrNpnA/GlBFKJA=
X-Gm-Gg: ASbGncvh9F5yaxxuqGDi0n5JZ/HgnwWYurlIobMoJWbaJuh4FwAPAB+r84UVXsP/y+K
	BzO1Pva97lfUaYn46Q1Bb611XHcjqUJBMM5Ruxlj1Cv77amfG8JNXujteAy4PRJRpljHWEPVgdv
	X3s2KXG1rOOzAqw6CjbrcfI5Ysx4of82ftxHEb6+2zSykNdGuqFtl9rWKqUhfb
X-Google-Smtp-Source: AGHT+IHGrVJSMaJYk97FhpsFbonLqOQOB/Wd2mZuukBC3gRoPFLN5J0Xer3j71/zlYXXT7ivZOfvmRuV2FlWzLk9VeI=
X-Received: by 2002:a05:6512:2247:b0:549:5a14:96d with SMTP id
 2adb3069b0e04-549ba44050emr6525874e87.19.1742161989147; Sun, 16 Mar 2025
 14:53:09 -0700 (PDT)
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
 <Z9c_8AQWgW70XH1U@pollux> <CAJ-ks9mBJUReOCbF-ar+Scoo8RAqYu-mc-Ej8UMHoyGHs0H7sw@mail.gmail.com>
In-Reply-To: <CAJ-ks9mBJUReOCbF-ar+Scoo8RAqYu-mc-Ej8UMHoyGHs0H7sw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 16 Mar 2025 17:52:33 -0400
X-Gm-Features: AQ5f1Jql2BibtdHTUi6SM2mAoPT-RMod8Y1_KQYqOH-kepF-Q5sm-y0FcygfqcY
Message-ID: <CAJ-ks9=OZyRNPxEJqBvjt77Wv=689jHLVFNDCjUE9TM7Vp-00A@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 5:20=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Sun, Mar 16, 2025 at 5:17=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > On Sun, Mar 16, 2025 at 05:10:30PM -0400, Tamir Duberstein wrote:
> > > On Sun, Mar 16, 2025 at 4:54=E2=80=AFPM Danilo Krummrich <dakr@kernel=
.org> wrote:
> > > >
> > > > On Sun, Mar 16, 2025 at 03:30:27PM -0400, Tamir Duberstein wrote:
> > > > > On Sun, Mar 16, 2025 at 3:09=E2=80=AFPM Danilo Krummrich <dakr@ke=
rnel.org> wrote:
> > > > > >
> > > > > > On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrot=
e:
> > > > > > > But let's define it then; what about:
> > > > > > >
> > > > > > > "[`Vec::set_len`] takes (or kepps) ownership of all elements =
within the range
> > > > > > > [0; `new_len`] and abandons ownership of all values outside o=
f this range, if
> > > > > > > any."
> > > > > > >
> > > > > > > The caller may take ownership of the abandoned elements."
> > > > > > >
> > > > > > > I'd argue that giving up ownership, while offering someone el=
se to take it means
> > > > > > > that it implies that otherwise we'll just end up forgetting a=
bout the value.
> > > > > >
> > > > > > Btw. I'd still prefer if we could enforce that the caller has t=
o document what
> > > > > > should happen to the abandoned value. But I acknowledge that th=
e safety comment
> > > > > > isn't the scope for it.
> > > > > >
> > > > > > It'd be great if e.g. clippy would give us a tool to do somethi=
ng analogous to
> > > > > > safety comments.
> > > > > >
> > > > > > It think it would be useful to enfoce some additional safety do=
cumentation. For
> > > > > > instance, I think the kernel would much benefit if we could enf=
orce that
> > > > > > mem::forget() must be justified with a comment, since as mentio=
ned ina previous
> > > > > > mail, it can cause fatal bugs, for instance when used on lock g=
uards.
> > > > >
> > > > > There are other examples; ManuallyDrop and Box::leak are two that
> > > > > immediately come to mind.
> > > > >
> > > > > But focusing on Vec::set_len again, could we return a mut slice t=
o the
> > > > > tail when new_len < old_len? Something like:
> > > > >
> > > > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.r=
s
> > > > > index c12844764671..e5f857d723ec 100644
> > > > > --- a/rust/kernel/alloc/kvec.rs
> > > > > +++ b/rust/kernel/alloc/kvec.rs
> > > > > @@ -191,9 +191,16 @@ pub fn len(&self) -> usize {
> > > > >      /// - If `new_len` is greater than `self.len`, all elements
> > > > > within the interval
> > > > >      ///   [`self.len`,`new_len`) must be initialized.
> > > > >      #[inline]
> > > > > -    pub unsafe fn set_len(&mut self, new_len: usize) {
> > > > > +    pub unsafe fn set_len(&mut self, new_len: usize) -> &mut [T]=
 {
> > > > >          debug_assert!(new_len <=3D self.capacity());
> > > > > -        self.len =3D new_len;
> > > > > +        let old_len =3D core::mem::replace(&mut self.len, new_le=
n);
> > > > > +        match old_len.checked_sub(new_len) {
> > > > > +            None =3D> &mut [],
> > > > > +            Some(len) =3D> {
> > > > > +                // SAFETY: ...
> > > > > +                unsafe {
> > > > > slice::from_raw_parts_mut(self.as_mut_ptr().add(new_len), len) }
> > > > > +            }
> > > > > +        }
> > > > >      }
> > > > >
> > > > > Would that sufficiently communicate to the caller that they shoul=
d
> > > > > deal with this memory?
> > > >
> > > > I think that is a good idea. I'm not sure I like that this is usele=
ss when
> > > > new_len > self.len, but it also doesn't hurt too much, I guess.
> > > >
> > > > Feel free to send the corresponding patch. Also, feel free to add t=
he
> > > > corresponding comment about ownership while at it.
> > > >
> > > > I'd just drop this patch then.
> > >
> > > Looking at the usages of `set_len` that we have today (excluding the
> > > pending nova patches for truncate and resize), they all amount to
> > > `v.set_len(v.len() + n)`. What do you think about replacing this
> > > method with `inc_len`? In the nova patches the only need for
> > > decrementing the length would be in `truncate`, so `dec_len` can be
> > > introduced there or the length can be decremented there directly.
> >
> > I think splitting it in inc_len() and dec_len() is good. Note that othe=
r methods
> > need dec_len() too, e.g. [1].
> >
> > [1] https://lore.kernel.org/rust-for-linux/20250311-iov-iter-v1-4-f6c91=
34ea824@google.com/
>
> Ok, I'll send a 2-patch series that adds `dec_len` as a private
> helper. I see no need for it to be pub at this time.

Actually, I don't think we need `dec_len` after all. `clear` can be
implemented as `self.truncate(0)`. Do you agree?
