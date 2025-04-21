Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF7A1EF090
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Apr 2025 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263196; cv=none; b=Dd+FBCLvTzQiZFmrO0hsH3GMPYQMbzpzSgTW5qzFuhz0JmN8O1Ai3ncjlmgwcvTENPRoRRTfW+ckt3MBXWZzVc2y4PJcf//kYfxCIDyiL4VbEJ6wrLQIHkA2Z/n22QXQqFyoJprJOZyVnSfTLt555xdHVjlrIpZwaHmWKKGxkY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263196; c=relaxed/simple;
	bh=ApKe8oF63tfK+c15d5fHPDIKWOvpdK7Vl2AMmjb8w7g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZ3ip4W1yWn5Ezxw/PZ89LYgR6VmCYyLc8WteA8BebGG2Ni05EBfemJwp0OK9pTmPzZmuhKZ9L349wVLMRAIwPY6UGSc7SBHgAizwI5Z5qKKgPMDrPsRjFs178efbvEFab3aTPWgGpj0QX1y5vlGFSihAuQXmBY8sbI/CKI/Nlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=D4xovFiR; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="D4xovFiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=apuvx3gjunbhfe7eymzvlodfcq.protonmail; t=1745263186; x=1745522386;
	bh=7IwTzBLsSrUW2fbp1K3bxI74sXuik0hnfJ9jYv/jsOs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=D4xovFiRO49jojevhNUmb8TKSUdkABQXMv/6BBAr8Bx9ochbXls9+UCJTEQQV+dst
	 j8ZIYDdgs/kEsYebJO+xkwobQk7RjrMibJTrc/R7vFqh1MsuEv1lJVad493ve6trHl
	 uw4u/u1To1mUuc/eGf6MOfABSBqLHTQBWpdWwJNOS5VX2Y/XPTZTAlTtPtNluYZgj4
	 PzbkOAp1uqRKijC3mU+CurpLHJBUqmJOKITbI0xvKgpHRRFMNoGTfXLQk9G4oZ0W85
	 GcUD+vmuTUPcbdkgjWacHirMhheCQylIUUhGVyA3GAUXlQ7NLPeUX6UZ45x2FrO2oM
	 31EnTq0CRQVmQ==
Date: Mon, 21 Apr 2025 19:19:39 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Untrusted Data API
Message-ID: <D9CK5T6VBEG3.EQ8VXEH1DXDY@proton.me>
In-Reply-To: <20250421134909.464405-1-benno.lossin@proton.me>
References: <20250421134909.464405-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7311ebc7d6e764ba3af09d71907f15ae12c9ff7a
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Apr 21, 2025 at 3:49 PM CEST, Benno Lossin wrote:
> Sorry for taking so long with this, I didn't find enough time to work on
> this and when I did, I spent a lot of time on trying to get the
> interface into a satisfying state. But I always found something that I
> didn't like or something that didn't fit correctly. I blame my lack of
> knowledge about "all the ways of reading bytes in the kernel" together
> with "how should reading bytes in the kernel look like in Rust" for
> that. I think it's best I leave the ivory tower behind and just
> implement the part that I'm confident about (it's not a lot :) and then
> just roll with the use-cases from there. I should've decided to do that
> much earlier.
>
> I did manage to create a very basic validation API that I *think* is on
> the correct path, but I still marked it as an RFC just to be sure.
>
> We can & should merge the first two patches, as they allow new APIs to
> already use `Untrusted` where possible. (some APIs might of course need
> to wait for the validation API)
>
> The first use case is Alice's `struct iov_iter` series [1]. It simply
> reads untrusted data and then writes it back into userspace without
> looking at it. The RFC patch introducing that can either become a normal
> patch or be folded into Alice's series.

Seems like I forgot to change the last two commits to be RFC commits,
sorry. To be clear, these two commits are meant to be RFCs:

   rust: validate: add `Validate` trait
   rust: iov: use untrusted data API

---
Cheers,
Benno

