Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3D72F60A1
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769369514; cv=pass; b=W3xyF+MxFFLnAIx6FFKc6zUDJH1VK2L58+R+h+5B02S4CgP97hnOq1NPzeDuvh3ig6iiodUNUEpYeU2/mP4mekFFTVlp+xo6xTj+QIzYMzDRzVrvNZc+WK+CsrnQNa1KkSPAzOATIxsEd3e2xsspDWacIq/bZ1VS16OMQT3SKJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769369514; c=relaxed/simple;
	bh=fPAp8UIXg97X7d5H7WNxrNYgN5hhftdDhA8G02w0Yz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRCMfw6l8n1Z/JZG6+LIkvwDP/+nWSnvl4FG4cctLOrenFqhwQNcBXzGqmGxq+jzJxBeR8Foxvh7SnfcvGirD6AK7b094GBBhw/Y22nVIeNss4nH1c0K5kQ6I5DVSpzROilkMAkVKyLnsJc5IFNMx0XeAWqq6tPSG9arzr8RQlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPRfw+1P; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPRfw+1P"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6aa67a792so163861eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 11:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769369512; cv=none;
        d=google.com; s=arc-20240605;
        b=bh3nmAU2lR6Hx6Fpiso/PStMsHH9Vf/tCTyt236YI7+i61+mvg0nbLp324z8FUBx2a
         p6WF4JpDIXBjz1kb4pvZWIXKVV9Srh9jqZOcjfM/7YdPuYe2+G0uQVw2kwCmDOL+/ltA
         8APdK1dfQHCc3aCRiH7quuJ4gqB5fmrhfGRaQIeokrqig9Dyawyn/Wh/+U9xmi464bw6
         99SeiF7xHu7620TA/xBzPdGEjyydT9Jitv6/0K05GLh8fzFUCLee4pdAr71Fae0eOQ6A
         frtJGDytRDFxkR3cbOTQ4tcGTbPTFJ5WeZxFnH843VP9RBdzgouEXFgdWnsmaA0x7/Ps
         PsfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oCYZ6EVMM8zSfmlw1EvcNIYl747x8F2M7ChfkVAJ30o=;
        fh=KmnnU2NLoKC6Hve8MdTixKoVR0KOwRcUV7k2N6S3bd8=;
        b=DMUtE+vOAuvCJw7ca3H5P1f3CVNiHCWFso8n2wMPCGT8ELNXle6hVKvmwHKm29i49w
         D0kqjlryCZotKjpL3pu/UAYWD2qME+hP7pozhNkKDE39kD9liiMRFbfdz7ZFmBqL+GSc
         A/+hBQNA3CDKs2KIfRIW6AmYECoL1Hd3fh/hhJr3Iiso3ae26Z6hqQvAfskpCIhiMpNY
         LXxwBZwEbc44fnl0869O7jPwU5Ng+va+aKWLTFUpJXxiMRzM/io+gHAt/hqurNDMT7r2
         gLeYCBIZCjWuHOZVpA8n0MZ6d+zO+jrq3RiL0ry8VyT/9APciJ8/7pVYz6nIhSizBF8x
         l/+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769369512; x=1769974312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCYZ6EVMM8zSfmlw1EvcNIYl747x8F2M7ChfkVAJ30o=;
        b=FPRfw+1PQ/C1Fw748H3+TyRZbcUuAhwtxG6Syhp8laS4eM0qb3VWivfybiFacQhTf/
         JUT0jzxDLMiaGHjJeYtEKiqa9eGepGczSUix8oMjsZnLNqdVlC/qVpTbvhb15sodrPJe
         JNpNJZKnCvAAL6V0kqPl7x3WROXhdTrbQCV74OeCkGDoY2TAyIlGtXLKS/WnscS0m/tE
         RiY/A0VlIHocleFC94/6OGvFpHFmI65Xdzsev1SomKGvmvHnZPjsHBeBcy2jemxTRLiU
         SQDeFp0uj8WENV6uolTwEHqDElHJGnzZjSS3vgYeHZ5WOQZXyssczjkxni4H/7ROww9k
         Lchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769369512; x=1769974312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oCYZ6EVMM8zSfmlw1EvcNIYl747x8F2M7ChfkVAJ30o=;
        b=jW+dozXCGB32t/NJnoHH3hPv77bfEiV3ba7Ji/ITDL3VbzyW5bAcPkREJa+yMRSJhI
         sEMInkM+KNEfs2/I0ZiHoRX8LpHD16QBFxlx95xFPGuv5JhljxbOBDdRPjbATx5D0RRY
         rmYc4ROJSEm9yBMMkWadGmFkgzrUCp7/PMR5AsY1YkvkliWMf9wt/c0AdN7tZpchqdu/
         clmo/dlvtm0HP4IRf0H70bOlUERxvq4vesI5BqFmM33brHRiSau3DwLYFlfJmOjKV7h+
         VTpLshOpFxRyIlltDa6HgKFY2U+LvWBOaNhbmBvFY9HXWcZCD2JWiBJlOq2fevPx7Jef
         PhzA==
