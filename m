Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0F5661
	for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 20:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748291292; cv=none; b=nQBeBQ6gOtVG36BpAnE6kI9yN4Tjw9r7oxMW0XlRaAk5ZGF21pt44LRLVA5ZiWtH5Efse/VUT8sRr22F44XbH4+ER8xv+Iqa6fmDiaWoaWNqXcd3Ed4GA/hVhIyGnjU3gObPzH1MIS9uZNl1rInbE5AAEhPZ19NqZ5AQWwGBtz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748291292; c=relaxed/simple;
	bh=9Ciinazl2kdQ2MEg9td4Iu/bpFfu0Wstt1SrBAOcgng=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jKQoeAWmzXRsLHS3rud4PGDSSvvSZsZPKxQen4ZZ+1nSk2gOCbS1as5Pyn967M5VnZAo/iXh20OexMUw50ofMdYRs4ZmQ7jh9EfnbZG+t1STNbT9nAVceHABG56YyuF9aULmf+7kCh5wyNDk/ZX0t5UYuq33B93RTFaxns7yRu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lx6nGoLW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lx6nGoLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38201C4CEE7;
	Mon, 26 May 2025 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748291291;
	bh=9Ciinazl2kdQ2MEg9td4Iu/bpFfu0Wstt1SrBAOcgng=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Lx6nGoLWxoY62urzEi5doswcHLOAAbFaxecNkJhlhIp0cvtQlThHpkzB0WVxYMpji
	 WK8YVEqpnNn8TLLFA3nRqVTG2xs4bi3sEU5tvaucRCqPMs9pj1g8sha36Tboj7Mk6+
	 cCaQU/vS7Qsu8lWCPu2KYjfUH5nT/ctqpk9GEn+XrC6EVOBeF9+mV/GpiXYCq1WDVk
	 EQO+4rs7aYVHmIyTKnzLg/W3z4s+8YDbvJAUaPksVbT82vZC+hxhB5iw8r+g6PpWDV
	 YVLwi3RSsN/YFhjNZPv+FaNBiPvivUsaEsLwYKrALSxsYiz3A3s7SlMKmDdnvAiGtm
	 O4PDAU81Bym1w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 22:28:08 +0200
Message-Id: <DA6DJEG780UH.3FURKORQ8OY6U@kernel.org>
Cc: "Albin Babu Varghese" <albinbabuvarghese20@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [[PATCH]] rust/list: replace unwrap() with ? in doctest
 examples
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250525225925.14797-1-albinbabuvarghese20@gmail.com>
 <DA5Y0QPY52WJ.DFA7YNSN2B2M@kernel.org>
 <CANiq72nNX++eUKAHYvxMvEeHy6cfDP98cteVAgM7RuQH5hDkVg@mail.gmail.com>
In-Reply-To: <CANiq72nNX++eUKAHYvxMvEeHy6cfDP98cteVAgM7RuQH5hDkVg@mail.gmail.com>

On Mon May 26, 2025 at 12:33 PM CEST, Miguel Ojeda wrote:
> On Mon, May 26, 2025 at 10:18=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
>>
>> The changes themselves look good, if we want to use the `ok_or` + error
>> combination. I haven't thought about this, so there might be something
>> better here, but it already is an improvement over the previous one.
>
> Yeah, I thought if perhaps we could have a better method (extension
> trait) for these cases, at least for unit tests. On the other hand, if
> it is just for unit tests, we are back at using something that is not
> "real code", which is what triggered this patch (but at least it would
> not panic).

Having thought about this more, I think this is fine. I don't know which
extension function we would add to make this nicer.

---
Cheers,
Benno
