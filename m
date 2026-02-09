Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F0836BCDB
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638846; cv=none; b=Lu81Rc6abv7nVsFcJiPXt3J/Pv28bRGULWnKeSn84WHZC5Nl9I9mks0ZHR0AtAcCFJb8bdsRzxney+waAB8cgfbQUpbJBCvoznWL0pgxLyTsdkMK2TCVjTdTNEDsprZ7ugoX5yN2l9Fobe+thaaB0I++ARcmeeMRFGRqeb7j16o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638846; c=relaxed/simple;
	bh=JeXjuc2EgfmYsHtTB7Ub0A6vQcD+zKshMdd4AuJ3WqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XllPyFMxvOwGD3VTDWx/EtztFY8HZVx++0UcEkB/gn1ZuYq+kh6ZLeecgv3PwRdrWXQTXu+FTwBSG4QRwiNbLsewqyV62l6nKIi2WeD618Tx84hzEDKHoGNQbgSkhNzPkeB/FC8RK+4x8bGJrhU8hUdXvMNikjUWOqpiyJMjMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f11n8RHn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f11n8RHn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEC3C116C6;
	Mon,  9 Feb 2026 12:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770638845;
	bh=JeXjuc2EgfmYsHtTB7Ub0A6vQcD+zKshMdd4AuJ3WqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f11n8RHnwEZpcoL8NaWPdtMJ7PyA2pc1op4/1ln6OrpfPzQBzvgBfkTwTNKWPRrF5
	 ecawlYh3I58cQDLta28K9+oAGTOTiUKc3YXDrJrusiOAVMHyngdDd0dg5DJxrP3E0k
	 zxLEgFoeTOuq95xZ9at1bsD9SI9cRnWTBd8iWcpSopjIcq+Bx3D65zUUSRu2eUL6qw
	 I2Q8UkzuylJlLHu3VZXypO9/ZeZVe6fJqQ9IUBPt6rXgciDEkOB1cCHqo6KwuCtmVn
	 LvIcVGr6YMBiCXGNomtPnbN5cx9OLeaL1RpsxmDtERdiZ/3tU90Y/QO4GlR7RcJSSu
	 rq6CVIfWh2pyw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: std_vendor: add `{likely,unlikely,cold_path}()`
In-Reply-To: <DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net>
References: <20260208224659.18406-1-ojeda@kernel.org>
 <20260208224659.18406-3-ojeda@kernel.org>
 <loMX2c-d-q0qiOw4sfLMKLAt-D5giBVKFD-iqhC7j9DJxvEGyhJkgtUfpEipAmkoLRU37FUhKkB6Mz0xz-MGqQ==@protonmail.internalid>
 <DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net>
Date: Mon, 09 Feb 2026 13:07:09 +0100
Message-ID: <87o6lyunma.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Sun Feb 8, 2026 at 10:46 PM GMT, Miguel Ojeda wrote:
>> `cold_path` is becoming stable [1] in the upcoming Rust 1.95.0 (expected
>> 2026-04-16).
>>
>> `cold_path()` can be used directly, but it also allows us to provide
>> `likely()` and `unlikely()`, based on `cold_path()`, similar to the C
>> side ones.
>>
>> For instance, given:
>>
>>     fn f1(a: i32) -> i32 {
>>         if a < 0 {
>>             return 123;
>>         }
>>
>>         42
>>     }
>>
>>     fn f2(a: i32) -> i32 {
>>         if likely(a < 0) {
>>             return 124;
>>         }
>>
>>         42
>>     }
>>
>>     fn f3(a: i32) -> i32 {
>>         if unlikely(a < 0) {
>>             return 125;
>>         }
>>
>>         42
>>     }
>>
>> LLVM emits the same code it would for similar C functions:
>>
>>     f1:
>>             test   %edi,%edi
>>             mov    $0x7b,%ecx
>>             mov    $0x2a,%eax
>>             cmovs  %ecx,%eax
>>             ret
>>
>>     f2:
>>             mov    $0x7c,%eax
>>             test   %edi,%edi
>>         /-- jns    <f2+0xa>
>>         |   ret
>>         \-> mov    $0x2a,%eax
>>             ret
>>
>>     f3:
>>             test   %edi,%edi
>>         /-- js     <f3+0xa>
>>         |   mov    $0x2a,%eax
>>         |   ret
>>         \-> mov    $0x7d,%eax
>>             ret
>>
>> The feature itself, `feature(cold_path)`, was added in Rust 1.86.0
>> [2]. For context, Rust 1.85.0 is likely going to be our next minimum
>> supported version.
>>
>> Previously, a PR in Rust 1.84.0 [3] fixed a number of issues with the
>> `likely()` and `unlikely()` intrinsics (by implementing them on top of
>> the new `cold_path()` intrinsic).
>>
>> Thus add support for `cold_path()` by applying several approaches:
>>
>>   - For Rust >= 1.86.0, `use` directly `core`'s `cold_path()`.
>>
>>   - For Rust >= 1.84.0, we could choose to provide a no-op, but given Rust
>>     1.85.0 will likely be our next minimum, do some effort to support the
>>     feature by vendoring `core`'s implementation based on the intrinsic.
>
> Instead of using the intrinsics, we could use this instead:
>
> #[inline(always)]
> #[cold]
> pub const fn cold_path() {}
>
> This works all the way back to very old Rust versions, and the codegen seems
> identical, too.

Allowing `feature(core_intrinsics)` is allowing a lot more than just
`cold_path`, like `volatile_copy_memory`. I don't think it's a good idea
to allow all these in.


Best regards,
Andreas Hindborg



