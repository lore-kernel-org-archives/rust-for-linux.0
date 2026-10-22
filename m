Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792680353;
	b=Rd0z4ASleq7xYZICpxF1QFPaGgVLoXzZfCeHS94zOwXbFnwUG425BomTYY69NGzDS5+Z
	 CFm62IAbMr+Rja9GgT+y/nldzXfrHE15ZvBmIZzkMQZY+ODYhuCYdMyCk3rrhlRdLyNrj
	 XPD5lTz8AzPlG/5Zg0kT1LKvrfJoDQ/J2ZlX/Lq2RxmfU+jLNzsExFcpV0wCgzlY1iQNX
	 9ehSfyR8YSYi9qIS5cai5CBg3BW+6/1AO2c8ZbcHE19aHjJw1mC4XA5l3DiFBme13wJ/u
	 1cxkA610HMJZ5L0mkpoBXaH267USNXAbpuJfQ8uUEqY7X8CdNLhRWVoT+GNXmRsCtNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
	b=jgffOX4ss1NYUehPWvai7O76pAMpSu4kQaWXSOXxvjbCDlS0swQjbqrhfywMLklc/0bC
	 LPLKPONGPhD1qLzRb6p5uysXY7wfdEitv4oCdzLiGKN6hqhu7hoLgo9b8DNNg89KfM9LA
	 iyGJILAGte9RZPTImg0FJZQBYZciG3TuTHSwCRPMdCxNNNaoPKryOf/0VtqeaE7CBIUwi
	 wy3YpTGy4lirICyFBm3GGVoE678rzIgwEdrzTu51beKPXFzf70DAOJ5NKzUGDE1pXsEDO
	 WbRZQR0e1h/xxwh6UTxyIuU62YBNWS8EQJ/WQ5HPVT+BIPhDFgj53JwQnoeGspNN7+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r4wRlYH1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46105606A31F
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 14:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46105606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r4wRlYH1
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35159e0092aso243146eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 07:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792680352; cv=none;
        d=google.com; s=arc-20260327;
        b=Xi3JM5CdoeC2AtERWfKXZMcsmHr+dimwDyHPBw+7lO5mqKjOrzb8TDJ6aUg1US8GPg
         hVXMu/7EQzLrOR1tNcGbE8mTXUbbsPUaDvQ/cc7LTi5jAMOuLY1AhjmjZKarjQovtYvb
         /lNMAMvHVjSzmwNcAbM+GSxShKKJg6DJGTChwy39El5FD4Rfw2UOmU1qIcR+HSne2PdH
         XAccvLKgUC9y7pfNhjQ5LJeb5bcuQG8J7IZobNG8xbAZsC/1/PoQwXwy5rwX54LBX4Xi
         g8si3rce8eT0n3sChgz+B6I5IfCzzjdkTLaKiuIQBJtVJlkD754Ja7dKUZoWZtJyLa9P
         AMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        fh=PQTbYo9MQ/0gnxMpk5A3VSmYSmaIyTttLlwPL7fGheg=;
        b=jt57QyC7HuCIxxJ9IlndEjPfVBmPOAuWG4EMEEXJm41PfpjTuuJHp7Sk+g+8uFGHbI
         esT1tVhpaIq0D6hwSMg4vM4xvhvSEljus/pfyxf1QbUD2iqGt0BqLvwEv1npyjq5RYej
         HabI3U8x2v3MXCStwDWREK23W3YxxVufA3vMAR+wwwuzMMbWp9omBKy6J9vhuX315nE8
         f+MzQOHibPCLzJ6lilAamlsjwHK4rA4jyobvga3Ay0mtO0OP2rXENio/s5DEFrWpf4U4
         /MsbwfG2vwgUt25RzQfgA3tfEdFBh8C4xwQ6vygICfESZBY9IhxMKjaK/i/+W5LlkM45
         98OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680352; x=1793285152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        b=r4wRlYH1jON8AvwU167ICle32qfyo0r3cKuuVZAlkfyydgEodCKRlWUfTUCOfyRtrv
         mdL9z6oLfA6vJrwiG64+WoBtXs6CNQwnA5Yryd8yI6gn5zTkFJS8CFrN7J078tokjdKQ
         Mr9D8zGWT5vCh6SqfTVbYeeEWH+PAjcCO2chgojmIr06oIgzklRYmhGwnVR5vAl889MO
         6YC9CS0uo9j2AhI70vjk+y0CfgHC3ITI5cJeQT9JE2XL3OeLcrmCENsxsgK0XB6N1r9t
         OijP9/5FnKvqj5cXEUiymJos1KU/Aoig+vy6hJHswIJAyR9ar0R68i5kapWHddIRyAtu
         qx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680352; x=1793285152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        b=0TSbN27Slyo2AkaQIgbEe5hGtci3I7iuzvPsnH0Y3DX+DbxDsTXM/0bRALwb0ba79H
         bvgtS/YIK3/YORwDI60o0H/VEpP43Dqjkv0ClscH813nfjMwifooQs1GKTxM5Mr1hQtl
         ydTGrXEkEX/xYmn5J95yh2YOYxt7DThx467bpJDLGE2trwNJ5psrlQA6LuVfcJ7XOxgS
         PoR+kSLwoTRETETA0BzzL433IUdo7CYk2oluXcjTJEo94EhXe+LE076KN2ydsIxmjhgp
         WCj3nTbbrkgEIngJrkJmwXJwgvpNV930ZrfWlYZqYPVgn9I8LbuC6e/t/qnrx+Z8iiFz
         lLqA==
