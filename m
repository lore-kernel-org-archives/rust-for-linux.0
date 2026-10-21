Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792582650;
	b=0sRAQre8YYrDNQZt5bAJ/E3Om8TFth24Or1/Se4vz0Y69BJk2g255L1pS8x23vDjBq39
	 phVw1S+MvPmcTexXKZ9GMZYCa6xLomGgwnTogzzdE3Glc3RgBQ+ZGT4qWbAQ/ZM5x5Ur3
	 NdxTTpi98d/mHU4DTzbVR51yg2S/CCVkx0uoQcBX/1gmd4CjHBJy3MH6VRTmYROtZOrJY
	 am+xOUefAvO0bFdD2sE1/7kt1VYI8gmEVMPyxD+6j6X7tindwOynFDrAzGQWsa52Wy0sN
	 1UoRU4Ogjg/y0Co2ozUdrrbaKUQUkY53o5S2iBrS0ag4UlWbgA5S37pxXV38qcupVKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L9TNqnfcFMmSJAaSkxyxoiwG4lEBGzzPIAP5LrLyRIg=;
	b=fsU2I0mCKotZtph0hIcc1MfnRRGeivjVF+aqOCfN0P8fvjTIhgPo3mKs4TXJq7LqCqKc
	 t3DuSAyAjIAJDDsHhLRK2R7gib3xwTfpQ1YBfbHNtUdo2KfopJDK2JNXGzDi/u5/80gJ4
	 mWFwA56AT/913L8mER40ZEDxvgJawZy9YiAQdzP85zTa4jW9f5MIk6iftuSgaul7cneAm
	 Ayu91viJgISb0wRQYZZK3g7So/d0BwiY3LwbGh1a3CnGpP1NeVLLhRh29cSKonNEnNAqQ
	 PQVeKsmLVXydLKTD7EEzKN5kc2ty5Zz815o+fa4bDKFL1xJeoh4NqVaK2vNHTxaF9lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EEPgKWE4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20D606A319
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 11:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A20D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EEPgKWE4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bb5afa736so70528eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 04:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792582650; cv=none;
        d=google.com; s=arc-20260327;
        b=GVj+zsLTidoOEn6JkQoQmLybORLoddfHu+Be8f5u4f7N3kYRMc1eEhw/TaqzuvCO5A
         RRH1u8Jv0dpVjhI52Yq1cwKEd9CZUZcVpp0B/5z/zzhw6lp4N/fJ/Hidc6Z82SJo4GSa
         FiObrV6ZgRlqnhReoHrKWqEHGOp5/0a2bMl2hgnzFJgobw5H9U70/6sRwUOHFlYddYCg
         ZvGgAtLSrZTXWfqUo/11XZaw2zxWQF6oARDQ0yM7qnyVT1vp5GkK344zkLvV7U1/laxW
         il7C6wN1B31OH7AioK/QubO6RWo6l0uJeOif6p1ZNnOsRbVupPwJ9mDZqvsDxSopnKyq
         JfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L9TNqnfcFMmSJAaSkxyxoiwG4lEBGzzPIAP5LrLyRIg=;
        fh=F5oDSCIzYVdqg6Danire5Uhv9OXNrlasHFeeVdtWdSU=;
        b=fiBoo0rtzjd/GTZMiFvG/tgxoLCaSh6f5Caf+ardP/uRPFinjOfxr9cygmRowPgzut
         9HkcLj4bfaOGJZkub4+lDUTGHDQX0RR/HOhpA2qP8trtGf581cX841Yi2peZhWrkgXQw
         3vIZXDMG4Pam+GnB7MCI2QarIKzC1Bc/w+23GhW1dZKeOUGT62vz9OM/+yTetvZ4vV+o
         AzjDJO3I2lxKk8xdvk74mZp6L5wli2rdRwY8GkbwtgS1GYkWxzIwigB9GT8yM5alLTtV
         t00z9eiCrcDL/Wghl0t/+9FRqHODOdsgbls1OAk5hDCtii8bQB9oIZq4wdUZAbpGlXXC
         Ilog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582650; x=1793187450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9TNqnfcFMmSJAaSkxyxoiwG4lEBGzzPIAP5LrLyRIg=;
        b=EEPgKWE49OXEfBV1qqhluE9DKOaKPblxvuus40vGZgjvXSKuMcHmE4LR0dOyHSMid2
         SUUCJGGqETUOnicsgIobbdFX5G8hLBgdUai6ulyE8e5xcOkamEAGSO3lfmGzFzQBAv4P
         9t2WjI991wzGkny6dOXSInKrryjUkeqK1y+/zFvmlHGoJP7BmcSeurC+UrDEg8vKC6pk
         j9E/K50bLjLEQFRycsfpv4Ji1KCEmqVQrwCnrS9dHBV8sj+7AK2HYowQRfk1Uqv+L08U
         PnYC7gnl6rF71OeBzMPJaQgA3ra13bCkoLwQMZID2wFRRIgJphYXuqdHa2ONsJTIhDjE
         g4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582650; x=1793187450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9TNqnfcFMmSJAaSkxyxoiwG4lEBGzzPIAP5LrLyRIg=;
        b=Gvw6tGlxORhOVjc12CZyBUBDmo6Cxn6og4KnggxYTurkdzcuNMEM0PROPzYiRgR5gS
         p34SfCd+aSl4ZmLbcQKzEn2vL23KngPvurMlru5nIO/+mGWsdNn90Ymhlhn/XeTdVeFe
         v9DYYUJ43JJD/zCAuAftm6L0zGlZeIHcBgQNFOfwgSyFyV7Qi0HykUg7vGICEDEZj+ZT
         4jn74cKv+zY6Ia+hK93RFp5aBQQ0hQ50AM8e5Y9vydfgx+5tNXDyply8Hng06GApu9mD
         scKyIPj+m1QBaRbheuFptaLyIYlGKfyfl4MuUrLhvOaQVNm0lD+0jXYtJXw3jsUdmkvL
         +Cgw==
