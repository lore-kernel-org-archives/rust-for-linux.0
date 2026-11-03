Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706079;
	b=jxs3Nuu3EbAhnzLOuHeaHpxKeXfCJNJN7IetAtD0o5s7ZtfENldC0NGT/rU5xWtvmbqa
	 xOmoBVHmvsjDaR4FHlC60pPjz5RqK3QHF1P4M5o5JwqULaq0vPKBzDUoTVtQ61k1mXZNP
	 k+xUblA4KAiYk7tWDE9H04njdE345SNhlIKfqnGkiFLeSXiS+E1vP9Dhj5ZGBFJLE4wPa
	 aDQgLdEug/pbP5t6+WxBdnLhktVU+z0oSh05I9fURE6VDqPzlECOcFpIaDKIWXordifiI
	 YTonyMDgzUK1ysJ4vsMNrLBfJejejICf6cegcEbirHF25mazzw4Rvd+19IM2Ij3TL7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xF8KPXQW/l1F2OMDbW4b8SXIZxTagK8YBRwglirFNRM=;
	b=XC3DU2fP/T1GmjEIjFv6/gplybuWOddec0zzPbeV+6uwIsFmhgigaluSQ3qvSuywqNGo
	 3dd5OHAdXZFtQFQc9MLs3qGWERAFLqaQ44e+JPGKDqzbad3PoHG38s+ZQIk+OXdnxQ8u1
	 9ILfkW+lM+cAbBqJTKy7Tgzr81i2JvpwKkf9u/zeVPeHOyO1Selnpo/5wHszJtxt1n2+l
	 vvCSnH+CWPOvBkj++010aJourN9CRrB3xBGjSqfuGHQHyhHdOmAa7D2nj0fYrIOwwaF8H
	 0nRCP0HPaEBUUwlYLLoS5yM8k6GP1ies1pZpXLEcuV5xEXeUIIhZFaOfqC9SuquoIkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IZ/h420J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18220606D836
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 11:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18220606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZ/h420J
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a0eecf73fso690112eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 03:41:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793706078; cv=none;
        d=google.com; s=arc-20260327;
        b=BipIfES1ORwuEKPXBG8EEnTa1tAX0AjUCNpNtdl7gJ+3cAihNg3s72IBMhysoAxiGu
         +JJcvePmWMCE9KCqROS636M/DUh76DirkR8YCGfdTSfimTDoquwNX8xzIK+IS9Sawvu1
         ptMqtrPbKqUeJFiuGBpRNvf4SCc/cag1iihfBJoHVeoYgrO7SEQgG1BZVcavcb/RKNCV
         N3KYbTr6ijfLlPMeC75GJMFI7La5AA7vlvmkO/V7CmFtxioxZog2MrsjX3SoY8FixY28
         2ivZtCCkHIlg9Mc1xOOKVdeaOXAKZVRwvLNnyccq//eRTEbZEDkwhm0FQyL44jJxoZhp
         HjsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xF8KPXQW/l1F2OMDbW4b8SXIZxTagK8YBRwglirFNRM=;
        fh=/kqFu3BxvprP7lW2S9iMtvP5c9zzN3RYZHirqn+QHKA=;
        b=HVk1NNBtW9ieGm1IH3x+vIutbJohuP/Vi0hz8cibcJ2fK4W8ss9Tp/vSRO9U2EuATK
         HBk8pxk98+modtZi6mCH+YcEIIS3xhItEV9OTW8Erg0q187TAzpWPpHUAiUv3lUmuVWo
         ukAN3Hjzr7QZKtkBlLdtjL7Jdn5BcG6B3EKhkocqVWylMYIbAs251aZsAN1OWrmKE5ZL
         7tK/ahdZ9bm52W1fbQLJ7IYG5EO+iIS+D3+XCs97GyYTxrNSJ21blfbzzbgROu8x/yTj
         kjw1Gv5WuP0B/ZLpUvCC/PHjvZVEUegJyEWMyhTOdzc8cPHxJ+ZNIVIn7pPCXYZNNxJd
         wTtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706078; x=1794310878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xF8KPXQW/l1F2OMDbW4b8SXIZxTagK8YBRwglirFNRM=;
        b=IZ/h420JkfXL7GZvLOuJ6he1yVUFj2spADUzg8pZ4MFAuE6Jy46fr0YKtI5WjkjAva
         hBpem4tQCott6vJJZm8zAZg22rxmZx+4PIvUL0Bprbu5lsvcP93xPXFFjr2HvR6yJ8PH
         ENSaKTj/roidwhcjq/wS+IJXEKJV2ePGQwOKiM8b/60qyKkTEy+xXOWs6/fn6NcEz9JB
         g7D7s+dC5V65dX/1iTZUtiCIQ6L0A3GP/q+8w1NJyqH5sixl75ghk3ex8esXgZQGOIMg
         2mr3P6VjXSKAacWJtLl+67g3lb+SLIbU9hT2BN5/EX3ftLmCdUFyEqg5ncelVA3DCVq+
         xCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706078; x=1794310878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xF8KPXQW/l1F2OMDbW4b8SXIZxTagK8YBRwglirFNRM=;
        b=SFCmonl+h9ju41FdFRbeLs+F5EACs0N03Lz3KwFC8KyErhTa0fFFtbrDKm3nmdHZIL
         ftrJBiCM5sNHD0omMZlpdb1ZZRyErxt5btP2qo8AcIlXS5QvY+DBQBYWV33sId1OexlJ
         q7goNcTr/4d6tfEfrTufV1yIZF1SidBSUauljsrmh1yLaAg/jqXqdFcTWMsA4EEKUheP
         04ppVZvMwRzzc0+nYQx3vAN4Y0xNyBbQMOb99zBZCJpTLhwiFVWHrXe3xs9hx5449WSL
         wFZJPsEzbAmM8CZWZrNkbV5jYAuKxj0SLHuZeVfil6Q1CjShnfAx+CaMOMlLxkoaSxH4
         mhlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOinqGX2PzYcDJPylgKNePX+gZ00bfeciQeIyowBUmY/ybCIIeZspBMxckatN0CMj4oMwR5S1+epIKfkv7Ng==@vger.kernel.org
