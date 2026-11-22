Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795344492;
	b=uDBFW8CTe2pARXhkJJgtttyzQ2lilyST3yQSxb34v6aOeCDsqKlwTsYuWXgdZd9O7Ifj
	 p2GI/WFIvhsjdnN+uGxS32sKNmIuPtPK3Wl4anApdJlo8ZmT7kxY0IreOCYeJa3m30Rrj
	 XulaOLlMRFlv/11xSZz+wm+iIi9Y231qIhqXyPF1RrDkXcCSZN1jK9x6AzGAtpn67OjMF
	 y0aqZRmuc14e/WubRnSNRJSkdSGuEaYNx+EqaJaPiF14azmtmD0HBQYQ9B2KD3CSCAn1O
	 B0FDXuPiZS48YbVszPpNiLRp7t3MUcUi9Nh8X6q3vyCB0Qhyazz5AjMXlS9okDl1KkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Mhx1drtVssrwQUvFZpFBDrx2YW50rLKbvbFZpE3l9ZM=;
	b=CRVaKZu7UHsyA9qiTNZEnuHhHeapTiwHOwV+gRoCEjDtwlm/G24JKOVQ4ajlERakJPCh
	 Vhm2Rz5zj4JislhmmgSCHM8C6Y4GPFvjrIEt0W9ocOAcg4sY4Edzuh6qFlt1rAX/SFEoM
	 Kl2WDmF25sBdUJzve5iJrwQQ6eZYi6mfskJ1rsGjfoSLS3eoTjkKLo+P0KNLSsKsc6dwM
	 +w+bchvwocpUItIxAH8RLovvNrj7+mEfFYVsIrpoa22CKCUW5YwqhvLDpYUPAVNXpK2aZ
	 +pCqzXBR9mJM4ljwEMeU5N46fkff2znS8RgAdGUqZ1bc85iWf+QsD9ZrtxJcZVY/lRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9zbnVMb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B866606A32C
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 10:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B866606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9zbnVMb
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso305613e87.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 02:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795344490; cv=none;
        d=google.com; s=arc-20260327;
        b=X+re8QCagzD4KtGqkV4f7CPb9pHylv+oLavA7ICp7T0R0AyKQQfU8gZO6nNgRKcobw
         C3o5XVlNUwYxb8TtqEsm2WTjP9MXydmVoMjkeEk4Jtgrrez+nLD42fdF6Lip+EA4lFEl
         IXJq9Yo207SEs/TTaA4B3CYkZ8/Z7F6TauMpN4lNKGV5xVw0n1RBl+NqI2ZA9aguzkpV
         3h4ZFKPsw4xmp5iT8QcKquQUHtgq1bb21nPVvgM1kZy3VzXw/tjxMZzp4kpmKpM8WOBd
         9yGIGwT69NtKRlA5PFRW/uHPdWjO/Csbo3NudLICcYvDO+px126Y939ncgonSpJDyOf7
         V/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mhx1drtVssrwQUvFZpFBDrx2YW50rLKbvbFZpE3l9ZM=;
        fh=qKNBN+fTQj3ty/Y0/CWrFgN0piWvrXi9mut4SGINOZc=;
        b=XO9U1o14oeX+WQPCEKj59Dq6FzBM5uzUIGQS0Z5ZYNc20+NODbNff1vKyhzn8ufYXl
         4YgMQ27ezkzSuoe8stn9KNYJCCO7YkKlgNx3TEMqcSQEYdPjTNieDGDmhzngtE92c3Za
         B4uvvIIGN5ZlEekMbn/xt2gkLVm4Z1EWZL07+eu/Osefq7TEQE/R6wzCqkySKLpw74k+
         6zXwUP/cekotyltfYP8YyOCJVaJNGXM3UajPZaNyeLwmqCqAs+3fbCZ80DDorNfq3t4A
         NzQkOufhQOMc7n3yHZL7D0ZiU3cGohCk8xweyDXD/TQUOgbwxdYAmVVV0zxsljCiaOAO
         wgBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795344490; x=1795949290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mhx1drtVssrwQUvFZpFBDrx2YW50rLKbvbFZpE3l9ZM=;
        b=Z9zbnVMbXt3evjE3H5vkEJM9UAcNbZ4iAbK+wILD0kNY3Om2RZN+SiL9tvcYq/Svhh
         i9C2jt6bKMyLucQvhdCAIpBoagdSUse06BqE6ZH5lWpLdfU2RULCfRWEmzftiuagTOV0
         xXDxzugyr83m2yOxVlCm8lCp6GGyvxolpTr/pvvncRCCtnsYB6XA+NIG8aiKz5u2tGSU
         EVbhjTxS7KMygVR/ZcmzCEXBRoyLMhr6YAWqPDyIMR4TWYBVnAEEJJ3RndYwphzQ+Wvx
         jGkgF6CswU7cet793l8eLCz+GRyy800mYtBE0rxgicxHzouU8C7m+RqWZ8U8Yl4MM9a8
         xoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795344490; x=1795949290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mhx1drtVssrwQUvFZpFBDrx2YW50rLKbvbFZpE3l9ZM=;
        b=gqFZJqIsFtYehpnWQvNH/KxwY5XDQeuvNcEccfjqcz4HLWRdGLMxKETt5Ld8fcWAzT
         RnOcClM5Tv169gMKFrkJ140JagUJtmzF9dG0iEi/tmthoMA2msF4ST5k5UJGPmWwY+/N
         i83yU+Qc+vcxFqyDIR3Bomo1goID4TJJ2Ex8dRgq3C+ignaXUSLO9+kdn9iOKXlVUbmk
         fINd8sBS7MVdegv32gA2mb7O0dmGdIZl/xvfGuyAEJ+3GGYD3+kcSNNB8ahlsFEOqiAd
         vtc/PVqHQjvnr2XAf/CUTmcS8/nVqG8+IsWseShQL+1Fpga6yp1cOOjd/Y6DQSRfhXeK
         KyRw==
