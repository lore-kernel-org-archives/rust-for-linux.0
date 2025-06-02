Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270F1A3A80
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 01:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748827092; cv=none; b=kcoivVLCPqyyWoJSSs4Y0hYgl8uQlkdCwFkpMpJDFYGPsMV7ALrr4ayZ6h5VyWfD5i0EdIRKfNaDM/W568ifO7Vyt/2D686zmiK6+/FZkgfdWU5AHLO8x0CcFQ1s+AhF12DNrcV3DDuCkGL4mBoFkUidIbLRDWSygtQGmfxVB64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748827092; c=relaxed/simple;
	bh=dAXBuYw4yroyUC0VpP4oyvK8LqmqKLV0doVnUr2zZKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGsf58gKAJq2aJf9axfifw1owfMHJ6raQUYdaXz3lbvhjbuDb4GapDSlKk4A1AuURqz95rmbkSB/TdMeMmocmlB6q5Rm5Mab1lKJ1mrubl9cp2bdbUeFIh/RoLS5SgQAe7S9Y0akbu2PIX3cmQdGTx6K+ZsNRZuI32tRmRLnBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpjwKGQ3; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpjwKGQ3"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2cca475546fso3164523fac.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 18:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748827088; x=1749431888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVLMNTN7sjVlEuHiSG2rde9sSLAyqhLlFxU7VC/3D/4=;
        b=jpjwKGQ3ffFqhxpFuqLiWbNxoOLMUyuae4Pbq4SGKhnIwUfN5HTlekTS/IjUOibXCY
         NSBOoZwsqJlbA0flkeD54iNKK5/NxCAgbVYaiwgtymhnX73ZBXU6IPj9K2ALg3XQBORj
         TQxiXAbCIHT/6LaRDdGllc3XfFLAsrA9hhrKniCs3kHBAAi6UDJbnZMGwo+C5pQT01i1
         pMoqR+9XMeb61PhTAYWZE75gWlUoJfkhFOKmNg2ChWKHGTiSggZJBTO93BErhX7a4ztK
         CvHITfQTmq/t3Evlvm3eW/lKjVCxQgYVwYnBn41jO+fmRocLp7A6A5Q/ZDR6rD0GBusz
         yR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748827088; x=1749431888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVLMNTN7sjVlEuHiSG2rde9sSLAyqhLlFxU7VC/3D/4=;
        b=BE6sfMR1b4MqvlHlxcnDGla4SJXmTm+SVrOCJF8p/9Rf/jxqSzZkio2/bghySRa/qh
         /kJsn4ujZW1UxAU4fSwL3mwgQ7t8nF3JC/rasADFjJHbjgNtFVsW97/6KVmgnqKfLa6f
         O5q33WLzxaDNOVW1bGgK0N0Eq/J6Q9VdfpzJ1ZLNBMSq3tdbFMiSWralDeSSHfuCMIo0
         eG/lRAZLbi2GiiMDFeswPR3k+cxcxCgyk2u9sz9zdOCbHMhIR/h0cpXrt+vVnT/SPWHI
         1cuAmf9g6r9cwm/fJHFOWOkQzmeR5WvHpNgghU3U3aNFn0pRcKRJhCpStoyO/xGRYuCu
         8b2A==
X-Forwarded-Encrypted: i=1; AJvYcCWFT+2KTREq6OZgCB9KiidFmVil9hW+aL5JmIjfiCn4GOunc3EHFnQT0WxLq40zhmRPAFpDLj6NTzV6mlySrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWC4QSLMBxgiJf7juSmh0tMfZz4ZwM6KBUy69e+15tMx29vK6
	5/owEebXzR4hSCQTbEWfQPZXtoxlp6aUBihIJ1emP3MgZ0IbjbKBpHqEsRFdtAFOb1FRofnJyHc
	3becxO2WfW0wvonfEMLcsBt4+S7XL218=
X-Gm-Gg: ASbGncsPLaLzeTm8fR3UvX6/QpBJ4O1CXiZ1+cBfzEfUavuDS7YNUGfBvuF0iXVgkxu
	dzKSRvVNxfMsmST4QrvE3Y8l4f+mwE73ZjEVV6e76/E5hKZzC6KSqOUX9Bno2gekEUdIKIJoYD6
	ARsCtSgwqYhusvQprcqjREy4RiTaJlaXnOaX4IU9ngUJ0B
