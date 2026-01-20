Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61E9310784
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923610; cv=pass; b=BmifBI/YytCJiwJtTTsI1ZfEStlZHbA80zEebtwrig9gSBdyECsGkDNOn1cki7pQs1hfG1+fAvzy4+xEHm7wGrLM6SPBthRv9ypktAY+07G/1qlURFwTswcFVhTPoSTbGiT7uRhzSMxZr27Ayb+kTNYTSFnJa5PuGxQXw7rYPJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923610; c=relaxed/simple;
	bh=TQGY/mnOv8xh5X3OZ4UfqmIz8FieKXUG5flmghJ6Alw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esA5m7uDRn/eYq0AaKXPNBO5hKymOZNFBOHP4IhksOMxJZlSgM20wEeqQvXQ1z2E8rLdnfiszyd8/o6NgVobhpWfJqbgD+xq2Rv9BZjqhaQAUTkV4Si4zIkvUDnsJ2+XdUs4ovzCsGf9dkOQJW0gpRGbmfmMZhfWori1jVrVuIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVwb1WbT; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVwb1WbT"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37fd6e91990so54912771fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 07:40:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768923606; cv=none;
        d=google.com; s=arc-20240605;
        b=brQ1T0BMsYyP0bL3AFiqXAbdSNwcyK9No77TcH0MS66oNe9+AW6MrNcXW4bF6dBzmV
         UZVPxNYSrFom+pHAVKHrkgXZnt5v2z2Jp0VPILM7ryF0eSNm0YWvQ3fxPreXesTIDv92
         x93b9nONHncD0RxFVmv/r2Z9EGwuF7SYIgTQG3jqOzmqimsj2V1pba3s62x3iOQYALNN
         lYLTjmM5uP3AlINfVFPBA7DYy8UH6x9jABvpwHjJ/eOoOS6tSECeiv5QL6H6H0dmF5f+
         /0sst7MOt4WtkinKpAFV3NW6hTkvGfdzQTsXbpd2i4w3JZEy5U/2rcdce63GJVSwiN9b
         xi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQ3DU/8TKNzt4I6ZjPuV9IAGlZRrIJo7C2QK9LSQsp4=;
        fh=PeEswyam1Pm1bXt1vIx5y+qsN7p2rzzProi0/UV51aw=;
        b=BEe/lGCbtaUyqzeMrbi1jIkkvfGoF95uF9pLT0eLaWKkwyVUPHPboSsPl4x8xNp21Q
         39UGl9G0YdfolIVXqwjuexr5ThO9MQ/Ld4mxvS6jK4UxVRLFrXYk0loOWl55pU36X/9X
         /tlTRaVM3SW2RcAo8KZgYO1Cf4vIbVMqvXw1Rb2IBa70rv8PSWZ9PuAcpzfw9zgDoSc5
         x14XU4/G45OvmVYZDr2KBlDVfptHEWi+hX/94dcSrq1ildC6iJmLlz7FYb2RNCjOvBGA
         NiZ5d/FEleAf0sChfXwiy+ELBIW7gMkfFoH4pWPgn0ilY67jpQJuOJUMM8X7+moVBU/5
         d8gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768923606; x=1769528406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQ3DU/8TKNzt4I6ZjPuV9IAGlZRrIJo7C2QK9LSQsp4=;
        b=kVwb1WbTeCV/+k42AC96AsACh1cE6HZdztzN46rBlgM3lzTxxQjuqD0ZAoRjZLmHNm
         LwfQIot3hNlqTCpjLwyeD9Wy1jKkcPoRZF5EVx1Yz8FNC/056i4ug8BaXyP6Ka1u7J5b
         +RNolXEiTYwuf/SugGx7c0WIBcKYk+QJ/teuse0sAFGjpfM+U/PcpUd/7ppdissmXtzq
         XO4dqnJnBdJr660cMWHVJE6TKdQEUlSqqHmtDHmucejY0o4ILtvvU6ycqTqNeG58mCh4
         uAkjl8u9Rf7lcczbvSPAnkNG+9oxSZ00wTpw71wQFDBDj8YuTuaF2YokP+0TbA0rlM6k
         7BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768923606; x=1769528406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQ3DU/8TKNzt4I6ZjPuV9IAGlZRrIJo7C2QK9LSQsp4=;
        b=WzRpePD0xO5pa1gbMXhH5/sJgJYJhw0Mt7uprD4KkM8bTFPH6mwUth1R2YpOzFuIjK
         TfqKNcIiiq5VIHuISLkowdJmS6bXu4Zekbvg3BVfjVa56RMob++TSYzWeUNN2EjRXEn/
         VeLK9+UNE7kZBK/nIL1d0HMfTuYgtJ1Ev9uVx4fNHW3jtLwsyb7/Z5oE6WgpPTOSpP3s
         k1tY3meU0G7QwCUE8MxxrOZnHPZldnlfJ4cY9kNmUmK6ED4Cwx/r2qE3wiPLZ90uyGzu
         Q1/t2G3sBEwUwzfUU/pUgvjR/mOLFucywTE/8yHl6341fcrzL5jxTo9CxLLIXIb3CaOs
         QHJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP4apXXe7Qd1u4lli8cGB6sjy0x42Yh9dPLAE0d3mptWU05Zg0QDTCqQz2LdVEJ0Wcb3aPMlQUVaS3DWzCMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJApZIjZD4jVuEjTXKtcWxMc97uKta5oGbmOROKZ5F7eerWLkU
	q27h8aV/jgPdWAWJqGlblpRSQQQLmBMY+6JIHWyWSe1tS+InZdk17u78rpd/56/x/BRjYS+QGZX
	sTme2hK8qqYgwWx225KcCYBKIqhUXXH4=
