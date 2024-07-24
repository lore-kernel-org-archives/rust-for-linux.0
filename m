Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF76161915
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jul 2024 19:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848401; cv=none; b=hgGHlW5Wu0kJpXsRkR3aTPyil9EV0vim1fK7Er8FwQRQvulMGcgn6DnetFgvoDa8unwe/eeVjq33RzTNbuDGOE3kH3Mzbm8D96Bw6VGEh3WW9JRjnwtn2TfMbDZXfkud7whUdcbKf9ZdOvFji5QcWt9w/omeivrjqDMVF8XHL5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848401; c=relaxed/simple;
	bh=wODsILdydAWyTmURycOlaz/DUnsABuavn1/8cgcYgtI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ibg395RUp3ZqL4dP+TYQFSwjYh7+A19B6d9rKctTPAU+N0O7d8KI2vc3XtWCdRa3TqvlRoiiMc3ciBbKyM77xYE4d10yqUgaTtx5/HIc2sdzvKoD9KAxv+ja1pk0vgxJwZYlJu7fhUuDHTwElLjl4fGJ3+Cos7b154ydIu+wMyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=IM4WzLF6; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IM4WzLF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721848396; x=1722107596;
	bh=yROuNhhOiZXiesuXRINKmwCmOfQ2t0VJpy13JCepD18=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IM4WzLF6B5uE3dxiAPg8LKmkGf2baCHAvm6m3zLJ8FDEQjWEMrn8FyzKvcmmjfJ6f
	 pJzUxNUCpG0PgnDiONtHHe1h4ZB275jV/Z+ly7xl57jNmIE4+sjyYlFNmQZBUkjauV
	 Vsq+33aempb0fKxeoAwa2Sus/Cn6OlXL9n9qApq+1oa2L9Pm+vurtz1ciAV7uhqojQ
	 eySUNtC7upXmnvwDYwzxYlQo6FoTOKLxaLmtVAk4wcToaGV0ld5EDlgX5gPQ9iGN6T
	 kJWZ/kyung+cuAd6fiOYC6NTDAOVoY2uvfy9TjYqI5+r0WW3BjHX1akZ6pKoaPU6MQ
	 ynKsgqmA3407w==
Date: Wed, 24 Jul 2024 19:13:08 +0000
To: Greg KH <greg@kroah.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 1/5] doc: rust: create safety standard
Message-ID: <59ebc5f2-7d58-49f5-83f1-c954705f3953@proton.me>
In-Reply-To: <2024071845-neuron-figure-2e26@gregkh>
References: <20240717221133.459589-1-benno.lossin@proton.me> <20240717221133.459589-2-benno.lossin@proton.me> <2024071845-neuron-figure-2e26@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: be907ebcc070349e238c381528938ba589d3fe6b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.07.24 06:45, Greg KH wrote:
> On Wed, Jul 17, 2024 at 10:12:29PM +0000, Benno Lossin wrote:
>> +Because unsoundness issues have the potential for allowing safe code to=
 experience UB, they are
>> +treated similarly to actual bugs with UB. Their fixes should also be in=
cluded in the  stable tree.
>=20
> Odd extra space before "stable".
>=20
> Also, link to the stable kernel rules here when you reference "stable
> tree"?  That will explain what you mean here.

Sure will add it, do you mean Documentation/process/stable-kernel-rules.rst=
?
Or a different file?

---
Cheers,
Benno