X-Google-Smtp-Source: AGHT+IHfjEBaC4xImA4Ccm7T6LBwvNLOOmUBhPpmPLSxpWUCbVcu5vaUwDBwAqL14Cs3GAO1KF/4lRdvYgcrqGe+uIg=
X-Received: by 2002:a05:6871:e80e:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2e9211a2f44mr7162125fac.2.1748827088460; Sun, 01 Jun 2025
 18:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
 <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org> <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
 <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org>
In-Reply-To: <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 1 Jun 2025 22:17:57 -0300
X-Gm-Features: AX0GCFvU8oEZJmnozZEUnXEs1jk30qJyDAC8J-4sBwK7iASiNzgcs4jeL9J95Vk
Message-ID: <CAPZ3m_gCY=8PScnfGZmJrpxgPFtTOaSh6Xw-9hS5pcUs7y4p7A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add invariants
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

oh no, it looks like I submitted the patch without the explicit v4
version and without the 0/3 part :/...  Sorry for that, it's the first
time I've made a split patch like that.

Em ter., 27 de mai. de 2025 =C3=A0s 09:03, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue May 27, 2025 at 3:02 AM CEST, Marcelo Moreira wrote:
> > Em seg., 26 de mai. de 2025 =C3=A0s 05:56, Benno Lossin <lossin@kernel.=
org> wrote:
> >> On Mon May 26, 2025 at 4:01 AM CEST, Marcelo Moreira wrote:
> >> > +/// - `data` is valid for writes when `is_available` was atomically=
 changed from `true` to `false`
> >> > +///   and no thread is holding an RCU read-side lock that was acqui=
red prior to the change in
> >> > +///   `is_available`.
> >>
> >> This doesn't cover the case needed in `drop`, since there might be a
> >> thread holding the RCU read-side lock when `drop` is run. But that
> >> doesn't matter, because that thread isn't going to access `data` (sinc=
e
> >> it can't have a reference to the value anymore, after all we're droppi=
ng
> >> it).
> >
> > My understanding: I understand that the write invariant primarily descr=
ibes
> > how data becomes valid for writes after revocation (RCU grace period).
> > In the specific context of drop, the validity for writes (e.g., drop_in=
_place)
> > is predominantly guaranteed by the exclusive mutable access (&mut self)=
 of the
> > PinnedDrop implementation, rather than the RCU-based write invariant.
> > The RCU readers would not be able to access the data being dropped anyw=
ay.
> >
> > Plans for v4: I don't understand if we need to change something here or=
 if this