X-Gm-Message-State: APuU4Z9CEESThuQLOHFX9LIhbtHH2jvXF8ULSPP3gN7dxcm8wiu9/0tz
	aVsc6mnaHxwITtercQTqvtnzixXNY3Y/iOnfk0rmrWZYtTR4yXDUvTIZprP35AppIbmN+O+gvAY
	RTyui+bUy8Lm7OeHv1HE7zcKhuoQtxvY=
X-Gm-Gg: AYBFou0iYqcwNnyD5AljgD/oYXtJxr0tbWYELiC5nvjAo29armZl5qPVAgf0ORvb8ox
	o6BeVRZvuvll/lvK84hATIaF7ozhlabbgvA72pbQ9EJDq9J8PWlH9n0xM9VUJttnG8DUxmzuiWb
	515sU7yXxwHYs50w/blXb8yj4frhTSd6YJu4jlo3VVeos/5JGA0wSj1oeMPwQZlHtpXPnSRGzWp
	5nFKXlOn1LjBLu8FSMmFq3qKdWFdJbUk18WSfkGvzAaPsb9RlRfuXfYVcAn2h5mBX9DZ1V6HPo8
	+G5q6OluJEXg1z6b/PNTKNtpIxTBpnLKf64L8hmo4ouXmC8jDyvieclGDoJRGfT2yFTIVftbr9h
	IfmKoSSkMhKmPsnqZiUKq1aR9/WpxjpvpU3+XyFbIvATq4Xxthi0UHIl3Xge6bO/pupsUCSeEyP
	SZYoMRjmcVyWW+X3n9ff43u78gc8w48UA917qoF//6eNbffyfL95dN4f/2yREDTLT1Xz5b34FsA
	DO/YWdzq+e3LdFNzy4S33K7Jtwg/PTOuhPPN/pH7yPrad/7rFhmwk78Sig=
X-Received: by 2002:a05:7300:d082:b0:369:ffc5:6767 with SMTP id
 5a478bee46e88-36a4236a643mr25334942eec.2.1793706078021; Tue, 03 Nov 2026
 03:41:18 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKHwh-GzSuLn9dvjnWph_tr6MDa4nZnjc-JaMy4PeqnNXDnaMw@mail.gmail.com>
In-Reply-To: <CAKHwh-GzSuLn9dvjnWph_tr6MDa4nZnjc-JaMy4PeqnNXDnaMw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:41:04 +0100
X-Gm-Features: AclHuK_Jen2-hcfaHSJ1Yp_sQSHJT1zUbaplJF7JMWFIUAm-y5cC-e37DF5I9b0
Message-ID: <CANiq72=T89-swC3BK0LxcdR2ZxAGtdPnpPWK6JFxjL6Fe2-jWg@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: test retain ownership and mutable predicates
To: Peder Bergan <peder.bergan@gmail.com>
Cc: dakr@kernel.org, aliceryhl@google.com, ljs@kernel.org, vbabka@kernel.org, 
	liam@infradead.org, urezki@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:21=E2=80=AFPM Peder Bergan <peder.bergan@gmail.co=
m> wrote:
>
> rustfmtcheck and strict checkpatch with --no-signoff passed on this draft=
.
> The draft applies to alloc-next at
> 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4. My validation used Rust 1.99.1,

This is not a draft anymore, it is an actual patch since it was sent
(and doesn't have RFC in the title) -- I guess it was considered a
draft for the LLM when it prepared the patch.

By the way, if you use `base-commit` (which is how it should be), then
please don't repeat the hash here.

The other procedural comments apply similarly here.

In any case, please do not re-submit this one until the maintainers
take a look, i.e. normally you want to wait a few days or a week
before fixing nits etc.

Thanks!

Cheers,
Miguel
