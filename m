Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDDA18B476
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526155; cv=none; b=DNeoG0poHL+ZgFYvH0eBW2uce2nDNmqSRZ/TlZcrzn5/jXNmJw8JNJx4gFUbrHSrWf0bMGX3YwmF2UC6qtMNDsIgXzY25TjKwVdEkKgf/VFPr8Ur/ym85urJHgsD4ISjL4lr8Uq/0ZtOm1++0BlhGD2wtVDHt6exqeuPyMlduR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526155; c=relaxed/simple;
	bh=0ha3COx0DHOj8uxVj0+IXNOyCOzZMIKeCo7cSFiOZo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WOjZ+biqMWfCtT5u2y5hygCAClvL23Bv2cqKc5kn24P1NyZbx+JA+LrYD2UXNBU87LTwvtz2mJT/agBa+wgMlA5O05smFZ/GblIzgpywUQq2gKX++YjOo/wyNJ0AwmYXFNYgRSnni0uU7nXfHq9/qLE66Tf02McACCDsHhGBy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y8xcS+tT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y8xcS+tT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38231e9d518so2750565f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732526152; x=1733130952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ha3COx0DHOj8uxVj0+IXNOyCOzZMIKeCo7cSFiOZo0=;
        b=Y8xcS+tTTWlf9/6R6RcIHXDyFyLx0NYP3v7Qp6LDlZunXveUB+nNcRMOOfqG46QacO
         ZJ1W6+WVTekrxD/lQNa11Zbi/JXVsDCXDKCK6yoyavqdXqXdsAUDl2VnEIzLD37Wj8Pt
         GEm22mlGlq8ivVDu0ituahMFRO063vyyqE0QWCo/RavTB3ELTaLIRAXvignghtCUiNh3
         3QSgcbiYVtmOQIyxm4zFXtCaX6H4BF5z12TbaxeLaeT0xeLV9u3ZJm8O/FXnNqBVqNwA
         Z3S7E6HBzLA9MD0Y18ePo5gKdixPMhbCQTqhQPAjYpdwFHyKaTRqQQj4uN5MmMiPYDGJ
         OszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526152; x=1733130952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ha3COx0DHOj8uxVj0+IXNOyCOzZMIKeCo7cSFiOZo0=;
        b=SH5Wqnolv9saMy5IseYQgKrvOJgrNEor0MmbI/lUxPQEb46STvuKVuk5JV0UtNUahA
         xm1oT/BiTsdTz5K6CMWjrEHkFi2RN13B5rwN/mfNPlxf9a3ZbMffjiQpaZoKDcPwuLCt
         rL2R/gfgBBYh4qcsMC/bDiPG8VuybVrdyQBQOTxjiDK/q7Zu4A/9tc3qCa/E9SuVwL7l
         lJIUdz32JcUBqjmdmp83xGamFTgSos87XMWI91iVf99uc/Bp/kiv8en9qAc8AE0/LLGo
         YhVe6/IvoBCsynh/hr9LRhEz2ybPNUHnxIWU97AOC47kr3+Y4zSfz5lXSZe0tWFEkM33
         WoWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRDJzgcSBfqazX11p0i5d6dHzGo6EmB4UHr1xQJA5ExRvbigtMpL/5ME6fvK4rtyBu9Vq6tW+bKwT96E5/fA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8qCMYNS1Y4F4kzJNMhsUehWUq9IR6ZBPDeTf3lP8ufa1SX89
	8HRj07VTL2FSidx4GJ26NBwbW2FM8o69mbVKVi0OCfIapq6+yX1vvbGqX2CIjRxDBQh3d7jUFUl
	bCBx2827B9Ex/XUiGUZyPFzhI/ak1ffiB/fL1
X-Gm-Gg: ASbGncuAo3Ad05uclZHfGQCtLMtMaSbX2djC7mBIZCg3t7+UqZGhLMD1RBpCfQBVwAw
	YmxxTIJAmgIkxnXD24QOKv4h4a3ftG0T4vjY1r23mB7/STEVQL880pdor9jiH2Q==
X-Google-Smtp-Source: AGHT+IH8NglVha/cRO2EUsWas5pT6+KPbdrlOa1Qfc0/+y2Ov2H+tjMFSpQ12N28tn+7P/9GBO4emIZVFBM59ocV130=
X-Received: by 2002:a05:6000:1fab:b0:382:4a15:6928 with SMTP id
 ffacd0b85a97d-38260b5715fmr10344321f8f.14.1732526152020; Mon, 25 Nov 2024
 01:15:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123222849.350287-1-ojeda@kernel.org> <20241123222849.350287-3-ojeda@kernel.org>
In-Reply-To: <20241123222849.350287-3-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:15:39 +0100
Message-ID: <CAH5fLgjoC7=gBBnohf4GPLPrk+wpR7P5KMm25EAmTspdTjg=4g@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add `build_error!` to the prelude
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:29=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> The sibling `build_assert!` is already in the prelude, it makes sense
> that a "core"/"language" facility like this is part of the prelude and
> users should not be defining their own one (thus there should be no risk
> of future name collisions and we would want to be aware of them anyway).
>
> Thus add `build_error!` into the prelude.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
