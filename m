Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189120;
	b=SHqX2EXfOzP4KgnN/FKcnxerV7iXtjBCoV37Mls+6kFaj5VO6cPy0yVCapTgix2Havh9
	 SRI2/mV6U38byRp7G1KerF72aTeZfThOa0KnfCSlXzhmOT3cq4Rme3pyFBH8eyDRz7YRC
	 8FlmjjhqpdbZEKYXH3+VKiKitQM2Mj6rZUHBft8LDKsINzP1Er7M5iY9SOYXPoqol+RhW
	 ZjO9teHto2B0g61IshF0mVxeT8AphiZfzwiyZw+DcBaWKRMIxQYVbBoxeKJjKoSWgBBMl
	 daaKNWkRpJoGpMyIwwMYOumZtL4V4CttyzuIVEXAr2rkpTOExzL2Mog9ZmhnNFbTTMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:
	 X-Google-Nh-Sender:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ps+r6wqioFZ5jOTix48/157hwwLW+rUrXw7vqmb1SQE=;
	b=Rz/RfMnhzxRqkW/xcUc+dpjtZqdwRcpTDsAf7gKhys7oXvO9cP0zMNnXQxIWZl8sQc1i
	 yRdZzRADxlPVG8geMB6EEi7mlmqRP9Fz/PsuUtBVtwOVnUwaAvpKIwwve6jumnMeF0gUO
	 IsoKKdnMEhZ1FT3lt+BEPGN36sibijObfiBH7yKaMMJAlVzIrtxb6RXvNW2FLgI6FsuZN
	 bKAVTMBsZI0z0MrUwEpDfbD+JFvBgRD9Kh/Ckc2PdhUCcMaem0RCgy2+kDuoKTmfhARdO
	 jZq77/XdckxGyk0rhmU+uRL1IgGGEIxpv6Ej1BPgT7nGpnBQaZy5VqpIAE14Ld1GoEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnVGGT5F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139B606A330
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 15:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0139B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnVGGT5F
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b315dd057bso6902057b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 07:38:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795189119; cv=none;
        d=google.com; s=arc-20260327;
        b=H1ZFlhoV5NHZwSKLOU7TEN28GyI0ICFU0EpbFRkKNvLwCkFaZdp8uR6iqUdvNrPEo1
         ASGLjtdQ+zn0ew6xlWd0tM6HjjXL9WDKrVbAzM9ZxbVMX5KdtXA5RNa2/XIMmypJfyZU
         8In8UN7lCEHz5VUoJWaMl0dwptRTHkOJE/aoPlWo8bb6Hxi/hOJvyd7mvgEqyfmgGpLV
         7nm+/fJ2vAWcYkZDzt+rcN7jrG/jffUEnfKMyjxOn+r2x7w3RzY9ASfzZpkn7duL4X2A
         KbDlOq6dIXeFMbUqd8EcCNSxBPX75RWBU8VgQGVL2rSL0TvUYmRkTLsihw0hCOI1TU3r
         f9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Ps+r6wqioFZ5jOTix48/157hwwLW+rUrXw7vqmb1SQE=;
        fh=6DRvLvSaGKQ3gk69qBjbCaHr8R1LkyBxWxta8InDvXM=;
        b=Gd/YTRg3sNlR+mPgI/UkcMMD2FhrilzT3Y5WXh0LnuiMMtaGGdW0r9TaFBSwlL759C
         tR6bre9t/boBS6N0ZfECLh6zvlLTUjd3jCB4IzaYi6/C2Tv7UIbYLS+PpF3wDzy2DdsH
         D9XJP5XqRmXy/9mkehXg7FRcHprj0K6Mz0LYjyR4Jt+ELpzvtdB/ijNicXbqBqXR66nZ
         38ZBXkgpnboKMdNwY7i5CDUmRtswgG2DRKKDI9BcfCiOoJg8DhY5tOgqW90Klxv7rU0Q
         Wm6Trvg6qXkvXEO6Pdfh44oKLac9sXiPc3faY0jCgDmHfZbHM5emk1M65yCbcKkBtzwK
         U37A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795189119; x=1795793919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ps+r6wqioFZ5jOTix48/157hwwLW+rUrXw7vqmb1SQE=;
        b=bnVGGT5FdmfEv33S1WebbDElFiOPTlcUqXiZC55dfSFHGLQwFARnITwzxuBWLniQrW
         q8pWxUscFadJF2tPc65NGbH3a74iijEKChfdjO8i3OqgCNezzzMm+819J0XZYTOUPCT9
         2U21a8HyXsZk8rzpayrPVDyF+AeYsrff1w08u7diFt7mD7XoAuBHm67EJDkqiLCZ9LzR
         Dcti7VKSMEu3wxV1jk1BdKVtKv8NQyGKpf4BTu5yxWsqEPx9VAnagka7VyUqnB5UD/uf
         1yxZMIpKVsR/QesEP1jtp4yizg8aowpIw+GpXXKONwE+ZwGbroaQXWCMxzOQ56rKRebW
         MeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795189119; x=1795793919;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ps+r6wqioFZ5jOTix48/157hwwLW+rUrXw7vqmb1SQE=;
        b=hcGMVDcEyeoDrdONJe+1ObrwxG1xmaTYXOrt4tlorrM0SeOXvWvnDWUw9jw7vy3gCg
         Bk9xJOfjOcrSKf9cjOlTp0omOZV/PGujWvC70+Nd5juxgHZLPNx92h1kKIJu7OfKEpMP
         RQDSXSrG7H7Au5AoGiPOaBTBor4M/miDyld1y0DcQ6SZo2jlpnxFre3QeVYUqw/rvzbO
         zRrbsm+Sxn4WXiV/vPXFB32DDXJvM/A/0yzX+HpKgPb2fldv8APt5MdwEluKWXC2hLv+
         CPj5Iw7Ah/nwzJ978WStJ7LncckKVEmWvzdG9b3cqb8lnL2MobnPnxWf7cTaKqTLm1k/
         5kVA==
