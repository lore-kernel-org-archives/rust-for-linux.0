Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FC8176AB6
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721982413; cv=none; b=TQHY5WQ1DJvimpb26mBNP0JZHuWurIw/cUzGCb7s8IlybjQHEZ3VEdVavEr4RaF2+5jHVFn3c43xPowA7msDgkfx/Gc3MTt8kwTRcUNCwfl9zgMPs1kIFSef6fSxoHZi172cbWUX7bodkuQS3KZTZF5/SLVmpA2AWMZF7v83Gxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721982413; c=relaxed/simple;
	bh=Dv7gDOSb7XzlFakGXU4WjlbsVKQqmtnUDmiYXpU+q1U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mM18Hc/bh4HeUFzXonRpLbGXLgk82RWD5hol+dvLK7MnrZI1pJyqiG6koZmcVvXJGgCqwAKv2A+t9BUmKMx53DhDcEPwNApKFt61ShIfHCiWSQZX5+vkkUlHqWlB3gfrYMX1+HZCfmbjB568izrvPhtZH3JVKHI6zkYPBeZ8WaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=dBIKDXc/; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="dBIKDXc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721982410; x=1722241610;
	bh=T76SZ6qLi+QJY5P2rlncRmCRboug4BcadueEcGPkj5g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dBIKDXc/MCuJkhRc6r5uTDMvPMi5owDGNkQv/rzWJI0BJ+xtRrz5OOvcgvsWL/r4d
	 ZUWLRlNzYedr9il1gOXChWqXbBC1zn6pSo+pobWX9iw9kfPjSE78uFAOU7CFTWpMtA
	 8G9XmFOphT3OmcuYnSi8Z5tfHjJ8FhOb0Ff2NV1DCzwSAZQHCtmjkTig1b6hl9BCFV
	 lk5Yy9rdQjJiSgqmH1D4kt/zxgAPPxi937fPFoQBMPflGsqA7ogiLgOwWVme9M9t4m
	 RQ82dGfDyzBzdB5/Opr3z19bqbYRjgXoDq1USlJaaHu3osj0NwMfsj0x8VhMKGT7mQ
	 j74DcSMgy63lA==
Date: Fri, 26 Jul 2024 08:26:46 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: mm: add abstractions for mm_struct and vm_area_struct
Message-ID: <324d3628-a537-431f-8dd4-f33184600537@proton.me>
In-Reply-To: <CAH5fLggDDXmD8Nj-r0_bbEfquuKfOeH7bJkcA4GA=kKk8=gi7w@mail.gmail.com>
References: <20240723-vma-v1-1-32ad5a0118ee@google.com> <3bf6bfdc-84af-442a-acec-a58f023d1164@proton.me> <CAH5fLggDDXmD8Nj-r0_bbEfquuKfOeH7bJkcA4GA=kKk8=gi7w@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 15db2875872a64e93eb9af0276362e416da08e74
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.07.24 10:14, Alice Ryhl wrote:
> On Fri, Jul 26, 2024 at 10:11=E2=80=AFAM Benno Lossin <benno.lossin@proto=
n.me> wrote:
>>
>> On 23.07.24 16:32, Alice Ryhl wrote:
>>> +pub struct MmGet {
>>> +    mm: NonNull<bindings::mm_struct>,
>>> +}
>>> +
>>> +impl MmGet {
>>> +    /// Lock the mmap read lock.
>>> +    #[inline]
>>> +    pub fn mmap_write_lock(&self) -> MmapWriteLock<'_> {
>>> +        // SAFETY: The pointer is valid since we hold a refcount.
>>> +        unsafe { bindings::mmap_write_lock(self.mm.as_ptr()) };
>>> +
>>> +        // INVARIANT: We just acquired the write lock, so we can trans=
fer to this guard.
>>> +        //
>>> +        // The signature of this function ensures that the `MmapWriteL=
ock` will not outlive this
>>> +        // `mmget` refcount.
>>> +        MmapWriteLock {
>>> +            mm: self.mm,
>>> +            _lifetime: PhantomData,
>>> +        }
>>> +    }
>>> +
>>> +    /// When dropping this refcount, use `mmput_async` instead of `mmp=
ut`.
>>
>> I don't get this comment.
>=20
> The C side provides two ways to decrement the mmget refcount. One is
> mmput and the other is mmput_async. The difference is that when the
> refcount hits zero, mmput_async cleans up the mm_struct on the
> workqueue, whereas mmput cleans it up immediately. This means that
> mmput_async is safe in atomic context, but mmput is not.

I see, IMO this would be a better comment:

/// Converts to this `MmGet` to `MmGetAsync`.
///
/// `MmGetAsync` uses `mmput_async` instead of `mmput` for decrementing
/// the refcount.

Since from a Rust perspective, this is just a conversion function. Maybe
the name should also reflect that ie `to_mm_get_async` or similar.

---
Cheers,
Benno

