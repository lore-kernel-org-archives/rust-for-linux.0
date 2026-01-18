Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876ECA4E
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765558; cv=pass; b=g2QDK0lI9sFHGqipc7YztXhdvLgHkh0ThhlgQsHAZ0GxPOXprEDlV24HaCj/SoziE5YaANbewztEEPj66xyg3a7+oX35nHfMZO/XHlXBryvLQGDX1bhBZAnOtod7ueSgrxkbw/LQt7QZUYUwsGSoEI34Y8AjD/xM0or6bLGc4bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765558; c=relaxed/simple;
	bh=KVHaohjIpkS8RF4XW8vpNt+aWDOb9cyMHNvbV9tdgrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+ryLaiiXvfwws/az2c1goA7WQOzyeJrdc4MLe61ejMcD6ZBnXOtzJs4dYrkWHCiZaMn/uiZFO3cMnjCyobDpujYeUGZAjH+OpysK/8TQ1JEZ3akn6GTwmOkFi62pYAcrtugqEn3lMWTkzXeS4USGN8lbu5Y9yyIFUCdgZpu3as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1kGETeY; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1kGETeY"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6c1ec0dd6so182551eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 11:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765557; cv=none;
        d=google.com; s=arc-20240605;
        b=iWFfkiQL8Hqn7lxrQHBCT7bnuO7Kozvl9Sd1NhDSWXsrGVa0xOO4DGNaSTFXrCHU3Y
         vRjRxBcylzAUI5SL9dajtnlxm9htv3LZUsHwMCO9571ZqJfvXnD62DCP+7CZK7eaqq2v
         HjNP5zFGO9OtITojYJ/plyvGNwMDTae7SKe5CMHYJgMxRahmIQKCW1QtZ6gXRn7bSbf3
         cAp0t2SMmQyBC31OERr0FpTcRQOgFQuhMLMaJ6p+9gikM/UE/hX+EOx2YORf7IPbHtFs
         QwOMeN2CW/8CVN3UZeSGn0C2Udgvom1UwA92bZWyUO3akQy5W5lZiM+Fci7pw0zooBFH
         s19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ngLJEmbzzfwIyJl3HgdWne+DdSWDFYCnHseYetxWc3E=;
        fh=dkC9AT/Ei6pbrHbyN9D/mPpOA/c/rx299Pp9mrscZ6U=;
        b=J+0hU6RyPYX1HQA6pLOITAO6hX60B9+xn/LeZCb+quu3JWwxEATXI+kIUo6AyzcSvv
         v0YjT2tFXVPnqAAAscxIZC8fmERnIW2LtBZErdp2PTQT1wsFVV5YryC8/g3dO6Kc2ABU
         LWa1s2QJ8sRIGnDlgv1SGCx0ezoWy/xFxVU3HUBfYD9NMqNWOLnP2c2M1wPu1uaGd4az
         UG3jIp8LvT/OTBWNzyaWxxKEOOLEdfG2c7kn+Sk5nEjejHewqKL78++KCCMnpTMKSB1t
         irWKAZ10X0oNlBGnyqAeTTlClYnNK+y7m23fbt+aHvY0XsNYT1Nl8iy+cVI7dwHgHlGt
         t4sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765557; x=1769370357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngLJEmbzzfwIyJl3HgdWne+DdSWDFYCnHseYetxWc3E=;
        b=a1kGETeYn96vfAtUMnq3WWCUyDjZfuOjIYO5KJfsxBT6XOBL2QZUW8WlSERfWCZ+4R
         e0ThKDKGRjJJDvZLq025pLtHvGAHBPFmGRlh7DLTdTbQ/q8qqCIl1Gja4gWBeKDzzBei
         04rmBcVo3YV5C7B4iUgHbopUVNusdCjvLjJDb8khHlngeQtBAtDmMUm4FgUMu28bMWI6
         SY2xT1DgfE+DjPc2xE72ZtSsMjciuJlnNaa4WYlOhU0KmbyL7DKEeW1m87TPhiT7s2DD
         3vLQMsnPtUnwrWHMlfJxSom9JF2UQtYpwmz1VfWTEAGzDq9Uxw4ZC9RNpAepSChWYcmW
         Ar1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765557; x=1769370357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngLJEmbzzfwIyJl3HgdWne+DdSWDFYCnHseYetxWc3E=;
        b=RmHhNwGawl53XEqMXBxLLWEKav72cMMpBkJSvRQtzZxD1uf9VkSX0lbefzK+MGW74L
         VMAA3l/uga+mzd9nywdUOkXsS9pkYZNVlqFqrWZUvTO3wWLFvtzRmtw7efripG3Zm+kv
         1Dcx7HK9yqK++/w/7ZkIA7cd6PhMM5xHH5OiFIP0mw0NpVSph6bflSkQAxaE2Cw6+t8j
         Ftm5lo9OBRt8An4WIQOw7pcT9HipV20iuRcVegFSvziTEUwGI4IVb5cK+WzpevwQtm9S
         fghId6gaKYftVIYXH5B+8gOIblvOWioJKVoC/Pd9wOYiRmFCDQu/vTgWhh2QzNrvXaIW
         aSGw==
