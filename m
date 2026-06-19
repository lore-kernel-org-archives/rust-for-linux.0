Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548F740D57F
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781850579; cv=pass; b=JEetagSSmH/LdofwIQoUxUQsDdf8xY43R3lHIgcKa94hcUPJAHNcad9I/NN8eKRSwf0PhKhSnSzrrsmThB2lnEEdQF/jxQRNsMI1SmHO2vb+tAzPQbjBjbINfXF5mf+LHjGBgl/JBVn0GVXGDETQmV7/oUhQDoBshQdf5+V0tGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781850579; c=relaxed/simple;
	bh=9Ck+PMMEdFk1gTxZ5WgLeVfcpym7nrzhjISCvrnSO3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPNEej9Hz16biCFL5DaxXYv5krym2rDQpYHzxAHMqt51mhp7dXk/b7xix5fGCNrrMOw6icnHyCAcrqZNBtsNfYc5GAsTDVdhMZR51PFWkn6bwpAeh8fVtkrZ9FnU0ywRJ8r5FvmGQIE2aS7VUFgBm90TekZhiWxGWwGq/mnwYig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvV3qNyw; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvV3qNyw"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bce0dcbceso191753eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 23:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781850577; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+ymkGAs3u6xm5IDW/lrkKpQJq5V84kjGvTvy/G22zjc2TVQJ72pMNUDVdM3gJIhZ0
         CGH+3OgeL2oAM9LfMPdykPkhmhnv1eq3bpfk+Br65jfExfXq3hzaxI5knT9dc1546LGw
         SXSBkQYXVwCq6zXwrKdeoY20FUNMxYtwCmuBJXycbISPugVAOHg12FzwcbT377n9VXCN
         yhPQ/Hiz7SMmoyf1Fzh/okRR5kejTa4oO5uoammTcd9HeLW6t0kZuvwgxl/HqjPmaa7W
         IrGHBnjpfG56PAaZkal4zoM2jIEzyxvaxbeVzcei7pI/YcqUWdsI0g6CObxvtADHJKbg
         bynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GIni3623zTBJu/3eQjf3ErdK1/+Vy3yt/K0LQSvsCE4=;
        fh=N5s1KrU1Ojf5K60WVWpGJNhlNeQx1/8NiJI8oniOfMk=;
        b=HCViiK+7jd2dUctIwIsK6zk3Qg48vg86HjPdwuNeG5eBUh2CCUPDFJ2NzK8FZBHswm
         HPq9o3oWELsUy0QbPcuVHGQ/MMUVDavmuPd2Vv8n8pz20ILowTOjMmpCu+b4gerEPmJO
         VN4lNQITW+nppQP/7JCvuhpfQSQ1n4hgPiTBFZpxwNaD5zwuC6l21DBp0kRRv4PLQJ4/
         DKKE2YbrNOu65BvmMVSN9ZhoYKhvXsFXWKwlCk+922/MMw4jSbfYvNm46vjbkEXShJXz
         OD+LhqaDMY3co623hN+4bCoQN3FWABo0xdBMvk1WP2TsQIA/XWrrFw4N8ADVwg/BR3gR
         SKJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781850577; x=1782455377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIni3623zTBJu/3eQjf3ErdK1/+Vy3yt/K0LQSvsCE4=;
        b=VvV3qNywIPbjADsiyCTli/XqLgZH4UiY6D5a/88zUd078i6p3YTNZxE+71qfy2yMgy
         QDmt6HYFTxKeXJxOPP40QmeSU1R3Kw9jfD2NrUvCJz3oeOE4/038IBW7tP8Ej3eqOzvV
         xsjHvPVn6PJdRHvvvq/zzVpRoh10s7X/yxV0cNtbeePqSRmU/4OEa2LLoy3P/Z3DOfnO
         O59UgLlTmKEle2BDT2Bu7yd0EvxXXijpuprJRYw9+X9xNNUI8QbUGbBqd6Y3aGjhYquG
         NvduSndqb0bupx0r7uISBJOKDnQjiOJ0rqVaCihcqwpcSgDCEaW3oCpVo1GjbF5Gzmd0
         ZSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850577; x=1782455377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GIni3623zTBJu/3eQjf3ErdK1/+Vy3yt/K0LQSvsCE4=;
        b=gqdcCZOQRJxnw4shjtnal018avaokED2FqkHBXd4TYfjjpNIIVhL9Ornft3opUbNog
         Rjyjya2zU0xuP6qD/e/pwkeyBmvyCmZa4PxqxgPWKvRZk0DZAtvpc2GEjT4t2dpenwXn
         2EJLNXnqlB2zEosKWpj6p48SGgG0wqj2561ya/itl37UZ51kMmqvqU1yZwgQgk3bI0Y1
         a+JXIu+NSM+M/4yXqC7VYMLwKbAgRV3vtQcBMJG3u6ZqPTqFjoKBtv+C0f4tWXb6zF03
         aaayVYkE3TgujRbkFViehmQcRurgieJwD/XpyoPVnOVCt91oO5hX32SNiw1I8yP450IB
         hc1w==
