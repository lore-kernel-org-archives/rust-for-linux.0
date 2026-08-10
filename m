Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F84048B1
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374878; cv=pass; b=rL/5/7xslYCu5pAW2L1MupnH/FzYg4XeM+sOUJMLkDziMfh0l9MC+la+9Qmtj8jNVCjQKTlwwOGxa1OEjPcQGQxYVp0MiorWNPoKzXxmB6FAfp5eoPsw+i4o/lce1KMFo1BkeojzBehOkv+hwE1V/mw2v8CD1U6ivJkxEuQvdX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374878; c=relaxed/simple;
	bh=lWrp0+S8yTG2bZoxMmKx3l4wh4JQEiZ+pXK8yhSHxhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2GQUxib7iqEgo+lM4t/NtYEuVRUdxgeduhxZSlQjBRj9XsLVe6yr8e+y8Tjfqq3TsZC8LeFNKM+p5MsYWrYAO1SY6CpXE6AfmqLrDs0XDlwpMV8kPICxSwRNfVRQ0UyJtcEjxuvKyMHUzOCnCgJj2KyHJLkNQjaQxDZP4U2O6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLdwP4Nn; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLdwP4Nn"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cffd93cdedso1394555ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 08:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786374876; cv=none;
        d=google.com; s=arc-20260327;
        b=MaoBAAa0s91TOnmmNSO+rAYEcMCzuJ51z/paBa+6TPpLzXjTttiJcmL3KMG6RQ0Cy2
         nuNCR3Da2eN9pkUj5cyr2oTSSh8374yit3CPNCq7JY5h+FJV92MiLEVBgJZVTGNU8Wt+
         EjQ5ZCuPsZQiwgngUPCWsnaNFAJyvUPlnAic/s6UfyXLESgTNOjc/07bGeMhannKKz/A
         A8zkdfyja51OhXG/DYAOgrOfI6AzSzvjO9ezkkYrIFuLgFcq0AWfaS1iLCH8fPWdvm75
         fgfFkhRFO2XabwtLZd06i4wOP3MR4dw07VBVYM00O+VXCg9ECZXFy+B3dzrDrnHGaVLS
         8Stg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsvLcYw92jqUdNuwtnOa61g/5vWx3AsXfWVhRcglFJo=;
        fh=Atd7loo0iEkiRUcMZTtocmnPJY+WNI7axeVwV8DkjnI=;
        b=PxhmhijdwQgN+Yf6YkK1nCMdi1q0bOiwGolW/zG9Pg6cQS00SIXv3p9iQvhvwE3urI
         OxJ4thDm3lnuI4PXmkyRIfE75T7okpEt0V3ZUDgaZf6HbepYIO8T7l+FimiR1tzYT911
         0ojmwQqdMxZ8chVjDMPQK82OnBR6Bldyeu3hOJP2JR0F/RSHPlTq+fMwB43Gbtljdqwc
         YQtf6jTiZDDjBgMQnaSV498VBGBTZBErkAsLYyjlX7/O0JeVVym2GAzd4Wy/3sHoFUob
         X3lnFgYAbwrGhHzLmBSUo+uk8g3Xhp1+4o/J0W8B6wRZV8/kLKXwJECU1u/tYcPS+fls
         xPKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786374876; x=1786979676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsvLcYw92jqUdNuwtnOa61g/5vWx3AsXfWVhRcglFJo=;
        b=hLdwP4NnUNFzI4Ybp8nvpCrb3ZHUpg35onlsgbL8rvHEzdn6UFGEM9WrkCOHGB7Mmj
         AgdAzfJ7h4DPDYun8gZKqI1XU4JNlkFhO+x1mtbXflA6+O6LdQijnyg3W+ocBN/HtVVy
         jNeEO8EeXgot4C/dqmaLrT+LaryoCSF5O6fJnKhMVDeTVO79AGuAJaZtnfyew0ZNg7cw
         RWBpaA94j47aykCMTc7hQ1qyGZyxaMKsAG7/2slpUzW31FG4PXMnL0scPTUHqDGBbYxl
         dcZ5g/Ml1/Ugmx31KI0mP2DxxjMOE4AOA+C4RolL7Mu7CB5ENAPWUQYB6eVdqnUeF3CP
         aM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786374876; x=1786979676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsvLcYw92jqUdNuwtnOa61g/5vWx3AsXfWVhRcglFJo=;
        b=dnHuZONIJuVL8NJyIHLmI3QEquIX4fQWJ7svXUae02DOYit/u/w0qR7TXOnvWwxauh
         0faY5fpWdthyffZ/qxcJNGoxSoawEKAjCZAioCvVQh4xIudgshpKgWbVtbtS8YgORQkf
         sq9oOhCJ9ylEs3Ygy01RaDhca+wqVwOQCIeYFBLbnJChH0hDaJCNHGoaMqpIj0hAOtAY
         1iKHO8Fp5rBEmfnIKYKU7071gFyQcQRzi0hekv7c7CqeM20mvX+l9MjP741FwWjlxFPx
         aFaF9Mja3CshTcJPXdP63dLRRAbUPWuKsHv0z7Rq+7ifCW8M8BH9b8492/KLeEcgtw7o
         AY+g==