X-Forwarded-Encrypted: i=1; AJvYcCUl4xnCe2IGTuFhRTyuSqJl2uU5T4KCdxzmHIpTDRLNnAwNoQXyQrRCCjLW7ckBolxd8+RK7nphTz9jjSXfNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxJl9nPJG1qvB8KN0oTLNEyGcdeKt+JlCNUfKB8HlyFaFc4fbm
	qO790wAKIIeg21NN/ql0lFKgVE6PYIkYv6XiWfkXlDg6rLHFKcwJgTTh5dvD2tiicc3SPOSvbAR
	Xd3ToaQWEGAk1UfCgVJq9CuZjcZWmwuA=
X-Gm-Gg: AZuq6aJGScoJYijAhL5OF0cP9wsw9p9DTmEtjQX5/3JlD+ogUFxex3TcK0+ejj2Cc9/
	UHlmm7Biqiwf+y9Juxen7O1PrpOKD6OQAjJievn6d/z26stxAmYkiaSTH7SnPVM4Ydl3L2MELka
	p4b7qc+T9ty+teT1NrG3mdzgP63od3u0ChDdGsbOVnYc99JJWArfFtiApTAQo9PIo184GfP9pkn
	uffwC/hrIszeGJjg7DoSCjqdVtc2yVJZm8sXIKXbgHMUay7fGMvx7M+3DYPFkuJsjC1Th8he9aB
	ExtdhYXDNFJlB6U5YAnvmiP6SoV25qbfhD/dvAyzX3e5MZdYyCbTqUn8vqSybYHzpT4T9O2BhRX
	7CjO5x5p5uOz5Nmcwlry7vIU=
X-Received: by 2002:a05:7300:730c:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b764828e58mr528325eec.5.1769369512443; Sun, 25 Jan 2026
 11:31:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129124706.26263-1-atharvd440@gmail.com>
In-Reply-To: <20251129124706.26263-1-atharvd440@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 20:31:40 +0100
X-Gm-Features: AZwV_QjR6E3moaPQ84WTNSw6mg0IJQ1S0uBvzNkuxr_seNZwcMmpOFEofNm_Kvg
Message-ID: <CANiq72m4Oxm69hzqF1WB5bY87BLUr556v6_sZPeEkd3KM7RF+g@mail.gmail.com>
Subject: Re: [PATCH] rust: auxiliary: use `pin_init::zeroed()` for device ID
To: Atharv Dubey <atharvd440@gmail.com>, Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 1:47=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com>=
 wrote:
>
> Replace the previous `unsafe { core::mem::zeroed() }` initialization
> for `bindings::auxillary_device_id` with `pin_init::zeroed()`. This remov=
es
> the explicit unsafe block and uses the safer pinned zero-initialization
> helper.
>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

These were also sent by Benno, and in the issue he mentions
"re-sending", which usually means just adding your Signed-off-by below
his:

    https://lore.kernel.org/all/20250814093046.2071971-1-lossin@kernel.org/

But he also mentioned the Suggested-by tag etc., so it is probably OK
to keep authorship and add:

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1189

Cheers,
Miguel
