Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F01337AA94
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085251; cv=pass; b=aGmB0N1kDrNMyYMCri0a3Jueg4juD739U/m8y5XiEhQNF+QEozioASpQPVfPC3Q4SgN0HkdnDb8slhghT3pIZzOK7+TJPayae2xSjUJT3KJgUjQkh/XkK2GdPIkIuNsKqC3/7S8fLk8UwiOluNAAnSsb+KaOSqOUC6AjCFhE9CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085251; c=relaxed/simple;
	bh=N/01I3arb0JvYOAS7rcKtSWOMLBmF1heG9rgEhAN/T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWDJ6vxknpZBWxeakDKMroNaGkxGWZdPJLzIHNT9Gzdm3ms9lhMBR8a3ZwZFZuoCiGSWiNThtGjcBl8pH/7TLfBfH5AJvUqGMNh0Z110KTgIk894JTWUAV8Q3Md4TDvkTN/n5Y14emo15lc1oivqNzbrS2zcUS74uU5vAyrtGCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/Dbrtp+; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/Dbrtp+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d5862bc921so764465ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 13:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787085249; cv=none;
        d=google.com; s=arc-20260327;
        b=q8GHY09Ks6gNXrvgPnlNLB3mWCq7gULHnPUYdowEobk5qGscx5/P92/GDBnPZ6960C
         cQdi+SI02uUEN87Cpkd/L2xwWBvrnhYFIDfEZXnmmmTkBuZLpRzZNOuxS1gAXlElq2/S
         OInk8bJIhkG8EpG7w9M2HtNHKQazQnI44iR/d3rVJxh+j9dXIjW7322gkL8zg0enAS7v
         VEv6OJtOyW8+vSEynEPjVoLWpp8HNDiIIKL8UjHmvm6Gb4qM/BJ1EtMwrIrWxsafhBpC
         bkupHNQAkjb9Q/0foePp+oKVuRiLoSeUwecYz8qK7YtDEMMSuxgAgIwKWoii3KF8AwIs
         qz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wejPKdrPUvNJPxSOuhkO+cKcFWDhbqdCYzUyKCfy1WY=;
        fh=GjkDEfVHaTklyt9LjIYL2mKfUTkipIA3HqnTI10tiK8=;
        b=ZQ9S5kqORzLax6oYi8nyVmEIBjOM1iC+18cB4rV1GHwbtdOYE5rMx/2DrmYsqFRLy5
         zw3KI+4sOmNzo8qGDH95sNzVMjURVRYcZMc8OGdQZ0lMcLKEQyq3AKgOoClzwmx6Xu7m
         diM1WN397ADdaSK1Gg93bSZUI5oNtvhc9hRUDQ4oYjNKc3CANu5TsAzpRgzM4AYhPzMU
         Rso5uBD0bhMincAruea2ArecIrjb7ZmvJVX/sGQgiY+yFMjqyRRp2zRuyYikwBNM4ED1
         yypWPD6HlKS1QSkbssSlO1k5joPGuaLtRFIUCz3K3uZKQyrgWaXj9ZLIuq9cidTAGWsq
         FseQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085249; x=1787690049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wejPKdrPUvNJPxSOuhkO+cKcFWDhbqdCYzUyKCfy1WY=;
        b=g/Dbrtp+AfxjbVulbu9yVJa4DFlLoOPD9FXd9vNQwWZxaGG05s+eXAzz4z7uoLKy4y
         TqzVEDk3tsEQlQzqpSOeUhArx+Adv3EU4WSwkUKlHfYFVv9mGTtYKuLp+gobgBtfuHfL
         cnrJrgrH0m264VHi7tbqBIwovLmoIn3HV+BcnNWljjren2vBQBwrzb6816MejNzQ1zKL
         Ig8BC9yc8MqYUhRmf0MqFIIw/7g/vwUh6fR7HLNiJup2N52z8ZBwrIYa8KiHeHVqkud9
         jTyo8BY2qawX0/lvK7Ksxj18S3e/cbiYkYLZHJnKUd+DsKKuElKHPbZpAC+KVNtkVj4J
         wsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085249; x=1787690049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wejPKdrPUvNJPxSOuhkO+cKcFWDhbqdCYzUyKCfy1WY=;
        b=jgrl2oFDXgsTcPljubcE6wqrdvu0B0j1EavpaPZwUi3QV6azr+AxarL3Eqki/z36CF
         Q4xjouDX3mZSI6xznyaeMWFi5w/oT27uKp4pqB43/h4+HpL7CyU8T/ygigADPyfZPbUV
         BSgNO0EA8csZsOFKYO+SiDkXyKVqY3hudYdj/4X/tpQGFESNspNdt7l9KaVFapks2dYK
         pRZnSPWcyeXGAMAQ0cg69qnmkM71GAYPYAdpM35P+5dIeDp/qllOeBquv8ihRxdHmWFm
         5kTsgZ0pBcWy6K5mPvIJ6NVsx4qKababjsm+d7wiBwYVidPBE/RWFqO3nhnSlT52RyPa
         Jr4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpVW5g6+ubq4MTe7Cr+Xxora99sBopeO1OJuG8zkAx08IaDEwY3w75oQnrtEJsghE3Oq0MNoiHNzxjo17Wh/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84dXTvSfx+J9MbtJvDwdtoYdBIIG260E5m4b4ZCW1O3jDnI86
	uetDQZ/WYaR/BaJAlywW7KQI94WrBJwSDgzUN0PuFCZ1GyltcsofVDoVv1De3ZrUgC7iLPGJ3k6
	bBEO6OTq1N/5DU/4Ydpm9v6tG2MCtTiI=
