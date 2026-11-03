Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793705643;
	b=eSXy1p5o/11uaimkmiQy7kTdFN5t6nh4Sy70TOHE/HRnxlEOZHiOWdfWyjBYzb7/I/07
	 y8X5+Mr45InPVYf2TAG8m9T2SBz5ZmLNkZndZa8oLTIp8PmVAgUUBofLEW7Bb1Ov/js8G
	 +hP4GGmmpMY9g+ryPpVHwgqX8tUtXLltqwj5nlkVtMGOz85/QfVoCTFcpEeMT1i5QeCkZ
	 fsWrLkugiB0/MIll5ePMN33zivkRoIcXuUQ1lVgDR9s/PeJ6C4Q2+pfDh89EVd/H2sO+Y
	 XTwueZz4bJyjIPK5G6USwGV5buae4N/SqL8j07yerXQE2ArBidcl6ru/4EABWjnzd+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cfOvbnreRRmSZwsiQ6nUYAkQQRmf3bNRhquYM+8iOsA=;
	b=zuHMFOzxrTiDuMrolk59hNgWAipo5uONClmqRLpAOHwTZ1tEBxB7PH9VK5NQUwwNwTK/
	 ih0YjsO5Di6eEoG/Sc3/JQDxmxhFrRqR4nC9/s8ur6hCCEANU2KcSYFS/z5QbmUTmKWrU
	 7Ue5ANaRER7W051pwpAb1CYPZPvIhk4fUkP3yBPpDwjCwTWSHL2Kkx7E7UsinhUq98TXr
	 63v5xt5Q0LMNNcOqOGOODDxoh/QPyeSqx5gf4m/M/t3QbpOg4PLdmVDPrX0UkbBAgxlDj
	 8nwxLIUBTON9agHS6lL9dHvcKClq/IHCKp6V8LPwtyb46COaWEmP5pY31FYUx46zhZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc59Z5mq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514DA606A326
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 11:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc59Z5mq
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a1c464349so530525eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 03:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793705642; cv=none;
        d=google.com; s=arc-20260327;
        b=ViOvtq8jfxqKehylgR0hhdq1OkoesE0l91LRHf5lA0v55CpaXXscOXkvq/ryQ3cJrw
         vpudBg7rIW3nP2OMG4TP9RXrJFjj9vWA2uo07ul5qacpAiX6JLfNwXhMt2oJ+EzjbuDm
         nnPn2nUDgo4v2rwo7z7PCl6cZDvcFbp3sYh4yFXRfdtEjG9bZBQJHyyaxpOgHp/ocdKJ
         D7r0GqJdi2VRMi08CLGLXXE2x2yIlGYG6OVRcz6OPF/u/iem5GfE8R0EubA2s9JcZDCN
         axhzuvTydNQ2qIEJxe9yAAqe4+J6zZBuSltfH6PSZx61n+AmBBSGzX7pfWmR/rIAy0xW
         +eEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cfOvbnreRRmSZwsiQ6nUYAkQQRmf3bNRhquYM+8iOsA=;
        fh=iAqRR0qLqbKnOoYEsQveleqZRquZGWX85Yazi0TvNjM=;
        b=Lg3Q1NnJoeS596yfELuUfP/cG4+d9LaGPuM2c6JYMPTeay6Zs7tFTHE4IWNaZNP+a0
         SrJ3omeEkj84Q51bh3zv7JbEgoDpXBOk9aNutqRI4I0VDmFEdFmAomPb++Hhi3zTMLJU
         axWh1aggwNcUrcgeUUNT+68o7yvf5ym0Bw1GqRC9zJi1x3tRC9ZXwX4WfrwgTWEPMya7
         a2oe4er8rXkwE2zV97lTjO0amVNLU3EaR6QjwnMjKSIyeMgPTAo8YjK4yue9+LZDWtQY
         EqXwcut72mU0m7KYbMyfGPz9Bm5CxXVcDeCXeWzoLrVNlXlzl6zTVitkhZaWID2VrNx/
         qgWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793705642; x=1794310442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cfOvbnreRRmSZwsiQ6nUYAkQQRmf3bNRhquYM+8iOsA=;
        b=vc59Z5mqgpqw+XuHGExMjcxe+s1YwaxnpmpGsKrQniN3Qus0WPN8zyiA73TCOGOIg0
         zZbVgzvgFgxJw2cqjCD/sUOitM5pxutoZU/fEN4t7seN4rggPMBXw+BCFtjGM6e/rGtS
         qmhHuUiRC+ic/4hXmX34btjze1VF/CRx1PV0h5ZLNrl8MtLuwSCV//BKRRXrzG/EbY1O
         ltbbFIJo7nNpgKBqmWqMhBWd8PvtqH2ovfpE2cUwoPkccCNOYXDlp1zqRZDdqxUR9OlP
         iaZpvZZ4cpcwuKBfEf++4bTv1igu+j4gvAxdFh9085kKkcKQk18V6/+ed1FQ4v4oGuqS
         YZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705642; x=1794310442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfOvbnreRRmSZwsiQ6nUYAkQQRmf3bNRhquYM+8iOsA=;
        b=0lwSc/Tt16370VOtwIZs2PvBnn09bODF+CYqkIDe0YNXjFvW4lKir7ov5ynGbhrbOZ
         mhdCYetkx2IPcy1JOksDqNr5t2bjW/GjSOeWGOnpbAQhg0XlLvdaUr+c1ta1373fbjim
         TYwtPV78TudTXKJIb9jTp526LXCIPVVugBbbpkW2KRKnh3xWXnst8n7MQ5k8caRAJg0E
         hgCabhDlqmPXUZkjcEvSbL0Z2phBIMI1909IYSZz7bXlN6BtiaydNBXfuZL9aawhJBey
         ipDFzrfw4zMLHGWOf6iX2cPgCQKglmclwCNjmOjoFankiqQCfoaYMwZPiGo7IE4eaqiM
         pI4w==
