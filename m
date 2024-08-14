Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092B62BB1C
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723653327; cv=none; b=NmjGA4j1YaVM48EIivg/PuNCSYZhzqgO8QOGTwlH8yXsBKnrC0MMqK99t3EGjz9RJBJOJ/TEuLkuMJ9MoNIVqdmrVoYSt3JfAvDiAvxGOy/7r1I7kyGltw56ADvs/7wQlDkGbx3oe/qU4kMrIr/IlPauUD3pmXyNnU01nr+wZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723653327; c=relaxed/simple;
	bh=BEi72zh/A0Ym3ieP4T9A+P93iD1olPrV9gba4Kak+Pk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RL5nU9jopyb0y8omLU3sahiklrDq9zJk8ejHAlZ6k5WpQrrev8AHR783aPfvfn0Whv2fhOZEF6jWMZTg/6HH0qlMihWQaNwaWZMwJckxOvdXQCbw+g75F8eE29B5cQi2hbBFfjTJMrfYItX+BjKGhfXf5VY/c9/YNwxUBJPajkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JOvj2lJs; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JOvj2lJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ux4hrfrohbcj7aosnhhhwh7yui.protonmail; t=1723653323; x=1723912523;
	bh=TWJzCnlP6EoG4SDdUYzTYEz41isA+56G/7vmG1iqMnU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JOvj2lJsCTcx7o10PlK3p/nXRjv559fD0LNYjw62n1YGqr+Fb9U9VAW3/HdnwK7Aa
	 1f+reoPv7KVUhWeW0LFQrwLZR2ezvGysZYmoGAyXj/lMAJuJJMYNxSn1EoRZICHJzz
	 Seb38n3g63QG7fymU3UoCLdnEze0EMiDILEPScZQg7VnYmTsEl7gfPrTQI9wbjkP84
	 xAXy6vsCmZKzGiBTgemp3Rg4t0SMPagsOxXVolMCAEPCtHRMBOANtKnV+YmA4JhATc
	 Og/iMXrfoqQYezkNr8w/Kw/4K/0JULaS5C5Ort62hFReWUukl1mB1I0+kbxesyjJjT
	 fSZ4ArXRQzn9w==
Date: Wed, 14 Aug 2024 16:35:18 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 08/26] rust: alloc: add __GFP_NOWARN to `Flags`
Message-ID: <e217d5cb-206d-47a3-bb0e-2466f1dc506e@proton.me>
In-Reply-To: <20240812182355.11641-9-dakr@kernel.org>
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-9-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 5398ae4da48429626b4f122ed52bd7548cd274f6
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.08.24 20:22, Danilo Krummrich wrote:
> Some test cases in subsequent patches provoke allocation failures. Add
> `__GFP_NOWARN` to enable test cases to silence unpleasant warnings.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/bindings/bindings_helper.h | 1 +
>  rust/kernel/alloc.rs            | 5 +++++
>  2 files changed, 6 insertions(+)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

