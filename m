Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB1A1F4262
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 21:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405933; cv=none; b=THxVgaCM5Ntpfi6nRgeBnQ+7cW5ZO9hEoNLReG1qew9e6NhHDttmwLtrJGnilDmEWDgtARWAABYdI2Klt0lJR/imOTWaDNYSpc4YULdgJgFeQ192Xyql2S//6klsotNF/eRfFV4OerQyoC+iBYF8PXiso5PSOOWrVFzSAo9q5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405933; c=relaxed/simple;
	bh=z7ossravAl02wsKG1jGXEHvAup5mV/7gmJYOwpAwUj0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAAgSjwJIXDnR73m4BgDXYdEqW5+LEMmoEolyUJjKTYu99uzJCwuv6g+BJpj4/RCVhbnp/+mq5ZCjprwKIUIPOn6xzRoj8NLH9dv9hCtzzADRL19LyiWkOCg8qEdIIDLEhbcysABumFJNeZdrldmdfNATkUIPKMXf9AMMSR6zaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=EdoQzLwt; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="EdoQzLwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744405926; x=1744665126;
	bh=IE2p6mZjml/IXoHIZjvaX+O6luNGGdfOBUl5xiXhoUc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EdoQzLwtYiykqSHi8gYRiUDh1x7R3sUMgkrAaNDmFADCAzH1qkH67Q9Y7o+1VPh2Y
	 cSVnI9UwN/3hMb0F++MEs+lBJ83bvi2EzgX2XM+LCWkoJQ+JMKS//ONF1XTuleM+Sa
	 Eww6Izr/3dzrcVWOeQjoVcUN9LkrrmYGrUa5pCpmbBPgxCDrPZtnmLhUbDc0F9sfMv
	 G/sZ/RjTJqkN5KF7owQaJmEvMYhBmtyY5WqaWEYLB+uuKkuBI46LCvwb5Wl2WBxya6
	 BcH2aF/mQhRNsH4M1wtf09ZXUcLCV1StRYdmKta2tXeQBD9mvtPo+pB8c+my+h7eMW
	 vDdn3I+1yn7ig==
Date: Fri, 11 Apr 2025 21:11:59 +0000
To: Tamir Duberstein <tamird@gmail.com>, Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: check type of `$ptr` in `container_of!`
Message-ID: <D944ADIR8SAC.1CRNV5FJ99TFD@proton.me>
In-Reply-To: <CAJ-ks9ngPKeoR86WX=qcuS8LtMafZuRXQt7+J9YRv+NVoSgr-A@mail.gmail.com>
References: <20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com> <CAH5fLgioEPTrh0vYt5zdmj8POCMyDdV+Bd=j_M3PZ-EdKLZtTQ@mail.gmail.com> <CAJ-ks9ngPKeoR86WX=qcuS8LtMafZuRXQt7+J9YRv+NVoSgr-A@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 31cfac6718c54d9d2dc0286b06b479b403baf261
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Apr 11, 2025 at 5:41 PM CEST, Tamir Duberstein wrote:
> On Fri, Apr 11, 2025 at 10:36=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
>>
>> On Fri, Apr 11, 2025 at 4:31=E2=80=AFPM Tamir Duberstein <tamird@gmail.c=
om> wrote:
>> >
>> > Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*=
`.
>> >
>> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> > Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP=
5wBuGPYh9ZTAiww@mail.gmail.com/
>> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>> > ---
>> >  rust/kernel/lib.rs | 5 ++++-
>> >  1 file changed, 4 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> > index 1df11156302a..da9e36aa7967 100644
>> > --- a/rust/kernel/lib.rs
>> > +++ b/rust/kernel/lib.rs
>> > @@ -200,7 +200,10 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! =
{
>> >  macro_rules! container_of {
>> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
>> >          let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
>> > -        $ptr.byte_sub(offset).cast::<$type>()
>> > +        let container =3D $ptr.byte_sub(offset).cast::<$type>();
>> > +        fn assert_same_type<T>(_: T, _: T) {}
>> > +        assert_same_type($ptr, ::core::mem::addr_of!((*container).$($=
f)*).cast_mut());
>
> I noticed I accidentally sent `::core::mem::addr_of` instead of
> `::core::ptr::addr_of`; will fix once we agree below.
>
>> Perhaps it would be better to wrap the type check in an `if false` to
>> avoid evaluating the expressions at runtime?
>
> It's optimized out at O1: https://godbolt.org/z/44Go5xnWr. Is it worth it=
?

Wrapping in `if false` definitely doesn't hurt, since we get better
debug perf.

---
Cheers,
Benno

