Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCF42E7F20
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766044620; cv=none; b=jqPCwn+3re1wsi+7QD+lSGpv9sszrMZuDCjXgNAdq0yhyNnCJRQYJJxWX2IOS+1+WcrdL/FnY2VlI14tVLWsag/IKBlGHIy/BboGbZd1yJg8jRsveRsFo39nvfC2rRDPUeAhRMTAa9XEtSBZIVvBo5CIFX6j+KgvLLeM1R43l9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766044620; c=relaxed/simple;
	bh=PfAi7Yk8IS7tVVJ58Ad93og1GcLCfL8n6xeo4xi24BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovfXGxl4GYbGonmu0FoJ+V50TfUh5Ihto40L56UNFjnz+t/DCnU4r28Uzx7MjVLNxXllEj+ZRQAaa6KNtQFG8UQobdsdiyPThkq4dEXJCoSveKxfIAcuVucjyEg05AuAXHjxsyvOTRGY/i/0515qr0VNhmGQ5veCdBQo7pbLOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OIcA4GMU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OIcA4GMU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so216489f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 23:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766044617; x=1766649417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reflEkCbL1WL57v2B5U9Chv9SZ2png695NbwK5Wv+aY=;
        b=OIcA4GMU+sLxzpWhUgK12801MvN92zCsv1puB57DKTuN/ZUCXIXM1qBXOY9ZAdJH2v
         QRDih2PTZ75ZXqvu/jI8W5EG2FPH+iEbtkgAC3rMaFX7jO27qUefKnk9gBpxA1ddTK7n
         IfsrFULfoy5IzBlMX7LHJmA/P9TSj632E169tT2CWwSDb+i9V7zwkQtqkY2sLp7EV4Qu
         WQCuC19fOsp66iEBAbsQ69XkG0qc+iqDfMai6i7eOe/etWMe9I0CVg6FbDJrCwKKyElz
         eVC/JOvn4kju8CFsvjXIxrTmBTm0iRTlCZPWFlwdFbLZ33DiT5QWbtUw3KwIJE0W9nX/
         kxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766044617; x=1766649417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=reflEkCbL1WL57v2B5U9Chv9SZ2png695NbwK5Wv+aY=;
        b=WVoO1R/j6/8FwHMpkMaqMVHePI0clHofr5b923BqZUUmHcNHY0PhCM1ujIIeu06zVB
         A7uIpo/EhSCrT2WlcmkFLcjlqsDbF++fd22lQWRlQffVfXJA/doZyovr000Nk4s2ampk
         P424iBLiGcl82naBXT9N2G23tCae9gfCy7yieJXEyWtvG3brjBSBly3iA691tjzNgE/h
         p03sCWIizI4FM+oJERYQaPz+1KhXUgRkJJQLpAk9S9NyTM1XAyBIunq1POjb7GcR1r/Z
         G1yzVvI0DY148aPR426/Ns4QSfuzwiB7h7E0ZBZKSxLb6J8LzjMl6Hs7qxqNBVZRnF0w
         DfiA==
X-Forwarded-Encrypted: i=1; AJvYcCXetiuXtbnGmYpUNFLAtnefLeEYi9vMbQkqtSoZ6DjVkrcH9xVSshls6o+A17X5kk+/BHNm8m21lXHsqp5dnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0uUo+6GkqjjMCJtnubW9uFccxeJhu2C1suBLvuWK+FG0wAXBV
	hCKG8UdFphIfHa1vM4DRaaOinGLTRc5MHj5TDYN6IOTWS7kGPq7hlFS5cu/CjkVd+nT4z45+UNm
	TvnjRExIrp82fMUHJgjt5LipVp4fNkDgQylzs0rvQ
X-Gm-Gg: AY/fxX5Wv5a6iYNvvuk1fVoUXr9B92s+3FaksII7IY7RVeLMcrx3SGdobfGqmn5I+Fu
	i/0n1rExcH06b8SIZW5kGGNO3n+ZMwhxiX0Yjixy9ry7LU7jBLs4JCEZ2goA+gKNFvuI9JPMw5H
	RntAT+VRPQXc3X2EmOHyuuNWJu8xfB1RS4LTP8JQPwAkulYKSgPEbIhKj/lYTK9C1Se66yuA516
	QOyXZaCisXoVNX1OFfn69/cDrOok8jtEd0LG0D3g/aw2t+Mm7QPyim9F71AGIxMAsq+Ez8cyTm4
	OiJENRdzIZOK586MdK9xKD1Mtw==
X-Google-Smtp-Source: AGHT+IFz9yogMQP7CQkl3rt6bCn9HCCA+fPnGdwZ1l9XoWDgjGwxtg3JFKXod9kLOuyUjfG7g6zb/zI34eq7D5UuKWk=
X-Received: by 2002:a05:6000:3108:b0:430:f23f:4bc9 with SMTP id
 ffacd0b85a97d-430f23f5243mr19980056f8f.62.1766044616946; Wed, 17 Dec 2025
 23:56:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-add-entropy-v2-1-4d866f251474@google.com>
In-Reply-To: <20251216-add-entropy-v2-1-4d866f251474@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Dec 2025 08:56:44 +0100
X-Gm-Features: AQt7F2oQRhF08Af7BU9mB-eXXcRbutDYOhOrHFhJb8AYhfU-XkY5S3BOmLbMkSI
Message-ID: <CAH5fLgh3u8h9kcxMXvPiBTrTgpE81kopjWL1ySYSjWucHT+Dkg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Add support for feeding entropy to randomness pool
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 1:37=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Adds just enough support to allow device drivers to feed entropy to the
> central pool.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Some nits below. With those fixed:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +//! Randomness.
> +//!
> +//! C header: [`include/linux/random.h`](../../../../include/linux/rando=
m.h)

Needs to use srctree instead of ../

> +use crate::bindings;
> +use crate::ffi::c_void;

Please import the prelude here.

> +/// Adds the given buffer to the entropy pool, but does not credit any e=
ntropy.
> +///
> +/// This is intended for use mixing in data that is likely to differ bet=
ween devices or boots, but
> +/// may otherwise be predictable. Examples include MAC addresses or RTC =
values. This slightly
> +/// improves randomness in entropy-constrained environments (especially =
common for embedded
> +/// devices).
> +pub fn add_device_randomness(buf: &[u8]) {
> +    // SAFETY: We just need the pointer to be valid for the length, whic=
h a slice provides.
> +    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>=
(), buf.len()) };
> +}
