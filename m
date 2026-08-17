Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C823747045B
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997650; cv=pass; b=l15WXGD6bgAGYd1Dgp+T1tGZTdM96Ov7jxd77DGHIlH4sRMxzeO1fkAplvEbO3HZ/yWMAQ1yBxfRgw3dwwlpf4PS4lmJqU6mKxpQhw0wGwP8n8pfwQWiRf+R7npFYhpzoszInLL36pTEgUr5Ast42YYnyBQXELInyPu1YufUtRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997650; c=relaxed/simple;
	bh=XLVsMWdtExaM9s+oU+lazgOsPzVgtcsSdhrjyJ2RQxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWTmy24i0yLffGnuspvNJxOHaf1Nodm8nBzWdv9sfwyWmmiqy9ISDl3Tvd9wqpbniFF0xmeIwj6CT+OhcUy7RuAjV86FPQ8o2RvW2F4R5c7pfJlhmAcAlLkvWphiz2wsX4+HsMiN1vBFaKZa1buqY/bc9R2pJrqxuRv25uEKwMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJgywkla; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJgywkla"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cace91f112so44757005ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 13:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786997648; cv=none;
        d=google.com; s=arc-20260327;
        b=nWW6kCq2awFYo8IEW3IRRjqtKcAQN3qaydYCtnfwoa6XU+2GnL2bN1BBfwPcRD2Dm6
         jBghFCKVcVzYUfUrIpCF7WzT2ISUQvmSzJylqh6fckiqYtfWHUBpWNoCi27RzFn02QOB
         ksifSVQw3AU8Y4SChA30wCd9sI3KEL0FJhEe8ZgZWCSCu+eg+BD4oxImvbRCu6rBsQDf
         AsJmPFdrzdKQ55kQYz9PCpUHMGwJskp7OI6pxH355Gq3c392dFZHqppEAM49gvK9NhXd
         Hprcg8Jy9G5gTgqBqFjQx4QpIClvj5MOmIr/7fCc6XlR1ZXydvGg2it4p0CMLg47Nstk
         gaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLVsMWdtExaM9s+oU+lazgOsPzVgtcsSdhrjyJ2RQxM=;
        fh=1F9mJEaiwnHGNcGczzIu7hMWLHjC1VAH/o2qGPFNHqw=;
        b=VPNDNb0FOHhwTHaa6Xg76fcSb6jPAJ4YYZP20hL4kUtAuUyqvsh3WiiB4NRTWSawS6
         zXTyCaPUIi1sR2VYRVqWchfvYxP2xTVXGK851cE6EYs9BQInLnuBbCK6AIL/nR6GcNRv
         tahqeFDf3RHB2xMvLd0gIrDR6kK8wREjjelhBA6PnNXvMbhBqB1xAxaCkFmWinnGE/N/
         12ZPqfhiSYHL1hf4BatSM9ikmk0GHUeBopvdRNuphGvuHTgT0JBzo0VgBcvZpz+vo7Ml
         OJEw2zYWWI523+wVoenr4uv0XZNpj4lhBhlaYC4eQmv8qNO7W1Ytwqub64npLLrlOQ9B
         9dlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997648; x=1787602448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLVsMWdtExaM9s+oU+lazgOsPzVgtcsSdhrjyJ2RQxM=;
        b=SJgywkla1SjeyY6aoVWA5KSksL7HEW7c+2mQ7tTPNzQdyvArdOCGxpquR5xpP+dQVa
         ks18Ehj1HMxawDUQYyDPoE6I/K5jC9m4bBKFKOAqZcA0iwO1HPUV+CPClIfJp2AQHoHK
         kZQZd1LLmo7lPG54NNXRC+fts2BVPUnj1MClUudgpdxR/uwmfloA0WHHRB1XNPrUlLVJ
         6vRfXEZ1XGd/VKll7Qo8heH+PuUnk8TbYh6/Fu6UqVvZwkRdKapqzERhkvkN8uY1/DER
         BFnR1mJ1zmLjvDJqD+VHfa6bIg3B1oAMRN1PGUp2qHoizT1s6rt//A8zn32oUeDw4Vqx
         h93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997648; x=1787602448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLVsMWdtExaM9s+oU+lazgOsPzVgtcsSdhrjyJ2RQxM=;
        b=X6NvxYe2hKmpqlT11nD53KQROPrZ50IQQVPAbXPe/3XZLi/eVFLiNJry862ULmi5Jq
         tj4Yot3Na5urK26hRK07mBf0hZXmwhENbV9SjLcBob2D0vuByA/zdjFs0pMaEIkc6n0g
         Bla9n2/U5jp4KiZukMLoShiPCymcGjC+V80qOlHoLFO7+WA3aqBn12x09oFAeY8dUehN
         jldJek4RngalbxyuWbI7tIgzx465Q1UclAh21xq9hWAl9BpDEHUH/5O4bYsBm1v32aF+
         5s6mIIGTY9ucO1H0ojUYg2XfzojA1K74vjN3LGHIjpt5cXf1MWEB57wJr4xWfbKM6yXy
         nKcA==
X-Forwarded-Encrypted: i=1; AHgh+Rqf0UjeIi6HgmoHd5hOkrIRn/kXTffriMGFLQe6pj339jKKcs1S/NnFkBusDUPpWq5t36ThAcAGtmVe/ZocVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Setu1dLKubdlhf2dZrSiKz5CCkrsCl2/h6Rk9rWaPk5vwI2q
	tOs4jAg7I/SioinmvHDbWvtmGTeq7G99RbSvEnnoga8aMYg0ZtHCElAtrxrXgMu0h6czqSqsY10
	hFq7mOaCUmAxzzurynn4TSc7kghZTVs4=
X-Gm-Gg: AR+sD12hd5Ba1AkmdMMEYLXZpzY0Un33QVJQ8bc+6/g8uohpdVro3ICvZEN7wL/6oln
	RzR9MmG2+hbJEFnP6EWJa9id8w6osqpEM7SSPisK9K7GOQaiIj3/lyR6k7kSwDSr5DLsot0fKL6
	V/bsrXEfcSOVbIb4D6CHhwrFMQiBBYTllDTST6xz1b264CT7SWWCU6zGRGiH3KoBM2N+r1pGkzg
	5oWo4DM+7o5ggRsA/LXtSwsLBbppGrvXe2DaFDwxbwkuUycvlMHq45XUfYXrUhnHGvn02hCo3Nb
	lTFz8/yXvZRUv5g5/HUB63icZgCcaL0zmxXsjNyB4sZ3EHLpwOg0hPpTo1PQuxaPtIl5PazxlcV
	noceIPInTMLp535sc9WLkDe1YGMldfw==
X-Received: by 2002:a05:6a21:150c:b0:3c3:af85:85e7 with SMTP id
 adf61e73a8af0-3cc72094353mr31538761637.34.1786997648060; Mon, 17 Aug 2026
 13:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 22:13:56 +0200
X-Gm-Features: AcwNN1VtNSRUVX_S4c1aAwvBlBumGK9sX5NggnTFPh0VlTehKX72W5UNOW-1T3s
Message-ID: <CABwQupOTqnF8iSccT+imXKeOBbTxeUWHR--em3C3LAnwVBwWZw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] rust: id_pool: take a NonZero capacity in with_capacity
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> There is no good reason to allocate an IdPool with zero capacity.
> Reflect this in IdPool::with_capacity.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>
