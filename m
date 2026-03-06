Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC72C3757
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791675; cv=pass; b=ufD4+3rMdHrmTfuC5d2VMIjg8h1P0Lcz7mqER4penlN4FNjHwyZDpkbll9SHuQwGFoJQ0hkI2iEEhkbpqjs0wLCbxdxQhnjhrBm4enfrHtDWPNfPfPbKdFRpX1PszrSR9tlLQ0i6keWAQaOiQEL9m5sr27uMOTfGw9MNZYDrtKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791675; c=relaxed/simple;
	bh=Fhf8ctLQ4I809lq/hxfBzgrOONnciSWT06sWsgYCOZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pi61jSRj0hTEnbdHVpInHmnK0SzqiIfJ60t3sxvC+WqrWB63ivizRbP9dNM2RspSVoo4WhEH8UMvghrqr0+X4uVxwDfWIpOQMncQWa+U25vES3GDj6aQiqcjQgGhMbWFEx2sSPyXD3ovI1dXk1KgnnTlxaNIYh36TgN4h1PWc3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEsSIFMN; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEsSIFMN"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124b07e5fe4so409870c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Mar 2026 02:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772791672; cv=none;
        d=google.com; s=arc-20240605;
        b=IM4DfCjND4DyA3MfYCREK3X38+7PEZkWtSFdaWVo5BDSNqfRo6YyJ+4ZL1/QuDhfxp
         5nMMDEHB+Qk2l94F5OkgNm0Awnz35N5RJlS6viio96ZU6ylLDP2oXpp05ruR8ytrwubs
         c6nMZmk8mvPrjyqlcmv0PcMg3Hg1Mmvdke1NnpYgrLNNrP1ojdfYkVmau5UTVwhPL5h0
         gqCdnDgo+Bcw7SWnYY71wZvmMMEcusxKGlgo0BjsKOKyPbgIBh/icdtuE9shK8d9xX7X
         Rwq3ibaSoQfFH/c1kTBZl8xn0DDawyNCr+awpLD3Hexxib8sz1SttBD2CAF648lYZZh8
         w8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=++lqn1eH7/e+zPojLyuT5tGFljBqP9YQWzYLYUROh3k=;
        fh=3khtDpJsSg+3bmehl8ClljJTsYBkND49ZKYGUtCv/9U=;
        b=W1WFLdXnJT0htpr/e3GCkpx6jARMNiRfwilwyV7/uXjA8YFroso9ciKhTS4GWc2KTb
         gciKnuO2CbDWNoTTzopsDjwcvDBSyLadLUfIqHQeZhSyHppKUaYty1JpkWyaErsfqIwx
         QCsn5yCiHSxqrXM5xFLJ0kEU9obqUA++iMQIedG1acWER5xUK+c/2e+SFbhs4MdC/DXM
         xdSm1xZLRKBdoAk/X88bdaQe6ms5J+BiQir1/VltaaJYjGrxKgf0nuWjZqj/FXh7XtSM
         w8Pj5x3t+aceJeOvk48/ZHCobv3YIWdcvE+htafnBUowgtnoczoHTEMzmsiLScsLvSt/
         5mXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772791672; x=1773396472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++lqn1eH7/e+zPojLyuT5tGFljBqP9YQWzYLYUROh3k=;
        b=nEsSIFMNFZ5zRtdGqXN5LuvisTcCkMiAsWVrT5vTE+ik3WZBQKcyGTq23W943UMkSq
         3jtEwZb5T/lVzona7bsDTRIhuIPzE7VcDj6fmH/OOOBBDDbjuk/3BjWHLXkKUFwP/O0t
         FgHizIvvfISrRrpbMzl1MyAptURcIjG64tHU4qJQTRnZ7G8n4Ux/eYGjS8oOe3YfcUrs
         IB78GycXWQwJ9w5/IQArk38E0oZVgbOd92Pj7cJaYRJ4NbC5PqEcn4F71pTX3WNWTIHF
         iGKcurmdCtuzkByuhiGwCSldWF+Ce9ssg4aNIvXCdh3dw5hZPX1CkGZFmVZ9RzSzoohr
         CNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791672; x=1773396472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++lqn1eH7/e+zPojLyuT5tGFljBqP9YQWzYLYUROh3k=;
        b=YAdrgQnAcfb69daYoIWzgTSCAhl+zSSScYPAAiSRqnSMFWIUQhfakYpvJw+15OqG69
         y+rwBe2RcfiOUn7gmURmhaWVvFY/V8rUdJoA5dXVUYFd3qGfP6EGN1+uiZDwkw+u/1Vj
         OoxmFhevNu9ClViXkmvA/PneKV+thauw3oDQU/MOYjSDUoBBO9JLjTeOAjhTcSRvB0ah
         mLiAQl3tqF3rYNCUdmq2jn8n5wXFhbNZOPO5oLRvundnfJmi4Av36f0qt6COBzqx9yPf
         VBXl4pYkBfACKKpXsmckgmzlHVbaSnYQrgyq4aGrE51V7wzP0kBUpDVU3mAFtk2I9Tk+
         FvhA==
