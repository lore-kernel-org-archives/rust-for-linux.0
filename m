Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9C31354C
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675261; cv=none; b=WPnYeF5kmg+J8RB5UTb97THRfp0MvnRF2FUF7mVgqj+B/mCQrUaCAJ+Mo/c69zPaxx8y+TNwn/z/oHuVl1h87QfRBRD8dr//HaV4yV0RURmihXCuU9u/WE/HR4RX/c8lBiCEVtMFiW3p21M7IyfMDTg0jm6ow3fmcGEYx1qsh7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675261; c=relaxed/simple;
	bh=PAQmWESZ7Q5aun4SbjeYV87iti2NlgtgRQqjB1UbuHw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OWq0npibwCgju1QTZTorpL5Q4eJ2lpzePYEOYSFaOk8pBKIuaquVolOLYtYJNCfAPDXfNolTx62NWCSO8Rfl9ye6jgqA0ROLlB3nKaXJTURocYU9lsSFRPtnTNfnfkILMYjN256pJFRdimuyZsbaqSzAztnVUdD/P9uP3JZm7K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oj9VRx8Y; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oj9VRx8Y"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963a722ed59so678507241.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780675259; x=1781280059; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyQyGkRUe5VvjYqInQnqi8SySL6a23ZU66H1yfN16R0=;
        b=Oj9VRx8Y/dnG60kHueKBN+78mYaN6GlK0I/KtUB1OuXLhXTI/3Ej2hCpTy+rbGfzET
         Y5XarkNokIwCLfB5z8q+fPfOrGC9gTn8PD5NH4wBM8JUOJD+oGOjKDiEmUuW6itPEI2m
         KVMGmGIioJgg/gMLT6njmguuVpl+hVB8xILSeq0fJv2BtlDs+hgKnRDK/ujmTmzJWC4M
         hsrTvgx6xNOekhBtj33789jPMDRowYJ6ZDXk5JQc2buC7hXFutMrV/QiF3Yyx6Potf5y
         xf5F+ggZRP+oWICT6ef4fTqBOVjGcggwNT2qPWnTCDPvaxo+8lVDRXYAu6/Hm6pIo8n4
         pTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675259; x=1781280059;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyQyGkRUe5VvjYqInQnqi8SySL6a23ZU66H1yfN16R0=;
        b=XMKzUDnsoTul7iIqqOQub1JLWpDIERKDJTVmRD+hXaf+J4L9eGahqZ48jNoiDWyU47
         Mstl9h4F0kf3COj0dX228/J8JZSF4ERhaN581xgQ+1fqi5r0WQd/zUwKrQrUdPVgW0oD
         mmsQjnoQhK3fnJCyn4QtIXLfLw7a6a4soNDJnvaCXIEqCyDfJZxIUoRvYj7UjPtEGaG9
         kXEizG32XJzPKkHahPHE7jlbWZjD1aCjcBNao839if4fyjNwGGTLyY5GrEJ/2y4jV7DL
         R0JTyvxINPVLcNGhvXQZbELCj7hEzLwq79UI3fckxswHHBAicPQqE95zpokTPTauNzPK
         5n3A==
X-Forwarded-Encrypted: i=1; AFNElJ/FswjFJdgtD06Oz2FnoWTpvV6AhLu6ze9gcoIBeONGJWVQfrgHs35gW4MJtY5MJQuN6GqHaDK66HMVifBe+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOvbN4FYQ7ARVtyueP7oh4yST6y6XN2cnVEraFCz9P2iCaKT6
	mDFsoVaweoc5QQmZDH4TLqBMhSzKE9ZPytJhuCCgilEUWF/sgj8SKSk2
X-Gm-Gg: Acq92OHaxkSmQsIEBqK1EKLvLIK45JS5e3YRlNFgJAW/R0YEIQZpquLEAc3dpcCCYQJ
	828bI+unHeNlKMbA6gVVgODsxQOD6ZC2eJ1lyF7yMpuxXLh6oPyOsTrGhmMGsV3vU4kognVRDc+
	ORtHKuFVcZTck//Mq34JfCzcxKnl+FwXwjxCrd7JApHAfB5Pw3oC8vYnERP9hJPTQG1XoTiejaI
	pUPi8wnwSX367TNZoWqhZOJqw7hLxKcxySH/nSVCMbd1QKFjLYG9VD3LAxLUjo5Flg+BW3IVLI1
	CQMBz2EmZ5UaGUNKLIrV+W/KNA7/wQ7EIBpcrfyC4bI1ZaCDVruN3zrk/p9r9+UtXzMi+0gNKFg
	MQcodLYw7FqQDLRv6sbof8f+BrVgIOLd0gMe/dGZuoRcuq/Se+xhHdUwqgFhLkxKxr3EyZmI7rA
	lG6/DPulHVWmkj+RsgbdgqzH94pkuYr2E7RjLo06YJzweB4SxIcnbbUZ5MwRAV
