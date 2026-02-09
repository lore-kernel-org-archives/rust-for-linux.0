Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF762F3618
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637961; cv=pass; b=E8IfNPBaj4YX4JeUwFBSqajXnqLeX8Z8u2ceU/+HebEcUmUM5h27R6M9EZjghXhaIF83iEk8xnHB87m2ot4gwjtG8LObq6yGuyMLAQxw+00bfe+kNhQAWhw2d9Q5GhPRDPbpnj2UYQBaMtQUn86c66oFcpjBkaqf2MGuUSJ5qW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637961; c=relaxed/simple;
	bh=Zzq7Vs681aqPWze8v3VJWnqjtVrKWx8sUWRtzAo7pl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxwGX8ixdYpRxg9e2ymHkgsqUTr+x2z6IsirLdcYSoi73rpFZBEkJzNvA/Z8FdsR3aDB65ZWrfBqkgtiOthZxiPPZ6cVtAX4jmqDiSN4L+n7U+XDofqkXNppQpXiHbDQmfRa+qTolTjTmrZaK8ErtkaEKb20nRab4GI8dtYcw1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTVPfV8c; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTVPfV8c"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b869dccccdso93464eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 03:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770637960; cv=none;
        d=google.com; s=arc-20240605;
        b=fwwUSe837dpqxREB79gRgtfcGlZMvUNrAt0I3svlpXeulrrJYSg2aN0oB7b5iWMANV
         gcXOgoGqNohntcyjG6FkwPQ0LCrlRPYC+zdKd6rSU1oX4/zOYCvGurbynkpY89fwM6Wa
         0RKeXNQQ1qRh6wSf9M+j6Xpzdo+LQP+geit9LmAfC3qBTkEDckrplXJSScq4xt7fj+Rx
         XGw9rWtshO95Z52C4nizRH5oJ7Jagz8mVLTiuhFiEvhIboNBtDfnbCEjUVRivRwZsj3g
         HjeNO0sff1ILu0Ade0woF6xS37pJELOUuVxsNr94EtFC3WFrMSLcXn5KzqxXDljsU5u3
         afUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TY6n6lWqMAjZ459keizyTELNtiM7fikiKNyHcAG5eMA=;
        fh=aiDULxMRe22cMDWBZ66XRNL1KVQAdnvjrDu5lkdZZEI=;
        b=NkmAAQrKOnz8ntSKNKPo+dWzya+xN5ir7M76sX9PZf0kY4lvcsFAfKE3rycCyTLIfO
         wAEFaLHFrE6b7kRRdYR4E22Rf4O7Cpm6lRttl59CcLJr656IDUHE+DZpDludhpxcIuaV
         akws4lxU4NwMelas14/njh9Rda2hUBq2nERbG81uYYSUhk7J6m7sMcEse0kGEsLQfmBD
         ZGo3USoon4PDzRZ14phos1eOe46p2EHQaAWA53LaqqHT4Sd87qBlZ0gnCeM/smHhbru4
         mcp0R/qPt87oWlStwJtBFuJSNYNoK99PVvlcZ1GVxlWx5qdInBzk2B6gSxsqTcgacnV3
         sAmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637960; x=1771242760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY6n6lWqMAjZ459keizyTELNtiM7fikiKNyHcAG5eMA=;
        b=lTVPfV8cJ4pBf0kouP2OSkraq/sqGY/u4ZhZ2xIqWNEH5053iCNzWuChrAIlcOgjOt
         pKEeUAlTqwxbFOdqLLJru/LsHSU3xytRZDO/CqoJyRIt89wjn4ib5FXEamdvTW7U9Nyv
         KCkfhiJHeC8veWZxpWwnDwAqyLoRjPnPhmC1ViFI6joZARYBxgmGwHawDrNQe5D6rOU5
         v1FKidRUcjkk0dXy8XcK+QkMTeDVbkamNk47Nf/SNz8T6HdB7NACv1CjIGnQVgQpSnvn
         7xCoIatKH2oTFPH8kXmNFemhBOpI5ZJ+fhRwO5Mc0M35TH4sbNVYHWvY6dIHa9AgA4uH
         lG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637960; x=1771242760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TY6n6lWqMAjZ459keizyTELNtiM7fikiKNyHcAG5eMA=;
        b=Djk6TTD8zPp4TrHWfk9/025z25lz/aTIpqSWcf+xgUEH8EfT2w5063qOauaRR3wwJ9
         7NnKMkfbGxEVh9gbjscKrQT6SwNWMxdtbW2o+ck/taHAkN3nIVYajhFfLOodCNkzCqZy
         7jaRmPMrna14ktY+RqkiToQXDL3zoFurTOV8BL7lb+3Ct6AHr4xykDXpGbbF64Ovmqnm
         TQgFGxgHIoDCWGPqtUceRwC4DXhlRVErJqFwQ2gpLQlOScEoTfdJAtncr8UXI+6t9pAM
         9C2gFqov827+Ltac34p7Rv6ReXuRozZG1LHS38i3pS7nx4KKEGGgHInC/DZPxbs+zze3
         9zAw==
