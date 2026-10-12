Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6469CCA4E
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 05:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781819; cv=pass; b=jx+e5EervGrOcLyt5gvhPZsWtatycZxU5EcNRvG5z8sqxgz/Ua4aGaA2qoWCDeEETkouU/zby2TDfetmX/wyZcsdfJaTuYNd/+BJ8GpV1niUc+mrFmCcmHzLzyqz4pRCWl4o/DCKnQ/ueghhc3V0la6mrfdkke7e8VPD2ppu1vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781819; c=relaxed/simple;
	bh=Jsd3T2hjnvl243+w6J1SRDGT60HX/0ppGEwueKKSe/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5/COTRfbxeGXZE+nancvZktCI/jr7DczV2B/CAJgcQae5VTgiqTa/EAOjsMr4wIxaBhV5JotMah8cA1DJZjeNcN0ea09WJA+EjcWe4tKw9/wH68NnWpfDtCfYYmA0koY430qUIpk1mDNOxtYLEAAxlbNj9n/Ud/PvPe5yWlvBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMQxCCKD; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMQxCCKD"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-313bab9cfe7so146381eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 22:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781816; cv=none;
        d=google.com; s=arc-20260327;
        b=JZDq93fCXT4vw6VemgrgzQViAPk7W8FtcXDbtH7MF7MovF8RyDr/r9sCs9119NCdds
         wr5y/jzuLrfhCUg46djrHZAe40b1UFo+ogZNUxrw7vEY+QYsnyBc2/Sh5UBfCM6VdW9g
         vTty/yyQ0OKiLKBtXnp+KLunERxqKo+GW+KGzDOHxv5RdfXjVSnB/9OwxRLZTxdc5E9v
         jBNRq/LhPn044uUwwD7l+cZT7iS07CVA3H/ZWu4L9l914a8GiAWp3hgMKbTB3V4si7hq
         dK7GYbWzpL6sG825Mf8CCxMp5DvMuT5oXUvUD/68xwPg1rvFM5rjJJI82Kj7nf4NKqRT
         1Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X8MIw/22Vrj04Q0rO0vVGzttNISASYLhkJUm2E7UKC0=;
        fh=I5i0UdqQ4Zqp/3kd/ZQnRkXfDGgOEcXGHylJIGGxTxc=;
        b=msBuYXwjhP/jI5EqrFRK5HZOwyOyXvD2sTtqYmwioAsjVDoWYkY2dSvk7LQ8dz/UYw
         Rs3ObH2m5z5fkW5MI0PKiFJdsliWKkeZvVHpcwkBzoPVMVH4h3Uwnzp8ZzgStI9BRpt4
         mIgMR7tzLAF2dyj2K/urmyvFN0x/yHLFDlw0hC/O4afjovXwhHL9wPNHon69Mu4c2SfA
         Vj/vLwWl2P1P3lO9N34yiSUQIMAfDh19JyuuPIAZlOd8Ty86oXJi6agu3alMpwDjXLYm
         fPpuanGblyFEMG1Lt3VFZuM9FcsRpAsW6u8Ryx9f94zHb2l9KUDd03bbl6HgZ0Cen6e7
         IEKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781816; x=1792386616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8MIw/22Vrj04Q0rO0vVGzttNISASYLhkJUm2E7UKC0=;
        b=hMQxCCKDDGw+AnLPylMR7C+k/E6QpJrWxSycxdgcD9+MEko7f+CnkxAhHjgC2HFA2o
         tHf91GUaeihmMDixe90QrYrn0Z8dqBGWsusurRGnRMvrhIPVuCdZ9VfxtyPOCzh6bGCP
         QsVZ+HJiMXgPCTrScE46C5gw1vLUgTiLkyirix4ovVSDQTasvZ+tzwvM6+ZSMlYvL0lQ
         QLapyi0h+p8lNqdXWefV21qwPvHZOYV716/WjZNCFiV2sIayNu4ZgxvrKHtZ7FNQ6AGB
         85w8eCmfrmfSLaGLDtEA7B8V1wLv4LNEQB40GG0Z9xnTfsEiuIHA2jpkRhCbT764cfOY
         jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781816; x=1792386616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8MIw/22Vrj04Q0rO0vVGzttNISASYLhkJUm2E7UKC0=;
        b=WrBhLXjas7y4s1ofUECevohEau2lXyvn+Gfv4zWg93igTSeMkhVjJjpBIaIHO0rAXe
         e7u3k4wghBPhWj9BHm7hGYxPNzJLCxJK+Ry129YImkUB5jOqQ5eRVTUfJC0AJSuvjnBC
         1mC9XeVPiqeKSGoTvlO4ljcFa4fbLcEs8IQsqr8gTKzjXrsMwaMR/avaAHsy2sw7c+JA
         J+LEH7VybzAMv/clZ1c6YGX0vEGPckO7hBS916BrofwR1DNerc50XeFnXGoeNGmqCENd
         UZftAKNVuxV0OQVhryJNrmk6I6Sud4Vv6QsAemzGyVus4w0lKiuWp2odZPX/AwyN+ge2
         VLTg==
