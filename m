Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569617BBF
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204798; cv=none; b=U3Z/V7hww06L2IYkkcScZKOxrJhNFCQHp/dY86jndhSg9UWt80y2OhJmkT4qNxgFPpGTdPnlzh5OXTXwMDRZDw8Etfw4KWFbMXzAjjRdxF1Sc2RDvBoUu6w9X9UALAlm/MBzi8FHsIHcfWBDx0Veph91CQ6iPx7qcSf5gqK5IMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204798; c=relaxed/simple;
	bh=ayx9DSvEDARhauudzQXQzFlKFdi9apnZJk3lAvvA0Rw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qokaaaytF7PBq/Gn5cMPelLgZ6jd/RG909dgqS10N7IftKZhb6uBAVe+eSAyaUNcLUdpI9XQBiH5uyHUQsQphKUjCvvqk1zB6a/PWC7puzRNAsRsNO/5UkCmBnI+Y6jQQlugxk7/Hs5u0+QCVnsEY4Fsp90MkwRJb+uh542CHJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AH3ww9x1; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AH3ww9x1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ggqsbjrc4rfzllieplhm62wjra.protonmail; t=1742204788; x=1742463988;
	bh=rZV/G3yDfrnV9JTqllaFw+sdsVjBv/lh6HaV3B0P7ik=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=AH3ww9x18qmguysTMZycCeWxCjiQzi62fC1EGc+dvx7uS1+Gm0BBYt0iMAsuMS6OE
	 cHwXRPITnuvsioc1PmXjaG3h1j4wKeHgojP6s1SpnDaRRLzifKLJvsHMWyULLw4niP
	 vBt3P8xBywfJbORPTcFj92CAN2Haxiz7PhL6Xhic87HDBh0fQvJD1Vm7QZ6YGjJZsY
	 CsIsAxE2dj4bEnkaEm3kXr3WpyRSC8BpLLy2QtTnVYEUnOm7P7mOXqNhcnTPHLf7Mm
	 Bu658SzGLoAyY9z/zoPripdTwWVgJEoqPlRNteVXmUmO1UXt2TTeTO4QAUOJ7leDGf
	 AmD4ovbefkfQw==
Date: Mon, 17 Mar 2025 09:46:22 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
Message-ID: <D8IG1SRAUBFT.3KCSGXE1TPSC0@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ef7fc21c1712a733857e2c4b83d17ebc447d1d01
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Mar 16, 2025 at 7:59 PM CET, Danilo Krummrich wrote:
> On Sun, Mar 16, 2025 at 05:40:29PM +0000, Benno Lossin wrote:
>> On Sun Mar 16, 2025 at 2:46 PM CET, Danilo Krummrich wrote:
>> > On Sun, Mar 16, 2025 at 09:13:50AM -0400, Tamir Duberstein wrote:
>> >> On Sun, Mar 16, 2025 at 9:01=E2=80=AFAM Danilo Krummrich <dakr@kernel=
.org> wrote:
>> >> > On Sun, Mar 16, 2025 at 08:42:43AM -0400, Tamir Duberstein wrote:
>> >> > > On Sun, Mar 16, 2025 at 8:31=E2=80=AFAM Danilo Krummrich <dakr@ke=
rnel.org> wrote:
>> >> > >
>> >> > > > Let's go with just "must be taken ownership of" then. Unless th=
ere's subsequent
>> >> > > > feedback, I won't send a new version for this, since you both a=
lready gave your
>> >> > > > (conditional) RB for this.
>>=20
>> I didn't realize the `forget` argument immediately, so I sadly have to
>> take my RB back.
>>=20
>> >> > > What does it mean to take ownership, if not to run the destructor=
?
>> >> >
>> >> > Taking responsibility over the decision of what should happen to th=
e value, i.e.
>> >> > forget about the value, drop it right away, keep it alive at a diff=
erent memory
>> >> > location.
>> >> >
>> >> > > Given Benno's insight, I think the safety text is correct as it
>> >> > > existed before this patch.
>> >> >
>> >> > Without the addition there's no requirement for the caller to take =
ownership,
>> >> > but that's what we want here. Without the requirement it would be o=
n set_len()
>> >> > to take a decision on what should happen with the value.
>> >>=20
>> >> It isn't a safety requirement, right? I think it's fine to document,
>> >> but given that neglecting to run a destructor is safe, it doesn't see=
m
>> >> to affect safety.
>> >
>> > I don't think there's a rule that safety requirements of unsafe functi=
ons must
>> > only be used to guarantee memory safety, etc.
>>=20
>> Well that's their only point. Safety documentation should only be
>> concerned with memory safety.
>
> Oops, I wanted to say "must not only be used to *directly* guarantee memo=
ry
> safety, etc.".
>
> For instance, it is also used to justify type invariants (that exist to p=
revent
> UB).
>
> So, what I wanted to say is that setting self.len by iteself is never dir=
ectly a
> safety critical thing.

In my mental model there is no difference between "possibly immediately
UB" things and "possibly later UB" things. Both of the following
examples produce UB:

    let mut vec: KVec<u32> =3D KVec::new();
    unsafe { vec.set_len(1) };
    let elem =3D vec[0]; // UB

and

   let mut vec: KVec<u32> =3D KVec::new();
   let ptr =3D vec.as_ptr();
   let elem =3D unsafe { ptr.read() }; // UB

While in the first example, the UB only occurs when calling a safe
function, it is clearly the fault of the `unsafe` block before that
caused it.

>> You can still put it in the normal documentation though.
>>=20
>> > But you're right, if set_len() guarantees a default of what happens to=
 the
>> > value(s) when the caller doesn't take ownership, we could avoid the sa=
fety
>> > requirement.
>>=20
>> Yeah the default is to forget the value.
>
> It's not really a defined default though, it's just what ultimately happe=
ns as
> the consequence of how Vec in general and set_len() are implemented.

What would be an alternative? I'd argue that forgetting is the only
sensible option.

> But let's define it then; what about:
>
> "[`Vec::set_len`] takes (or kepps) ownership of all elements within the r=
ange
> [0; `new_len`] and abandons ownership of all values outside of this range=
, if
> any."
>
> The caller may take ownership of the abandoned elements."

For some reason I don't like the wording of ownership in this case...
I'll try to come up with something better, since you're splitting the
function into `inc` and `dec` anyways (which I think is a good idea), so
I'll reply there.

---
Cheers,
Benno

