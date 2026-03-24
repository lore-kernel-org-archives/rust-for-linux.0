Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640E3F54DF
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359594; cv=pass; b=vCWzMO9tGuqcCaFjD+aphc3OQqoCvzpSsLeIXA3afQx6Ao3cGDyv/4U1qTtC8wMkPkk2SiAiF1JWINPpABVHVo43qkRVKOzEkbXdkTCDIRzy/CJdVcIGLWoa+0K0AgJvZhu1H6XjdQirrB6Vq07qW76ea5is6KxIb5Slk6ejYeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359594; c=relaxed/simple;
	bh=BPikQtScP//6ER4N1OXFO/BklENecMrT9k+vLl8AuBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Etj3l9Ec5JQezCgCHKSXgkefbKSpuEbynVq/vq1iatOASFenTqfcomrf8wVe9YEimUyIenVbcNTk8gCP6098S4iifbmBYe3CHqZhcvNFYBomFX7mTW0kJWB88+MIp4Z8dC51oQDG5bgxOXiv4JZjEmrmD5J//ELKF3j5F2HsP3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWibFwhU; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWibFwhU"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12736a0147cso393909c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 06:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774359592; cv=none;
        d=google.com; s=arc-20240605;
        b=KoapbaGpLE47dVCLrL96lK+PdV1e5s2WV9ATD0WPTBDjAjZ4OUiQuxZph4wKp1ENJL
         dwL/Gby+p3xyErOfGvsRvFTwVpzti2/Uab247Yd1dFyH1WRRSJ5S1jIZ6RM4PR3Evcdo
         J2V56jJoi06fGD5egQ/bwZ/JmEmQKjI3hKAwZWwT6ivN1bHopMcSv3CdFUs7CCr0IGu8
         8iOQgRFM/6dW57vD8ymb0x3rHT3HBXo/dtxiqrwqmhMrFAuMEKp/L3nriXnhpIy0Btyf
         5vTG2BaT/ES6jA5VqMxQYUgXuX0g6xskIkBxV2UKeYiZi0JQwEkm/olX0/DLEMJdMOyb
         Z5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BPikQtScP//6ER4N1OXFO/BklENecMrT9k+vLl8AuBg=;
        fh=O6LcwnZ64poFK7kLy957+GKliGgn0xGT7c+XiKXKKko=;
        b=WDAJgFXYsoZHj7TzLKmqG7ZgtFHCHRYBI7JuIlsHwleTFGSdEXunNaCe2swHD7UYjc
         9ZYnFkwhFVB/E+GQHCkqEj3EHZ5edYCRe4R2splUgtcdbLR2K2mDkss/CJ203UUQBC14
         1HjrMddZVGVAGCbzjOlvsoyTGnnKkVBa8Dvaeg+fy+/F6vzVfLTPLcylRcnU99QzN/1i
         pg7W6vkpnZiHR4PzNvNIpTci1pDstmlj+/7kKIjRKiIqVCx4k0KvcLwhEeSBtWYBlD/m
         rGehjmkwv3WkN6RZH1UlYZQ9N0M4TpO4o+07OELS0i/IjKSlMlLCm9x3oZV84X0Qdurd
         y8mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359592; x=1774964392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPikQtScP//6ER4N1OXFO/BklENecMrT9k+vLl8AuBg=;
        b=nWibFwhUOrFSsroOZaBKg4PMxFBgpAOz+YBPm0gBijeovfJiruN5gUF3XgAkLVE5oz
         QrdDiX58428+Sb9uQTTIYpHrufYOhRpCKe1kV/fzOTmRDISGL5VbPRWdoCDAhf1g8/Kq
         IY1H0kXlmcY4qySwP+DVkz/LZrByEKs2wqXU3GcRdpuNhLg21RwghAg0vPj3BR+Gwqq+
         YjZo/qMRyO6IzCctREdpKvgQzlxi2XuHJoA2gsDMnQPkwUdH7Az8qWHqjbOfP5mLN/fs
         W3A/4FqmQs4xJEdykLeSlY/GyGFb2JwhEoyxBQIsn4GC0t6fQGsLxczlnLbN53a8V8Oa
         dVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359592; x=1774964392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPikQtScP//6ER4N1OXFO/BklENecMrT9k+vLl8AuBg=;
        b=RvOorSwuWphn+6x4vFLS4d0w+Z2gHbT8Zn7q0mbBYLwkfvHsuTKERBOkW/VaGdyqnP
         G6ksray/DHwS+dAS/J2FJ4MRGY+zVWYIykyPewIKVkwinBXalOKEcq5N9JzMzB9Wpadz
         mirbsyoUpA6wjOQNhJRdkyvtcp3IT/hK8M7sj57b9AZ+SAaj/AbUmQpSSa0KLXTfTZGJ
         lS4A4fnR/O6BaqdQkg/zFPbm2EHmwL0DGhABrrISCuss5qDxFa3lfLsEmhqIsvvtN36x
         zO3dyWYuOUf7ZE8dM5YBuynnd1/w6oJCQz0PsKXvbHbcV9WASxmEPhHEi7AynhFtExYC
         JhWg==
