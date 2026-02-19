Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B1C2D3EE5
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771491269; cv=pass; b=qoUnd1mkJhxmKSFRzZ4qrm8Gl5fHQKyQugpkO8GWy4r2hSsrQmroQ17YKGXb+RH1tFE3QnDAekIBF5+ePy/fH/lnvTR6xNWbrbZryFdhIioVEwXv0MClRZdqd9utGw82Zs4uWb6N9Kl7OdpVq0agOlYx967d6zh7BSVffqgUaOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771491269; c=relaxed/simple;
	bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pexUr0OFvNeB/mvCW2OCL5vGcaWyB9xL6fgUrcgk+FNDcDhBDq4fhxr1s9YFL+OpPW3RQi6zf+oF+4Ytf/NN1NbJ0C7bAYJMJeHs1Ct7yE7rbolTyZBErnY1j1fItshR6dH/AhgeLzNdGYfG26eWTlHj1cYKnifQyadPVb1TNWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sl9MlyI/; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl9MlyI/"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12736a0147cso52702c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 00:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771491267; cv=none;
        d=google.com; s=arc-20240605;
        b=egoOMYErXuNx56DCS4v2HYAtNDXgUbjRXebeuClMhksx5/k4XqwYTlaeuGqxATAtzM
         GRfSqKiJxXC81MQRF9Ms2h0z4+s7YW0nskOFc1Q3f7C3+rPrSwaF3qI0LHm1BkM1mfwl
         /UlB8IgHt8y9bdMSjew7ltBQsT+fSo4RA7MjVlHbb/p6hGbgTKfFBQ59sCfKQwDONeiI
         +OTXDbz2BRSOkYhUdg0Wf7I6A+tqpgH4XYjueelkzRiTE9K/DiF6IxGxVaExhMPI0mfV
         sg+yuaDEs966C8OEcZi22zYKihOpE59TmkrDcaeNohztq0zdLQyBHphB4LO7hydyqgvW
         fiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
        fh=Lj+WLGwTOpr5NME4O91Om+EalC96qorj+qvNIoVB7PY=;
        b=lC6Pa/UZkCWNLouaAqRSckscX1vfYltkeNgwx4qvxNBNLWAfa6dSRDAyv6eiWTkMjO
         caV5foqjZL9P0DDYXhiAhI4DriL/6gEYu6/8pWhM8osxdsN4d37U6lAYnWdz9ZeJeA78
         qzminxD2LS6aSxrg8o7Gm62SGyG2vKS9hUV8mFaVYBuiN19RyUZiK7xecG1zNVQVAjxG
         ZDecOw7qJ/FPtw5usIjKIG9JCuI58NeUh0ocJArB7+9ViNkNCyCeSsWIxiPc5j9Hj7PI
         7bOQoGLLMUbnHju12uCGdxbSLhZ4hAMMCu+Qo1YwBqJ8HfzSc29W2HWyntBpkqEkHMni
         MkZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771491267; x=1772096067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
        b=Sl9MlyI/uIqgF5rEYqPvT2pxyLsZu3P1sgyGal9+P9gIZPUFE62QNARoXbIA7iwYFD
         fCsO1k0N7x1R8A9UTFh8DX4AAO34CP6W9d4n73IXD7qoCgrmQMZDROkAOi6Jj2M6giMw
         XcYSJKQLzp30BkBcHjWt49wkvIoMz8I2UB1ezVkQBHeRc2UdoHzLavMw1EyJHNCQAZxX
         CNjnbbdlrWIA3EIBpvc04I15D6SUjB/5OELoQe3J4rYHq4LYF50UBfgmxvmlznUp8uLQ
         7rruYXP8S5LrX9QndYyXIe+iLtPJ/yGbSwP4OKmCyiylhoV2Cky20jrxdJpNiPGtxLI2
         Wctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771491267; x=1772096067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
        b=kiBZJgMwU2lMOXtlRAbPpkxTtbNgYJwT9Fyjgk+ALU6nsFYVHaGfr1+Dr77CgiJO9J
         Wmi84YfXsUYWPu+BEPadiET0UpcXOaaCj3L3yHRsBH8t2dz3KxlvMbxzqKCiS1/7IyOH
         6OnXeqDtXpkqZvbz5XORsjsKmYyPkcc3gvYugwY66eYX6JR8qHvHqRpdTgJaE0Kgf9FN
         Pzchvq8DcVJYYDgGlVTEApsWKS8rXJgQUnAixmo7dxyL9BiWQMvIhDNZtAwYI1qXr5rR
         xJitF4rnDNNpth5r2rlRHQu5ybBM2H4F88U/TXm0RjsMene9zNKa7wqcCVZtrgrUCsdK
         nNAw==
X-Forwarded-Encrypted: i=1; AJvYcCUfOyBCCw9pcuW3l/VfqAypnjZNbxOs19B/1YQIXk71MZ4S65Hhd/j57ORDhs/qWmiMwnFcoSU+6KJ0vPLxMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1sfUfeBbW8XHKNY3rPR5aIAceXOycrdYdCBofXcWUaveaaCmP
	c/Tv7Y+CISxMlL9RO9PDq14rf6YAT8l6jf68Qf3gphvn9W/JQWlWaPfT1XiDg9syByYOfT9cDok
	JrAWHOATAFql6nCY+K36UcEnT9E0v8Rg=
X-Gm-Gg: AZuq6aKgJ3d8jadAcP6geAxX2gZDBez2wV2TtI4iOl0WHM8McDkPrpR6RnmDDqOKG3v
	T/PyuvYXXgMBUrA6KGcguqY8tZnqbaBOYwqxSIoNJgeZb75p+r5WIqhthnKJb5hbOPVs8m9uy28
	B8bZpRBEtRjil655EmDL33CyhqzoyyUfyo99Uj5ZN59ZBuDe+DQO78G/tvOFy9jfaIKaOVTWh/o
	iQJzllYd1FLtzENOahpnosfywHfe8VgW3suNWRstSkL+i1rCICsx+CDtHMeJU84svqEcMghqHBG
	lrhhEJnYSIxLvRwe45LBM3lsWwa1TrQDUJOKAuYrQx+oDz6XfkHNDFyE7IhuwUe/AQbfjf4/r1f
	8S4bHjciwnDGWFekK8mr31jrf
X-Received: by 2002:a05:7022:419d:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-127397d8800mr4979968c88.1.1771491266834; Thu, 19 Feb 2026
 00:54:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com> <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
In-Reply-To: <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 09:54:14 +0100
X-Gm-Features: AaiRm517O8N5cgdFr-9hA2xKEEuwUHYT4nDXwLjBAL8577hK96CpY5pCEg8UfyE
Message-ID: <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 6:13=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> rustdoc complains that this links to a private item in a public doc - we
> should not mention `GpuBuddyInner` here.

If you all think something should be mentioned for practical reasons,
then please don't let `rustdoc` force you to not mention it, i.e.
please feel free to remove the square brackets if needed.

In other words, I don't want the intra-doc links convention we have to
make it harder for you to write certain things exceptionally.

I hope that helps.

Cheers,
Miguel
