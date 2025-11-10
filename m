Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF76F19DF4F
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777015; cv=none; b=WKx/EQ8HhOpKbcLHsAENofvwmSBI3s1QUujqbtWvmwjvVVS0QTZRCGBGeI3oBmsjosGg3GeZuIke/g/qSip+SqdZA/yIa9C08scYPh3q+lwYdpvyx/dJuyIKz2b7aqJCo5WmAD3Enrecv5slIIky54vv3xYyDs0PX63fFa+xucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777015; c=relaxed/simple;
	bh=1u/zmczNQy0Vh9khFfKWBkWJhyU/W2V8MjR4f0/cpHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RzDG/OKe+gxsKDwAzOVZPL0Ms9iQHBYD6z1KOcZGvIDuYj83Ab/sWZ1B/d+Vt8mCtxufw+BMrr3I0vkNVVbwHjjyhhxtBFMBlAPZuKRX5KO2mj3obaBddh7SAVNaosuNJoiRQTG4/xvU3H8lTbUYGKysebfHMrPFk/62cNkHcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlHAoEwb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlHAoEwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62A1C4CEF5;
	Mon, 10 Nov 2025 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762777015;
	bh=1u/zmczNQy0Vh9khFfKWBkWJhyU/W2V8MjR4f0/cpHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UlHAoEwb3XuKAZ1k9bnWNMewSPUm6EiRDXC2yzaXIIQbWkW/TdDd7ezri9zxJ09OF
	 Zzl5GtpQ7k76/jiwFvgFChQl/5fN+qJArKIa0O4/4rQ8GDcPnFHTGqAOmFVibSk+jx
	 6PmZXq/B5aVtIf/SgkoH9A+0jbN9UF3II7ynAST8zHppsnKoE4lmOhYeN7Mp1ScVtv
	 0RJNRR+gB0EvA57T46jZ5lq22dbws08OjcXn3P92fnnskPHLZLkX1yxnvhq7UqJdt3
	 ISRci4iqMqmuUDQDqGOcyVtVIrPNhHG1vzvSegELbpIDoAqamkIMmT9P85qBLoaS+k
	 rriGaMkTD4H5g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
In-Reply-To: <aQyxW_cskrK0Zyxr@tardis.local>
References: <nsSZZk6z9Ia7Gl5JS9LVNDRjc-9eFvtSWyLI4SSjsHNouDkDV-GmXnixMYlIpGHryPfhLr8Z2W_CkWd6D2frYQ==@protonmail.internalid>
 <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <87pl9w6vs5.fsf@t14s.mail-host-address-is-not-set>
 <20251106.081231.149919562701074305.fujita.tomonori@gmail.com>
 <aQyxW_cskrK0Zyxr@tardis.local>
Date: Mon, 10 Nov 2025 13:16:44 +0100
Message-ID: <87ms4u6q1f.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Boqun Feng <boqun.feng@gmail.com> writes:

> On Thu, Nov 06, 2025 at 08:12:31AM +0900, FUJITA Tomonori wrote:
>> On Wed, 05 Nov 2025 21:59:06 +0100
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> 
>> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>> > 
>> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
>> >> pr_*_once macros.
>> >>
>> >> A proposal for this feature was made in the past [1], but it didn't
>> >> reach consensus on the implementation and wasn't merged. After reading
>> >> the previous discussions, I implemented it using a different approach.
>> >>
>> >> In the previous proposal, a structure equivalent to std::sync::Once
>> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
>> >> to provide Once-like semantics by using two atomic values. As pointed
>> >> out in the previous review comments, I think this approach tries to
>> >> provide more functionality than needed, making it unnecessarily
>> >> complex. Also, because data structures in the .data..once section can
>> >> be cleared at any time (via debugfs clear_warn_once), an
>> >> implementation using two atomics wouldn't work correctly.
>> >>
>> >> Therefore, I decided to drop the idea of emulating Once and took a
>> >> minimal approach to implement DO_ONCE_LITE with only one atomic
>> >> variable. While it would be possible to implement the feature entirely
>> >> as a Rust macro, the functionality that can be implemented as regular
>> >> functions has been extracted and implemented as the OnceLite struct
>> >> for better code readability.
>> >>
>> >> Of course, unlike the previous proposal, this uses LKMM atomics.
>> > 
>> > Please consider if it makes sense to base this on `SetOnce`. It is in
>> > linux-next now, but was on list here [1].
>> 
>> Data placed in the .data..once section can be zero-cleared when a user
>> writes to debugfs clear_warn_once. In that case, would such data still
>> be considered a valid SetOnce value?
>> 
>
> It's still a valid value I believe. In term of data races, Rust and C
> have no difference, so if writing to debugfs could cause issues in Rust,
> it would cause issues in C as well.

@Tomo you are right, `SetOnce` would not work with someone (debugfs)
asynchronously modifying the state atomic variable. It requires
exclusive access while writing the contained value.

Best regards,
Andreas Hindborg


