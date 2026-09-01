Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556EF4766B6
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254011; cv=pass; b=tWA5FBphBlCOwI+7o9YIHb2zsBenx/JRIp2HJqRzFRCIYuXTbW9txj58iTnXkDjh10Uy3sFkqMoJ+Ve0STN2rnd6F6x5Bu+3iMGD4YMXIfzoTsV4/5PcFuVXsddXMKvXzHRugEzPi1I53ZmBpe5mqr6H8mGQmsnSwS0m7rzLMug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254011; c=relaxed/simple;
	bh=vpZBEto8PoVWCX501jJbndFd75E0wS7eccM0P5s5MNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFP5kjn9PmeYE5Sm2Wk5Z6O7fgiWTcN2FSaca5o47uVJUWYLF8A0mrwF9e2R0S1n+5Dfuot9Yu1stYV8tfYW5MOavOQ6KYl5z8uRzTfclAkeRIVSvmsVJDosLuzs51e7sx9JAOcRc5Pw5fFW2nVs7GskcWS6E+5Cz5v3iIh/GtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ+mdyBN; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ+mdyBN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc222b3da0fso114562a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 02:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788254008; cv=none;
        d=google.com; s=arc-20260327;
        b=Xrycc3M8Kn2/2Q8HBITYXaGCSZTpOv9IEg0cL1iOWYrCpNoS2E8lz7g3zqnH6JH9SQ
         S4Cclnvy+8erbXAWJKsUgj8bz+9942lczY7po2P+I9WcF1rnpnPvCxJ8Zb+0GfL8tz8L
         7zufBSTIHLkkq1tEGUJ0hVbyq9xxN7f1K8FihfDG7nD4EbNogjBxWX8wN/0KKkIkFSZK
         EQofhAxdMPMosB7xmRTe/1i+ONtb/q8gHljnWISyM6g3BE3CqB9zEqrnSFznC/+5amZi
         6SVP3+6l7C4Vv709F0K8F2TvttVZnzW4gItzFkXMS4zqyUfbZBXNVSQWEqxednsYHfsC
         4zhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vpZBEto8PoVWCX501jJbndFd75E0wS7eccM0P5s5MNw=;
        fh=hgt7OdKwTmhn2rOfEEUTkhMQCxN+MHwelIr0JbUElno=;
        b=ZlgzCke3r8acZYs08wF3rcLC2qq6fb6kdVWafLYcmQWn8Q7uf/rvNn32BTttCB/EdX
         g6K+BRDqaGrBAQlf67RKFbNIozNVItAZNFLE9RgxqTRSKCPXhSfHTRPtJBpMggdlnN4J
         Ta40F+EI877/WupV9DO0/W6tCuiit70T9gUPzwRoBhWtZBRrByZpdVzT5zZRMIUX+mBi
         GIZJ+INK7OxipiwRUuPV9cpTSJ2t1Sdpeji8TE0MaPTAkc1do5WdaJ4a/eebK7v/InuT
         cIZB4qNLol3FWNoGnBNwcYeHOSc+MzL80FKyH5c2SsoGbfsWFuDa5wmS+3KiFtZm0u/m
         uxDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254008; x=1788858808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpZBEto8PoVWCX501jJbndFd75E0wS7eccM0P5s5MNw=;
        b=kZ+mdyBNwGXPB71ZOD5ubeRlNeoMjjm1324iN6VVXQkvPXpBZOKXGwe9aGz315/qq7
         DhFxQcy2jAL0m7AR6gbdouQyb+NdCmCFlaCQCtUec7n5mwftziRlyOtGCLtRWjHc7P7Q
         E4K0m4plTvyvZZ3YfnZDYbx1hTAaSP8TtJkOBxL1yG/WXZRN7LMS8RCgfLMHKeNU4EpE
         ufK18YM1bMOtoyS2wVU/J1IYbcNahUHBv/MFeymV227UYQuzT/V6xGcLvluPmBXfVfbb
         g2ZZlMS7h08VS6Pph3L85s/aXi/xtodluv1DN32yg0Xr+nJKxQORiav+nY17CWAIG5YZ
         CT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254008; x=1788858808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpZBEto8PoVWCX501jJbndFd75E0wS7eccM0P5s5MNw=;
        b=HlRTOkMp76ns8XYcZWo/bYAMmtklPhGL8zu/1uYLj5I8pJGzwHu9Gl18lu8TOClYN+
         ki+/X9He3crkzuxmpg6AHOlHR9YnbkyJdNRMqjSEToFX3FKVUjQrj4DVbIhWAa+hDllm
         ZNoKy31VL+9vIAMQ838juQxRWmQymtFzzET7A52XIiPwuyhHlZFeVw75m2MPG45Yta6n
         TB7AhssPHvgK4ALYX2rWKZ0x6aj5jDnGk4/yDh73uGn6wCbj6lMJvumhP4Bhd0por0ta
         YtoyDnT2DK44tpQVQjFLWG38KgXgGxwCZxCO8R3Eu16dSsglw8EQ4NOxi04tAkJY3Hmr
         8r+g==