X-Forwarded-Encrypted: i=1; AJvYcCUg+T3aWqPIoqwtjh8jgpstjDLhdH5547nqHsrLqY5ZW7Gl4HIOTK4iJTYJsI2vpP5t32fTslykTokpje1SBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTaSaamNS9SDLKXm9hKXVeQJFHvpCDCDzJqx5caz8yf39pvLCQ
	ax/8vaN/24ksAJykm/FghHSWzM6jrjrU7bVHqKf1VEOSZLqV+3OfPtY6SpjR2KzQrVlXpjvsESS
	NOdUNXI0AHLlad7lyhP9hBIDLxeRTUek=
X-Gm-Gg: ATEYQzxCBPohu0oCR1R/zR78zuJiXm4AwZOhrDDh1g6ZYSg+xk217bNkXjdpWXoZMrN
	s63BPuLC1RIL2ihjbjTf+A9/QMraRzmVUDbuAxoXpcWhQyIZ5La9pUb+Gt8KQkacE5gRE/cCXxi
	w9A9X5valC1whyHTjN/nC0rLMHhwqE1y9dLuvNF0jkp79VSLPgzX+SBdWEYEQpgMXSUqkoJkV3k
	PgykBEXPh7ntoSORfrt3ZyZD/XGt/OicHBzo2dFYllzy/O0e3uj8r0WmE5kIA0yudAqcNnXzM0O
	R/f9vN61mOhbUi6kiaF6RBPUrqoB1uG+I1Ss7BFCbru7StAYSdGitb6ps/Hl6PRPcffROw76wjC
	t/YkyXz7GP1m4KsLERBd67usKZdnJNmsyfQE=
X-Received: by 2002:a05:7300:a887:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2be4e03172cmr363173eec.3.1772791672496; Fri, 06 Mar 2026
 02:07:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org>
In-Reply-To: <20260302140424.4097655-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 11:07:39 +0100
X-Gm-Features: AaiRm52OGxVDcIvbac_wkfqvMT0_HUteDugri4evs7r3G_bVSd9Sc_fQlcDPxrU
Message-ID: <CANiq72=LpEDdZC3yucxseXdq_iUZ4HwU0JSWRgWYWKwQNTU9Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, 
	asahi@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 3:04=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
> traits cannot support unaligned fields, since they use operations that
> require aligned pointers. This means that any code using structs with
> unaligned fields in pin-init is unsound.
>
> By default, the `init!` macro generates references to initialized
> fields, which makes the compiler check that those fields are aligned.
> However, we added the `#[disable_initialized_field_access]` attribute to
> avoid this behavior in ceca298c53f9 ("rust: pin-init: internal: init:
> add escape hatch for referencing initialized fields"). Thus remove the
> `#[disable_initialized_field_access]` attribute from `init!`, which is
> the only safe way to create an initializer handling unaligned fields.
>
> If support for in-place initializing structs with unaligned fields is
> required in the future, we could figure out a solution. This is tracked
> in [2].
>
> Reported-by: Gary Guo <gary@garyguo.net>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-ini=
t/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
> Link: https://github.com/Rust-for-Linux/pin-init/issues/112 [2]
> Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch fo=
r referencing initialized fields")
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

    [ Adjusted tags and reworded as discussed. - Miguel ]

    [ Updated Cc: stable@ tags as discussed. - Miguel ]

Cheers,
Miguel
