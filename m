Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B6322523
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851784; cv=none; b=Cr3OXTVbehaO5Je08vN9Py+4kCSWWx83uxtMK2wQLvpcv6w5IRN4Kq8RBbtNG8D3afyNZd+6t+mzMFqaQ9R5Bx8i+yCznVzvPZbkjjimwAUfQmX2QwkaeqaXg2P4Sdvx78Yfmk+flhFY3Td+Y22Nld58vH+fqwoEclsVaF7Fel4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851784; c=relaxed/simple;
	bh=s7YYKCGrzDJmMcEnE5uhOoPHRBjXuRBU60RPdyPRN2o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HD08vDm9yJFxYIT5pT02Fa9ag06QeGX2vqTXFw+Gt2KBcFqAudLTz9EQu/rZyc7pMPYGEzch+zozI1jHHzRUMqwkTHBhTu/lTNI+SBFQZ54Wx50MnVlL+mZRHTBt26X6ChOdCdKoCIABiRJ3dpTdMtx4CZeEefDsT9MGkG1JsWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBwNOe9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBwNOe9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF6FC4CEFB;
	Tue, 11 Nov 2025 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762851783;
	bh=s7YYKCGrzDJmMcEnE5uhOoPHRBjXuRBU60RPdyPRN2o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rBwNOe9mCMsJjWXVVSLv/7sW2m48IPkuB228/q4tzo2ibE1MQL8PCAL4tJ6gOzSYR
	 YLpdJFUhNXFK5sBJBSGBpHMqVBhm/4podEhdoouzmFVRicrasKcV2ND0ZEq7/p0ZPC
	 yPn6KgdAromoNUe9wthVUwuJOeKQbj96m/nl0IRSsqS2A23tLvpZ9O7kLg1nw+volo
	 0lNanPprDx2gfeM7e/dl7kz/dM5pmGAqJ4QXzVpVO5+PKUqvwyVOtXJArm3HDIn5YC
	 nAHXYa3kVfsTrqXH5fqWJvihKYbXHBkMEAptaZsXz1qwtY8Mlrs6rVtFfgM9OsGwJk
	 0QPRBtcuZEYiA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
In-Reply-To: <aRIN4U8L4-wQjyHj@tardis.local>
References: <nsSZZk6z9Ia7Gl5JS9LVNDRjc-9eFvtSWyLI4SSjsHNouDkDV-GmXnixMYlIpGHryPfhLr8Z2W_CkWd6D2frYQ==@protonmail.internalid>
 <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <87pl9w6vs5.fsf@t14s.mail-host-address-is-not-set>
 <20251106.081231.149919562701074305.fujita.tomonori@gmail.com>
 <aQyxW_cskrK0Zyxr@tardis.local>
 <87ms4u6q1f.fsf@t14s.mail-host-address-is-not-set>
 <aRIN4U8L4-wQjyHj@tardis.local>
Date: Tue, 11 Nov 2025 10:02:46 +0100
Message-ID: <87jyzx6ix5.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Boqun Feng <boqun.feng@gmail.com> writes:

> On Mon, Nov 10, 2025 at 01:16:44PM +0100, Andreas Hindborg wrote:
>> Boqun Feng <boqun.feng@gmail.com> writes:
>> 
>> > On Thu, Nov 06, 2025 at 08:12:31AM +0900, FUJITA Tomonori wrote:
>> >> On Wed, 05 Nov 2025 21:59:06 +0100
>> >> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> >> 
>> >> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>> >> > 
>> >> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
>> >> >> pr_*_once macros.
>> >> >>
>> >> >> A proposal for this feature was made in the past [1], but it didn't
>> >> >> reach consensus on the implementation and wasn't merged. After reading
>> >> >> the previous discussions, I implemented it using a different approach.
>> >> >>
>> >> >> In the previous proposal, a structure equivalent to std::sync::Once
>> >> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
>> >> >> to provide Once-like semantics by using two atomic values. As pointed
>> >> >> out in the previous review comments, I think this approach tries to
>> >> >> provide more functionality than needed, making it unnecessarily
>> >> >> complex. Also, because data structures in the .data..once section can
>> >> >> be cleared at any time (via debugfs clear_warn_once), an
>> >> >> implementation using two atomics wouldn't work correctly.
>> >> >>
>> >> >> Therefore, I decided to drop the idea of emulating Once and took a
>> >> >> minimal approach to implement DO_ONCE_LITE with only one atomic
>> >> >> variable. While it would be possible to implement the feature entirely
>> >> >> as a Rust macro, the functionality that can be implemented as regular
>> >> >> functions has been extracted and implemented as the OnceLite struct
>> >> >> for better code readability.
>> >> >>
>> >> >> Of course, unlike the previous proposal, this uses LKMM atomics.
>> >> > 
>> >> > Please consider if it makes sense to base this on `SetOnce`. It is in
>> >> > linux-next now, but was on list here [1].
>> >> 
>> >> Data placed in the .data..once section can be zero-cleared when a user
>> >> writes to debugfs clear_warn_once. In that case, would such data still
>> >> be considered a valid SetOnce value?
>> >> 
>> >
>> > It's still a valid value I believe. In term of data races, Rust and C
>> > have no difference, so if writing to debugfs could cause issues in Rust,
>> > it would cause issues in C as well.
>> 
>> @Tomo you are right, `SetOnce` would not work with someone (debugfs)
>> asynchronously modifying the state atomic variable. It requires
>> exclusive access while writing the contained value.
>> 
>
> I mean if we were to use `SetOnce` in pr_*_once(), we should just use
> `SetOnce<()>`, and the problem you mentioned doesn't exist in this case.

At the very least it would break the type invariants and assumptions of
the `SetOnce` type. There a race condition between `SetOnce::as_ref` and
`SetOnce::populate`. I don't think we are allowed to race like this,
even if the type is `()`?

At any rate if we do this, we should update the safety invariant of
`SetOnce` to state that it is valid to revert the type back to the
initial state for zero sized types that do not have a `Drop`
implementation.


Best regards,
Andreas Hindborg



