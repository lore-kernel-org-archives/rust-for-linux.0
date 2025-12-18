Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E9C2E11C5;
	Thu, 18 Dec 2025 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766047024; cv=none; b=H5FsoZzZhYQJ0e53y0ZPx4vy7lLVzYxHp9ji5KTGD29h3ptpLNrc1H99vwXZE462x/KoEeerID07ZFDH0Dju6TKarCN4IGNSIEMoPe8gVyNvV+hG0a5yWCWcc7nm9IfwTVaG6QQtd5FbhbUNPVFHTtClh41YpE8k/fvfhTV6k9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766047024; c=relaxed/simple;
	bh=QQZzTuZtp6sYw35xu6HDs3xnL4i3ihTZecG/dya5SPA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MFr9cqTaggomUeCUCWszEWRwHzfi/wVF2iBvqtBIBdnfZM8vHF/ez9AbYN4yve10RbC4IW9GIisWbK41grFpJZlwoZu3h0cIO3TbYI+0hfpGv1PvSJGx8qUCZp3RrmWZy3Wxm7WEez3gp/+Pg4AGceEHl8tMSFYyVm1jEjfOsfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/Sn3q8u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/Sn3q8u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEF0C116D0;
	Thu, 18 Dec 2025 08:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047023;
	bh=QQZzTuZtp6sYw35xu6HDs3xnL4i3ihTZecG/dya5SPA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o/Sn3q8uQ6vNQfH4UX6yCVQOXOdb37GJGmWu4jOh0fhBpFuP8/sKEPMHHXW6qrO/V
	 Lhcbka7y8q4Uv32MHik6oz9PzJmXREhJ4UWDoImqL6QEMaDpleiIzR8BZNM6c4ytve
	 NcfETAaKmsyAgjduDi3c0JsyP0qtATZgGxfJ9iQfn41zk7Wp+IwFgPqwYErpEISk63
	 uPyElYiaCEvbjEF95U+OfNpN+3o5rQVJGqUHanmTOweU+uAHngKM1ioFdSkvpp93UV
	 F2Rge+5Y2i6A5mNrUe4HvOb6MGZrNMAzuDwlGT07NG2doghLjSRHijqNIENad6elyQ
	 QxDXEUyeSmVmQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hrtimer: add usage examples to documentation
In-Reply-To: <C1C6DB90-202A-45FF-9D01-D7304A8DC8B0@collabora.com>
References: <20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org>
 <ppzmlAVupzBwfQchQvMLdXNjAU_JEy5uR-s2OhGLegkP3b32qNl67HZIMbZJ1Yk5Yj1MGBTG0TLFQ4vAbW8rcg==@protonmail.internalid>
 <C1C6DB90-202A-45FF-9D01-D7304A8DC8B0@collabora.com>
Date: Thu, 18 Dec 2025 09:36:51 +0100
Message-ID: <87ms3guqxo.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

<cut>

>>
>>
>
> FWIW:
>
> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_0
> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_1
> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_2
> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_3
>
> This looks good to me. The rendering looks ok as well.
>
> With the nits addressed:
>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Thanks for calling out the sloppy error handling, will fix.

I don't understand what you mean about blanks?


Best regards,
Andreas Hindborg


