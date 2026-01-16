Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA7337BB6
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 04:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768538156; cv=none; b=OdU0j7Skk/w21W8S9T8fqlmMcDyuhkh3HiU4T37w51ECw5hzsMA60Z4hYT0Up+xydCaVWV8sExEUInlKgJh5UD1tduulxiD0Zn3irt0ErwdddQz6P6SQNXft5AwhhKj/pBSHhh2lpuoE6sQ34JCprT5Fqg0Cqmq6qjsxW+W7uBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768538156; c=relaxed/simple;
	bh=DOwOAovjqpLPTBvXdRwjrrdCPVZoTNcm8koWtRr+W+Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=e3B6thlvhe77B/AS+aHyj4HAt8ooHFRJyZjbt3BDEdmNALHWiNLQUlAVa4LJaO4/VGp9oVEcczFOsLyJqNv6eurnoeoodyke0JgunR6xntNtySi0NNJUIW+z0FpIQaV03p0cyi7zt8/W7+pHvxK1h7MVm15qlgCnwsAwlNfWh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDPXTuY2; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDPXTuY2"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-34c84ec3b6eso1386505a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 20:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768538154; x=1769142954; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvxU2Xo4FV8P8Yq9ofhsreC/go0rgbArc3Ohp8dUkSU=;
        b=NDPXTuY2ak7+2pq1aJ32UDRUbLT3QHGcJ19Z6SOI0NKj746sE7zwGdC0YZ4gddpwHS
         q4eX2OyZ6gy4xsjs0sn0Bb0loScAZpYwl1WgoY+oAh4U3LR2kzAq7bEdRterz1bO2oxW
         cS5PrkuTTunxI+YYHCWzff3OFWYp5ECtZ7yUZDGuVXEL2yEYDKmKvzIL9MrK7eQelSEl
         pmpmi84pki2basGW1grVBXjXTNetEomIlrDzBjn2sRxPPlO0PCBCU7TKP9uqkjE07pYi
         lYe+lZlGPKHSq7t+eD/RFdbSE/kc/KhXi7h/5B3J3r8jWGsJmaoYxkkknH6XdN6k148M
         AP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768538154; x=1769142954;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvxU2Xo4FV8P8Yq9ofhsreC/go0rgbArc3Ohp8dUkSU=;
        b=coMs26zfenfPFM9z8wkHJT5SeANGfR+g26L28gbo42BeBX5zXsyppHHsZtri82MqgW
         marH3b+ZCZrMlXtH6S/My/3Wel9aIBEFElUrmez9dlzq+a/2owSyq0lzyHJDQUOvHGkc
         3GCUHGrbql/mpKXpw8NIGGnPnOO21n7b6394oKlB6HcVgPRDV/7uZQ9X2CeU+bQxGcpL
         blllzuxQWCQtw15pt3K1b5pfts2P8QHnjUaZ9LznQoYpgJmXYtA7VEzKzVhV11hOG5BC
         kFWGsyTCbU2KeRgG/O826znq0/1LS5TYGbC/swcm48bvAt5IiWbf+G39SmFWUev02TTo
         Ozjg==
X-Forwarded-Encrypted: i=1; AJvYcCVSQDSP15p6G1d58VF5iFCqHODJu8YvOW29Xk+Jq5l9tzMK/ZbrPaASToCBFw9TIkUe68FzhF6UyxBLskvxOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBrJ8TbSE/1UIYFGei66Dufbm56GqOiBS4vRR3ymhYMKcFiyB
	teiFA/N9FOMweolYqvcpBWsMdVFbTzXHJokXv7RPNg5IXRhzvyf6MQ8a
X-Gm-Gg: AY/fxX4UDINmSdjl8ZMPbVLMKPx82mhrYMbS5EgCC4xjLN1yoUVowXjLSYhu8RB5LQE
	FBRulxYym2K0QSdgHAeJUEpKKJzigsOHT7d+InMt4Qo8wVGGSLcTnC9nEbIl2Vl/8Wjtjm6MQLd
	axaZ8f58PQTWNix0J0k6CIQL3+fGCAbKs5HjDEUW0j1hUweN+wsutYh8MDifUu2klVoz6kDXD5D
	58jVZOi6kXLBk2FKrpPxQ3BYjsrDWq1m5pz0He0W1Je/NF94xWBo9P3hjLcGEkDpM5CPZ+l4NsS
	2YskroTCHgHRfzDFzrZuzwr0MipoR7+KF8rYCGfl2603Q3OgHGWdWDXXheF0pip+JAmtNSKZ67d
	gB4qiy3SjYUiGZLqynUzIIoTJymfjquyWYm7YPs1JAGED4ME4EbOf6J++xSSNKxmJbnTjwwW0iq
	nxRi17GmBv/0E0BaEg
X-Received: by 2002:a17:90b:4c92:b0:34e:7938:669c with SMTP id 98e67ed59e1d1-35272fa8de8mr1493475a91.25.1768538154497;
        Thu, 15 Jan 2026 20:35:54 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1291fbcsm793393b3a.55.2026.01.15.20.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 20:35:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 13:35:47 +0900
Message-Id: <DFPQG929N5CE.34Y24PGBZN2ED@gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Jesung Yang" <y.j3ms.n@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Tamir
 Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
 <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
In-Reply-To: <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>

On Fri Jan 16, 2026 at 6:22 AM KST, Miguel Ojeda wrote:
> On Thu, Jan 15, 2026 at 5:35=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
>>
>> Rename `core-edition` to `sysroot-edition` to align with the naming used
>> to refer to standard library crates in `generate_rust_analyzer.py` and
>> apply it to all standard library crates rather than just core.
>
> I think, in principle, even the sysroot crates may have different
> editions, which I think I used that variable name.
>
> For instance, in the move to 2024, it seems all happened at once in
> 1.87.0 in these upstream commits, so that seems OK:
>
>     0e071c2c6a58 ("Migrate core to Rust 2024")
>     f505d4e8e380 ("Migrate alloc to Rust 2024")
>     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
>     993359e70112 ("Migrate std to Rust 2024")
>
> But in the previous move to 2021, `std` moved in 1.59.0, while the
> others in 1.60.0:
>
>     b656384d8398 ("Update stdlib to the 2021 edition")
>     06a1c14d52a8 ("Switch all libraries to the 2021 edition")
>
> Hmm... I guess the new name is fine, but we may need to go back to
> separate naming eventually if they get updated at different times next
> time.

Perhaps we should introduce `std-edition` and `proc_macro-edition` in
`rust/Makefile`? Passing those down to the script would make things more
future-proof.

Best regards,
Jesung

