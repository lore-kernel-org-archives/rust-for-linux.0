Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2142641D5
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 23:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741129982; cv=none; b=eKhVZLIfS3hEP7s8/66upTdXJQzUVK8N89v7nW4n277IdHny1zAGHwQMz0cT0kC0LhBXTGFr8hV/+V5YdgDd0ADQUZxXua0MHs/RC9/4FuNxWdYKgcozCqGtEO5q5pal3nmkmy3936MUiJDxqUqI3UCJA3f5KREsu/mV0cL+d7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741129982; c=relaxed/simple;
	bh=CBh0/lnFCBSjyNG5U65NvauwZbsNhyoUfXWRCO2UaME=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tHzZDJpK49ceUlbcxW0lz/XrMuiF5hgpLCGuiBrb0kopOmnuvdsqDMQZjanGUMMZGPa8wSNte2DaFRYa19YayYfBJ8fzdrMkSO1A1MYZxOUHdV+NH2JYUpbVI4qYx4rHHUfVCt6MQGomhlhU47fq73e4Wv0C0noGH8UaXawDHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=O8kvZoPu; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="O8kvZoPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741129979; x=1741389179;
	bh=CBh0/lnFCBSjyNG5U65NvauwZbsNhyoUfXWRCO2UaME=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=O8kvZoPuRL4R0ZXrnSjtZZYvgzefOGYcsananWyk1sMX4XXyUzFqWajaD79Jj4/By
	 YgerJavA1k6M1ljIzTHG2+iOqyMiaOTeOA0zLw9+rAw2FU5Q4iCfc9Y2Y1ig1hTm2p
	 0A/6DQnZjfz9T6JZPA6cYFHN60mcvgdrUU1F3sACvcAmP0tV8YN28AYI88mvQRXBJY
	 mer8w0vWKLK9VwAqccbA/X7hCui6pxfzjI4XEG+7CRgEe+Q8KhV0VoFULmWvdrbzN9
	 Ge5dzqmt5m19dFI6FekLIYUuRLcqwwT7IIX1OjA7r9J/IvJF/dAX3ik4GxgURwAvKV
	 D2o9nJt/LpVlA==
Date: Tue, 04 Mar 2025 23:12:52 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/22] make pin-init into a standalone crate
Message-ID: <D87V29499M2B.60G4ED2NW58J@proton.me>
In-Reply-To: <20250304225245.2033120-1-benno.lossin@proton.me>
References: <20250304225245.2033120-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 25e23c960b5645da8be8cfde5b79bcde2b8a56be
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Mar 4, 2025 at 11:52 PM CET, Benno Lossin wrote:
> This patch series extracts the pin-init API from the kernel crate and
> turns it into a standalone crate used by the kernel crate. The reasoning
> for this change is that the maintenance burden for me is too great
> maintaining two (more and more) diverging versions of the same library.
> At [1] you can find the user-space version of the pin-init library as a
> Rust crate.
>
> The reason for the difference between the two versions is that the
> kernel does not use the `std` and `alloc` standard libraries as almost
> every other user-space Rust crate does. This not only prevents the
> kernel version from implementing features for the `Arc` type from
> `alloc`, but also from any `std` types appearing in the documentation.
> Additionally, the documentation text is different in several places as
> it explicitly mentions the kernel's `Opaque<T>` type.
>
> There are also minor changes in code that occurred due to the same
> reason as the documentation changes or due to the non-optimal setup for
> synchronizing changes between the two versions (the process it fully
> manual, as no diffs can be ported between the two). For example, the
> `try_[pin_]init!` macros in the kernel default to the kernel's own
> `Error` type. The user-space version does not have such defaulting
> behavior.
>
> Since there are other projects outside of the kernel that have begun
> using pin-init, the only sensible solution to this problem is to
> synchronize both versions and then develop them simultaneously, ensuring
> perpetual diff-compatibility. I have even had people contribute code on
> github.
>
> Additionally, I want to do some big changes to the pin-init library
> internals. For example, porting the proc-macros over to `syn`. We will
> probably get support for this later this year in the kernel and I want
> to be ready to be able to make that switch as soon as possible. This is
> because non-syn proc-macros are just pure hell and the current
> implementation is a frankenstein-monster of a mix of declarative macros
> and proc-macros that I'd rather replace by using `syn`. I already wrote
> the code for that transition and will be submitting an RFC based on this
> series shortly.

RFC: https://lore.kernel.org/rust-for-linux/20250304225536.2033853-1-benno.=
lossin@proton.me/

The RFC has been generated from the same changes to the user-space
version, you can find the associated PR here:
https://github.com/Rust-for-Linux/pin-init/pull/31

It is much much more convenient to let a script handle the changes and
then verify them later compared with making the changes to both
versions, double checking again and again.

---
Cheers,
Benno