X-Received: by 2002:a05:6122:54a:b0:5a1:edab:f216 with SMTP id 71dfb90a1353d-5ac5197b908mr2700846e0c.11.1780675257631;
        Fri, 05 Jun 2026 09:00:57 -0700 (PDT)
Received: from smtpclient.apple ([2804:7f1:c241:abe4:8c1d:3d1b:d7cb:e7e9])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d6fb9ca0sm9109916e0c.6.2026.06.05.09.00.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jun 2026 09:00:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <8ff2de94a50ed077a4cfe520a081f2b8b438a375.camel@mailbox.org>
Date: Fri, 5 Jun 2026 13:00:35 -0300
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 rcu@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FEFE0522-FD7A-40DE-8B2A-09FE2F33F327@gmail.com>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-5-phasta@kernel.org>
 <4F8E8E04-5AB5-4E6B-9194-5FC467E2313F@collabora.com>
 <20260603191405.4c75badb@fedora-2.home>
 <09096455-BA79-4E61-AD88-44DA57C5BEA8@gmail.com>
 <20260604101552.4232733b@fedora-2.home>
 <8ff2de94a50ed077a4cfe520a081f2b8b438a375.camel@mailbox.org>
To: phasta@kernel.org
X-Mailer: Apple Mail (2.3826.700.81)



