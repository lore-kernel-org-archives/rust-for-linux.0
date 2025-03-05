Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE75643166
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741183407; cv=none; b=Ow2UJl/jQ8qbGwS+kb1dVm6K2SwyJ5tJ5TRFAP4MmJk1H1bDDFr6jDM7C0PKOlSv4uNQAG/x/FIi8UuSK4kTW7nu+NQhks1qDHZcDAKs10nHjq8YwxWdFFGLAx6+U7bYIEEV6UzPfH4ncF7DJiljRziCCX7s9e9rLECouWCKnbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741183407; c=relaxed/simple;
	bh=ckugIU7awNeBmwOxUjjXg0GDN5WuDOHLUUoUaRf9q2w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhBxcu8MPkmQ75u1Xk7vkIjTxsuxhNRiPTJxYxkPVgaXQv7QlF/0FeEmwXqAC1ruOZ0IAWJ6/SbH52dEi1ShMlJGuq1CIKDxB+qce9hDJIYznjxv7D7YeVjbfszKcxVUs5ZmXoi2FJh49qZHvlVG5Ak/t7306xnyqkMclP/zFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=EF3iHpFz; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="EF3iHpFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741183403; x=1741442603;
	bh=ckugIU7awNeBmwOxUjjXg0GDN5WuDOHLUUoUaRf9q2w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EF3iHpFzh58GRvMwcBaHQYarU+PHosDstJWbgnTC5YUR2Yax8vlRd6PYc7DJC+u8k
	 JnAuuIaYDmqqW8HzoyUL5OKCYBPu26bB6RojpEs878fYNr9eG2ss/aOXBqBT4bDkTU
	 T1WC0vdSc7AA6cHi7LBoA9OiNYMIMANj7MxXU3nE0s6xIglDoBXldIj8z4vQZsi9Pc
	 eKvR/X8Hb7nqlCm86mmo0B7cYpnNNdESjSLGVnOVTIFk/Iy/QnLiCOqkzMk/TlQlXb
	 xiMshSMda83XjIv/AMu8lDjK5QjF0gvoiIDYotsY+lMM+IyNP2sGANwDlCYuoCuGeh
	 sQBMluSPR8yfg==
Date: Wed, 05 Mar 2025 14:03:08 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/22] make pin-init into a standalone crate
Message-ID: <D88DZV6T9WOV.1QM9UZEAB6IL7@proton.me>
In-Reply-To: <87msdza8d5.fsf@kernel.org>
References: <xn5HRPkxO91lsoIUAwMnnAvQRCAgmw6nzTZX2DsODS0viAvz_g6B8l3dpYNtcL2jBXySi0DQrVi04b6MY8GbMw==@protonmail.internalid> <20250304225245.2033120-1-benno.lossin@proton.me> <87msdza8d5.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 37069e50ecf508ba8a128c01fe4c82a996a0cda1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 5, 2025 at 2:56 PM CET, Andreas Hindborg wrote:
> Hi Benno,
>
> "Benno Lossin" <benno.lossin@proton.me> writes:
>
>> This patch series extracts the pin-init API from the kernel crate and
>> turns it into a standalone crate used by the kernel crate. The reasoning
>> for this change is that the maintenance burden for me is too great
>> maintaining two (more and more) diverging versions of the same library.
>> At [1] you can find the user-space version of the pin-init library as a
>> Rust crate.
>
> [...]
>
>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks a lot for the quick reviews and testing!

> Tested with downstream rnull driver. The driver is 71 patches on top of
> this series. It required a handful of trivial changes to patches that
> touch pin_init, but everything seems to be working just fine.

Do you still have those trivial changes around? I would like to know
what kind of changes you had to do. Was it just import adjustments or
did you also need other changes?

If you find the time, I would greatly appreciate if also you put your
rnvme driver on top and test with that.

> Reviewing this series made my head spin. It must have taken a
> significant effort to compose the series. Thank you for making that
> effort!

Yeah it wasn't easy to get the two versions on the same page again. The
hardest part was to split the changes into self-contained patches and
also to ensure nothing breaks between them.

---
Cheers,
Benno

