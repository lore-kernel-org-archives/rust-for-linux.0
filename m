Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916BE13F42A
	for <rust-for-linux@vger.kernel.org>; Sun, 10 Nov 2024 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731224753; cv=none; b=Fp8pgbZ0ZDIPy9rwXHOmQjpKgtzROrSNuWWs/sqHnAe7AiXB5QYFKOkwacJdTEj/KT7oadjk1kdJhX0iRCJTtBMyMf5/x2i+i0TgqNa8hA9FVbNkpvuf2By0TcVfZL0bZscFLviL72MvUFQ7kU7htVCEKc0Oa4oTL+G/NbKyMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731224753; c=relaxed/simple;
	bh=J/VeydnvinFME7CjDi4P5+P4cmcE+xx1kQi0rmcmZuw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=CsCTk3dlzEgpSoOsWECWpdeOFRYBjGIanrG5ym5u+SZl6Y6qvpgUEV+htm3nIfXQlAuT2tQYccDz01xEb7jBN5cZQZWBOYy3Jea2eN93oVe+LOU2PRKcgHpXIHVdhwL2uuFKG/N9yJrr/NX/hLboVn/5SkhZwEDOjx1m5FR1uMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=3ovpAELi; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="3ovpAELi"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id A8BF337B2401;
	Sun, 10 Nov 2024 08:45:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731224749;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=J/VeydnvinFME7CjDi4P5+P4cmcE+xx1kQi0rmcmZuw=;
	b=3ovpAELimv0D1675HfzaxsbbrhuvGG3n5A/d6BREHeHIMMYhDP2Ctu0sjJDlcQ1H
	3ctJBoEAZX+5AuMGagcghdLI6+r0L6L39039zNxByLS7beUP1CP8FmAuPtPgjn7A7gU
	IJXlYX5HDuzsx7+Njc6PMgwVmTiocq5YF9E2PSCvAz16X0odPsSlE1yy0u5oaNjhRfc
	WyDAKlVMv2g7MtBTwMJCAsbrH/M6Z/4YNcHOQe43MXOswlOnpzbNJIF6IXhd6hVbfEa
	/nwLlwNC8z4CtMU1Q6snIF+Gz04u3Z6TDqESjwQ+kQfqpQxCfz6y97PttF2Tcqp2Xy2
	VU8wV/jImQ==
Date: Sun, 10 Nov 2024 08:45:49 +0100 (CET)
From: jens.korinth@tuta.io
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>
Message-ID: <OBK1JLs--B-9@tuta.io>
In-Reply-To: <Zy_oj_k-qUPLSVEr@tardis.local>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io> <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io> <Zy_oj_k-qUPLSVEr@tardis.local>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



> With this `Once` type, we can do other things like waiting for some
> initialization to finish. We can put the waiting as a future work, since
> `pr_*_once!()` don't need it.
>
> Thoughts?
>
A `Once` implementation as the general approach of doing things once in
the kernel would make a lot of sense to me and I think it would be the"rusty" way to go. I'd prefer that to `do_once_lite`, for sure.

However, I'm not sure if it can replace `do_once_lite`. Doesn't `Once` use
a closure? I may be mistaken, but wouldn't that have at least the size of afunction pointer?

My second concern would be with the methods of `Once` itself: We would
have to rely on link-time optimization to inline the methods, which may bedeactivated. If they are not inlined, it could mean a far-jump on a potential
hot-path that could be triggered many times per second?

> Another meta comment is the usage of `AtomicBool`, please see the LKMM
> atomic patchset [2]. In short, we won't use core::sync atomics in
> kernel, instead we can only use the atomics implemented by ourselves.
> And we currently don't support `Atomic<u8>`, there requires some work to
> get that done.
>
Ouch, I didn't know that. Sounds like an interesting topic! I would like to
understand in more detail how the Rust part will imitate the inline assembly
approaches of the arch-specific code in C. So far my mental model of that is
"we'll wrap it with bindgen". ;)

> The other thing of using `AtomicBool` is that it's not the most
> space-efficient way for `Once` (if xchg() is used) on all the archs that
> support Rust in kernel. RISCV doesn't has a byte-wise swap, so the
> implementation has to simulate with a 32-bit or 64-bit swap + mask,
> that'll be totally 5 instructions, and each instruction take 4 bytes. As
> a result, if the `swap()` is inlined (which most atomic operations would
> be for performance reasons), you save 3 bytes by using `AtomicBool`
> other than `AtomicI32` at data section, but you pay 4*4 extra bytes at
> the instruction section compared to using `AtomicI32`.
>
Ok, wow, good point and explanation! But it does sound like an
(arch-specific) implementation detail. I would expect the `AtomicBool`
implementation to do the "smart" thing on every arch, no? I think on thesemantic level we want an `AtomicBool` here, regardless of how it is
implemented on RISCV, or another arch?
Jens