X-Gm-Message-State: APuU4Z9TBZ5nP8u5yCzKhIrwaUgF4IaCs9snVeAGpLku+gsmHy+UZRKZ
	0JJ9MJ0bXLb7Z/pGzE3TqSSRSCVABss2U+L55+kC76Yi0Uo+yrVpHxIuRp/+rkq2bGtPf1+dYqu
	8QZHGhiV8UEkGGnKCEMngylsMdyLfcek=
X-Gm-Gg: AZFdTZcIArBSVEhQhbw0raLIWgdBAmxsnEy9Ve5EDubY/WhJeAyy8DjYw8e2zt2kkyQ
	jKDDZhDmwVo/qlPpeGddrv+lq5xhaSF66xQBi2yBOuCZEeEzVusAi20zvHNtEEVN0aSB9OFMfqD
	gRnic3XZT7hhP7JJpa2YyOseavXNEfq1gW/hijmBYnflEoLlXAhbxw04PHRp6enMDBDlD67Ips9
	Ggvv24sAR6cRSjYHm5kjjw77YqGXxZuGr2LMj/mAMLasay6dGjt2vNOPJIhWKZMqDh/rWFTwrlK
	IoZuATHz0aiI0ao8+JQEA187MBjjas/3pPqM6oeBruVGAl7V5vHqHrUB/9tKkPDeIjZht4dsARL
	B/8utWPP4v3paQ0Ks2KevUKAjg0yAFxLwX/UX2OH4EoCRG30amSVh8Lt2PYQEs9wOUQfp9ewQWv
	i9vlvWNLlp3TZw3B65dxApy9Ojeui5f+kTF+hFHBN422JGOj6JDfG9LPNerCF2qzxrqfqQbzgjU
	W2JJ5oY0ghu1aXCI7mrKdeKYkIPYBFWxDqopClIhv8rJ6z7TrHFcyrnl2LveMJexOUXXDvM
X-Received: by 2002:a05:6512:4481:b0:5c0:ca1:46d3 with SMTP id
 2adb3069b0e04-5c1bc7c5ee5mr2148467e87.5.1795344490129; Sun, 22 Nov 2026
 02:48:10 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122072007.14685-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261122072007.14685-1-mbkchelofficialdev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2026 11:47:58 +0100
X-Gm-Features: Aa3M54rWh-NrLJggWQJFn1aNreu1UxgU70djoLJk4S5LUh68VqdSv9UJWxdNb5o
Message-ID: <CANiq72kV0YwG54i6fLSv1Rwtu+3Ks8XUzpdkZohY5tiH6LzhRA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: gpu: buddy: store the allocator inside the Mutex
To: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Joel Fernandes <jfern@kernel.org>, 
	Matthew Auld <matthew.auld@intel.com>, Arun Pravin <arunpravin.paneerselvam@amd.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 8:20=E2=80=AFAM Ivan Tverdokhleb
<mbkchelofficialdev@gmail.com> wrote:
>
> -/// The inner [`Opaque`] contains an initialized buddy allocator.
> +/// The `inner` field contains an initialized buddy allocator wrapped in=
 `Opaque`.

No need for a new version (I just noticed this skimming around), but
please keep the intra-doc link when applying the patch. Or is there a
reason why it is removed?

Thanks!

Cheers,
Miguel
