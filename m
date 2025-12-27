Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96726290;
	Sat, 27 Dec 2025 22:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766874332; cv=none; b=Y3pSKmX9P0pHqQOV+1+vPRvDDCZjYu/OG/Buw87L3L2gipXgORGXIp/zJM2vrL5PN/KGZ9pLs1L3W21Mjp3EPTBiLJcK4MyUmuBdcgrpBMLGLWENQJ6vWGC0a2uvdc31PXGQ2OqkChKDj7o7HKdqdh4v8zSYqj58mYdpEJeGwVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766874332; c=relaxed/simple;
	bh=ve418wM/XyEWbfmF9fZaylARcLvP8lDozBBpjRZ5o+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ILmPg+dVdHFp4bsEQqrJF2VdLAQ3ERYItp8d3ADFekKogemdNtoCU9xzoiqpjeuNokAEvnHEqBhIZAUYgTLLrKXVYMu0IUCf3P3oA8uYBTsqsOBopMzv3WVO06k1+rqsP1bFkoO/JZnh0tTvtud/6SAyCdpm4qTj6Ypfz/OThwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyQvmqNv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyQvmqNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A6DC4CEF1;
	Sat, 27 Dec 2025 22:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766874332;
	bh=ve418wM/XyEWbfmF9fZaylARcLvP8lDozBBpjRZ5o+8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=AyQvmqNvp7aFQkxu9SD9KvqD0VPsY4RmdEyFYtNitIJA85tSgEOywKmb0jorw0lxS
	 IjpVlVP9LPMRay+Sec3vC3A2AkCG8ydTk+EL7v5/Rvbgy92vXOCxmp4AnxnUzsDgcO
	 Jf3ipoz5wiJvSNAeLP2N8LtwbR9BJHnhNVa7YBuDEXNYGFjtgZzNmQMNNpuIk8XkgL
	 Vr6b69aJIulzkcnfZIHt2KyLLUyA7pee51MsvXVSXYIskVTmpFlkET4Oo8zsg6feEb
	 i+ZT0v0mPlqtqFG9/Erz5tLI9V2JGKahlDqs0C3ChjjcutYSaNv+wsN5C6CwRPVFDF
	 UnjE7r2+m4c8Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 23:25:27 +0100
Message-Id: <DF9COCLM7VEQ.11RH8SIO59PMU@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
From: "Benno Lossin" <lossin@kernel.org>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
 <CA+tqQ4Kyy1re209kjBvtJU037MEcv+jQzEt=E9CMS4d2iuFR5g@mail.gmail.com>
In-Reply-To: <CA+tqQ4Kyy1re209kjBvtJU037MEcv+jQzEt=E9CMS4d2iuFR5g@mail.gmail.com>

On Sat Dec 27, 2025 at 11:45 AM CET, Jesung Yang wrote:
> On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
>> > On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
>> >> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
>> >> > +    fn emit_overflow_assert(
>> >> > +        enum_ident: &Ident,
>> >> > +        variants: &[Ident],
>> >> > +        repr_ty: &syn::Path,
>> >> > +        input_ty: &ValidTy,
>> >> > +    ) -> TokenStream {
>> >>
>> >> I feel like we should track this via traits rather than using a const
>> >> assert. That approach will require & generate much less code.
>> >
>> > Sorry, but could you elaborate? A small example of what you have in
>> > mind would help a lot.
>>
>> Oh yeah sorry, I had something different in mind compared to what I'll
>> describe now, but it achieves the same thing without introducing new
>> traits:
>>
>> We have two options:
>> 1) We use `<input_ty as TryFrom<repr_ty>>::try_from` instead of writing
>>    the `fits` function ourself.
>> 2) We require `input_ty: From<repr_ty>`.
>>
>> The first option would still check every variant and should behave the
>> same as your current code.
>>
>> Option 2 allows us to avoid the const altogether, but requires us to
>> choose the smallest integer as the representation (and if we want to be
>> able to use both `i8` and `u8`, we can't). I missed this before, so
>> using option 1 might be the only way to allow conversions of this kind.
>
> AFAIK, `<input_ty as TryFrom<repr_ty>>::try_from` cannot be called in
> const contexts without `#![feature(const_trait_impl, const_convert)]`.
> I assume we want to keep this validation at compile-time? If so, we
> might need to stick with the custom `fits` check for now. Please let me
> know if I misunderstood you.

Oh yeah that doesn't work (yet) :(

I'll take another look at the function itself then.

Cheers,
Benno