X-Forwarded-Encrypted: i=1; AKwUvByZREAnlPgS2Ol8XN+kKoj5HxraqJLJKPTQs6zeswDhccC5tpaUqNF8EEG/6TKSSakgv1BuJguATFsz0TVcxw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKBLabA0ReBgeX6xtW+Fe292RaY5M2X+fYwiLLsxAyheCrEhpfD
	zl4sDlyyYLVm+Nm4RIqYv4iLEECNkziqqLv9SgdiAih00rJWnMTc8O/f9gFM4UzNrgQtOpptsAN
	WvJcrusyHPxa8aCieQZlLC7zMTwhAMwo=
X-Gm-Gg: AYBFou2ZpACObGOxohQuE2O85Mv8mkvzCmPfx1EQLF8C67pF88oH2ow4ReOa/tryq9g
	nJbDfgIEWmhsU6E9m0+RWufDVCmeEoqzejUycmCvhjmxnjM8V6TZ1nedVVp7qm1hSOZkPkyXbsD
	OzrV9RT/oNkvAATv/me4T1Qqt1LrcQNAq4u0901LtwXuG0MymT5FFesYR21MCWuiC6C5fgdLvbq
	I6worfCwI9HnqfwTcvZ0SR9Mq1lGrrQG1TEjRzJEq1qi4qwDDmK9aCKE/oR5di+7FHQ0UWRMGRL
	ZxgwbaBRYx4WoC6oxzqdFlgra7w0arh4IzZIVD5JS58JIou5pgXPxvWsqraCRfMi91aQxzFDVrv
	OsRQG8oo4MivqY/Bjn/OH0+N3MWVVlYxFReoCjbiNS+ek+Bm1/x6sQGabs39LAoTaLrOHHhbNrj
	7iGYn4ReKCfdVFB9bk87h/n5nOtRQi8OZfD5I0aQxTLkHcPwSvdiqKO+K/bgVjk+jztrqBwBefr
	r12WpEJfCLwzBEpTHcxGsmAObncmDO4SXwN
X-Received: by 2002:a05:693c:811a:b0:368:8792:720 with SMTP id
 5a478bee46e88-36887a14b77mr6320743eec.1.1792680352107; Thu, 22 Oct 2026
 07:45:52 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 16:45:38 +0200
X-Gm-Features: AclHuK8EKOtLgMJPZNE8Rsgx4kNwJ7cv5GEy9zBG17C1iZxOPqBR29S9pWwIt5Y
Message-ID: <CANiq72mEp=Vyj9-TcG6_X5_q+8guGQvJFbgmEwQdORn53-V=JA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Fix CFI type mismatches
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> This series fixes a few CONFIG_CFI indirect call type mismatches that
> I've run into while working on Tyr. If we're going to run into a lot
> of these in future, perhaps we need a better solution than addressing
> them one at a time?

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