> > will be reflected in the SAFETY comment for drop.
>
> We should change the invariant to only consider threads that can access
> `data`. So
>
>     - `data` is valid for writes when `is_available` was atomically
>       changed from `true` to `false` and no thread that has access to
>       `data` is holding an RCU read-side lock that was acquired prior to
>       the change in `is_available`.
>
> >> >  #[pin_data(PinnedDrop)]
> >> >  pub struct Revocable<T> {
> >> >      is_available: AtomicBool,
> >> > @@ -97,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit=
<Self> {
> >> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >> >          let guard =3D rcu::read_lock();
> >> >          if self.is_available.load(Ordering::Relaxed) {
> >> > -            // Since `self.is_available` is true, data is initialis=
ed and has to remain valid
> >> > -            // because the RCU read side lock prevents it from bein=
g dropped.
> >> > +            // INVARIANT: `self.data` is valid for reads because `s=
elf.is_available` is true,
> >> > +            // and the RCU read-side lock held by `guard` ensures t=
his condition is maintained
> >> > +            // during access.
> >>
> >> Two things here:
> >> 1. This comment should refer to the type invariants of `Self` ie
> >>    "`self.data` is valid for reads because of the type invariants of
> >>    `Self` and because ...".
> >> 2. `INVARIANT` comments report on changes in the type invariants of a
> >>    type. For example when constructing a type with type invariants, on=
e
> >>    has to document that the invariants are fulfilled. In this case, th=
e
> >>    invariants of `RevocableGuard` are:
> >>
> >>    /// The RCU read-side lock is held while the guard is alive.
> >>
> >>    Which already is fulfilled by us having the `rcu::Guard` type aroun=
d.
> >>    So we should also change the invariants of the `RevocableGuard`.
> >>
> >> I think I suggested on the previous version that we change `data_ref` =
to
> >> a shared reference and thus simplify the `RevocableGuard` type, becaus=
e
> >> it won't need `unsafe` any more. Then we can also remove all invariant=
s
> >> on it. (And we also won't need the `new` function any more, since we
> >> have direct access to the fields).
> >>
> >> (This change should be its own patch)
> >>
> >> Then we will gain a new `unsafe` block in the code here that we will
> >> justify with the type invariant of `Self`.
> >>
> >> On second thought, we can reuse the `try_access_with_guard` function a=
nd
> >> then we won't need an `unsafe` block here.
> >>
> >> >              Some(RevocableGuard::new(self.data.get(), guard))
> >> >          } else {
> >> >              None
> >
> >
> > My understanding: The INVARIANT comment should be changed to SAFETY,
> > as we are justifying an unsafe operation (implicitly within RevocableGu=
ard::new
> > due to self.data.get()), not establishing a new invariant for Revocable=
<T>.
>
> We don't do SAFETY comments on "implicit" unsafe operations. A SAFETY
> comment must always be directly above an `unsafe` block.
>
> > The SAFETY comment should explicitly state that the validity of self.da=
ta for
> > reads is because of Revocable<T>'s type invariants, in addition to the
> > conditions
> > (is_available being true and RCU read-side lock).
> >
> > The proposed RevocableGuard simplification (changing data_ref to &T and
> > making RevocableGuard internally safe) is a significant refactoring tha=
t
> > should be in a separate, future patch.
>
> I think it should be done in this patch series, as it makes the safety
> comments significantly easier. In my mind the refactoring also shouldn't
> be too expensive.
>
> > For this v4 patch, RevocableGuard::new will continue to take a raw
> > pointer. Therefore,
> > try_access will continue to call RevocableGuard::new(self.data.get(),
> > guard), and the SAFETY
> > comment will justify this existing (implicit) unsafe interaction,
> > rather than introducing a new
> > unsafe block by calling try_access_with_guard here, which would
> > prematurely depend on the
> > RevocableGuard refactoring.
> >
> > Plans for v4: Change the comment from // INVARIANT: to // SAFETY.
> > - Reformulate the comment to: "SAFETY: self.data is valid for reads bec=
ause
> > of Revocable<T>'s type invariants, as is_available is true and _guard h=
olds
> > the RCU read-side lock."
> >
> > - No changes to the underlying logic of try_access (it will still call
> > RevocableGuard::new with self.data.get()).
> >
> >
> >> > @@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuar=
d<'_, T>> {
> >> >      /// object.
> >> >      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Gua=
rd) -> Option<&'a T> {
> >> >          if self.is_available.load(Ordering::Relaxed) {
> >> > -            // SAFETY: Since `self.is_available` is true, data is i=
nitialised and has to remain
> >> > -            // valid because the RCU read side lock prevents it fro=
m being dropped.
> >> > +            // SAFETY: `self.data` is valid for reads as `is_availa=
ble` is true and `_guard`
> >> > +            // holds the RCU read-side lock, adhering to `Revocable=
<T>`'s invariants.
> >>
> >> This is the wrong way around, the safety comment *relies* on the type
> >> invariants of `Self`. So it should be
> >>
> >>     SAFETY: `self.data` is valid for reads because of the type
> >>     invariants of `Self` and as `is_available` is true and `_guard`
> >>     holds the RCU read-side lock.
> >
> > My understanding: The SAFETY comment should clarify that the
> > operation's safety derives from or
> > relies on Revocable<T>'s type invariants, rather than merely "adhering =
to" them.
> >
> > Plans for v4: Reformulate the SAFETY comment to:
> > SAFETY: self.data is valid for reads because of Revocable<T>'s type
> > invariants, as is_available is true and _guard holds the RCU read-side =
lock.
>
> Missing '`' around code. Also please use `Self` instead of Revocable<T>.
>
> >> >              Some(unsafe { &*self.data.get() })
> >> >          } else {
> >> >              None
> >> > @@ -176,9 +185,11 @@ fn drop(self: Pin<&mut Self>) {
> >> >          // SAFETY: We are not moving out of `p`, only dropping in p=
lace
> >> >          let p =3D unsafe { self.get_unchecked_mut() };
> >> >          if *p.is_available.get_mut() {
> >> > -            // SAFETY: We know `self.data` is valid because no othe=
r CPU has changed
> >> > -            // `is_available` to `false` yet, and no other CPU can =
do it anymore because this CPU
> >> > -            // holds the only reference (mutable) to `self` now.
> >> > +            // INVARIANT: `is_available` is true, so `data` is vali=
d for reads.
> >>
> >> We're not only reading `data`, but also writing to it! (`drop_in_place=
`
> >> takes a mutable raw pointer and will call `Drop::drop` with a mutable
> >> reference)
> >>
> >> > +            // SAFETY: `self.data` is valid for writes because `is_=
available` is true, and
> >> > +            // this `PinnedDrop` context (having `&mut self`) guara=
ntees exclusive access,
> >> > +            // ensuring no other thread can concurrently access or =
revoke `data`.
> >> > +            // This ensures `data` is valid for `drop_in_place`.
> >>
> >> We have to mention the type invariants of `Self` here too. And also we
> >> have to satisfy all the conditions on the second invariant:
> >>
> >>     /// - `data` is valid for writes when `is_available` was atomicall=
y changed from `true` to `false`
> >>     ///   and no thread is holding an RCU read-side lock that was acqu=
ired prior to the change in
> >>     ///   `is_available`.
> >>
> >> This is the problem with that invariant that I outlined above. Nobody
> >> can access `data`, since we're getting dropped.
> >>
> >> >              unsafe { drop_in_place(p.data.get()) };
> >
> > My understanding: The operation in drop_in_place is a write
> > (destruction), so the prior INVARIANT
> > comment focusing on "reads" was a mistake.
> >
> > The SAFETY comment needs to explicitly mention Revocable<T>'s type inva=
riants.
> >
> > For drop, the primary safety guarantee for writes is the exclusive
> > mutable access (&mut self)
> > provided by the PinnedDrop context, in addition to is_available being
> > true. The RCU-specific
> > conditions of the write invariant are less directly relevant here
> > because of this exclusive ownership
> > during drop.
> >
> > Plans for v4: Remove the line: // INVARIANT: is_available is true, so
> > data is valid for reads.
> >
> > Reformulate the // SAFETY: comment to: SAFETY: self.data is valid for
> > writes because of
> > Revocable<T>'s type invariants (specifically, that data is valid when
> > is_available is true),
> > and because this PinnedDrop context (having &mut self) guarantees
> > exclusive access,
> > ensuring no other thread can concurrently access or revoke data. This
> > ensures data is valid
> > for drop_in_place.
>
> Your email client seems to rewrap the lines, could you avoid that, as it
> makes the text harder to read? Thanks!
>
> I don't think it's a good idea to have information in parenthesis in
> safety comments, they should be clear without the need for optional
> information. Also this needs the invariant change that I mentioned
> above.
>
> >> A function that also needs to be adjusted is the `revoke_internal`
> >> function. That's where the second type invariant comes in. I suggested
> >> that we remove that and split the behavior into `revoke()` and
> >> `revoke_nosync()` and Danilo agreed, so could you add that in another
> >> patch?
> >>
> >
> > My understanding: I fully understand and agree that the following are
> > significant refactorings
> > and should be handled in separate, dedicated patches, not in v4
> >
> > - RevocableGuard Simplification: Changing data_ref from a raw pointer
> > (*const T) to a shared
> > reference (&T), removing its unsafe logic and internal invariants.
> >
> > - revoke_internal Refactoring: Splitting revoke_internal into revoke()
> > and revoke_nosync() functions.
>
> Yes, but please include them in the next version of your patch series :)
> They make the safety comments a lot simpler.
>
> ---
> Cheers,
> Benno
