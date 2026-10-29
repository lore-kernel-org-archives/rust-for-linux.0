Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306631;
	b=YiGbRNm6jCVfj3tt5AwXDX9jWlpoXzXxmB6mg+ttUe08OyTIKwwL5GD0qpFttVRi7k35
	 M6S/Ena9xj+OMMSypTDKgIaB+FL4sHP8XaKyF9H6wb0jxgoZMW8XqbW+o3sBe2yfnEA0v
	 PPNf5UjsjyuPAVEfo35/65UjLYqXRLpb650Lfb1XJwM+JGX94mmL5dtKpmJw7CNv51dug
	 U+2Ckz8ZLHOfxmqaqqIn6OB4WEh8+au4/QH0dDTeF5R7AatPy1i8sIlB/PAuXdUkaiioH
	 mVQXtw61xmbt7OI6m0Jp267+bUWNbCkBJFuITU8Q6rwIqGcBLUa+9MKmEJW10RnPN+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UbmFjhL1Yr1IGodMB6f7gL/eg0MWJVKXYMJM5sJ6SX0=;
	b=nNOlQNDw7yz2UPJcO0v3BpmWKo2NDXkTL+9yyfJ9zroJZB6bIsneCzuhHVXNhvIFEiEd
	 9XzN891u4sWicXZDHKewmf0zWUAN+NslBJoaY8YQ+vkH908DzJQRUO8LWwVAn9WtlM4NS
	 1pxfJrfh84uJQv2FiU0/NnEpW0btLwpaRjTLsKZ2V0FlReRIHotESgez05VJvwxXoJMxM
	 rceevp2gAah1FAaXdkfRZ8eCGrzGR8LBZJSQtiTlhLSA856fC2rgWY5+bx3NgnY9cdhAZ
	 bfd2tOirtqwGk8jQlPQQepdcfRaggQw2TbV0j6X3HVXKHBdJHTfiLzNDAAJ/Ljp2N+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EzloVelJ;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579D606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 20:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D579D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EzloVelJ
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so4442447a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 13:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793306628; x=1793911428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbmFjhL1Yr1IGodMB6f7gL/eg0MWJVKXYMJM5sJ6SX0=;
        b=EzloVelJMpFvlgCSyB3rzHG1wJohLuxYC7EDLh8Moda+0MKiJRmOAcyVC6uAV/Mng3
         T3350d42T8eqefdtCVVwTj1GNdqOitmDib1LjHnzhuvJlZh+lyYTB6nKZra/aAVSf2ZM
         m04RxrUr8K09nypIknQfqGQhUzkVeu4jvYkvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306628; x=1793911428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UbmFjhL1Yr1IGodMB6f7gL/eg0MWJVKXYMJM5sJ6SX0=;
        b=rejHqXl+eBsnRVeaKPAQFxCnx2l2mVVxfSODiYnMllWJheiGwxRelzh6svaaP7xN38
         Ecu6PFk8W3kf8LbADvn6SSBe3KjZlpxWIMDJm8SnQZQqOXXSzCR5qZ6YejQ/W28mao8Q
         aZKIDYr+/0PiqGgJeCI3KWn2MGUi6qQxsY5ol9wRB6It88zodM40pZFJMxXqlDjHviPy
         t+ORPo6Oy/3Jp0/yOZJH8P+Nh9KWllnI7eKeZGUHSR0yf5zyZ3P2YnOMueOIJUk1aRE6
         FXRKeJ0LzCZLFpgVL1KI1ufitP+1fuuP9N6V78OcCqdaNuxApZrK/lg8aDSLQmdwREC4
         H+NA==
X-Forwarded-Encrypted: i=1; AKwUvBxIvtRAQVAOlKlUuqllJ3iuSygSnGuSBpmCTsP790KWHcZpfZcIYjIg/8Zb4Nsomm5eQqYgOV6f04SwKQ1Gag==@vger.kernel.org
X-Gm-Message-State: AFq9FYKxB7z6yoU1pdkGEolpWrKH7zdMJhcHt3EpCazzUNQgFlXDTzQ2
	yWusfzExR/Argg2s8lGXaXwTuXCB30hpMQBjppXN32Zz5Wtyg2YX8qx96NGi/g1Dv/rqefPksVs
	EtuS1yFU=
X-Gm-Gg: AYBFou1S6C2ubIs+qZrR3tnN8KKxY8X35vnbj2f88/GrR2hSORhQ/XqeuJ4Q83Vjkmb
	3DDa0B5GaLeuscT/g4TB3quOXGBxdVrHKJ66oWxbEwy8ABJUqZRVrUCEw1YrCqGVLkfybOWTLll
	LR0w6i1wLVx27ix6m/KUw1asdEO5alVCF27j74tDlgSL6AgPlstq3/DBMfTkqh8ITL3K9Si+n3v
	x82lDWi/cxot+LsbLlBfmEV2ipVDwMH/Xjs6k54ZfKS7hFqfNgsQAccOcvUFhB7xl5PXje8ZsDz
	zEt2FXTzd5B2VaNxAt99qhw0JudJ8I0OVZJj8ZcLLPd603zmqci9waDYJ/BRW4/08/wM5Oig/6N
	NF9qalGz3hNL5eDxiapKRu+f1QOgJcuL5JGVyhdSKmaE9HT230c5iZv0BuFO6NYlcNVEEdGwDrQ
	TtQPTuoazwKUGV/DrUYFzS7LK228aaMEAReRK4/9SbSkMzQF0unfRcr5ZsqGJ2Z/uIYMt1p3wO3
	67wSq7yP9XkiPTfO37xdgeRmhLksPhE+h284n0sEWbKSliIWHGFtRKZI+7LBdhANaFq6NS8bdiy
	XdfW6exbGJwuijLzoEImJV0UAY1U579QS1W23QDInMKJQdaipCs2qCyKsfyUZNYf41VU+BIgZch
	k77o=
X-Received: by 2002:a17:907:3f95:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c4ca7a96a37mr21454666b.38.1793306628247;
        Thu, 29 Oct 2026 13:43:48 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca2de3bb0sm21453666b.5.2026.10.29.13.43.47
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 13:43:47 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4682977f9aso333671766b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 13:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzrQGBBTmMABNUQAJjfVXOqnHMYTJfVNiZQzwgJ4jfxj8My7U6EJqzJr+w2C0hpMJQDS+Of6+SiNa1YNvbNRQ==@vger.kernel.org
X-Received: by 2002:a17:907:96a9:b0:c46:2a05:b257 with SMTP id
 a640c23a62f3a-c4ca7a4066emr23266366b.23.1793306627099; Thu, 29 Oct 2026
 13:43:47 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180116.49074-1-ojeda@kernel.org>
In-Reply-To: <20261029180116.49074-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 Oct 2026 10:43:30 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
X-Gm-Features: AclHuK_WekUyoZUl-q3rSVga5UWQQ_ZOCnmNxHq579Z3ukDBrM2pBi2mbGQaVpI
Message-ID: <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 7.4
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 08:01, Miguel Ojeda <ojeda@kernel.org> wrote:
>
>  - Fix KCFI failures on every call from C to Rust IRQ handlers and
>    'hrtimer' callbacks by giving the C enum bindings the correct
>    'cfi_encoding'. Also prevent the same issue for DMA callbacks
>    taking 'dma_data_direction'.

Bah. Is there no way to just get bindgen to do this automatically for
all enums? Would that break something else?

                Linus
