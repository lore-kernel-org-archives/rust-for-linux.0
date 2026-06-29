Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3638E5C4
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 05:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782712543; cv=none; b=jbaSRxOKCENReNEIQr1sSFwLxULmdx526iz7IzZDQ/SXkF4t8v0WZkvdAd+G785GeIAwrl3AcdUK4TaSrnW6IS+t2c4ogWNTFnQV+AllD+ZZfxJT854Vt+2CYvo01Y+AF5r/XBIQPWw9ekTvIJB6sp33WEEJeLqXis/IwmMRjbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782712543; c=relaxed/simple;
	bh=RKI4yMlcZvs6J82HVgvwX6K7+f1RH5e3pg8oR5A0QEk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=se+D9IPjmoq+A3YenTG0cTr8xJsWQQP0YiXpy9B/2maQBsXRtuUAOB8UvviBh8hX0r9B6gNNbXIqp4pp92XAMsf1pFzW3MmA3xOMAk+5zc4njokFxMXRubawwO2qi/Jm48+Kg9Pw+xaiHq8lUMgJ24mPP9HcTfAtrwQTHhXUaWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1zfK4qr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1zfK4qr"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ca1479dfe0so957835ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 22:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782712541; x=1783317341; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKI4yMlcZvs6J82HVgvwX6K7+f1RH5e3pg8oR5A0QEk=;
        b=m1zfK4qrtvAvZo7ffzpOQeYHL551XEgHk67Y+yUf66UdiTzh5tNKdqwqkHFtREujFE
         /HoisUmJwr+pvykRJj/ggI1bR83hK5xfs/h3uTboIaCKTb97MKWGN12i+FDr+7kw/Y3+
         mGpB5/J3FiA0HptERO80efWfT+jN0+5x5AXnDxGJ7WnfAJvmJ9wdfYCrOfq8FAVm7LvZ
         rA0RaWwmBMdtGkzYaWiAUHNPJjY9zrBcqp4n3rv93e4WtF0c5BjlvxELoF5miKQrgjW3
         eyy4z9//WerKJZiP8YybNthm08YQKIOpdCSUxTOlndatz1UPX+jW+oS+4lu5/F+7Gh7b
         DQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782712541; x=1783317341;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKI4yMlcZvs6J82HVgvwX6K7+f1RH5e3pg8oR5A0QEk=;
        b=sN1s2/wCv8RDS/squNawWA9mPqln4VFIcaKAmBQEELpFrbeSApHd0yUgDoT0jwG+qC
         garloeb/HgIdAVjZ/PIFM7T0lKziD/ct7M4GnMFUZ8bh1SaVQdl18nrRSHwVJOYOp8gl
         6ObhfOLjN1qnXR0UoF0W1KeFSF2aqiHv58mY4nRJtIn8H9umfY7r8HCqRiDMLySkOB95
         BbpeqergLgYjGX7ssX6ElJlgYTxEGapX2kuGzG9DShH+gH6PPduK4ql7ZXEvu6O4NrgD
         wUWC+6sSjopld2FeV08ls/80JXtB2WE3sY33RqFrRM131N5A7Gn2xzo/x5dZW+s4nhf/
         GgEw==
X-Forwarded-Encrypted: i=1; AHgh+RrI/vM1ENZ15qnKSAYpSYtHG4VqB8iv3/2zRZvIKsD4odrtXz+Wy2RZF+qPrYePqjEmRFm2I310HzpaCk21qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVimRXuziHiDsWldJmiVynR3MzhDnopXOqIlXhziDjU3VuFEp4
	QCZyDApTv3kQmxzndGIAErup89XJoJdbd5LdyVGCLuaZdx3Ks3mLKnPO
X-Gm-Gg: AfdE7clzkg6QxhPrGmMf6D6GzjwmnfUguu6ceTrxmfYe/Jpm9OK23uf9PZbSkPOmD2X
	GE+qnIscvdf8+bIVABU7A3+yl4RyiJ6ribTsOUWjCCdUW6lsonad3+c5tWWxHl6c0nV4B2Wid2g
	CnycqplezOs6rCWCN9LYs3lLp38G67ixwDgTH39biinZvGK6QTUd3YLhwjyOPkI1QCyWFa6awoA
	ei4lyIki3TQvWHSkDst2Zu8Iw+OxSrqhTbaRXHrBGrFCQ3sTIc7uNF5bxPBYNDTFzP8vFcnZSt+
	doqkalH8RwDfHGuFFiuvKmnGUn0+8oh2IWWGZwbHVVFhOcwDpS9cVTid75CC4nC2lXe1u9BtSMS
	CQpZH0VHfJ6Stv2wjfbeVqD8t7D9zni3LBklVirlpRigTF2Uaj2RIu11LoKWq5LgNPH4xmCuZqG
	5pOGfazoePwtCoJrRlSWCojpdc9rFTL8n+NRUYnj31oNkjAAruMs8q9g0AbjLYg6QBcEJyCPY9u
	nnbaC/80gnrTeKDsQsCeSu3XrL9In9Ol8QD/U89
X-Received: by 2002:a17:902:cf03:b0:2c6:9f66:d57e with SMTP id d9443c01a7336-2c7fc8ab2a8mr155882785ad.36.1782712541250;
        Sun, 28 Jun 2026 22:55:41 -0700 (PDT)
Received: from localhost ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9d886668esm26211825ad.58.2026.06.28.22.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 05:55:34 +0000
Message-Id: <DJLAUOEDW6HT.39URSU30Z0HT9@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, =?utf-8?q?Nicol=C3=A1s_Antinori?=
 <nico.antinori.7@gmail.com>, "David Airlie" <airlied@gmail.com>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Simona Vetter" <simona@ffwll.ch>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Pedro Yudi Honda" <niyudi.honda@usp.br>, "SeungJong Ha"
 <engineer.jjhama@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.de>
Subject: Re: [PATCH 0/1] nova-core: Convert bindings to use zerocopy
From: "SeungJong Ha" <engineer.jjhama@gmail.com>
To: "Alistair Popple" <apopple@nvidia.com>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260629025220.1935622-1-apopple@nvidia.com>
In-Reply-To: <20260629025220.1935622-1-apopple@nvidia.com>

On Mon Jun 29, 2026 at 2:52 AM UTC, Alistair Popple wrote:
> Given the inevitable conflicts that will arise from trying to merge sever=
al
> different series doing bits of the same thing I'm happy if someone wants =
to take
> this patch and the others and roll them into a single series. Alternative=
ly I am
> happy to take that on - hopefully Alex can provide some guidance here for=
 what
> would be preferred.

Agreed it should be one series. Happy to help or fold in my part --
whatever Alex prefers.

Best regards,
SeungJong

