Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D739E23496F
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175358; cv=none; b=Rt9JFICf+WWVBYIHdS/FCsEiu1hraeL1X8TMAiv1/NkEA8qRLz/ks9HY8IgV7wIXyTopRcpErtOybrCjhONN2vNc44nt+JlzUpwJHd+9pbnRqc4LbPBfEmGUxi4ZHQOD3BgrmkNRcjBefalx2i2egL2xozi0O8FEcAYlN+volFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175358; c=relaxed/simple;
	bh=mhj8Z2ha2cKG6o/32m4SY524AF6OiflHFozoqQeW8lc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fIZL8akQ5+O0JoTa6b/KbBTQh4Wys21qYM4LnlNBfXqdNOW+EgGTANxC7cGfT7kfh+YK+ZQxpu9cHPhokY7GOjQvh28xZg1sdkgRa/Hk6YWMy7IemwbfhXtRku3FSj6YEKMjVvitW/umORLVjvDa4nnjxnwyp27w80U1WsYEcVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=aDawgHa6; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="aDawgHa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741175353; x=1741434553;
	bh=wo3McCt822WJDFOtfBkdir2juCuCd/bcXFtTS2mK67c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=aDawgHa6npFcy6uy7jy9rOQ6VmsYQFBGm6lAoW/9QA59kT7efjM2L7d5p4mz83YRH
	 Giy/5dzvuWncskS8U7QtrG7g/u9kwK48VzsBhXEBZUshzIkmMhTwFEkBI6iF10MLUn
	 1xDxcWd71Qap3JMTdE6cvks5iyo097NxbzeKkz/iCCYNVGfOFYgGph6MYAhcHwOJn5
	 UsXDptOSol9n2cZJ9746c5wtlZmNwxDON1R7ZimqfVzO/KSGuOAGXJTNfa4Z5TPTu1
	 6zbcHSX/pz68uTYkYgdDUT2MiYcU43CWT0hU54KEsirZLFdgjDjHOsQq2EWM+qJJsO
	 JNISH/MCt7LAQ==
Date: Wed, 05 Mar 2025 11:49:07 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/22] rust: pin-init: fix documentation links
Message-ID: <D88B5A6UFZRN.21G1VKE4ZXMDA@proton.me>
In-Reply-To: <87y0xjd7y1.fsf@kernel.org>
References: <20250304225245.2033120-1-benno.lossin@proton.me> <ya83goUtzcHjLy0IcSqvzACQD0E8Vn3F-w29yUE8jareggYjn0MS8ppl7uT1una8iXgpyTMDiG48RlSzZLTr-w==@protonmail.internalid> <20250304225245.2033120-12-benno.lossin@proton.me> <87y0xjd7y1.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b2c20968cd7f4c2bbe50f205d3a1d1616d4cada9
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 5, 2025 at 12:37 PM CET, Andreas Hindborg wrote:
> "Benno Lossin" <benno.lossin@proton.me> writes:
>
>> Before switching to compile the `pin-init` crate directly, change
>> any links that would be invalid to links that are valid both before and
>> after the switch.
>>
>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>> ---
>>  rust/kernel/sync/condvar.rs     |  2 +-
>>  rust/pin-init/src/__internal.rs |  4 ++--
>>  rust/pin-init/src/lib.rs        | 19 +++++++++++--------
>>  3 files changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
>> index 7df565038d7d..5aa7fa7c7002 100644
>> --- a/rust/kernel/sync/condvar.rs
>> +++ b/rust/kernel/sync/condvar.rs
>
> [...]
>
>> @@ -204,7 +204,8 @@
>>  //! [structurally pinned fields]:
>>  //!     https://doc.rust-lang.org/std/pin/index.html#pinning-is-structu=
ral-for-field
>>  //! [stack]: crate::stack_pin_init
>> -//! [`Arc<T>`]: crate::sync::Arc
>> +//! [`Arc<T>`]: ../kernel/sync/struct.Arc.html
>> +//! [`Box<T>`]: ../kernel/alloc/struct.KBox.html
>>  //! [`impl PinInit<Foo>`]: PinInit
>>  //! [`impl PinInit<T, E>`]: PinInit
>>  //! [`impl Init<T, E>`]: Init
>
> Won't this diff from the user space implementation?

It's only an intermediate state, it will be changed again in "rust:
pin-init: add `std` and `alloc` support from the user-space version".

---
Cheers,
Benno