X-Forwarded-Encrypted: i=1; AKwUvBxkFoIjFr6MvK1EZ7Es00f4chzpwW19PMgshxvnwXHKl30ZBQ7P46b7UnUW41ZieZRAG06H3FTs/FUECeiuwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0RFXLdWt2Uktxe98YHxOcPaMhcHy4RuemgjrT05vEpdrFr6ld
	nEPQ2MPWrtpl3TkweWNc0fgUba2GEHzzdbpB63pBSB5buVRbCPaJQJKzo3fW1Qed+/pn79CCE86
	hGWRg0x3/RbMgZ1WQNnEcN+/ON2ZhmOg=
X-Gm-Gg: AYBFou0Bd7v558XqbqLkO/rPWGtBU5wrkOHEI0Lmwdryu1IJGYo/xn+CUAbvriy5SCm
	tzQkWscEi+KcDlFxUaXDF8KQG3exNFYAfSM38uvQ0T83zVHLUb8xT1xgaaTamw6FeIXz8hfTKXN
	vki8IbsZgvzlHGCOeYe8t5C87zJ5J/NOM0cPDl3rdKkCXBPUFr0DMZHrW6aAWEKxz0p/xG9WIQO
	BEAIo6xSX+SUYRsYNtlLdLR8VrbyQSX7ZRKvJhnaPfMh4MCbGV3+2smnV+7/emklyltSUgM8TCq
	LoIeEXtqp/xbifPzJkr2TqJ4+ZfDbIINv0mU5LOSyjnCymnFiG/zIsbpl09fZ4GKhXatXiqWMrK
	S1ydUkcPVaSOhsSuIAfrMTRro8liy4lSeTPZIU4qgKHUL+4zD+FpiQoddVCM/B+JCvZkBGw1rgd
	C0wwzhEjK3f8BbEjRquIsOfZmpXeUcaNFHrDn7mbWk+ei1ezt80GW/VZ2vOUcNj4VjUy0Bkb9kN
	Btis+Ku2HVtfDWqXlr6XtWw1F/6C07EfvH2Fg==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr26403282eec.2.1793705642096; Tue, 03 Nov 2026
 03:34:02 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKHwh-E-7CRRG-DH6-rDfGUCFAxG6JNgswk-suTaGKqMbig5Jg@mail.gmail.com>
In-Reply-To: <CAKHwh-E-7CRRG-DH6-rDfGUCFAxG6JNgswk-suTaGKqMbig5Jg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:33:49 +0100
X-Gm-Features: AclHuK-iMhGiUjJv_8E5Imp48tsrm0NqaTaFIcoPNcGmyO5xXsgwEO2YqTM6jGc
Message-ID: <CANiq72kw9+VSV8A+GvsYQrV0Qw19=6hg10Zjw9pDPOD-1nR-7Q@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: test drop behavior of Vec::drain_all
To: Peder Bergan <peder.bergan@gmail.com>
Cc: dakr@kernel.org, aliceryhl@google.com, ljs@kernel.org, vbabka@kernel.org, 
	liam@infradead.org, urezki@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:32=E2=80=AFAM Peder Bergan <peder.bergan@gmail.co=
m> wrote:
>
> This adds KUnit coverage for the ownership and destruction behavior of
> Vec::drain_all. The existing example consumes integers to exhaustion,
> which cannot exercise destruction of unconsumed resource-owning values.
>
> The new tests cover partial, absent and complete consumption, plus an
> empty vector. In the partial case, the first yielded value stays alive
> after both the drain and the vector are dropped. Per-element counters
> check that each value is destroyed exactly once by its current owner.

[ A couple procedural nits, since the message joined my inbox while I
was there. ]

This seems to repeat part of the commit message -- is there a reason?

> Base: alloc-next at 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4.

The hash should go into `--base` in `git format-patch`, that way other
tooling can pick it up (it is good to mention the branch name here,
nevertheless).

> +        // The caller owns the yielded value, while the drain drops
> the remaining values.

I think your patch may be wrapped and so it cannot be easily applied
-- please use `git send-email` or `b4` to handle that.

I hope that helps!

Cheers,
Miguel