X-Forwarded-Encrypted: i=1; AJvYcCX/8dq66sxC96AcpXN64JvlF9yJRaqDQjUD1PDvHlA7mSEUN4XqvuvQYO66TJy+Bjkod1lldzVyHF0/7NT2KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeLW7+7lUC2s7yZd6yi8zWf1yP5p4fJGrIL37erQCPagyItiJS
	GAdCEFFsP5M/arzwyqko0yCG57iKkNh2f4fvDWeKkBXEOI8chqboQzYNeZ1UAwPZFKnN+o/sBrW
	5/My7wuLYmgtL6eNhHRuA3C+iB2c0FUg=
X-Gm-Gg: AY/fxX4TafBrpcGQ9tjypv/FqC5mIC5RZUVM1B53JWGb5jsfBWsTtLQ2IyJCwrqGYX1
	zlLtR5ZVdX8XlaP9MC+cwvFnexJxwhY4kE4mIVL0BD14iww9I66bLxFi49Y+AJFf+owlqmRbqTa
	6LcTybMAzyR0sTfzZsSjS1JGj6yOQcCr7sCKitwDqIY87qmAENRo7FLWQnF3sCQH9oVxF173Njq
	NNcxrYhUovGAgj4glqrE0S0O3BNXKaE8HeiXqET8KkXobnF5ujcpuostPHnJtKpaoiaIwVtvZjf
	Ys3ZlRl3WkQ695cDCqZJ5M+KPjvQxsfxDsCKnrGboe0jIV+JFh8mqL5Qxf0nXdEqk1DbUkkknml
	OrfR769HBsiSR
X-Received: by 2002:a05:7301:3f19:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b6b380ec55mr3935044eec.0.1768765556660; Sun, 18 Jan 2026
 11:45:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208-io-build-assert-v3-0-98aded02c1ea@nvidia.com>
In-Reply-To: <20251208-io-build-assert-v3-0-98aded02c1ea@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 20:45:44 +0100
X-Gm-Features: AZwV_Qij1ytH7g1-A1PT-QCFQRqVSpKUckCbAvhQA3vEU6vow4n76J5rAgj9nXw
Message-ID: <CANiq72kvMp0KS0wXGYRiPOdNvJLoBpM45G7BHgPF_g-M9b5t_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rust: build_assert: document and fix use with
 function arguments
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 3:47=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
>       rust: bits: always inline functions using build_assert with argumen=
ts
>       rust: sync: refcount: always inline functions using build_assert wi=
th arguments
>       rust: num: bounded: add missing comment for always inlined function

Applied to `rust-fixes` -- thanks everyone!

The first one I will apply it into`rust-next`.

Cheers,
Miguel
