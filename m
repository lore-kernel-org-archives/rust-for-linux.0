Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264E46A60A
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762064; cv=pass; b=Y8gO+EokygmayRHz4n8vqYulCeMgTMi0tHmrCQrOnD7dtPtzIIt5KuM0dGJvv2yjCzmIrip1J1Y142KPwhM8qKPMTtBk2Zn/Zz4fyv4Yi+t+TVOBgH9AUAVy1Xl3F+hb6oDVW9Q7AFBEVY7okeWx+atvhhVYkPLpPFIAy2AO+8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762064; c=relaxed/simple;
	bh=KG8W2VB8Y5BWld7Tj4eJg8MWZrNXZgw/t+C+8e4ulI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnWToqA/d/0BzCDBKsCkHK+E/C1QCt15IgClfNZ1nk/ydhFQelZs+fxUMAR5kh4KurHVw1qgtbfxiZKQ8xM99Hyf8JWLMyHk3BGcQIXG+nFB9BevMi3nNjKRbccI7USbeBMdZ5ugATdLRilGDaXXxP9W+IX5KutfwEPzLRo2t5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2ao0fUl; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2ao0fUl"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4afeb6800so16058e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787762058; cv=none;
        d=google.com; s=arc-20260327;
        b=R0Gt+LjCCggTASGrO6TLghbyaru/Udox+P/4aCW5pph+dngInZM4DgPOD3zOdbfUef
         hHTHg49lSu/C+eWcSD2weVtjhTqkxMkqjq4/M3H6so8eW03SbdomZEQYu8SPi9/7fMe/
         3vDO/qFOVq0Pdk6D4xPO2u8tl7SQzYjqFZqm6f5qhJPC/zeCoz3ewCiaeFrWbxjBSUiH
         M0ZNbRLhsPiDMQ0pcwZ2p+oOVVaHLHIs+bD9maeRDm5gpHvR1WIksx5TndLnQFodefj4
         tzkmsrMDBdb2VQDwtGVtxOUZpnopK1Z5UTjoKY0BqU1f0a5iCCAZqJ1NKolD1yYNoClp
         +rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KG8W2VB8Y5BWld7Tj4eJg8MWZrNXZgw/t+C+8e4ulI8=;
        fh=X3bzFzHNUKlW7HONqGn8aH78aZrLXufUH8kHYI0lf8Y=;
        b=QqRTMzbYtZxurVE4olCsvW+V8ddbFhirJLtFj9Za/dMXODkzMQ9OtV1S+NPX1HpxZi
         0YbjFmdEcDKwKbgvL0GZcHPF1Bugfo/FDthhC7/g3d54T1KNl7rWT3Q8hxNXYsLH3J8E
         P4T/CzTYP8bh9R6YaiFHCMEqTFanSkJvetKt6nsI19oAWSpG1++K/R0rIyyP4U2cfIfw
         q+JAXtsHswypqO8wTE9A10At1ZnUKrIwB6wHX82jYKLyU68qZUc6zGENc5HloJVxQEUj
         ddLKMNlXM+lifR6PF759xT6eyninJ6alglClzvuzohOJAFf7j3m+MaqYDtffs8yH73MY
         QD3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787762058; x=1788366858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KG8W2VB8Y5BWld7Tj4eJg8MWZrNXZgw/t+C+8e4ulI8=;
        b=N2ao0fUlEblUNCxal32bPRYmU5H6Tiop9OuwrSH6WT/MactSHauX3tPg6hBbgpdrai
         X5uaHWC1YVaCSJJeZMvzkTwCdssFWhCqvUS5CGK6jQSrenyyuXafSH5h9b+TACqqrny3
         zXheJgUi1EmP18l9gGZ9PbC1qCpVnGUNCkNWap1wn/NpqDaCsS5NywiHfS5Etmr3Yeyb
         0JVxgvaQpKPn/oKtXIsz9nZdqpMRv9nWt8sTOyb5dG/eGFGJB/NuhHBVCDL+10cU009v
         lXpVe2O/gtL9tGf6nH/J6wLbCxx0jv13dwuzkOyf0KXawx+vb99Bfs2Gw656Zu+47lGR
         TucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762058; x=1788366858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KG8W2VB8Y5BWld7Tj4eJg8MWZrNXZgw/t+C+8e4ulI8=;
        b=VVDl3aVoK1/QXn3TKrs2DtgzBJ9RzE1MRRU5p2CN5KFiud3fJH6lYli2oDUx4wGLrX
         wfgB5tmaFIRNi0q0G32VHEG51etzCfWUthnazxnaMrKvdSuVc+gFet4auUvWObLM/yeh
         CjLPIu6D8ADWIskQaj7xjJhVatTn3iSLJd3mnTTBE5ObOq6zrCE/ZWhn5m/XotFBUxjE
         /YRtoS4VKne3qTDCAcCVLQNkYZewqJJUOHE8LGQoUX21COU9s2+JKSNAt9TqpCg2r5eP
         i3v2pu32ZaFT8ZlYF3+sNgY9nStl+9SZ6HVlId3Htb6dKWNn4Lg4+RZ1i3s0Tp1k7gRd
         NbkA==
