Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675BF2EAE5
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 16:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736353088; cv=none; b=WNG7G9rUUAuPNCn1jnMOqZB4agiLLLf0cHtx7zpfIKe8I5DgVi0B9w7iJPZ2HpAvcc/lIItGBSlG7rV24O7sF8KVp8mw7FgrBpiQKdbZ2+41ozsLaoKooff49YwAqOeltKMw+r2ijF3qqWWHntgLJOMq4+bG+MgRRLEkU8Kfkzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736353088; c=relaxed/simple;
	bh=yOBTlREGRBXDTsdlin8J4+t1EBnrYEjknmCFwqhiMZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pA19dMJwMEAB1Z7F8/BJz0bkAg4SkbQVGoW7TFEMmh+6TwbdhqUwOETQc1fO9uDW48tcGGa3OrC6Nh+sau7R7CrIWT/95WON49WQzJNXhO8FX+Bgm+IJvve11xF8yQxAtmAhV4OT+G/KBY7vyGE1NUkvNzL8PowEpTlSPRbcE2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Ga1KgKed; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Ga1KgKed"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id A127A240028
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 17:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736353084; bh=yOBTlREGRBXDTsdlin8J4+t1EBnrYEjknmCFwqhiMZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Ga1KgKedY8HcP2agEg1eZ9ve25yMVhRLpBTlr/tDunnLBKaYlrct502FQ71NrRWCB
	 HrLBoJlxuRyrZ2LK1rA8z5kzS4ssjrVoyLTuRqaXhXzKkxuN14U9fZSTFCFbWFpSN6
	 N3izrUNjbQ8rT+HRcaZXnLvGJ9I9i+ohbSZq4+MESvdE3CkKhtMURJrpXdIOpw4hlt
	 18iB+r3/NXbUs7S0sTyxewZSpajHq7WbygK2aLo0ypEIY9xgABgQpgw5bJ+TWvEQEi
	 p+1hIB+GqmCvdzjFPa1xyTapPPSv1kAfeQzSHu45BYOhji6kVvqFDPVz51vBVl9RaE
	 fpggCx4h6XMlQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YStPP4121z9rxR;
	Wed,  8 Jan 2025 17:18:01 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Mitchell Levy <levymitchell0@gmail.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,  Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Andrew Morton
 <akpm@linux-foundation.org>,  Dennis Zhou <dennis@kernel.org>,  Tejun Heo
 <tj@kernel.org>,  linux-kernel@vger.kernel.org,
  rust-for-linux@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH RFC 3/3] rust: percpu: add a rust per-CPU variable test
In-Reply-To: <677dbbb1.050a0220.39ba68.8825@mx.google.com> (Mitchell Levy's
	message of "Tue, 7 Jan 2025 15:41:28 -0800")
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
	<20241219-rust-percpu-v1-3-209117e822b1@gmail.com>
	<5374de79-0ee6-e817-0f87-c800a6fbb733@gentwo.org>
	<m28qrpbeiw.fsf@posteo.net> <677dbbb1.050a0220.39ba68.8825@mx.google.com>
Date: Wed, 08 Jan 2025 16:18:00 +0000
Message-ID: <m2septp9dz.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mitchell Levy <levymitchell0@gmail.com> writes:

> On Sun, Jan 05, 2025 at 01:01:43PM +0000, Charalampos Mitrodimas wrote:
>> "Christoph Lameter (Ampere)" <cl@gentwo.org> writes:
>>
>> > On Thu, 19 Dec 2024, Mitchell Levy wrote:
>> >
>> >> +        let mut native: i64 =3D 0;
>> >> +        let mut pcpu: PerCpuRef<i64> =3D unsafe { unsafe_get_per_cpu=
_ref!(PERCPU, CpuGuard::new()) };
>> >
>> > A bit complex.
>>
>> I agree with this, maybe a helper function would suffise? Something in
>> terms of,
>>   unsafe fn get_per_cpu<T>(var: &PerCpuVariable<T>) -> PerCpuRef<T> {
>> 	  unsafe_get_per_cpu_ref!(var, CpuGuard::new())
>>   }
>
> I'm certainly open to adding such a helper. Is the main concern here the
> unwieldy name? Generally, I prefer to keep modifications to global state
> (disabling preemption via CpuGuard::new()) as explicit as possible, but
> if there's consensus to the contrary, I'm happy to roll it into the
> macro/a helper function.

Yes, in my opinion, the macro name is indeed complex. You're right about
keeping modifications as explicit as possible. A helper wouldn=E2=80=99t be
necessary if the macro name were simpler.

Is adding "unsafe_" to a macro that is unsafe a standard practice? Maybe
we can remove it from the macro name. Documentation is enough IMO.

>
>> >
>> >> +        native +=3D -1;
>> >> +        *pcpu +=3D -1;
>> >> +        assert!(native =3D=3D *pcpu && native =3D=3D -1);
>> >> +
>> >> +        native +=3D 1;
>> >> +        *pcpu +=3D 1;
>> >> +        assert!(native =3D=3D *pcpu && native =3D=3D 0);
>> >> +
>> >
>> > That's pretty straightforward..... But is there no symbolic access to =
the
>> > per cpu namespace? How would you access the kernel per cpu variables
>> > defined in C?
>> >
>> > How do you go about using per cpu atomics like
>> >
>> > this_cpu_inc(nr_dentry_unused);
