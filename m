Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965092BE654
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965528; cv=none; b=jHVIaKQKQbnFewxwlRNkHLdaF542TcCApNO8dG7Qu458fyIjadxYcNA7nvbccfFl8fmRX4+/1IVXBQ+7EPHqOkJemK8ZVkXZUAJJpy/scQi8aaYycLNkHfplPYfBRsWAzn7jAgCO1/0171J/SDLOom/3AKkVYxhZEKs8Nfic26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965528; c=relaxed/simple;
	bh=93hWr3CW10tqHIXDYbrSHPvQwrzoKnMzBCJG3Vf4aGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQQG/RErIv3besZIZ6hNzEv/PDHeQd02/6lsrZAfiWB/oL1Mpm1XZK97n8lgvI4domIn9o3Q7FwyTxoLg8d0oSqnXiOuNLYKkM+S7LISJ3JxkWmhgLJPpv9qn9vksfSeYoyhK5tMf3PZ0sIRqFvIZvjEqP2uTzPlEomkIO+w2uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nvvb4IA6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nvvb4IA6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d54214adso28850415e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Jul 2025 02:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751965525; x=1752570325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93hWr3CW10tqHIXDYbrSHPvQwrzoKnMzBCJG3Vf4aGs=;
        b=Nvvb4IA6lDYWNoigOanTVKL4KfMgfq5kH2Lyg9qz1OFF5zPKZHHh04ZqRXNln5QEQ3
         /QfUMlm6EkVPQcN178SVPuHIK/P5tLPR88RAObw+HPCogbRech/KufkZayZohEyKJKEd
         j1lDnq3pYQG6WO3sOkZehWmY9QvE34BagOhCilW5Vs0X69eDH2qJKbP7F87M67JVcC5U
         9jNcWv8SWwB/IS632I7FVS8QUvbIc/5AEAZNa6jBKBY+IyNaLBcf3ZsjgHSyOnLIdnpV
         EtxGTEtXfklJ2fjm7WkHTLvSO4ssliP4I4/sWW2Sdr7cqgtIkb3wwrXyCPlFj6vsSvr1
         Bbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751965525; x=1752570325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93hWr3CW10tqHIXDYbrSHPvQwrzoKnMzBCJG3Vf4aGs=;
        b=Djt3iUpehiB2BTmblFWXFpia7BnDAu/1SPZP0mMQed8m6NpkmfnUw2a9M0MGNcZBN+
         HmSM+ltfmaIsg5bpI1Rhuq9Bt7+QYpQM/NvGyMnPT5DTmWcktTdJGTgSEUL5KxvcBFy7
         uHnODuw9PoprL7YLc7SUhjy6KwpjcT1cHc9Ng+DXTFYR0n1uMKb0nrjcijD2f3w2wOOe
         Ed5qec5VapD3+pxY4zZmeOpobIdYB+AHqMFIowXNZc0cdtmyiPJxBkNgCBTlHfV16Jv0
         450SbZszrCywRT7Q7frA/phV+JA3PBwm3h0fcbAofk9SMqVYj5VyjyF+Q5tdBx5b2ptq
         iafw==
X-Gm-Message-State: AOJu0Yw72MJiCmrhmpy1/ZiPjNRigPc4ygmBGfzsdc80nGcGzH1jFYoZ
	zP8oVAgbTswMClpwydGRRNny+FKEGGxe1mDAqckeXpiq/JiM4mFFhy9a2VZg9h5y4IGepSlFWGk
	l1B3g6HXARV1nsVAOk5sMtGQiC6uep4nyt6K6XWsW
X-Gm-Gg: ASbGncsl0kIPRIjYJ5MuUXm85C1F8I/YrT3dw8o0mPVmzO1TCjDUICYXKQ8YBl2Q7Xx
	JK068YhuW1di4Ydjxo6dDmECsAQvfvREmIQMGTGet0NEu7viR7aab0yPOoZ//h87qxdeoJAZ8O4
	kqd2aTD/C/vX6FMVmFiYqfCWPeKylxTBue2sEj4E/qd8D5PDYDTBd1NaT6WylV3xzgOgvroo3H
X-Google-Smtp-Source: AGHT+IGLZb2WPMNKWHvsNO2QvMWcnHAsOXW81tbgNp4vh0OL2k38REWdnZHTCfmUYHNCVV2Tu+hxKU2X2ApzXrJkrOI=
X-Received: by 2002:a05:6000:290a:b0:3a5:58a5:6a83 with SMTP id
 ffacd0b85a97d-3b5dde95755mr1690036f8f.13.1751965524785; Tue, 08 Jul 2025
 02:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708075850.25789-1-work@onurozkan.dev>
In-Reply-To: <20250708075850.25789-1-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Jul 2025 11:05:12 +0200
X-Gm-Features: Ac12FXzqyncHcpbewNp5JPkS05kMqf8uEOtDV_4zdHcXeFMjqppR223yAjXeBoE
Message-ID: <CAH5fLgiBd7iHiQ6UrMoU_4zxr84UbC6-q+Tve-3mhWJ5ZCr3zw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: rbtree: simplify finding `current` in `remove_current`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	mattgilbride@google.com, wedsonaf@gmail.com, daniel@sedlak.dev, 
	tamird@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 9:59=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev>=
 wrote:
>
> The previous version used a verbose `match` to get
> `current`, which may be slightly confusing at first
> glance.
>
> This change makes it shorter and more clearly expresses
> the intent: prefer `next` if available, otherwise fall
> back to `prev`.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