X-Gm-Message-State: AFuF++kY1e6DXkWFIZbJEikT2oJP0JAgecXCyi1y9rOHtvONcvnfaBfC
	Dx4aX+4HjfNAabwaDuwolAmgqItQpqwJd92+I2WiWMIVRnNbZ8sz/aGXZmIZYDt6ygo+kpfJy9n
	NYa4cbgBsnRXmxhEA0mN4t5VIfAtuvWQ=
X-Gm-Gg: AR+sD10rjPzqRlU6kukeJfX0pvIuOuQJmVCARBskPpAlEerxxl0MISAr+NQUkBxTfGx
	VrPcSLOmmV+txDgwB3wudLAIr2oxviD17n08VG7JoQx1i9QSIDgRZFhfGz9hjLY3Lt6CzO1oofs
	N4bs/Df6kI/wfV33To3kcqtmTt9GinjA438TXaEI1JKUGktToTwlwecZTSe+GyZYR4ZsmnDKKnl
	dbMN0XDHUos/pil0IQXngqry6sMMJexznTZCELct9N6+bBbWjvzqeVZidoaIQEMBa2YR52dtleJ
	thSaRsunBlGsotfOVm46t/X6QAwTYvlAyQh0U1oWjYtgkTTymXRn/bir7knvPR/fHsD3L8LFph5
	niHayvrKFLwu5NkwJcopeRC93W266729clUoR7lurFsoz6m1G7il0Au91pVOr
X-Received: by 2002:a05:6512:3a91:b0:5ae:b2df:c11a with SMTP id
 2adb3069b0e04-5b4af75f04cmr371598e87.0.1787762057780; Wed, 26 Aug 2026
 09:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826162851.2497-1-mike@fireburn.co.uk> <20260826162851.2497-9-mike@fireburn.co.uk>
In-Reply-To: <20260826162851.2497-9-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 18:34:03 +0200
X-Gm-Features: AcwNN1WtTQ_Rpj4PyUuNofpBE-QZJpt6zOpr7AELyOTFGtFlcqIP1G90kKDxBeQ
Message-ID: <CANiq72kTzdT3_jP+A5nD1+vvSHAptRDNvxkP23YiEKwBRjy55w@mail.gmail.com>
Subject: Re: [PATCH 8/9] rust: error: expose EPROTO
To: Mike Lothian <mike@fireburn.co.uk>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mirko Adzic <adzicmirko97@gmail.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:29=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> Add the named protocol-error constant so Rust protocol drivers
> can return the same specific errno as their C counterparts without
> constructing it from a raw integer.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>

This is already in mainline, please see commit b93fb6e76ec1 ("rust:
error: add remaining error codes").

Cheers,
Miguel
