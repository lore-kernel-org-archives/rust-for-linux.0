Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BF7081F
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Aug 2025 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755419588; cv=none; b=N7V8kMz8k0Yx27ZUdtCHqJZWr9I3tD4aj2BQcUcecX9Dc4RuYyB6CNOBLmzofC5pSvx0umOmgE6wO5bDdxcmXAcExE+mZ6UYtOrAMPbVAF53aRNCl4ByptIxf/TDhqq5AboNxuSVS53rxfrvs3FOaya+75rbkIWtU4QFb11gY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755419588; c=relaxed/simple;
	bh=9F4kZCt6EM418SfE71rTAkC9O6+5xOXqnezhdzokRY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckIavdWXgBeecmN2trOL4gEykG31Ym8FJr/SjskoGd0qRDkEmfycpNedDnAJ2LE2JXU4j44piwGqvOdT3k+jmZVURPn9T7jQTVNLlKFlTgcgmCXbnTCsudLIuEZCFyoDNDAbwLECnxQv0LwVtG+YAD//EgRctJVniGmoeaQLoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tHQ7wThX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHQ7wThX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso3146046f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Aug 2025 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755419585; x=1756024385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTwTOtGwt6cJGY41AEmiyutI55TEpKyzi4qJ2ueIWhw=;
        b=tHQ7wThX9HOw62audCRFxL49D6LCANf72ifESGU30yOkHmIZz/ZS16DPwJ3JFHBe0v
         Xi5NDy3BSnH8QPEsA/57LoH0w3T+r2+74XxQynJQ8gpN7ivK5jCmNO2HP1Ggp+a9WKc+
         pis3pdetw7I2THUeZe0k3k0dtcsR2FfSDt4vJ2ZqsXw0Weu/8R6uKsMIZfnzqbC4r7Ft
         9r7vlyWFWD8R7sysk/8nwT8cHNR1VOrOdpyjQdxZ/4F3AmznRGmBQ9do2lIeeKA7f0f1
         sTqbc3WDz73brb4OlNT9TVyfDeAF2euMjbHCLDchKVeo6o2682OWstbvpayNFFi9OFhr
         8oWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755419585; x=1756024385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTwTOtGwt6cJGY41AEmiyutI55TEpKyzi4qJ2ueIWhw=;
        b=QERg02gzR6MKUa3axzvmTCDKAC3iOhaqlybGumPV5twENhNs5lXv4dsDWpfv7E6vi4
         cp4iYm3SLayjbd46WWf6+sriSDgKci2WdNA3a0i5VJcPlXd1+butmaMkmmukpQrcP+XT
         a2TbwASW0SH/qdExHcmAVf3V64ULe0jv2nl4fOM0Ipd4lcoyKeLo4qAHXbvWaEh40m8m
         cdN1OYCUuBBsfY5NI2uEsawx6+luO3MifQVAaN6UCEVLYdE26RPFroq7bee9hYAhk89p
         NK5jRKFnS2CvFYI/CjvJXS9IhxEZWSKDbgGZ0HDBoJZ1mim08lx7csQzeoTCxNa70W4g
         kd3w==
X-Forwarded-Encrypted: i=1; AJvYcCVccmWOSiAwbdU8Qenx/SaPAn3CbeKseCzzmuOu/tjHT8OHOD4e1LrtkZl8tthiZVGYSLUUBri90OWc0u2nxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1e7kjL2g/jIf+5u7OyidtcZuY2IjpG8PQo9b8TB0119yCgTPl
	e1MKxqfFxNtGv49TDihEcYmCnFJFJOy1n1CV4JCOMV4JQrYMrces7Zclgp7Y0TtzzqDGqNolHxk
	rRLLRl5NziY/uqbip24eRv7dPp5D+fXGOOvKQWAPy
X-Gm-Gg: ASbGncvBDArSgN4hNg1VHFcrg5Qlrmq77cOVkI7BqUSdoY+x5KRIDoGqkrNsYlOdkYC
	u8pW0jtDyAyyqIZKEyIS9R23sfRV+eHMad6ArL83drxPIB8Sl8xoRpd1KdWdHLQVlFb0zWnGfAZ
	62fklkZZ4/U+oKEvaCPgQQX30/u9cakFs5B0h6UCFmh/jqgG5q/MTu/VTR2ZU3nq7MB6MZUffRe
	cubEPKb7tFLFsl2KuQqGfldnnaMWrhfBmlU
X-Google-Smtp-Source: AGHT+IGoRb1xdrYrj6kHKejvqdDcCa7iTaEaP7TOTbmewwBY/XYltNC5+vB1zPlq8+D3PhMalwZdmY0KcTb1ScHU0tU=
X-Received: by 2002:a05:6000:430b:b0:3b7:9589:1fd1 with SMTP id
 ffacd0b85a97d-3bb68fdc587mr6365788f8f.44.1755419585362; Sun, 17 Aug 2025
 01:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816210214.2729269-1-ojeda@kernel.org>
In-Reply-To: <20250816210214.2729269-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 17 Aug 2025 10:32:53 +0200
X-Gm-Features: Ac12FXzhd2iFnnKjyXBfrCIdB6O_r4X05qYMnlTOhhEd7NQgiE9g9rzOlA9OUao
Message-ID: <CAH5fLggYHJg+PmLD=Fg2a=pO7JRmM+AqppwBqOBpp6+179YcVg@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: fix missing import needed for `rusttest`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.se>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 11:02=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> There is a missing import of `NumaNode` that is used in the `rusttest`
> target:
>
>     error[E0412]: cannot find type `NumaNode` in this scope
>       --> rust/kernel/alloc/allocator_test.rs:43:15
>        |
>     43 |         _nid: NumaNode,
>        |               ^^^^^^^^ not found in this scope
>        |
>     help: consider importing this struct
>        |
>     12 + use crate::alloc::NumaNode;
>        |
>
> Thus fix it by adding it.
>
> Fixes: 8405eafa6e94 ("rust: add support for NUMA ids in allocations")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>
