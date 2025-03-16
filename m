Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A37B944E
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742146839; cv=none; b=q9lz69pF3y1bieYpGtfVxZL65rK008xOZIiAwNkh19RBP3F19tj1FOKyL2Rs7+/B5s8mgLFcf7CVyI8xy2qsiPHQbD/yqzxuqULhB+Ts8HCjpeSG2REF5cPUMtO+b++xdL5gwvbz2wQemJ2DlDZ+ljdqUAOpEtS0j0ITJR3OAts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742146839; c=relaxed/simple;
	bh=HvwjoNWdq+HvLydNSXIBI9qDKcnctNyWLr8qQpuX8m4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BoF7i+2Drr0F+wFX2XZvtYiQ47UkzxkStlkJEpFQIwuo3iJji1D8JYFC6tg8DThevrIp1Qm8sh5D46UcPU7dwg5W1vDOcU4L/1ozs+rpyheTOEDEG3QoTcbCYd0SHm94a9eQVdcOB7M0QPx8sl54bHALkgMr8a0B8Efp3a8UsH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=kxQ+uqIA; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="kxQ+uqIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742146835; x=1742406035;
	bh=HvwjoNWdq+HvLydNSXIBI9qDKcnctNyWLr8qQpuX8m4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=kxQ+uqIAMjKcKnIuooD3olMVvNob1Q6iYahpTZ1cOVoTz6i++VQcjVhB3gDUH1s0a
	 v7dqZF8XClayuDlVZoQnuopAY5bqo5zPPh4S2TaeZ5pDgTIrgtncEb7dpVzXVlHXEz
	 tEj99nUke4oaTx0sV5LP0hV35rXj0EDpCi4BUhdf7nBYdZEpvUz+3hXS+O83dqSkhW
	 Adqd+LRbxlDcOQNtlt3NCYcNRXfirLRqvF8PffQj71V74hcE9VkulWrlt4XfnMGbH+
	 chw+t4+dt5i99ngLRaz2HBn90nKIXrSluZtswhj2KkONY6GYypY7aFKLIcCXJEOsXc
	 fl8+gEKu8ag7Q==
Date: Sun, 16 Mar 2025 17:40:29 +0000
To: Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
Message-ID: <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
In-Reply-To: <Z9bWODCNNEq3xI51@pollux>
References: <20250315154436.65065-1-dakr@kernel.org> <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me> <Z9XIk3WpzruUfh6O@pollux> <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com> <D8HL95D099MI.2N779RERY6DAE@proton.me> <Z9bEosVk8-0sgSbw@pollux> <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com> <Z9bLtgJa3PNB0bkf@pollux> <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com> <Z9bWODCNNEq3xI51@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8827b71eac0fdb6eb9f7525099162f79a6bea2ff
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Mar 16, 2025 at 2:46 PM CET, Danilo Krummrich wrote:
> On Sun, Mar 16, 2025 at 09:13:50AM -0400, Tamir Duberstein wrote:
>> On Sun, Mar 16, 2025 at 9:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>> > On Sun, Mar 16, 2025 at 08:42:43AM -0400, Tamir Duberstein wrote:
>> > > On Sun, Mar 16, 2025 at 8:31=E2=80=AFAM Danilo Krummrich <dakr@kerne=
l.org> wrote:
>> > >
>> > > > Let's go with just "must be taken ownership of" then. Unless there=
's subsequent
>> > > > feedback, I won't send a new version for this, since you both alre=
ady gave your
>> > > > (conditional) RB for this.

I didn't realize the `forget` argument immediately, so I sadly have to
take my RB back.

>> > > What does it mean to take ownership, if not to run the destructor?
>> >
>> > Taking responsibility over the decision of what should happen to the v=
alue, i.e.
>> > forget about the value, drop it right away, keep it alive at a differe=
nt memory
>> > location.
>> >
>> > > Given Benno's insight, I think the safety text is correct as it
>> > > existed before this patch.
>> >
>> > Without the addition there's no requirement for the caller to take own=
ership,
>> > but that's what we want here. Without the requirement it would be on s=
et_len()
>> > to take a decision on what should happen with the value.
>>=20
>> It isn't a safety requirement, right? I think it's fine to document,
>> but given that neglecting to run a destructor is safe, it doesn't seem
>> to affect safety.
>
> I don't think there's a rule that safety requirements of unsafe functions=
 must
> only be used to guarantee memory safety, etc.

Well that's their only point. Safety documentation should only be
concerned with memory safety.

You can still put it in the normal documentation though.

> But you're right, if set_len() guarantees a default of what happens to th=
e
> value(s) when the caller doesn't take ownership, we could avoid the safet=
y
> requirement.

Yeah the default is to forget the value.

> But I don't want set_len() to make any guarantees about about a default, =
instead
> I want that the caller is forced to make an explicit and documented decis=
ion
> over what happens to the discarded values.

But it shouldn't be part of the safety docs.

---
Cheers,
Benno

