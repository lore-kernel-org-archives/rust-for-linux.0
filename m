Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F08A41
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756041511; cv=none; b=D5UjbvoXiCalbWGQu6I69RC5qrEz7IgGSbwCik82XWcNDYUahX5DSElMK3wtsiLRnjtOFPH2N3bvHYw63PrXxlCMadJjrF1eKGEaCUlIwzmN5vKvhRN5oG5Vk/OAMYfF8LTIHb+QqEip5DcQMmmclKWNhuD/bKnCfGEtF2/4dSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756041511; c=relaxed/simple;
	bh=8rEG/zHMY62H8SoQpOWtKL4gYJh1rEaAZlfNMZf3TkM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=PRei3g4eGkHlAunEu7Arp7zec7u2djizo7kzziQAN/Z3VwejTmO4AtdtQya3k8prK/gaj0A+Bkz0r6xcB0qYLX8TrEI0pYSx/VEd0ATMBGEUzFcukO1csycZNIu97O9UM3epCaZul6qL6oOSTMNBoEoydyE06zVHQvTY3BlS9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkDBN/xE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkDBN/xE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE528C4CEEB;
	Sun, 24 Aug 2025 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756041510;
	bh=8rEG/zHMY62H8SoQpOWtKL4gYJh1rEaAZlfNMZf3TkM=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=XkDBN/xE9oWPNlcrCWXL07yKd/x9NSSWASauXwWDSzb4WTZdnAB57Vh6B85+jYtoo
	 JYVC7SG8PU8+GArm0KxVBQxtz4j1eevX38ETGcrwqK3W//JnpSDfKHwXtSP5g4RFq3
	 mijJyUqdJ/Cpk4RUJgPzIeVnaETtDqZLbS7Yh7Z0L8FObw1XmVrQE1YswZ2P4768vS
	 W5OEMh7up/3lPEfDKQSSs6TcbWcpYnpzZ69e66itU2tFngXuT0Y9ECMx3J8c5yBjIk
	 GYqnAgTNiR+03W586JJBsd/22vPQvCShdLhpPOtrjdD9xDKBZMWb/mU/qZVPLzb++i
	 yVoj+iNRiK5sQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 15:18:24 +0200
Message-Id: <DCAOREAIJOR9.2N5JW0SC9YT93@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: alloc: add missing trait item MIN_ALIGN to
 Cmalloc
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-mm@kvack.org>, "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20250824120656.208978-1-dakr@kernel.org>
 <CAH5fLgjkqcyzoZD7PP2i4g4r2uqpdbDKVW5hLfm6c9ysbxkPuw@mail.gmail.com>
 <DCAOH44U57K3.2CVDYWF8MJBWL@kernel.org>
In-Reply-To: <DCAOH44U57K3.2CVDYWF8MJBWL@kernel.org>

On Sun Aug 24, 2025 at 3:04 PM CEST, Danilo Krummrich wrote:
> On Sun Aug 24, 2025 at 2:36 PM CEST, Alice Ryhl wrote:
>> On Sun, Aug 24, 2025 at 2:07=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>>> +    const MIN_ALIGN: usize =3D bindings::ARCH_KMALLOC_MINALIGN;
>>
>> Is this the right value for normal malloc?
>
> Heh! ARCH_KMALLOC_MINALIGN should be correct, because the Cmalloc impleme=
ntation
> should (ideally) enforce a minimum alignment of ARCH_KMALLOC_MINALIGN for
> compatibility reasons.
>
> However, double checking the existing code, it doesn't. Hence, the correc=
t value
> must either be
>
> 	const MIN_ALIGN: usize =3D align_of::<crate::ffi::c_ulonglong>();
>
> instead. Or, we have to actually enforce ARCH_KMALLOC_MINALIGN.
>
> Given that this fix is only for within the -rc cycles, i.e. we will remov=
e
> allocator_test.rs before the MIN_ALIGN stuff ever hits an actual release,=
 just
> using align_of::<crate::ffi::c_ulonglong>() should be fine.

Just for completeness, allocator_test.rs is also broken for the assumption =
that
Vmalloc allocated memory is always PAGE_SIZE aligned.

Vmalloc::MIN_ALIGN, of course, does not report PAGE_SIZE in the case of
allocator_test.rs being in charge, but it's an assumption that people might
rightfully rely on in their (unsafe) code.

In the end, just another argument for getting rid of allocator_test.rs. :)
