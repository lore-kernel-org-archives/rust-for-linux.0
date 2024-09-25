Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9515956C
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252830; cv=none; b=P/8OkTza12bbrgTENf7wiiP6dCBKDL+MQ4hEsCCqBPLup1etyHwg1FqC0LGPWFHDiv/MWlX7uj301b9ION63Lat/duuEoTX+qZxbW2k90PeZxLc37wC0RUZapWxhdOasGaqIak0BB5LVH5YBGpb9ep0qsMI1KbJIMK1IG2QqZVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252830; c=relaxed/simple;
	bh=Y2BIvhjNyYJ+TFNTSOch+3U0Xe960Xy8jCwbowNsyFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIPm+h9eiFtpsmyyw+Q+qTdVUglAKBEnzK7X72upytHHZ//cFy45INY9ldjtb1gBjGXo7rL9+CC3ur/Ejaqc75dWYvYD0C4BLzre2Yl9jPIhRvetDotnzjKJbAjeoMZJ0pGc+N5/XzZCUv+Ili7ES0uGXdIxIbo1Dyb9iKWt6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xrYr08T9; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xrYr08T9"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71798661a52so507089b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727252829; x=1727857629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25jgtKw05cLljXTa9ioZMmKXC7JJSPXQkmgPPZPPAvI=;
        b=xrYr08T92dg0VpGoxNeU0KPAep0urpG8kjPZyDe9TCCbqrbvrUc32P+It8QTic+44H
         7qnt6zGRa+yfMaRxVVCI4tqOxLgtZOSUZd5E4MJEhPTbldHTM4rIVFzk1Esmrqb/hLLh
         D3ryQscgnonnVYoBfmJ9l+IOmoBifwTxqQZtWWRTxgHAdTHj7+dsOVkZtmS+P9pUfL7i
         NDeSPKQDbb4dlogsT0vlKQzC/tqwlb0cJvrBkpZI9j7PWeCSPc5ywLcl1sn+guxk2XX6
         3+5D+uljKv1sKE8k6TVvaPX9DHq+JDsVDIseLFrxCyEkvx31cOqAIf/TpcoqHW7braPr
         jNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252829; x=1727857629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25jgtKw05cLljXTa9ioZMmKXC7JJSPXQkmgPPZPPAvI=;
        b=VYMB6FNpMPcm46zLAeR1Mb9iwf7SYrhna1WlelNG4e9CQMWZGOJP9M6DfkWG5REGGh
         o2pf6ndF9jl0uROLGZYfXFsgaPLpcYkFkh2dymWtqZeZFp5EeNcwXziL8WdwOYNoymUW
         i7a09u6H2vmyOzVPVKQ+x2M5pucQdm/oiw1dWMeLDLVaow1Y/9RHMGUj95pVZK8zJsnn
         Yu2CDSKAb15ZymWMGrUCiLbrBFlmgqs9mNTguoDWp9z/e7W9KPzVCQ3jMM5iRQBstL2l
         bbfAtJFrO9kfg9jHEH53LHq3lyWAmF+pgVhWJcS40+SeYvbLZzgNEkTyRj+AL9EZFdUd
         GE+A==
X-Forwarded-Encrypted: i=1; AJvYcCXTeIYJsdCG9Af5uJzEx0p4qrPiqGQcKdjL2LwyBaXc6hsjM5tpEZZvyXH+wk/MzRklhplsDSVcW1jRr2mYAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9AWnFN+i7mThqG9Hi4lVaZ00k6Oki/2tG7jVc6SN4yPfr5UB
	yNmVGMNBg7LTyMC/aYdOkLF3Mnt+gos1AKUrwrxU163UtxQ4QseHCxs8Fo3qqj3x/QHmcJoDVoq
	YS8om8Zv4MGQHD9BtwraRN2yXKHUztDKXwyae
X-Google-Smtp-Source: AGHT+IFw8D9Y8iDl9QsdusH9uDD+9on1P4pZpj5dYIq2QFb7UqISOP9oyEzjwVQEFX4WwjN1p6C5EsUcCJSsDc+lbMs=
X-Received: by 2002:a05:6a00:17a1:b0:706:aa39:d5c1 with SMTP id
 d2e1a72fcca58-71b0b21dda5mr2945661b3a.8.1727252828232; Wed, 25 Sep 2024
 01:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
 <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com>
In-Reply-To: <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Sep 2024 10:26:54 +0200
Message-ID: <CAH5fLgheG47LdgJGX6grHXL6h08tsSM1DACRkkzQk_1U8VAOxQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 6:47=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Sep 16, 2024 at 6:15=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Applied to `rust-next` -- thanks everyone!
>
> Also, for KASAN + RETHUNK builds, I noticed objtool detects this:
>
>     samples/rust/rust_print.o: warning: objtool:
> asan.module_ctor+0x17: 'naked' return found in MITIGATION_RETHUNK
> build
>     samples/rust/rust_print.o: warning: objtool:
> asan.module_dtor+0x17: 'naked' return found in MITIGATION_RETHUNK
> build
>
> And indeed from a quick look the `ret` is there.
>
> Since KASAN support is important, I decided to take it nevertheless,
> but please let's make sure this is fixed during the cycle (or add a
> "depends on").

I figured out what the problem is. I will follow up with a fix soon.

Alice