X-Forwarded-Encrypted: i=1; AKwUvByDoAHpfzPR38Q7tj2O3rRxLBkDV6dLgfQ50RgP30ijgeOHk7c+7cr0Xikccv2/ZmfOwVGxvQFNyh4bOWovfg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJroEI/zLmgCT1eGFdq/rqJA6OHqrYafqljMqdLsIRDBPnFRMHF
	qWCHB4HrQB4zm2v/CXuQWr6xq9baSgwhlpz3CZ5zs0RLcZd/x5HTL9zLpxzVzzcsfHS3Av4ErPz
	t2dMN17zadh5+Xv2xTnuN6bw1lFyfXvI=
X-Gm-Gg: AYBFou1QL2G9hlRVFxyuwV96Eb6HnMcf2F9N8Gnna0omiD9z5PwiBrBUWxwGP+1ApHL
	piU9pbm4cE03d1nB543DZ2azdQhU3wpdYT8JQDGL4oFLsnt7s74Dw58UxBpr6iuIFl8DNRrkzcC
	EOMDg+qtXRuETSH0Vsenrm3v6J/zOUxPL8YrorspYNjquIXEndKP2AmvG66mya/r85IRvJBn17Y
	g/k+DkFYO1BO6MClU+SdzMwNPWEDq2ntv5fBhqjw6o8NViO6wefvpUnjv1f5svRXKR00rP248NI
	s5KvKy+rp8B0qeeaVdT5ESwZduSwzBlnXBkM2tRXyDfL+Mi/FsS9XB9PmjiNfgjF59s/kR07JlM
	g1VY2c986kxM4u8hYjwFHHWlkvQHsh24qDryMnySLJWoQpPGoRn4x6PtcdIAeaHCewEo5oeo2Vt
	A0bFyAbAftRSdieo9s6XiHdTIcWI9vXr2EfxifzB1ASaJo29RiqercVenX9WpFAw0eSxtjYBvlQ
	Bx/abqrcSMhdr28nlE9Y4gc71OG/S92D/QZ
X-Received: by 2002:a05:693c:821b:b0:368:2548:c08c with SMTP id
 5a478bee46e88-3682558082fmr823558eec.1.1792582649514; Wed, 21 Oct 2026
 04:37:29 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
 <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com> <athToIRyTjSB_jVg@google.com>
In-Reply-To: <athToIRyTjSB_jVg@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 13:37:16 +0200
X-Gm-Features: AclHuK8_aYwJYOtfW9noTsKcimxOtxn3KEZMWBPUv5CixPzxJgOV79J2faUPU-g
Message-ID: <CANiq72nP1cXVOQp0xciGfBhZZfEfNP5hx8c+1ZPhXwrr=EOUGA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
To: Alice Ryhl <aliceryhl@google.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:54=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Miguel, is this something we can take through drm-rust-next? Or perhaps
> you want to take both through rust-next? Let me know what you prefer.

Both sounds reasonable, so whatever it is easier -- do you think there
will be lots of movement in the Tyr side?

Cheers,
Miguel