X-Forwarded-Encrypted: i=1; AHgh+RrjTgq/aw3OLSpM2/pciNHQDxuSucXKwRA2Q+EJTLes69SR4sHObpeOHFr1xxhwnIFLbeuteHOQivfMZuPKgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMiMyrx9Oj/aDQoOhH2Kgp/8MJpS+U/XFlT+zoqJWytLhTVD6q
	Lna1LZwxqET8InfvmA5cvv3TLQ0Gp1DmqQiSGivwDiuEqIdmFMepqi2PiZVJ39UJZpagvEUUMT6
	xIQrsphgL1uXKSiI7DLvOdmOI8UyGt4w=
X-Gm-Gg: AR+sD108QpH8J4UZeDUEKf3fP8O0f2d1dH9qAf+IpShSclFFhNoXtSr3vQcHjDEThfj
	CmQBTsxtWeWgGBM3XYw5NNOOYiOyCbqEe0a+K9NdOaicggb9ZBUKmaYNUh9ZSLj1FqhqDwLkN19
	xFe7XELYG4XVD2UxFO/dvbzDojQcQtIdxfVPmhvZAYLC5cm1E2kySfFcdRi/ajocZVdCsOiteeT
	TQXORehG3lAzr3etkD7hEC0L4J4otPVzJGrgQSkOvn1sV6u2MQD67CI3dmbIzMEN+hjzXFw5Nrv
	LVUfmwTx5eU5cfwDYIpzU9c+aXr3+1n9H/AWvIFnkN77YiAGI4Zie1PVpFYN4LHkbnmqEaYak1y
	hPUs9Mdcy//nFhBayV2yDImKUYklwlDtNctQin6Z3xu5iCKXgXdwIr6eDOajS
X-Received: by 2002:a17:903:1b2b:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d0caa9bb8bmr358544125ad.2.1786374876100; Mon, 10 Aug 2026
 08:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810150322.61809-1-nikolai@nikolaigrlica.dev>
In-Reply-To: <20260810150322.61809-1-nikolai@nikolaigrlica.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 17:14:20 +0200
X-Gm-Features: AUfX_mw_qZCfAiRyKyvctR4f2Tc23Km9r8ALCs8WtL973our76U8PqAfdbpSEK8
Message-ID: <CANiq72mgeJoZdhPsj9Zu3Xop6A96eFTeYy0aNEWQ400t00f8fA@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: list: fix incorrect pop_back example comment
To: Nikolai Grlica <nikolai@nikolaigrlica.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 5:03=E2=80=AFPM Nikolai Grlica
<nikolai@nikolaigrlica.dev> wrote:
>
> The example uses pop_back(), but the accompanying comment says
> pop_front(). Update the comment to match the example.
>
> Signed-off-by: Nikolai Grlica <nikolai@nikolaigrlica.dev>

Good eyes, thanks -- and welcome! I think it is your first patch to
the kernel (?).

Some extra tags I will add when applying it:

Cc: stable@vger.kernel.org
Fixes: bf87a41b85d6 ("rust: list: Add an example for `ListLinksSelfPtr` usa=
ge")

By the way, for future patches, please remember to Cc the relevant
reviewers and maintainers -- you can use e.g.
`scripts/get_maintainer.pl` for that. Done here for you! :) I have
some other tips and links here:

  https://rust-for-linux.com/contributing

I hope that helps!

Cheers,
Miguel