> On 5 Jun 2026, at 04:56, Philipp Stanner <phasta@mailbox.org> wrote:
>=20
> On Thu, 2026-06-04 at 10:15 +0200, Boris Brezillon wrote:
>> On Wed, 3 Jun 2026 21:43:05 -0300
>> Daniel Almeida <dwlsalmeida@gmail.com> wrote:
>>=20
>>>> On 3 Jun 2026, at 14:14, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>>>>=20
>>>> On Wed, 3 Jun 2026 13:41:02 -0300
>>>> Daniel Almeida <dwlsalmeida@gmail.com> wrote:
>>>>  =20
>>>>>> +    /// Called when the fence is signaled.
>>>>>> +    ///
>>>>>> +    /// This is called from the fence signaling path, which may =
be in interrupt
>>>>>> +    /// context or with locks held, which is why `self` is only =
borrowed, so that
>>>>>> +    /// it cannot drop. Implementations must not sleep or =
perform
>>>>>> +    /// long-running operations.
>>>>>> +    ///
>>>>>> +    /// An implementation likely wants to inform itself (e.g., =
through a work item)
>>>>>> +    /// within this callback that the associated =
[`FenceCbRegistration`] can now be
>>>>>> +    /// dropped.
>>>>>> +    fn called(&mut self);   =20
>>>>>=20
>>>>> This is a central point. We ideally would want this to consume =
self, because we
>>>>> may want to move things out of the callback.   =20
>>>>=20
>>>> This one comes from me. The rationale being that ::called() is =
called
>>>> from an atomic context, and the resources attached to the callback =
data
>>>> might require acquiring other sleeping locks to be released, and
>>>> sometimes you don't even notice immediately because said resources =
are
>>>> refcounted, and the lock is only acquired when you happen to be the
>>>> last owner. Yes, those can be caught at runtime if the C side is
>>>> properly annotated with might_sleep(), but that's not always the =
case.
>>>>=20
>>>> If we defer the drop of the data only when the FenceCb is
>>>> dropped/recycled, we're at least not constrained by this "runs in
>>>> atomic context" thing.
>>>>  =20
>>>=20
>>> This design does not solve it, because one can quite trivially get =
around this
>>> restriction using Option<T> as I said. If your point is =E2=80=9Cdon=E2=
=80=99t run any drop() here=E2=80=9D,
>>> then &mut self doesn=E2=80=99t do it.
>>=20
>> My bad, I thought you were talking about some Option<T> in
>> FenceCbRegistration<T> (there was one at some point, but it's gone =
now),
>> but you're talking about having an Option<X> inside the T. Yes, =
there's
>> indeed nothing preventing a drop on X in that path, and it's just as
>> bad as passing the fence back as value to the callback in that case.
>=20
> Then maybe we should just pass it by value and require implementation
> of an unsafe trait on `T`, whose safety-requirements demand that this
> must be save to drop from atomic context.
>=20
>>=20
>>>=20
>>>>>=20
>>>>> Consider a fence design where signal() consumes self. Now consider =
this:
>>>>>=20
>>>>> ```
>>>>> impl FenceCb for MyCallback {
>>>>> fn called(&mut self) {
>>>>>   // Can't move the fence out, so we have to put an Option<T> just =
to be able
>>>>>   // to move.
>>>>>   if let Some(f) =3D self.some_fence.take() {
>>>>>     f.signal();
>>>>>   }
>>>>> }
>>>>> ```
>>>>>=20
>>>>> This used to be the case when our version of the job queue used =
the "proxy
>>>>> fence" design:
>>>>>=20
>>>>>=20
>>>>> ```
>>>>> // Callback on the hw fence
>>>>> impl FenceCb for MyCallback {
>>>>> fn called(&mut self) {
>>>>>   if let Some(f) =3D self.submit_fence.take() {
>>>>>     f.signal();
>>>>>   } =20
>>>>=20
>>>> I'm pretty sure lockdep won't like it anyway, because this is =
nested
>>>> locking of the same lock class. For such proxies, we'll need to =
teach
>>>> lockdep about the nesting like has been recently done on
>>>> dma_fence_array & co. But I'm digressing. =20
>>>=20
>>> Yeah, but this is more about resource transfer in general, not
>>> this pattern specifically.
>>>=20
>>> I agree that this has issues, and yes, lockdep complained back
>>> then :)
>>=20
>> The thing is, there's so many aspects that could go wrong because of =
the
>> context this callback is called in. Nested locking is one of them,
>> the fact we can't sleep is another. And with rust it's even worse,
>> because of the implicit drops that will happen when you take =
ownership
>> of resources (taking sleeping locks to remove resources from a =
dataset
>> for instance).
>=20
> Doesn't that have to be a problem for much of Rust infrastructure? How
> do other parties solve that?
>=20
>>=20
>> So, by passing self by value to the ::callback(), you're basically
>> telling users "hey, BTW, don't forget to defer the drop to some
>> workqueue if you think it's not atomic-safe". And how can users know
>> that the thing they're about to drop can be dropped in atomic =
context?
>> They basically have to audit the ::drop() of all the resources they
>> embed in their type implementing FenceCb. Not only that, but they =
also
>> have to design the thing so the deferral of this ::drop() doesn't
>> allocate, because, obviously, allocating in atomic context is
>> tricky/fallible. AFAIK, none of this can be spot at compile-time (I
>> remember Gary/Danilo mentioning that we could teach the klint about
>> some of these rules). This would leave us with runtime checks like
>> might_sleep(), but most of the C putters (xxx_put(object)) don't have
>> might_sleep() in the path where the decref doesn't lead to a refcnt=3D0=

>> situation.
>>=20
>> TLDR; Call this PTSD if you want, but this is the sort of bugs I
>> struggled with on the C side, and I can predict that the exact same
>> will happen in rust drivers if we expose the FenceCb as it is =
designed
>> here and we don't have a way to check the soundness of the FenceCb
>> implementations at compile time.
>=20
> My guess would be that the existence of unsafe-traits is the admission
> of Rust that this just cannot be guaranteed by design.
>=20
> If a driver cannot know whether this or that is safe to drop, then it
> would have to defer it's dropping. Or would there be cases where this
> also doesn't work?


Although I totally understand where Boris is coming from here, and I =
agree with
him, the reality is that the current &mut self design doesn=E2=80=99t =
solve this. An
unsafe trait could work as a pinky-promise by drivers, which is half-way =
there.

What we ideally would like to have is a bound though, something like:

T: !Drop

If I recall correctly there were people working to get support for that =
on
Rust? I think there are two things here: !Trait, which is not supported =
except
for !Sized IIRC, and having an auto trait that represents types that =
implement
Drop, similar to Send and Sync.


>=20
>>=20
>> The other option (the one I've been advocating for from the start), =
is
>> to not let drivers implement FenceCb (make it private), but instead
>> have a bunch of implementations that we know are safe. Here's a list =
of
>> implementations that I think would unblock most of the drivers use
>> cases:
>>=20
>> - wakeup a thread
>> - complete a completion object
>> - schedule a WorkItem
>> - schedule a kthread_worker (once we get a proper rust abstraction =
for
>>   that)
>>=20
>> It doesn't mean we can't have optimized FenceCb implementations that =
do
>> a lot more in the callback() path instead of deferring to a
>> workqueue/thread, but at least those would have to be implemented in
>> dma_fence.rs, and the dma_fence.rs maintainers can then carefully =
audit
>> the code as part of the review process, which we know is not really =
the
>> case when changes touch drivers code only.
>=20
> Pragmatically speaking, if the common cases are trivial, then the
> drivers will get them right, because those critical primitives are
> already atomic-safe.

No, you can still fumble trivial code, specially when it has to be =
cargo-culted
from somewhere else. =20

I am not saying that having things in dma_fence . rs is the solution, =
although
it is definitely one solution. But the argument above isn=E2=80=99t very =
strong
IMHO.

>=20
> And a non-common case will have to be implemented in the driver
> anyways, so we'd have to allow for that.
>=20
>=20
>=20
> P.