X-Forwarded-Encrypted: i=1; AKwUvBzTIzhIoiRam0MuXaGyxyn0xJcDGZ2psxz9IXfdnAR4Pe5CUkIauh9kv4SmgvbzPRm0mzcWSunWw7opotvfog==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTku4PFrGCZ90yibAo5BJepKycAZXA5eGP6PNhSGx4Mv777Ynm
	rsn52ycrREJB91rwt8lCJqe/dZXsTvnxvN9M6bjpzFoVVnaY0+Y98TlvfInLKkFoJSlogCcGpBZ
	xvXcWndL6YwrxcigruTzq2ke9jYUsFXE=
X-Gm-Gg: AYBFou1AcmPjgRsq5w54bvhK4xfo5Z9hTqRVnRESOyJkPYm+6uXzOn9DFFL/AgMQT7s
	qmbcBjMM7Lwk2m4xRZ3bquZymh0cJlkyhbsWsoE7/sM8ia+YQJ50CzdUDVbCyQVrzTPbe+pQH6Z
	Ze9bVLq4nRvOHHtFuqpCp5gQVDZpNG4CuwplqFvfDG9DqYPZc0vuxk/RCRLeINZxJeA0EzIQZZq
	ui6JYmqpNnNdTJbWbQxjNYMyHtWT6+k1QW+RUJGBFMBog9zlwUflVb+xB1IjZvUlKYHkdTbOwH4
	CwDP7Gf+Dr1lmA0WIMGknC++uT5mQiBUBJHHjE0jzCGZSUHHJ6mGFHFu/MX41uuu7V8zQX66yzU
	9AeC/CXLPdUQ/jSmYhpS63wwuE4gdtOhghIB4wio85P80S3UZ/kJuhqYSqHBG2XuObXeha2/1m0
	PLoaH3Mr9aLyAUG8S4/B9cjqLe/WSl9QVaZho057PCB8STSTaTlcbe
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr19543281eec.0.1791781816392; Sun, 11 Oct 2026
 22:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
In-Reply-To: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:10:03 +0200
X-Gm-Features: AclHuK-Bo9taeBjxP17FN4p4L1pLyEmLZ22aTNxXFsCT_jeXK5HxzXpnPIQBRGw
Message-ID: <CANiq72=+wYHy-DhWNAxek2jXmbmW7_wh2EH1SLT7yqJxygokkg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Rate limited printing for Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> To avoid DoS on the kernel log, the Rust Binder driver is being switched
> to rate limited printing. But before we can do that, we must first
> implement rate limited printing for Rust. Thus, do that.
>
> However, it turns out that before we can implement rate limited
> printing, we must first implement the ability declare a raw_spinlock_t
> in a global variable. Thus, do that too.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

    [ Used the "kernel vertical" imports style. - Miguel ]

    [ Removed unused link reference definitions. On the `static`, allowed
      the `non_upper_case_globals` lint so that `kernel` users (and users
      providing their own name) do not warn. Reworded title for typo.
        - Miguel ]

Cheers,
Miguel