X-Gm-Gg: AZuq6aK3heE78eMxFy68RzeesxMNmyvnFALNZU+ZvC5Vu0wTy31hROpoxQKw62jHFnB
	MgEaBEwCMi2ak9KYk5Acr80utvu3xMz/YAuYZl5XGgQUR7FSoqFHYo+a4quSjsS0bH76AoRr4Di
	wzxYI2pjrlcN/o99IIx6VlKTmHHrFOoSv5WS223Trve4D/2FUKbi61eVh1ndUf3B3korx0FBJl/
	/7EQQJPSfhJdfGw0zvtZlSVXe1/o1nKOf0PS/DVCzmukwfM1FdTnig7r323tIs7BxTF+Dbja7qY
	VMGVxQKsV/o11NMuigbpJPPd3cGXtHwSkcKGPVGXw7ZilwtQEp9Xzr+a0akuZfzrBYysyDgrTfI
	WEDLc4w==
X-Received: by 2002:a05:651c:1986:b0:383:5c1b:4973 with SMTP id
 38308e7fff4ca-383866b0f16mr45420221fa.2.1768923605440; Tue, 20 Jan 2026
 07:40:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119033006.1453006-1-sunke@kylinos.cn> <20260119033006.1453006-4-sunke@kylinos.cn>
 <CAJ-ks9m9HV72MSchSS16FUzKLu9c6Ka2N4zZbg29VjNf8RCLOw@mail.gmail.com> <867a8e83-421f-404f-b0b2-7995006919d3@gmail.com>
In-Reply-To: <867a8e83-421f-404f-b0b2-7995006919d3@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 20 Jan 2026 10:39:29 -0500
X-Gm-Features: AZwV_QjhoNlAfKTzSaYoA-MNlBkRyuyW3lumFZO3l5L6ZuqGSvu6w-NlyHeRYUc
Message-ID: <CAJ-ks9mmuSu5x5bUmkFidwhNFr2dTFzA0GvqfR=RDxaPFRLF4Q@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] rust: fmt: make raw pointers default to HashedPtr
To: Ke Sun <sk.alvin.x@gmail.com>
Cc: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 2:30=E2=80=AFAM Ke Sun <sk.alvin.x@gmail.com> wrote=
:
>
>
> On 1/19/26 21:17, Tamir Duberstein wrote:
> > On Sun, Jan 18, 2026 at 10:30=E2=80=AFPM Ke Sun <sunke@kylinos.cn> wrot=
e:
> >> Implement Pointer trait for raw pointer adapters, making raw pointers
> >> default to HashedPtr when formatted. This provides safe pointer
> >> formatting by default and prevents information leakage about kernel
> >> memory layout.
> >>
> >> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> >> ---
> >>   rust/kernel/fmt.rs | 41 +++++++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 41 insertions(+)
> >>
> >> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> >> index b3501a11c7a3c..6052d9f8628bb 100644
> >> --- a/rust/kernel/fmt.rs
> >> +++ b/rust/kernel/fmt.rs
> >> @@ -192,3 +192,44 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> >>   impl_pointer_forward!(
> >>       {<T>} HashedPtr<T>,
> >>   );
> >> +
> >> +// Special handling for Pointer: default to HashedPtr for raw pointer=
s.
> >> +// This overrides the default Pointer implementation for raw pointers=
 to