X-Forwarded-Encrypted: i=1; AJvYcCUCLxRxo6MJdyWlsnENRFMEJIm/ZutdXThXFOTAFQV0ZhvZSu8wqAFMtvAD2HE6ETxCWhuTgdAs7sWoJ4cifg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypsNoL/fz2kKf9nNXF2VVEptmPln7JkNV6vo6s2iZIxCPw5by2
	ADiyAuV9N1xj+eZAp/ITeNfoAtWnkFDtnmnzyFITXQbGmvSnCG5+/l4CMNhcqIGgP3xjxkXFukf
	gvzyM9TwcL4XF1cwQWCCJMArP3ERWlhk=
X-Gm-Gg: ATEYQzwvGPRA9UA2ZJYs9bqExdXhlL7sZpblnx0v5lx05RriSM06AOspu8U/9WgCM/B
	6PzAmBP1KaCU2jCbKJyN18DgGEloraL00UlqZw9LlL5xvVgt2tamshF8NYRiwWB3zkbDK+62K0P
	zeHoJJ5t6yQ8R8nVE8NF3w2anLLiCpCgjcVhfk3aQLm4xejbPC7OxB65MqFvlivh4wkrNVJIa4B
	Cr9gjYKebbxHFRaFSJBIdFddTNgi1wEpB7Pd71USWtQWW82r7Zn3M9izQYEUWdF8/QnuOQ5LNib
	9+3gxrdT563nqJFkGH9MM0ubEbqpJ4IhEYyePzb/Ou/o3WhN9VhrrGxvqY6XL4biVMwcSNpOSJK
	3nijKvpCTJ5on4ACjmV6TbRE=
X-Received: by 2002:a05:7300:d705:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2c109784e48mr3673247eec.6.1774359592122; Tue, 24 Mar 2026
 06:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-regulator-fix-v1-1-a5244afa3c15@google.com>
In-Reply-To: <20260324-regulator-fix-v1-1-a5244afa3c15@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Mar 2026 14:39:38 +0100
X-Gm-Features: AQROBzBO2d4RUG97U4rcXNwZBxNlztEoEIVA_eB1k9Vx5UzdtWx_algtLg1o2Ns
Message-ID: <CANiq72kmF6attxK6HufYp8FsNVNLx4YLecuvFrfn8BzuKbZe7A@mail.gmail.com>
Subject: Re: [PATCH] rust: regulator: do not assume that regulator_get()
 returns non-null
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jean Delvare <khali@linux-fr.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 11:50=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Fix this by using a raw pointer `*mut bindings::regulator` instead of
> `NonNull`. This allows `inner` to be `NULL` when `CONFIG_REGULATOR` is
> disabled, and leverages the C stubs which are designed to handle `NULL`
> or are no-ops.

Yeah, matching the transparency of the C API is what we should
generally do, so unless there is a reason not to do it here (and
Daniel already replied, so I guess not), this looks good.

Liam, Mark: I guess you will pick this up, but if not, please let me
know -- thanks!

Cheers,
Miguel