X-Forwarded-Encrypted: i=1; AJvYcCWhX9cmk5qTjEYbScdnx0zYUiE3EAHag9wGAyrXhQkdKD19d9PK1ax1fufjNbA4Twtt4W3S/4ri783PvBpC7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGyPIyy8F59r1yURS2shD5hVCSQ6ZlyCDlssPWnuIdOHDw/Yg9
	MgI/2YtFiKaLBX61UnBW2kPIn62cUjrs1TJgMtVjD0ja7VWpzu3Hne7ZlvoilRrrnm9Uhnix0ZY
	3NB7F48N5qQq7912tDmvAB9rtDIyduHA=
X-Gm-Gg: AZuq6aKHHW+SwhMZTqIYbaE6G26IOfT4asezr1dFDTgHqg/wtxU3b3Qpg/T4M3aFNMp
	J26QgKl/LNdgH8jDC09Ies5rkk9K4tuTISyTw+SdbOPCCNh2CGksBqo/dDNCzAG9QSmd64xAW90
	6Pd/pZeoyQmrREr95JzSDI0OtU+tzLqtoQJgmEfcAjFGvF/UqcgRUJ93XA+SRlPUf9wDaLhhln9
	l8KqAuHvIfgfcBwrhXspP7HDzwVV4qrrpXmjzwUFPN7BBHXLr6PNZZwSfFnBDz1wlH0KeLYAIj/
	Ns3hNVV5LPL2XeguCNG8zlPGr2gG6xy+RnFiVXam2kLGLHoNQRhx0X8/e2bOu1QM0yzvYWDe7xR
	7QR8u5/C6I2F6FjM0SsdIMWw=
X-Received: by 2002:a05:7300:caca:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b856a4c911mr2268911eec.5.1770637959977; Mon, 09 Feb 2026
 03:52:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-4-mkchauras@gmail.com>
In-Reply-To: <20260209105456.1551677-4-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 12:52:26 +0100
X-Gm-Features: AZwV_QjceG8JgoEw5aRWMbymspplt_fvQ7_cjaWkDrX-7uHBvZ_bbKxcTrecCgA
Message-ID: <CANiq72=V4yyOwsxvWzGkXQAcMhoTaFZ8aNAe15Aa4BU9JtDGhA@mail.gmail.com>
Subject: Re: [PATCH V4 3/3] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 11:55=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> diff --git a/rust/Makefile b/rust/Makefile
> index ae22f2c5f0b3..14febe9c7643 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -392,7 +392,15 @@ BINDGEN_TARGET_x86 :=3D x86_64-linux-gnu
>  BINDGEN_TARGET_arm64   :=3D aarch64-linux-gnu
>  BINDGEN_TARGET_arm     :=3D arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch       :=3D loongarch64-linux-gnusf
> +
> +ifdef CONFIG_PPC64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +BINDGEN_TARGET_powerpc :=3D powerpc64le-linux-gnu
> +endif
> +else
>  BINDGEN_TARGET_powerpc :=3D powerpc-linux-gnu
> +endif
> +
>  BINDGEN_TARGET_um      :=3D $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET         :=3D $(BINDGEN_TARGET_$(SRCARCH))

This looks reasonable.

My only nit is that we could trigger an error in the nested if since
you wrote the if already. Otherwise, we could remove the nested one
until ppc64 is supported, or am I missing something?

Either way, for the Rust bits if powerpc maintainers are taking this:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
