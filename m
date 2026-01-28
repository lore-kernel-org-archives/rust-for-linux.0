Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55438284671
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612982; cv=pass; b=MCkYsc9HrBjBGfbZTiAQOAgMm30D7E+HuRZvUsy/L5onykYDKl8sgEuVNk4zJ9a6OTdrWu/uyl70ETGK9XKh2CEAXAfmZlMJFPoC84c0DWbNjGOtyU1iVleQuOs1XTI2Jzt8fNAaNPGF/602/1Dhzb2k2hxqOaTk+9lDfLOeDRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612982; c=relaxed/simple;
	bh=+/h4JIBOPrTX47mtdhSAYj2qGchP6OUmcaw7AJw2riQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFaxu/vBGmE8X/f8yCPDyETDnfohqp8QWjsvoJZtlEGiZUkPwIoOjFVrxnAvU/T+1Gqxy8xCVvNddciqb9r7OxQTkb661vgmjmJ/zdwzgW+6c+IbuV4GjBf0EC10JUl+F/Wm0jEvejVHoOA7AlM/H1b+HV7EUBuzUVVQfM2ngS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfHQekHj; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfHQekHj"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233608c7e9so822583c88.2
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 07:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769612980; cv=none;
        d=google.com; s=arc-20240605;
        b=Zj/L7Ex1nB+FvWrJY1VAOY0JoULRE6sa6kVgkeaj1mq1Eh3GapZHiIKv8T4729DYPD
         0Ik9fsc1uULz7fIVVmoDCzOhOGeagOZzQ1g7JfDZJJ1zofMThtN631lP4zbvoCxPqsxG
         hiCGgespa24CoTqWGYbfO2qaW+R2fNBozOhKA1G+vGWrf4PWFzQvJkFmlPvUCfJX8BrQ
         n+qHClIcNXbzotIfq9c9JHZxvhar4RYkQlr750W2vaTqf/HmRepxqHdq1TD+hXai+es2
         a+cj7jWLKvhWpo+ePPAVKc/PwhmvvE3oPlVwedhhcckhCk0yNGzEghtvB4RxXjJP9IAQ
         R08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b13g7FPDi397vhTEX6YIHz9rnTsj60DoC5P70lHQbHQ=;
        fh=Ywcv6pJewuPYpNm6j8RqKdciQCWVzVyQ/vHxwLKFLz4=;
        b=krC3fnOfUTV4g2d5RtXiFw6scel1Xx+TexH62++IcYafIVQyeIPQVSXUWl6CTeb1z5
         HogE+PC00JdwX92ejaM1t+M2k+/LQTL2rdb3DfGxC4q6a9fvYCMga6lKTfZX7QBIzHgh
         Z1PxRU5ri9/wHXIqhKGgfQZt6O/FkXAyTYaHIihB8+Q43Z0RAE8g5mwx7ckrTuyfCF3u
         bupX3yb/Y48nW96u5QL8Yk03Eo3e6pHcKnnh7U+/Ad0bXWq4C5tp89JvP2ztVpnLZB9O
         WpxdlBAT7YOWCdU3ia37TrZZZKBXsb/JuhdqGwye5kIJNqRNIDs07yptlGfdz/QwguPg
         ufdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769612980; x=1770217780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b13g7FPDi397vhTEX6YIHz9rnTsj60DoC5P70lHQbHQ=;
        b=WfHQekHjyS6dGYc7kLXdFijzEuU16qcr0TC+EL5LfJB1XF5preCEoL4Z5/tWKYEXBB
         N+YrZLrs31ZydiuRHMo/otmlRWIFqSPulIrKyFZTY+lTL1iOSTdYEL0n3eJTTkgGyYCc
         5+MWdakVwvK8w2HHT8Bv9sXMOE/aK4eRPUGFIAxnQ6F4bAqIPhvNzR2dx7IiNnFo+M7r
         giJ9FjntVoGfbH8A/5/rgw08VGCcXws3wCW6nCwdfMkAGkQqCCdD7ZrFIakoP/VbMRHa
         CIX8phK7xYuMOZY2z/63OeSmMxswn9tj/3q+XIij/9aQ+Tmq8Q/2p5RZedYFdFwYFZE7
         7ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612980; x=1770217780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b13g7FPDi397vhTEX6YIHz9rnTsj60DoC5P70lHQbHQ=;
        b=LzJ2G9WxMP0pZGoZOIznjzSeyl+buRNtxutTZT1LySD+WQjX6L8fMPtwOj8xzORWUk
         PTz3MS31qvLsib+HQqMOut0f8E6NvflcuhJQDHT8F16l3ZX9YNNhAOae1jYdIBZLZFWv
         y1VWw2Rq7LRDpPHI6j2d7GbBz/qjjNhf0/xh88o3SQq4RaaTk8+zX2ypwhkKBX5jltCk
         gdu4Dg1SKoBMH4uLrwAgTRYDfSjZ6t3mxa5/cOGmVDvtYrPpFUjgoLHQYeTma6ZJJI32
         NQy8PqJbYfQZ5FxXNFwuCvrkCBwAY9qTINfbPsnl0yky6n4GQlwBLiHYeyU6E09bl8UZ
         //rw==