X-Gm-Gg: AR+sD13ZJ/TBqPyoMspDOe7MEEqd0fErpvk1N4ZAhAQMKvpuQ6DZJr0xP+939UcaiES
	qbvORDZuKj3M2v0P1N1uA8U3wAjNkjFSnDfuOZsFKaaeDllpt9MHxfCYsoQcgsTIEhHHHSugC7h
	UsCs7hcqQ5AxTeh7560qS0MDe7Knq8Ib8v+A6MQnwnjd3KYNtJbOzunCR5ZHC8VL9/nz3TiSARv
	ehhnPbpSK3cCfRaFHW5J7a+UIq0r9ajFkFegk5M/cYCgS1/V7ZEwn9kLCGUyjItEZbyETAu0Mtd
	S/G0qaE2qtIrH7hnutO8QfmAj9ESwZGd9zMxKb6KlAlI6JskuDH6clWABZVusqfw5DVyxFS+1XR
	n+vcFqpA0BN+6UqFRdWo1LFtgdYaYdPyv8sShtZs26ngOoCXRAh/f3U1LSLwd
X-Received: by 2002:a17:903:3c70:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d5f690a7f0mr4953075ad.0.1787085249513; Tue, 18 Aug 2026
 13:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818105350.361218-1-ojeda@kernel.org> <20260818125558.GB5432@nvidia.com>
In-Reply-To: <20260818125558.GB5432@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 22:33:57 +0200
X-Gm-Features: AcwNN1XP-VtoOv-Bd7VIXi2fonKPLOID_bFjP-ajOtYy7n3DsuJ1tYHSHyvOurg
Message-ID: <CANiq72=V2EK_mt9w+7wvMws_=8bowjxtGALzA-k308gegyWDTQ@mail.gmail.com>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with `raw_try_init`
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Dave Jiang <dave.jiang@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 2:56=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> Linus will have to fix this as a merge conflict.

Yeah, I also warned Linus when I sent the patch:

  https://lore.kernel.org/rust-for-linux/CANiq72=3DXMeKaO09PhYkwHwxXO6uv0dV=
pcxi3tAOLzrmnvA=3DEgA@mail.gmail.com/

He already merged the Rust PR earlier today, so if you can remind him,
even better -- though I expect he is tracking the conflicts list I
gave him since we have other unrelated semantic conflicts this time
around.

Thanks!

Cheers,
Miguel
