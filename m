Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5DA2DA767
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899380; cv=none; b=G3jVrzJcl6ja8GtSaLsF1xIOjyXDExJRTGx8Nw9yQgph5AB9xo6LDry8vm+hLShQXMwakyYjgX8tsjoBV+2kdHomXrVKwJywEObusinB3fTXtqZrTSrsiFRHWUnWjdKIHgFV4vIHC5n0+2XYgYUzYq+4KH4g2gYQ+ifn/TJ9k1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899380; c=relaxed/simple;
	bh=7reyRBP3UdIht+6RRZkiKQMHmNl6aG2xURu4YxzEKWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoKLqfoCT9tr8b5nh57007wGr42g5tuV/9V4FiOz9xr7QDTNqhQsoauGQ3iHtf2G3x7SlChUv1T1dOXn364aKRUj87lZSyYz0nk3Hw833TWoC1qRckdU6ZfKSldj6i194rALv6de9qkGdksRM/QhXnRCli000D9B+hekwCx2bCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UgyIgxe5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UgyIgxe5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b780bdda21so3309679f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754899377; x=1755504177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7reyRBP3UdIht+6RRZkiKQMHmNl6aG2xURu4YxzEKWc=;
        b=UgyIgxe5Ro6fYRxflU0Ego4guQMhfCEzSrhh6tDPEaJ/DO14bGBDcxzK1v+bTVGFl+
         tbiMxEaCksHK4YVOdUluwfTA5WWn1+g1AERaS1cKb3pxAasn+C0bwkJPU9fmDQicrcd3
         VmU1FBnX4Uyri97fP7/vxgPjIH0Q3u9Rb1tR320XdFi2GHxAXRLErICdVuFpBVVfooRR
         ywysR+LJf0ftKt+WlDl/Gi38R1XYgP1DE2/xXR+Cmj+Pl1EAyBFkrclB3SG9nkFU89xC
         z/eO2xxIdARlwvcRi5qTUT3enjYGdcGv3soYYJPlYpxbyt7SMYBN+4Cddt8ZJhpeWC/6
         KfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754899377; x=1755504177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7reyRBP3UdIht+6RRZkiKQMHmNl6aG2xURu4YxzEKWc=;
        b=DVWNiNBDjOuauaSekPBDeMZh6cmmjDRyar2kW1b6RHhtHdZo57Ppm4DjlDwCSVLPE2
         ios9OPRddJjwPoRCGUT/J9m4Ie6fWwFoeyt3bryJbhkPtilMmvtiSYb3s75OksKAeNgg
         RLIqQddTqyYRwcRUprR1wlDMRiPmmFGFWhUQpztQM8FVZ2ILs5+hhpHxKDkZQMjV7IRg
         h45H3nbv+Rga3HlFEGetlHXJfhuo4xSAjZoNO3ONaDLrpAxL1E1xHmNdjMPg3kGCZ96y
         kXbh0ossqHedMk6/gp9ZXNjUn8xqzf7pZm+a+GCA8Cnttt4OOvT22M25CocCt/6tLNwW
         9+9A==
X-Forwarded-Encrypted: i=1; AJvYcCWUaEqrZ8YaeL8eQ72RwvOBeER64AinqsBw/GIo3PEpyxcPAZhqpsReC/BiJjabXI2D7aTzJHwT36Cx4hFvLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Ptn49U/QBCa3Abp8n8vHeURTrL7zo+UOMZvxULEhR8wrmp8S
	0Ke7n4y6odI5YEfDuCLHa4ZllKiaVIDUS35IMFSJ2opBAtTrse19KVDXJ1ByGcMcwg0s59dF4uy
	jvoEuZdfbwaaZv4GmEDusN6CkaOfGFWGzpxaJDnka
X-Gm-Gg: ASbGnctyv2KpefWaTtVu0iCkdwKTbpoSZQ/Rp2DfMCyn7JmgfJGEoSPCz1fzTIBSCsK
	f/7UBBwEGI1B22Jfj0dZ24zy7OdWrCaWNWbdRF+OKrOdcfPMAefo03IUx+Wb785BRxXCA7okQYD
	UOBrGEEcUixGyPNleafbQBnPMwxdr5UuSYo0CgWDQ95ibPtHr+7tbYrgnZixr1cxCn9eZ8mXc23
	H6D+N8=
X-Google-Smtp-Source: AGHT+IEsu+bZtUYeYy1qxaEMLjKNvZBb3uTm4CG8EO4rTl+OBSEfC36KtsdxhcyXXfpc50vvrKBBnYZqH3HvoakxFc4=
X-Received: by 2002:a05:6000:40de:b0:3b3:c4b1:a212 with SMTP id
 ffacd0b85a97d-3b900b4713bmr8942645f8f.7.1754899376430; Mon, 11 Aug 2025
 01:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175489428990.9320.6825335165759789458-0@git.sr.ht>
In-Reply-To: <175489428990.9320.6825335165759789458-0@git.sr.ht>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Aug 2025 10:02:41 +0200
X-Gm-Features: Ac12FXx9gehz2CxGJpQ6e8qy2Wc5klN9fbM4vuuLbJwT1_XhTbxYB4DdVe_ursc
Message-ID: <CAH5fLggrXbaOu8D2eFL+UtrNSqbm8H9sfgjDJzVJXMEgjBkffw@mail.gmail.com>
Subject: Re: [PATCH linux] of: resolves TODO for copy_from_slice
To: "~_xllx_" <elle@weathered-steel.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 8:38=E2=80=AFAM ~_xllx_ <_xllx_@git.sr.ht> wrote:
>
> From: elle <elle@weathered-steel.dev>
>
> Replaces the copy loop with `copy_from_slice` which became `const` in
> stable Rust with version `1.87.0`.
>
> Authored-by: elle <elle@weathered-steel.dev>
> Signed-off-by: elle <elle@weathered-steel.dev>

We still support rustc 1.78 and forward.

Alice