X-Forwarded-Encrypted: i=1; AJvYcCUEiPEpCGj4JGqBMkbAmc0t5eeXtX9nsd8KlUgBQFfGVCA89Xmif74I+gou2I4GZ6/e4bhQinn9TDyLegZJ9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YworAyWIgKN5NulqWBkQa48TGIPOjHSFX+8oU6hyCxIyv9KAH9i
	GL+uGaOBhL898YCOXCoMHcrKJOXF9dq8oZHceoyLdPqdxb+W1y/oeZnqKnRTBlC6DEr3h1OGcPt
	aKGqgL9/k8Q+pt66SCCw/omXleqSv/nY=
X-Gm-Gg: AZuq6aJ/srBmUosw1IEXkqy5AFSRAIJpPlKuNXE7rb076Nb+BFnwi/ulNXvzjwY/gM1
	xYZFPdI8vHfvuGQiHn3QSZ7BlXj5CZQ2iW0g0x8mH3l5W+Igz56fHGjHgZCtCafZlxnoHMNKqlW
	0lsi9IIJR55szNnC+Cm2W0KY9YCnGvJnRpJy634hr5EL1tzJ9o6GYyz1OKcFmTILY1M1QGiDOLA
	sGYoQ56wnbgJAT2d+9Em1tc3gGuqA3WRohBNfhD6HOuFeHFMc3+bj7Nv+cPocfOT97UUpQP0bbx
	cwX6XWNxRP5Wl5oGfWeYzcxeAU2LSQv71Mvsd3Cbc/3wBFdX0cMV7//MQjL4fuKQ7w6JbkJYCbg
	GG8HtgyjRdPxC
X-Received: by 2002:a05:7301:615:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b7af0ee973mr97608eec.3.1769612980363; Wed, 28 Jan 2026
 07:09:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112170919.1888584-1-gary@kernel.org>
In-Reply-To: <20260112170919.1888584-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Jan 2026 16:09:28 +0100
X-Gm-Features: AZwV_Qhlf5BvIp6KsqSmwerPdC-lhMeOAkW_lIX39xQBlFfUxUqa0UnDj8jHUjM
Message-ID: <CANiq72k9maH7aFgHj6OeD=m9b+LrDj-MpgOH-gH=NKWZNHn6aQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] refactor Rust proc macros with `syn`
To: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 6:10=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> This series convert Rust proc macros that we have with `syn`, and replace=
 the
> custom `quote!` macro that we have with the vendored `quote!` macro. The
> `pin-init` macros are not converted `syn` yet; Benno has a work in progre=
ss in
> converting them. They're however converted to use `quote` and `proc-macro=
2`
> crate so our custom `quote!` macro can be removed.
>
> Overall this improves the robustness of the macros as we have precise par=
sing of
> the AST rather than relying on heuristics to extract needed information f=
rom
> there. This is also a quality-of-life improvement to those using language
> servers (e.g. Rust analyzer) as the span information of the proc macros a=
re now
> preserved which allows the "jump-to-definition" feature to work, even whe=
n used
> on completely custom macros such as `module!`.
>
> Miguel gave a very good explaination on why `syn` is a good idea in the p=
atch
> series that introduced it [1], which I shall not repeat here.

Applied to `rust-next` -- thanks everyone!

    [ Pass C string to match commit 6c37b6841a92 ("rust: kunit: replace
      `kernel::c_str!` with C-Strings"). - Miguel ]

I dropped the first patch as it came from Benno's PR, and for the last
one I took the v2.

I also took the cover letter and used it as a merge commit to give
some context (with some typos/small rewording done -- I pinged Gary
privately to double-check).

I may start doing that for larger series and similar, so cover letters
that give proper context like this one are great.

Please double-check things look good!

Cheers,
Miguel
