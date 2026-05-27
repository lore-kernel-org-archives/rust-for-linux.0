Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DE35F180
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895551; cv=pass; b=udSJxqxe7/qweoUc2zRTS7fzd/OB5fEE0l2wQbQL56zJz2YJv4QB7zJ/4QOzbz25Txr7b8sr+jxT2ndVo/ayDp3FJpKBF27ShElS0TqAJZGOUGqpOLX+SaeNXJj7BmObhQRtW1i7MMzW3H1SZ7nqCD9lR6M9A6WsmG6nYgxZQX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895551; c=relaxed/simple;
	bh=3gcacoOPXNVu8oNVxJqiP4QadIEwhTQlbaG1YCaOev4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDsT3Bx/zG5EjzxFhoBzxle7r6JslDuhVF2y5fsQFdXgC4lWUFN7dYHFHahMPFTFhMwZkBkpwo15nJVqqUDVffmiHp8sXg7jdTiz2ho0QlgJWkdv28B39tPrvIyer8G1lwO9y4HzLd6CJpIJv+oGfUFedY4KZdM9ZKr5spJuB0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOavOemS; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOavOemS"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f24905306dso1258339eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 08:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779895549; cv=none;
        d=google.com; s=arc-20240605;
        b=gMluus7jethLGLl7cbv4PL0C4xXAWQne5nFPIEuTgRAym2uX+4PUjaA4IV/ufrXXiT
         9xcCAdC5+r+iwXn+4S8h1O57D5BC9Phn6/8XvX4D5QAAzTiFp8V7XuScleXnAFUu5e+i
         FoWSyF8QnPKF/DHGsRZmYzm+LQaNoumx+R1nJIMxV0HCZjMABaRwRUf80slIp3Thsd3r
         RFu5YFW//L59DfBMfSj5DTopWlxzuKqMVHKe8FyagMPqRFPo00FM0O+k7XJlmXgt+9Q4
         rRyfWcd1rtK9m6nh5lERNVIBHJgsHe41T2ObhIKBTLLsroRiSBAnhFOAy5/vXCOyFQx4
         qtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TjeyNBQa8Eui7iPdxBTsNWf9XLcWHv7FteBboWtGjds=;
        fh=ftVpIq73TRGFfHjVj0bKASBzHyFOaIKQzflsJ40DMMY=;
        b=Dl2hVcPLOS8Vmw96UhkB9DNPgyM04w1TsKQ/LCxLO0pEqmNCVNZNbz4dEBWiMvgUHj
         SdGKxxxV31dinPPzjVFI7VC2ZXd44HhLBlfw0wOooVSOj5XmGCz6uTXVS83+1SVQQVJe
         gXR39eru0/hR7UBDRv9WDu3mYsttLeVvEDRdLroO1nrxrsI4GizgnpSSs3ykz2Zbz/xO
         U3sN6KtV20CNoXGCzci47ze+LlDuao9/6wGGoZ+Kxc2VynUI0Lo3ueghcIaa/6bV9hx3
         OZ9/OFzjsASQZqczjP7A0d171DOHOeZfgO8uCAlh8SiuFw6BkRjPBr5V5PxHvN9w5m7R
         1+Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779895549; x=1780500349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjeyNBQa8Eui7iPdxBTsNWf9XLcWHv7FteBboWtGjds=;
        b=EOavOemS8n+uQTiweDhv9Bd+1RkcBnEX9TbInaUmlpOOBvybKSWsiP8zh3Jb7poDBx
         EY5fKOzGd1qxbeC7ZhlSymsGqJybYCYnhr1AKQmMIsbg/SHFbY4hNpQqJ0kPbsN3Q+q6
         9y8yPPXbwlbh1GWEePmsS5mXU01C10c1zFo/qBCeTgpoU1ViXaSDaAUimdVwSRTeIFrS
         6HKETuZJDE2aOb3IpBdwCctbrhxRqJ6Zz0G7whTujC5PZ/hWsVbGSC2PyHNB8fpfyTvx
         hA2aSj9pNOTE04Y5RoN27ep03WiuwCDt7Wrf+hAMSHUzFLtUvRQEM0zCbXAbAIwuXE1V
         rBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779895549; x=1780500349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TjeyNBQa8Eui7iPdxBTsNWf9XLcWHv7FteBboWtGjds=;
        b=b1Q19I2I5QQYD7yGDITxxp3ndm8UkVd3XSaVObqAFTcdwk1xTvJnIxQ7paNc45oXsS
         YPh+fHqidYzagusAcHLy5xBRPpbUPEBnDMAO9f6JVj6ITK55XFzkIP6filrBWpx83JSr
         2iQjEX3sWclCAv1wD588HgU6C0MqOP5RQ1N/RriCN5I0cYaTIyQ0vn5PsV2UYklbyHSn
         UwHeo/POCKFh/HX2pvH4FNPMUYIDtiJKalt23RfBR3S7nFiAieCdH8GuL7X3XkkiQcDV
         sS/C3kG7R/r0lLZNyzn4/xusGkh6uIwDjQXc/uySv3GKPk15f4wssggx/1vjA/r3Wj0q
         1M3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+a3m1mlNfColE3jV3cWHdvLDhMmWtiLGWAlvU7LwIDm+r12miu9/bLvsBogBVetWTHhc2ql5HOuyk8C9MZOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKqqiT+7qD+NgAL4Oy7FYQK31a/V+RnaARvKU4EQMVSA8rhRXZ
	R2DtakunDmlJrBR1pW/uiLRt6VoGiFyF2WCnaTQ5xnPCJk2BuFjO96h07mEFbtnF0jicFsMJ3PQ
	PaFJKhMDI2zb2cVAlTgghJSAEe9nootA=
