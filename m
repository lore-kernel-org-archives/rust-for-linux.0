Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727BB253944
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756040706; cv=none; b=r5c745unKn1V02LVdp1sVjIzIA6WgHdNiwEEpEKrP4vhoVtIMCOqFuTi8OrERK5hel/M8YDqAPParOGMNzPBu+DXzXh93arZl6TN0D+yqt5C0dzyD81ViPAVmmWgTMnVTlakUd+bLpNb9DznqZTyATUJECnfHwhaB9BzG1EEABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756040706; c=relaxed/simple;
	bh=W5xOQKuMNnSf7+aFccIF+sA9AEbiG2iUEybWWHNvCk4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Eb4AMeDhWDlKLFL+o7W2TgBjf0VIaGPBUaj10ky34kIdajOMyd2gjG0lyPalRqdk/odZ4RqlpB9tO7qbxQ09svdzOlHWrgjZutWitqmguGlyF3aesBD1kMFcL4SXrHHZbwCOE6RpKsM23ERvzDU5ZVS09USx2M0UBevI+5zAa0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vL767a0O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vL767a0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F53C4CEEB;
	Sun, 24 Aug 2025 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756040705;
	bh=W5xOQKuMNnSf7+aFccIF+sA9AEbiG2iUEybWWHNvCk4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=vL767a0OPT/0ICHw30ZcuWNYyRmxXsJnKrCo6leec5cPZPTC7AYgYzNhY5nAQCNGT
	 nqMR/jf0EuvJbaSeheX2vIGOY+rTAq2pyoO4D1blCxrHMmaCcubYMQEM8SX52ekfl1
	 1CdtRKw2FUlPujy92LLQe1fg3bguJRf1GvLez5LdOR4ucJkxTNLChTVY3gqHU9MKvO
	 6dqVq0XOTRinTPQQveASgmnLxmvV6RWwsm5i07QqGypsHKsaksYR1HKy/DsvYXVpvA
	 kUvbEqm7DPh12hhTXvoigsKDmlKdK9GJ9Udccc8Frss6fKQnZro2ceARBq9z+ZzEnT
	 wKiEo7rgjppFw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 15:04:58 +0200
Message-Id: <DCAOH44U57K3.2CVDYWF8MJBWL@kernel.org>
Subject: Re: [PATCH] rust: alloc: add missing trait item MIN_ALIGN to
 Cmalloc
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-mm@kvack.org>, "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250824120656.208978-1-dakr@kernel.org>
 <CAH5fLgjkqcyzoZD7PP2i4g4r2uqpdbDKVW5hLfm6c9ysbxkPuw@mail.gmail.com>
In-Reply-To: <CAH5fLgjkqcyzoZD7PP2i4g4r2uqpdbDKVW5hLfm6c9ysbxkPuw@mail.gmail.com>

On Sun Aug 24, 2025 at 2:36 PM CEST, Alice Ryhl wrote:
> On Sun, Aug 24, 2025 at 2:07=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>> +    const MIN_ALIGN: usize =3D bindings::ARCH_KMALLOC_MINALIGN;
>
> Is this the right value for normal malloc?

Heh! ARCH_KMALLOC_MINALIGN should be correct, because the Cmalloc implement=
ation
should (ideally) enforce a minimum alignment of ARCH_KMALLOC_MINALIGN for
compatibility reasons.

However, double checking the existing code, it doesn't. Hence, the correct =
value
must either be

	const MIN_ALIGN: usize =3D align_of::<crate::ffi::c_ulonglong>();

instead. Or, we have to actually enforce ARCH_KMALLOC_MINALIGN.

Given that this fix is only for within the -rc cycles, i.e. we will remove
allocator_test.rs before the MIN_ALIGN stuff ever hits an actual release, j=
ust
using align_of::<crate::ffi::c_ulonglong>() should be fine.