X-Forwarded-Encrypted: i=1; AHgh+RpgNXF5v09qO+8tQTL/QxyB0Nm8/dVwPapwiO3bELAfTsETGyV9xhWTMkgLzwf7KZiCRjWOWQPWsFGXeNdKOA==@vger.kernel.org
X-Gm-Message-State: AFuF++lkvSV0pWUO+2xan+RSn28S8BIqaunQnBZOYrGrfdhbnIEej8dk
	IoR79Us6ZXQODCYV+A/VSXdrzPLt9ZYCFDnt6X8GQ1TZ9Ge1nqgPARXALmyf8qiIE6e2Kt15AvX
	yyLmmTdhTgYq4Lbm9qvKqHWsPdkcxSvQ=
X-Gm-Gg: AYBFou2p95FoEcFh8DeS4zBcu/DhGtk47BkDgfx2EtS7d1/8NUZRHoQqXQSxtladUNY
	/M/bTCzB3Pmeqt6OQsO9VZ6U9WZO5+fQPvz6zDg99lXLMQRLtj8M8HzdQpMWeO0p2L1R1zjO8wj
	MmFwBO588ZDG8VIyGX8POZ6qhFy+ilWkxxfczYOK5DxFkxVE2s8BQKfVcpWhoOhdqWgZHR9OPgd
	UIGXoPYEbiSFZwtiRgVDEPbt5BuvWy/4ABt197F8R/NIb56lkWsa9A/ToMm7dgqT3DegRm1GmJo
	U8au/Lf1IQaB6iVj2/XKgfuwrPgm6N1Ibj5pRmlJQ28fTs25AtRbv0P8WfT0phNBxvZf92/ZSx4
	2X3c0LCdvv7+KN4FowawqqLlWwbQ4IQo8ckepYcotAWZXJhgbbgfDg5j4d4RsJQxmk5qvdHE=
X-Received: by 2002:a17:902:c94e:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d74ce5e476mr262988545ad.0.1788254008481; Tue, 01 Sep 2026
 02:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <eqzS1cYG2bYJ10oFrfX_D7UVNqb_NuK3wsMUUEXpdBj7yCtzD24WOzI8zIKg2FlD04VFp_R9xt65fGmEqpt6QA==@protonmail.internalid>
 <20260831-fix-gendisk-block-size-docs-v1-1-900546005799@hotmail.com>
 <87ld9mxxec.fsf@t14s.mail-host-address-is-not-set> <SN7PR07MB9708ED760C7DDF833BEE80E1CFA82@SN7PR07MB9708.namprd07.prod.outlook.com>
In-Reply-To: <SN7PR07MB9708ED760C7DDF833BEE80E1CFA82@SN7PR07MB9708.namprd07.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 11:13:15 +0200
X-Gm-Features: AcwNN1WeTomQFbbl4m_DFvxroJZ1wjKX2oKzXiA5vqp9Wpi2S2v6pF4_O2NjrD0
Message-ID: <CANiq72mC6uUrjHQ7Cz41o_=+YPBobf5TX4X43WfDhObaCRBM9A@mail.gmail.com>
Subject: Re: [PATCH] rust: block: Fix GenDiskBuilder block size documentation
To: ai qubits <aiqubits@hotmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, 
	Sophon Z via B4 Relay <devnull+aiqubits.hotmail.com@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 4:00=E2=80=AFAM ai qubits <aiqubits@hotmail.com> wro=
te:
>
> Thanks for the review and the Ack.
>
> Understood. I will leave this documentation fix as-is for Jens to pick up
> and prepare a separate follow-up patch after it lands.
>
> The follow-up will add a helper in rust/helpers/blk.c for
> blk_validate_block_size(), use it from
> GenDiskBuilder::validate_block_size(), and update the documentation to
> avoid specifying a configuration-dependent upper bound.

Note: I don't think your messages will be accepted by the mailing
list, since they use HTML. Please switch to plain text -- thanks!

Cheers,
Miguel
