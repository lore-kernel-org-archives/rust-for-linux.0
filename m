Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379F2417C5
	for <rust-for-linux@vger.kernel.org>; Tue, 27 May 2025 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347416; cv=none; b=RNRPltWjA5G6ijwh3e4N/oeW9peXwdv2iRtMs5kbW14IKVxsIc797ZkdHGybi56FUwdlUjuNvKlxCJcWj7r80lDLgLbfz5dNqc09J331VIFwU8vQ2txdF2Wl8lFpjkNsytEYnHqZBNNAKglO1pRfbJhKDIGG2sqEE8hmB4to9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347416; c=relaxed/simple;
	bh=li+MQeHuYnzTa1Oo+qLw5a9C6kW/x2KBW1PajRsWFGY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dMzch6i0cX4xTPFO/BWsCLOFhuYEMOJX/w8IHW9JuEG60/HaaeBrjoQDFKN9ZabtIgC4bzEsCZe99/Cp3cZhgWrMlXWDykevrabvTtNnwnbBDNSsyTeT+zqV+jHTofA0wwF7levn8vTwjPmMCxarBS64GfMTy2n9cj9VQwKGixI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+F1L8ZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+F1L8ZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F4FC4CEEE;
	Tue, 27 May 2025 12:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748347416;
	bh=li+MQeHuYnzTa1Oo+qLw5a9C6kW/x2KBW1PajRsWFGY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=K+F1L8ZZrEgXTD/tM+/5wSz09zqR4sstUlb8Zv2m/igf1hOjXxU9PzomgMxcbQOQg
	 Yv5AMtFe6ro+FgOq63fTFEOIdDPPusKoCkcm5BZRZRb+5EqRGLIiqiRk0ULfx0y9qF
	 RUemJX6Z1DHoU6JhLkA5Yoj0WyBXCm/lT49L2pK1C+SU3y7INhIa3RGIQ3Rypbw5+S
	 H3nR8XRQJ8wIwPeajufTZnQ+d4mCaIp1M/3bw19OMzYftq+PDSaML4rBUwQCh7/IJj
	 jG5VmMNlpG32jxK2biW0nSO7Vcrz70sTKb+/LxG3VSNgSjyP+1MFmpuHobP8lxU5cY
	 3JjepRSYV4F2A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 14:03:33 +0200
Message-Id: <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org>
Cc: <dakr@kernel.org>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add
 invariants
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
 <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org>
 <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
In-Reply-To: <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>

On Tue May 27, 2025 at 3:02 AM CEST, Marcelo Moreira wrote:
> Em seg., 26 de mai. de 2025 =C3=A0s 05:56, Benno Lossin <lossin@kernel.or=
g> wrote:
>> On Mon May 26, 2025 at 4:01 AM CEST, Marcelo Moreira wrote:
>> > +/// - `data` is valid for writes when `is_available` was atomically c=
hanged from `true` to `false`
>> > +///   and no thread is holding an RCU read-side lock that was acquire=
d prior to the change in
>> > +///   `is_available`.
>>
>> This doesn't cover the case needed in `drop`, since there might be a
>> thread holding the RCU read-side lock when `drop` is run. But that
>> doesn't matter, because that thread isn't going to access `data` (since
>> it can't have a reference to the value anymore, after all we're dropping
>> it).
>
> My understanding: I understand that the write invariant primarily describ=
es
> how data becomes valid for writes after revocation (RCU grace period).
> In the specific context of drop, the validity for writes (e.g., drop_in_p=
lace)
> is predominantly guaranteed by the exclusive mutable access (&mut self) o=
f the
> PinnedDrop implementation, rather than the RCU-based write invariant.
> The RCU readers would not be able to access the data being dropped anyway=
.
>
> Plans for v4: I don't understand if we need to change something here or i=
f this
> will be reflected in the SAFETY comment for drop.

We should change the invariant to only consider threads that can access
`data`. So=20

    - `data` is valid for writes when `is_available` was atomically
      changed from `true` to `false` and no thread that has access to
      `data` is holding an RCU read-side lock that was acquired prior to
      the change in `is_available`.

