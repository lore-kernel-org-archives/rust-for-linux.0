Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4AC2DA77E;
	Sat, 31 Jan 2026 19:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769886633; cv=none; b=ZuE47ziFKsvzqhv4O9DzQCZW7pc6wrJauE9D57VTE6OGaNNu/161Ry+mOziYVDfar3/mRrJOeV6i0gLGJXjro46Bte2D49Gk90dikYc9hFx/1d6Zim4Q6572XwYyvbgdss1z/uF71nNHo2cuq+7LipSXEt94A2GxEKqJuo7CAQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769886633; c=relaxed/simple;
	bh=GGsWzZCvO7JDVG/sUiBEb6ZMfj04oe5Kx7B5vtwqH8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I/fsJpZxQrVkPy8NSIKf7Ufnj7OHj586QjXe0onfW2oJ2xQVuN5KXbiJUEzfeOSg2vps22KkWwo4/GO0f16omHo/88k9XJpV+DWRfWCBG9wXgj3lWYToK9ll8bZ8G1jGS/hE0cPw5an5YjeTepfe0gBsEzv7zgR40KKv3YrOMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9t642e2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9t642e2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F2CC4CEF1;
	Sat, 31 Jan 2026 19:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769886632;
	bh=GGsWzZCvO7JDVG/sUiBEb6ZMfj04oe5Kx7B5vtwqH8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F9t642e2FWm0TcW3noTOKtWECPb42kH34miAwJu2QzuEQFkQiGjwIV8d96l1Y40mS
	 a/DEKfnr+blfZAuPEYYmvBaBlvcPlXs7yJUt2DQRKe/uXqEVqc5RGeVFFHNhWLzUZx
	 XmhROLl1Tn6eCVxmo9XxpFd/EQTwfiS30oTR+rspmbZExgCwESllrrCoaCcvV4TO0B
	 VmX4vB0oC2CGuY7O5Dcnw0GRHjYiyFeamLR2gG9y79QZf0s28p9Zr+uXGiYxCeKgnf
	 b/v53F6Ws/fkUio1yYuCijcL7Qu/QLodMKdNkuDzqU6NFd2wTwMhiVWPORbjUyyRtJ
	 xlamI8AAmEYhg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
In-Reply-To: <aX4xNxsF5Qs0CTPW@tardis.local>
References: <874io3rwl3.fsf@t14s.mail-host-address-is-not-set>
 <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
 <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <-5tKAwUVrj6fo337a8NWsHQBepB07jKIVI-VafwW1zp0vsGTCkBTuI5nCBniftYJePZy8kb7bhWptJ2Gc_B-kQ==@protonmail.internalid>
 <aX0lcVngRcRwqgd5@tardis.local>
 <87pl6prkc6.fsf@t14s.mail-host-address-is-not-set>
 <DceHeOJQ2ZdVoA8jlWqMpTO6bHsSLi-JNu4iXSpnMetXsYWKkLkv7vGSdHqqNIVV4XnkW5SfReAA9dDoUENEIw==@protonmail.internalid>
 <aX4xNxsF5Qs0CTPW@tardis.local>
Date: Sat, 31 Jan 2026 20:10:21 +0100
Message-ID: <87jywxr42q.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun@kernel.org> writes:

> On Sat, Jan 31, 2026 at 02:19:05PM +0100, Andreas Hindborg wrote:
> [..]
>> >
>> > However, byte-wise atomic memcpy will be more defined without paying any
>> > extra penalty.
>>
>> Could you explain the additional penalty of `core::ptr::read_volatile`
>> vs `kernel::sync::atomic::Atomic::load` with  relaxed ordering?
>>
>
> I don't understand your question, so allow me to explain what I meant:
> for the sake of discussion, let's assume we have both
>
> 	fn volatile_copy_memory(src: *mut u8, dst: *mut u8, count: usize)
>
> and
>
> 	fn volatile_byte_wise_atomic_copy_memory(<same signature>, ordering: Ordering)
>
> implemented. What I meant was to the best of my knowledge, when ordering
> = Relaxed, these two would generate the exact same code because all the
> architectures that I'm aware of have byte wise atomicity in the
> load/store instructions. And compared to volatile_copy_memory(),
> volatile_byte_wise_atomic_copy_memory() can bear the race with another
> volatile_byte_wise_atomic_copy_memory() or any other atomic access
> (meaning that's not a UB). So I'd prefer using that if we have it.

Ok, thanks for clarifying. I assumed you were referring to the other
functions I mentioned, because they exist in `kernel` or `core`.
`volatile_copy_memory` is unstable in `core`, and as far as I know
`volatile_byte_wise_atomic_copy_memory` does not exist.

When you wrote `read_volatile`, I assumed you meant
`core::ptr::read_volatile`, and the atomics we have are
`kernel::sync::atomic::*`.

So now I am a bit confused as to what method you think is usable here.
Is it something we need to implement?

Best regards,
Andreas Hindborg