X-Forwarded-Encrypted: i=1; AL+hErHtDvyohXUeXwPpQiW8xX4b78IICJRDrN2pd+lXzSh8YWOsI+GgmoIg7vlgNpmB3S+JXK2yEOmLtXhggZwMJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LllZFK+lP3MplxUyyzWXjCbBymPyV3Wmjqoa3cg9k50URM32E
	+oFgmYBy1pU7R0w9BebQeDTkb4XNpXOoUFF99XQWZKd6x0/oDEvNpOn4O1tToxl6WkQhpDQBTBf
	h62OwfIGzh/t95iRpeA06BxB0/gSFOxc=
X-Gm-Gg: AZFdTZdh/CfJJ47DZuimLCUphL+TnQxajVwbetp0FTnzkj86Q1NxU888PsYHSEjsigm
	LhMCk3uT/sh566hc94fU9rzWJ/2FX+uennCy0gxAuj7jIU7qPPsD1TZtCn0/p0C2EP8fc35ktLQ
	2j/mTg5i6AuBYSqjeRcyxEsIeeW5Li79N0pfmAlZIHjli3zVCSABJK2XPVfYBs1UDfi/yqbuIia
	r7MVt4ocMk6vjWYJeSCkpMKl+dLLNCXqk4J6ZkWY73cTflc+GZAg1kCQLwOheZGb814v8yaS8Uf
	NTXy0O0qUs0PxYgv9MUpUeT7R1qwF1E+Hm+asl005wKKvhMfsBkHLw9pMgsXqRwtPBBG6DE40v+
	rSqxJC9IBLtHiAyOLMDg7NFeGM7GPWyTZEc0AWI8QHhPh7lsooHoBQh1JNHT5acsC5rkg6WZ1hh
	1hNeB2+0O559qC8PoZzpv6hZEb+ylaRz1ZhVSDYC1KrJyaRe4acHd2IJXLH2A551IzCJygJuNUV
	tlo5A==
X-Received: by 2002:a05:690c:b1d:b0:8b4:dcd0:c84f with SMTP id
 00721157ae682-8b5204eac4fmr16574387b3.47.1795189118800; Fri, 20 Nov 2026
 07:38:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 20 Nov 2026 09:38:37 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 20 Nov 2026 09:38:12 -0600
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 20 Nov 2026 10:37:20 -0500
From: peder.bergan@gmail.com
In-Reply-To: <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
References: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
 <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
X-Google-Nh-Sender: AW_J_Uo0_1sBs8TErsdnA0bl-M_r09fo3bmPAFKFbN5updnOD3nt4wJAkVJ_H5CTbSBmeL_sAzELV7JydptwZ3U-bKXp4hN5P0JxyGZRhaKvQbc2xeia6Am19MNbOhrETJgmIlapcSxEfkIRcK97u7m9H2ahPrMhiDDN8BPwRvv50BcSMzFFRcxdoi5ZcHMpe9wC89aIvFtv1ZI5lI1vdEbb2_Uq2euYD3oi8xW93afcjggJ4FNACxgUJWawMCo_eQgx3psl
Date: Fri, 20 Nov 2026 09:38:37 -0600
X-Gm-Features: Aa3M54rVdUxyxZnU-ZKzu4pEIUMsVnXfFp-UHkXmafb_R_K0SJjuvOWClOTzccI
Message-ID: <nh-e30bf2f4-acc5-411c-89f2-b5dd827aa4d5@google.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Jules Mercier <jules@les-mercier.fr>
Content-Type: text/plain; charset="UTF-8"

Thanks, Miguel.

I looked into bindgen 0.73.1. The layout diverges earlier at
task_struct.se, and my v1 leaves that offset unchanged.

I ran a reduced test and found that making the type opaque can worsen
field placement on 0.73.0 and 0.73.1. Would you prefer limiting the
workaround to 0.73.2 with scheduler statistics disabled?

I'll add the bindgen issue link and update the comment and stable tag.

Thanks for testing, Jules. I'll add your Reported-by and copy you on v2.