> >> +// use hashing, which is the safe default behavior for kernel pointer=
s.
> >> +impl<T> Pointer for Adapter<*const T> {
> >> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> >> +        let Self(ptr) =3D self;
> >> +        Pointer::fmt(&HashedPtr(*ptr), f)
> >> +    }
> >> +}
> >> +
> >> +impl<T> Pointer for Adapter<*mut T> {
> >> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> >> +        let Self(ptr) =3D self;
> >> +        Pointer::fmt(&HashedPtr(*ptr), f)
> >> +    }
> >> +}
> >> +
> >> +// Handle references to raw pointers (needed when pointers are passed=
 by
> >> +// reference in macros).
> >> +impl<T> Pointer for Adapter<&*const T> {
> >> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> >> +        let Self(ptr) =3D self;
> >> +        Pointer::fmt(&HashedPtr(**ptr), f)
> >> +    }
> >> +}
> >> +
> >> +impl<T> Pointer for Adapter<&*mut T> {
> >> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> >> +        let Self(ptr) =3D self;
> >> +        Pointer::fmt(&HashedPtr(**ptr), f)
> >> +    }
> >> +}
> > The equivalent code for Display handles references with a blanket
> > impl. Is there a reason that doesn't work here?
> >
> >> +
> >> +// Bridge implementations for raw pointer adapters.
> >> +impl_pointer_forward!(
> >> +    {<T>} Adapter<*const T>,
> >> +    {<T>} Adapter<*mut T>,
> >> +    {<T>} Adapter<&*const T>,
> >> +    {<T>} Adapter<&*mut T>,
> >> +);
> > Can you help me understand why this isn't a blanket impl like we have
> > for Display?
> Hi Tamir,
>
> The previous implementation was indeed a bit messy.
>
> I've reorganized it. Please review:
>
> 1. First, add the Pointer trait:
>
> pub trait Pointer {
>      /// Same as [`core::fmt::Pointer::fmt`].
>      fn fmt(&self, f: &mut Formatter<'_>) -> Result;
> }
>
> impl<T: ?Sized + Pointer> Pointer for &T {
>      fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>          Pointer::fmt(*self, f)
>      }
> }
>
> impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
>      fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>          let Self(t) =3D self;
>          Pointer::fmt(t, f)
>      }
> }
>
> macro_rules! impl_pointer_forward {
>      ($($ptr_ty:ty),* $(,)?) =3D> {
>          $(
>              impl<T> Pointer for $ptr_ty {
>                  fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>                      core::fmt::Pointer::fmt(self, f)
>                  }
>              }
>          )*
>      };
> }
>
> impl_pointer_forward!(*const T, *mut T);
>
> 2. Then add HashedPtr and RawPtr types.
>
> <snip>
>
> 3. Finally, modify the impl_pointer_forward macro to make
>       pointers default to HashedPtr:
>
> macro_rules! impl_pointer_forward {
>      ($($ptr_ty:ty),* $(,)?) =3D> {
>          $(
>              impl<T> Pointer for $ptr_ty {
>                  fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>                      Pointer::fmt(&HashedPtr(*self), f)
>                  }
>              }
>          )*
>      };
> }
>
> Does this approach look better?

The name impl_pointer_forward does not seem appropriate for the final
implementation, and the two-step process also seems unnecessary.
Consider just doing everything in one patch (RawPtr can be a second
patch, if you really want). Other than that it looks OK.

Some basic tests would be good.

>
> Thanks,
> Ke Sun
> >
> >> --
> >> 2.43.0
> >>