X-Gm-Gg: Acq92OFBKCbFK2qJ5fu4yMVZU/KHgLuyKdB64JGIMTYgIx/16bzPMotkW7dscM/nic2
	tVMA5QwTNMQ+FhwIrnsi9NDMjQJ76Y+cWZ8isRjHDxIxpXf+Jjoxrwa4/8RBU1S17nbMgykT/IE
	S/v6kHGec4nxa3te3GEh/L7OIprHof4WMGm2BHc/KJdycedPrlBxVT12Y5gKb/WL/aab55wKVA1
	y4tdoLxDf19FeJ+CytDddZ3GHFBy2wJZKcoulabGLNelxF4RyyQTeKcMNj91bAFn13aywBfGzVK
	/01a9Pwb+Ta4EW5Q3QBxBRCtt+RPrP7BSld+i+DxsI9MLVY3WFOSXwX5rh+pgeJKaNEopgKo6V8
	JiO+yOfYDAwS417i2azkueCLhEz8uxzpp/Q==
X-Received: by 2002:a05:693c:2b04:b0:304:9b4b:3b9 with SMTP id
 5a478bee46e88-3049b4b084amr2183079eec.6.1779895549328; Wed, 27 May 2026
 08:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521165622.279953-1-japo@linux.ibm.com> <CANiq72kT7YEuMaM7wkOtCz8ZqEXbPLniA-x4L7E=B+x0zXt_2Q@mail.gmail.com>
 <20260526161312.19291A8f-hca@linux.ibm.com> <CANiq72m4GVWFYqnxNtCHTPu7XcGewHB5LNwOoayTfnXs9pPbNg@mail.gmail.com>
 <ahbJtRzeJUqpj3Ux@google.com> <CANiq72nATtptB+hOHAgqg8Zn_mzUSPRZUCXxnL2j0_yNqrMgOw@mail.gmail.com>
 <20260527134428.9471C69-hca@linux.ibm.com>
In-Reply-To: <20260527134428.9471C69-hca@linux.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 17:25:35 +0200
X-Gm-Features: AVHnY4JxIeVplEeTCxBunhgMDNffZGMmj-CXhwyOiDp8q6DO0QF1MDLSID6Nc8Q
Message-ID: <CANiq72kf-KpXNRaap+YzorD=bFPdKMr0cp+eaxLAurOan3pCgg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] s390: Enable Rust support and add required arch glue
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, 
	Jan Polensky <japo@linux.ibm.com>, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rostedt@goodmis.org, ardb@kernel.org, linux-s390@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 3:44=E2=80=AFPM Heiko Carstens <hca@linux.ibm.com> =
wrote:
>
> I guess you meant `-Zpacked-stack`? We need both `-Zpacked-stack`, as
> well as `-Ctarget-feature=3D+backchain`. Otherwise the result would be
> incorrect code, due to different stack layouts.

Yeah, I was referring to the case when the softfloat target is not
used, i.e. I was replying to Alice in general terms for upstream Rust.
The combination in the patch here is accepted.

By the way, the compiler diagnostic added by Eddy (a colleague of
yours, I assume) that mentions it is nice:

  error: `-Zpacked-stack` is incompatible with `backchain` target feature
    |
    =3D note: enabling both `-Zpacked-stack` and the `backchain` target
feature is incompatible with the default s390x ABI. Switch to
s390x-unknown-none-softfloat if you need both attributes

Cheers,
Miguel
