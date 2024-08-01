Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25E482C1
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502948; cv=none; b=ImMUD0gniSkOPZW1rRyzL9KR2+Y+xMHu6Xx0QVT/0cbnl7p/1J2as7TkdqGkIhSVr6xjAllUyx6Awd/1bH44t5tNBk+h6AtueRUYXdbrJTWrPrpeGqTlU3PD2fCVLt6UGSgJg6p8B/2/3axdejjH6YIBpbHHSOWY4281aXvkjyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502948; c=relaxed/simple;
	bh=htzbgoJecrAz4Gd0Hxqsrfi+e3ZhfhKt345PObGz7RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7I2nq5qF/Dx6UnGUuzH9njMHTs0abmSZ6lZnl7rMly8DF2S/s6VYmwc/MFSkn1iuwPdDCGjyyoINMj73lKG2jkd+koFajQVf46ixZoCNcyRrvk/znt6CVBQxGYwtjxYakMauTFdXu86U09Ekpcu5tpaC3yCU/3cEYZarj87CZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4alP9hRJ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4alP9hRJ"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f15790b472so3052341fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502944; x=1723107744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htzbgoJecrAz4Gd0Hxqsrfi+e3ZhfhKt345PObGz7RU=;
        b=4alP9hRJtisGD+r0w8QvncigEsKCxv7by/FiysmVwfLis3rL+QDqzAhj+AS+Zkc+zY
         J/6bK1p0NdzpODo9Ay+TF3CBoBptp/SBhNmFYjsHAVopGa3N/Yb6lnr3fHmCMgKqmxsd
         XBvsPVvyRr5vuaHyfnPzSKtY71tEpJJ/JZWwewAKhOtAHzXOnLD5Vt2NlhzI0C4wrrzy
         WeNNwbRhpNk/nqinZQuGIk3+/nvryP5F/ULpha8woUaH2R9Z5yzX9RKfBFGD82qf+2SU
         fIV1Jomlou51yIY4gBGpbgjDaOBMUGezfX5tjuxwfp6WuiIxRT8qqWlxTCDbL3VxiMpG
         5ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502944; x=1723107744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htzbgoJecrAz4Gd0Hxqsrfi+e3ZhfhKt345PObGz7RU=;
        b=s/BaTvgX3XfqAcTTsNm8Gp50JG1TWJXKcZnefJu6vDRb/fVjcD+tdXKohj5JzGO/pK
         wC511FX+iBfs2yEkEuEFsv5Z/2ygH/77gWL8yWrbBw1mxWuQTWMm5Qdmq7t0tr/vSdQ6
         w+uT5ltiHZyLCrowt6Tq9XwC8ykG73n7/gUjpjv6pDbsbCOXL4CU15f2q7P23IgsCv1V
         itKUK4O1Mf+QZhh27jlfHiHDUGjleXKykBgM6ut4AnlXkQG47N9cSzkdG98OPB/tf/Bv
         uFh47qnaJO5hzP41dq4qsFQSN0L5FHg/+84mjfQ1ikLfScIrM/+GyASm624jXJPzV2+A
         H8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWv5tG84Emi6bOj/e5hi19hBepQFh/iVKtWd9AY0NUKwA7yYIHhPUjB/PcMkDqQEqCwqpSZChut10cMQOSuv6ytfs2jm3zai8D7AyhIHyg=
X-Gm-Message-State: AOJu0YwTFS9k9j0pOTkTw/G++hM74VCGz3zKnbR06TmcBc5mZs6OH2T7
	lnD3GIeh7Qj090Ikxi4JLceoO4R3rSb7BiwoD4IhsG73HNQYocUmL4slKwWkqB764eqcpUMYP3C
	v1tubTkRHB5s8XOrq4P557ZhYFvuS9uE7wI8I
X-Google-Smtp-Source: AGHT+IHQAkc028YtQvdTyl6rfkHihPZCplN9RTiItFNrpQcWi3f7rQMpfL7voVqa3vUDkYzpg2Chh/B7hilYhnufvfo=
X-Received: by 2002:a2e:9647:0:b0:2f0:26b8:44b6 with SMTP id
 38308e7fff4ca-2f1533c2d0dmr11885291fa.40.1722502943602; Thu, 01 Aug 2024
 02:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708205325.1275473-1-benno.lossin@proton.me> <20240708205325.1275473-2-benno.lossin@proton.me>
In-Reply-To: <20240708205325.1275473-2-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:02:11 +0200
Message-ID: <CAH5fLggTGzh=iAoThtRa10z7_L0k73QTW2BMLjyG89o7hvTBVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: init: add `write_[pin_]init` functions
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 10:53=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Sometimes it is necessary to split allocation and initialization into
> two steps. One such situation is when reusing existing allocations
> obtained via `Box::drop_contents`. See [1] for an example.
> In order to support this use case add `write_[pin_]init` functions to the
> pin-init API. These functions operate on already allocated smart
> pointers that wrap `MaybeUninit<T>`.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/rust-for-linux/f026532f-8594-4f18-9aa5-57ad=
3f5bc592@proton.me/ [1]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