>> >  #[pin_data(PinnedDrop)]
>> >  pub struct Revocable<T> {
>> >      is_available: AtomicBool,
>> > @@ -97,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<S=
elf> {
>> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>> >          let guard =3D rcu::read_lock();
>> >          if self.is_available.load(Ordering::Relaxed) {
>> > -            // Since `self.is_available` is true, data is initialised=
 and has to remain valid
>> > -            // because the RCU read side lock prevents it from being =
dropped.
>> > +            // INVARIANT: `self.data` is valid for reads because `sel=
f.is_available` is true,
>> > +            // and the RCU read-side lock held by `guard` ensures thi=
s condition is maintained
>> > +            // during access.
>>
>> Two things here:
>> 1. This comment should refer to the type invariants of `Self` ie
>>    "`self.data` is valid for reads because of the type invariants of
>>    `Self` and because ...".
>> 2. `INVARIANT` comments report on changes in the type invariants of a
>>    type. For example when constructing a type with type invariants, one
>>    has to document that the invariants are fulfilled. In this case, the
>>    invariants of `RevocableGuard` are:
>>
>>    /// The RCU read-side lock is held while the guard is alive.
>>
>>    Which already is fulfilled by us having the `rcu::Guard` type around.
>>    So we should also change the invariants of the `RevocableGuard`.
>>
>> I think I suggested on the previous version that we change `data_ref` to
>> a shared reference and thus simplify the `RevocableGuard` type, because
>> it won't need `unsafe` any more. Then we can also remove all invariants
>> on it. (And we also won't need the `new` function any more, since we
>> have direct access to the fields).
>>
>> (This change should be its own patch)
>>
>> Then we will gain a new `unsafe` block in the code here that we will
>> justify with the type invariant of `Self`.
>>
>> On second thought, we can reuse the `try_access_with_guard` function and
>> then we won't need an `unsafe` block here.
>>
>> >              Some(RevocableGuard::new(self.data.get(), guard))
>> >          } else {
>> >              None
>
>
> My understanding: The INVARIANT comment should be changed to SAFETY,
> as we are justifying an unsafe operation (implicitly within RevocableGuar=
d::new
> due to self.data.get()), not establishing a new invariant for Revocable<T=
>.

We don't do SAFETY comments on "implicit" unsafe operations. A SAFETY
comment must always be directly above an `unsafe` block.

> The SAFETY comment should explicitly state that the validity of self.data=
 for
> reads is because of Revocable<T>'s type invariants, in addition to the
> conditions
> (is_available being true and RCU read-side lock).
>
> The proposed RevocableGuard simplification (changing data_ref to &T and
> making RevocableGuard internally safe) is a significant refactoring that
> should be in a separate, future patch.

I think it should be done in this patch series, as it makes the safety
comments significantly easier. In my mind the refactoring also shouldn't
be too expensive.

> For this v4 patch, RevocableGuard::new will continue to take a raw
> pointer. Therefore,
> try_access will continue to call RevocableGuard::new(self.data.get(),
> guard), and the SAFETY
> comment will justify this existing (implicit) unsafe interaction,
> rather than introducing a new
> unsafe block by calling try_access_with_guard here, which would
> prematurely depend on the
> RevocableGuard refactoring.
>
> Plans for v4: Change the comment from // INVARIANT: to // SAFETY.
> - Reformulate the comment to: "SAFETY: self.data is valid for reads becau=
se
> of Revocable<T>'s type invariants, as is_available is true and _guard hol=
ds
> the RCU read-side lock."
>
> - No changes to the underlying logic of try_access (it will still call
> RevocableGuard::new with self.data.get()).
>
>
>> > @@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<=
'_, T>> {
>> >      /// object.
>> >      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard=
) -> Option<&'a T> {
>> >          if self.is_available.load(Ordering::Relaxed) {
>> > -            // SAFETY: Since `self.is_available` is true, data is ini=
tialised and has to remain
>> > -            // valid because the RCU read side lock prevents it from =
being dropped.
>> > +            // SAFETY: `self.data` is valid for reads as `is_availabl=
e` is true and `_guard`
>> > +            // holds the RCU read-side lock, adhering to `Revocable<T=
>`'s invariants.
>>
>> This is the wrong way around, the safety comment *relies* on the type
>> invariants of `Self`. So it should be
>>
>>     SAFETY: `self.data` is valid for reads because of the type
>>     invariants of `Self` and as `is_available` is true and `_guard`
>>     holds the RCU read-side lock.
>
> My understanding: The SAFETY comment should clarify that the
> operation's safety derives from or
> relies on Revocable<T>'s type invariants, rather than merely "adhering to=
" them.
>
> Plans for v4: Reformulate the SAFETY comment to:
> SAFETY: self.data is valid for reads because of Revocable<T>'s type
> invariants, as is_available is true and _guard holds the RCU read-side lo=
ck.

Missing '`' around code. Also please use `Self` instead of Revocable<T>.

>> >              Some(unsafe { &*self.data.get() })
>> >          } else {
>> >              None
>> > @@ -176,9 +185,11 @@ fn drop(self: Pin<&mut Self>) {
>> >          // SAFETY: We are not moving out of `p`, only dropping in pla=
ce
>> >          let p =3D unsafe { self.get_unchecked_mut() };
>> >          if *p.is_available.get_mut() {
>> > -            // SAFETY: We know `self.data` is valid because no other =
CPU has changed
>> > -            // `is_available` to `false` yet, and no other CPU can do=
 it anymore because this CPU
>> > -            // holds the only reference (mutable) to `self` now.
>> > +            // INVARIANT: `is_available` is true, so `data` is valid =
for reads.
>>
>> We're not only reading `data`, but also writing to it! (`drop_in_place`
>> takes a mutable raw pointer and will call `Drop::drop` with a mutable
>> reference)
>>
>> > +            // SAFETY: `self.data` is valid for writes because `is_av=
ailable` is true, and
>> > +            // this `PinnedDrop` context (having `&mut self`) guarant=
ees exclusive access,
>> > +            // ensuring no other thread can concurrently access or re=
voke `data`.
>> > +            // This ensures `data` is valid for `drop_in_place`.
>>
>> We have to mention the type invariants of `Self` here too. And also we
>> have to satisfy all the conditions on the second invariant:
>>
>>     /// - `data` is valid for writes when `is_available` was atomically =
changed from `true` to `false`
>>     ///   and no thread is holding an RCU read-side lock that was acquir=
ed prior to the change in
>>     ///   `is_available`.
>>
>> This is the problem with that invariant that I outlined above. Nobody
>> can access `data`, since we're getting dropped.
>>
>> >              unsafe { drop_in_place(p.data.get()) };
>
> My understanding: The operation in drop_in_place is a write
> (destruction), so the prior INVARIANT
> comment focusing on "reads" was a mistake.
>
> The SAFETY comment needs to explicitly mention Revocable<T>'s type invari=
ants.
>
> For drop, the primary safety guarantee for writes is the exclusive
> mutable access (&mut self)
> provided by the PinnedDrop context, in addition to is_available being
> true. The RCU-specific
> conditions of the write invariant are less directly relevant here
> because of this exclusive ownership
> during drop.
>
> Plans for v4: Remove the line: // INVARIANT: is_available is true, so
> data is valid for reads.
>
> Reformulate the // SAFETY: comment to: SAFETY: self.data is valid for
> writes because of
> Revocable<T>'s type invariants (specifically, that data is valid when
> is_available is true),
> and because this PinnedDrop context (having &mut self) guarantees
> exclusive access,
> ensuring no other thread can concurrently access or revoke data. This
> ensures data is valid
> for drop_in_place.

Your email client seems to rewrap the lines, could you avoid that, as it
makes the text harder to read? Thanks!

I don't think it's a good idea to have information in parenthesis in
safety comments, they should be clear without the need for optional
information. Also this needs the invariant change that I mentioned
above.=20

>> A function that also needs to be adjusted is the `revoke_internal`
>> function. That's where the second type invariant comes in. I suggested
>> that we remove that and split the behavior into `revoke()` and
>> `revoke_nosync()` and Danilo agreed, so could you add that in another
>> patch?
>>
>
> My understanding: I fully understand and agree that the following are
> significant refactorings
> and should be handled in separate, dedicated patches, not in v4
>
> - RevocableGuard Simplification: Changing data_ref from a raw pointer
> (*const T) to a shared
> reference (&T), removing its unsafe logic and internal invariants.
>
> - revoke_internal Refactoring: Splitting revoke_internal into revoke()
> and revoke_nosync() functions.

Yes, but please include them in the next version of your patch series :)
They make the safety comments a lot simpler.

---
Cheers,
Benno