X-Forwarded-Encrypted: i=1; AFNElJ9/QCZXRO3tL80nGToDXyQag8DwLeN6OgmQF8gipE/in9KD3qrgZ0aZzdXalVEqEQlilj95k4z7Jzd1mIeA+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj7EuGpr1C0GrkRDdlvsIaNs8qoRFIjb0Rinv6txIQJdg8B2u3
	qnq8tHa48eDliL7YHQ3sry/ITtk0BvYrdi6tWDr7stKLSmXFsHeMlE7nXyDPFpuVtNhnAFQ5JaW
	2/YeK2wHABgYOpiLV37eDmE+8J4vg7NA=
X-Gm-Gg: AfdE7ckV5kqLAUniBbXKVbAYUsjyZ9drHOpAO1jlqo+ICFP/OSIAtzMs9G5L/DQ4XE2
	IJfrq36njU+D2/hSpCqtozt51uN8JuAxFilH4gMqFuK5SAbZhA1whXozvGAWYZcjxAAL8fpw9OY
	V2ELtA6S54FhpMujo2cx86Ualio689VyCTjtHYHaSYAEa/np3ikDWPVzoPKUbfJbyfln7To4dzL
	V8q1kieN65pGN86GB8K15Ul2mbXtJj9mArMdCmSljT/SgvqCRl7fJbHHs8m1I/XJpWMuGADKkld
	iNN/wLATZVv5WNA76qgJobye4+K99Bl6HXFc6oEStRAvQRrXNNE4KUOz/uSv6u01QS4NvWyd2uX
	K/Z56wovaEtHT
X-Received: by 2002:a05:7300:e619:b0:30b:d2f5:d503 with SMTP id
 5a478bee46e88-30c0750d8fdmr696077eec.7.1781850577337; Thu, 18 Jun 2026
 23:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-miscdev-use-format-v2-0-64dc48fc1345@linux.dev>
 <_FgQUCxXpugLyjMMqjxl9574cGo5dirs0Z56uf8wKnoy8aMjc5Df-xtNCJtnb8DLYca2o0VVi2WUOWL-gsc3Yg==@protonmail.internalid>
 <20260520-miscdev-use-format-v2-4-64dc48fc1345@linux.dev> <87v7bgf8f3.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87v7bgf8f3.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 08:29:24 +0200
X-Gm-Features: AVVi8CcBf7vBssE6ifFv_yy7Zzd6EAkMZfAkWEJRcLN15V2aWR2K38cRxR0A1YM
Message-ID: <CANiq72=e-qgJhHOauqqx_+FzQCUQY8yFg8TCQWCG1eyk5VXbTQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] rust: block: mq: use vertical import style
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Alvin Sun <alvin.sun@linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 12:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Cc: Jens Axboe <axboe@kernel.dk>

There is a v3 (may be exactly the same):

  https://lore.kernel.org/rust-for-linux/20260521-miscdev-use-format-v3-4-5=
6240ca70d0c@linux.dev/

Cheers,
Miguel
