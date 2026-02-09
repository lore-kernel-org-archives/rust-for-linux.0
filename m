Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAAD3815C3
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 19:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664366; cv=none; b=qm734lTxusft68j8Z9OF4eYb20S6mtyBObo7vA7jjAo7o2X5mEKhhhEXVIRLrHGYJPbCFJudow8RKv78b4uO+1E+sRG+ZeGUaQUe+0B7bq7/TQoS2cvaECmL3kfTbBr8Msh3wb3O1QOGg8KO3AliGIf84L+0qMLtQvBiY0qXdAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664366; c=relaxed/simple;
	bh=m+yJXAiLF5NxDRD/t7e/ZKvGLkZEVJBud7e/elfsdi4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KqL+UJr7XMo8O8bGwIIETTfZ35/LgNknZB7Nkzk1PKBnDjLMpIdunvVghDMQkP/yLD61Dya4Z/bhbV+vDyTYcMoFUWkyh8KvXFQ/oERbLoAlDqwwqNSA6lEoKNjCO09BXMaawWRNdWkF/wV61YvgwLmwwEThuUy8i6+IN0h69cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4l3sGD5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4l3sGD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89C4C16AAE;
	Mon,  9 Feb 2026 19:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770664365;
	bh=m+yJXAiLF5NxDRD/t7e/ZKvGLkZEVJBud7e/elfsdi4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q4l3sGD5UuYBX+gb2hHvFPEiXOLnD20jCus9onfI6P/eKXLPOzE22VwnnqJwLvTgL
	 SHzDWo8kWr4jhR8WTdPhwfC7rFmjt/Aoc24r7C/ZhM2+Oo95szX2rXRWuqTthRhVMO
	 FmTZEqkNpuLldDO3LFzg2TIFFHe8IG29xwq0j3A81cZDLW6qTtlbK2AoG3cDivTSq7
	 79/kuIgK7fbE527A5SKH6VaIlS97FmnM2ElgGutJF5BWf1CdZ6gTdOYYpSJ8roGeEb
	 GvASMPDwx6anLpVdKXEaBELgHqyWkxF2xcH+W8tG/0uHDeo1YqOiLia+oZFmlAgj7x
	 PMbMg97atUnFQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: std_vendor: add `{likely,unlikely,cold_path}()`
In-Reply-To: <CANiq72kNXMFriYor9z6rYj_HJO=ORRsVFes_Znt-HK5NYdQRuA@mail.gmail.com>
References: <20260208224659.18406-1-ojeda@kernel.org>
 <20260208224659.18406-3-ojeda@kernel.org>
 <loMX2c-d-q0qiOw4sfLMKLAt-D5giBVKFD-iqhC7j9DJxvEGyhJkgtUfpEipAmkoLRU37FUhKkB6Mz0xz-MGqQ==@protonmail.internalid>
 <DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net>
 <87o6lyunma.fsf@t14s.mail-host-address-is-not-set>
 <0a7fk1LqtnqDpPac2qby6bzZ440F8-ufrSzCiIA2ErdgrCGPTJVYYVdPI6CiPnqtbbNX-tSE4bwZ4gsKvfS9yQ==@protonmail.internalid>
 <CANiq72kNXMFriYor9z6rYj_HJO=ORRsVFes_Znt-HK5NYdQRuA@mail.gmail.com>
Date: Mon, 09 Feb 2026 20:12:35 +0100
Message-ID: <87ldh1viho.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Feb 9, 2026 at 1:07=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Allowing `feature(core_intrinsics)` is allowing a lot more than just
>> `cold_path`, like `volatile_copy_memory`. I don't think it's a good idea
>> to allow all these in.
>
> It doesn't really allow "all these in". It is just for two fixed
> versions, thus other versions would complain if you try to use them.

True.

> And, in any case, just allowing a feature doesn't imply we are OK with
> everyone in the `kernel` crate can happily use everything in the
> feature.

I know, but the feature gate is a very effective first frontier. But as
you say, with the allow being limited to a few versions, it is not going
to matter much in this regard.


Best regards,
Andreas Hindborg


