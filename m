Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893602AF1D
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 03:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769398136; cv=pass; b=Yb/Gk/KJqBtOK8paTMPWRnnlK17LkoONzyJIzZytqnC5P2Tyxix4ufNO1XxYcqBqbRxZFnRenczOan95sXF1fAtkEMqaURptJcxSCqPuwGcsiP06hahOq5aqmEtoNgkx7aIZjXZrNMQ2B5Fsdxf7INYcVZnYMFM094SQZpaGoVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769398136; c=relaxed/simple;
	bh=RO6EGpqkl7ErqKo9oPQ1lfQ3RKhgNMI57SH8XY0i/ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTXoSQiL9wVpg2WlhnHBYuS3sQsjJx1fChuG5ZS5E0icDE2TKxUy242bI5KuYoC0JG2wWso7+DN51BVLd1OP/sGLgl4hNZ68EkKI4wDi9Sy7zzLg1A95XQOCYFzG9O8qxYnM3qjAr9PyGkEVNwtSbqHf6nenj8qOMGsaV5ZaoKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIAPRG22; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIAPRG22"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b718524994so155159eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769398135; cv=none;
        d=google.com; s=arc-20240605;
        b=lmwHk8UIkpFtotCt+92bUudsNr7tyX7NdoS3xYHv0B/OAEUEQykL0p7ho6E68K28om
         sIUD3wD5TF5MBjvJFLk5CXSIc3H0aFS+xAjD5ffWozU8ZzJ5sDxTxVgK+kJdmJu5qQjd
         7XsPP2Uu1cgoWqk0v1mtr3jFTzJa+5Je3uddYRtVknivjW6UAPWtHrRnRcDf827KlXn+
         ENZ0kcclStDe8GL7EYMMCqvoOxxVlWUPAqj+7X61+QDzz70FSvfYfr00eP3LtbLoMdoZ
         o3G5CTRoQcZ/q1p3QZCpaRPiMk1hF8MRLDOw8DweSDALbaO3grSw4vJNPZReIR1gwdRA
         qI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RO6EGpqkl7ErqKo9oPQ1lfQ3RKhgNMI57SH8XY0i/ig=;
        fh=EGsv6sgz2ygzBqQk1+dAjUZlBi7qavM1iSaCSeRmY2w=;
        b=X2sdFAlllCohn3Fvzku0tFeqod8t+4lAi1oTbTkgtvNGbCdqKFYUzvFtRfdwgfzZCL
         yG2Xt3Wjq2tXj3UMPuA58bQLeQHI0kTEWJ+BX99BLsfDY7upKjaTKAnHX8qJO9+lj7qO
         /H18VDaWR6q844VLdkXqoCV/zxbZht9ZIvGwVJO5fL0krFyQFsjC+q0g5/k7bFNbahsF
         mTvdnQMPHxPQ6pWyWRHjxrLhyqWAbr2o1zIqRLOrnY8cmCHMzzaf8Uc3zQh5XY9t9tX8
         N1beHWOBC2ocOlzqD99FNjuf3Jc55UaM9JVZhj/ndUcmSUbRnanR0CRO97cpBS50cERh
         LU0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769398135; x=1770002935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO6EGpqkl7ErqKo9oPQ1lfQ3RKhgNMI57SH8XY0i/ig=;
        b=jIAPRG22+8nxn71SabaAFuzbK6xpYTAazu+W8SSbqdMw7k/n3eMAQKOE5XVJncbSLk
         3FQLJTH7c4pf5hRb6BD4qDszbJ71smhRvPfWIeiWq4NgAs/XVHQIyUHYce2DSTMncmEU
         XElyVl5oEBre72tXm+lgNDPEWqzR2+aie+VtR1HZWLW39NH5imgyNKIGE10NWU5pHqIm
         6BHZxurZNgkQdzzVEsq2sKGJwFBh/YfMjd5Nm3zfByFZVc+7iGn1mujJDa2h5HhvfehF
         7HnXcEO+6aw8gZzNQi/sNl44MqW612yFHRehdVw6lc/UWFsCYOQ+OfgAAUiRiXgwV+PG
         0+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769398135; x=1770002935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RO6EGpqkl7ErqKo9oPQ1lfQ3RKhgNMI57SH8XY0i/ig=;
        b=TQwv9pPlxQSHgr5E2ll26n4eUOGFlhJvxkicDzlgvENUn6H/RTuNhu2Zz7hgnoZkfK
         KM5/1ksrD8lM6n8dPasZqaqh2Th2VzcKww5W71BeIEYcTo5laMFAZjHrrrKufK3WvWgo
         VcU6FrPGbRczVYdg2R/LLVsQsxsD8z0ifYgmm5MCrQVseXN1YKrbK7YyqZZOQQLeVF6P
         Kw115WrmBNQyC2X9NOXr5olnZUFQjz6p8xwRmCeJBi0d2tyung/a9sorjYE9eJzL59tU
         BIYuniWdRBw+kWEE7W+79RAyOKrPfJFcb+gaatSxhztNZUCAZmpKdqUzATkSZpx6X+wB
         6GTA==
X-Forwarded-Encrypted: i=1; AJvYcCVA0qNiwUsqPQRW4tWMBTSqOCMq3lI5xw/uvMM7g2aFFtI63P/nIvrKEhILJsAG+oHqkxdOYwWfZLipWn5k1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4zaDXsgVUDU/kRsS3xKDfuPUapKCzCjRUWFyEXXG9AutLKCit
	UAsb6+hYDSZoMNjJZMbl1D4Gh4AiUAfttf4RI1yMV1Hx+HcdmMhMZWnIV77pwsGD/jLtF1SQcof
	GDxXFeAlXumo+y0aiPIzhSdom5xcQPrA=
X-Gm-Gg: AZuq6aKGK8DDi066RCo06pOw10d2xLq1tZv2Pckmi19mWgeAUJaX1pzmt7Md67BmqUv
	mIrbfDN0WIOXWvL58jkvgs4S4/GTPnnQMOegPwf5a7qbCbUZXQzg91Jqm3H6KODstVyEDeQri7y
	eDIdtKz9PNnBUPx0ZGYgDn37DZNDxIA7Hidu86QKddweoOFr2/ZlTtxMh4BFoOWkd/z5rmtRIK6
	dLZ9mY5nzpS1D4iKJL1M+A1fLLHDnEZTdVMCAwM6zlvupFNFzKV0/61gVcfWg2nE8HA4u7TuPTP
	/li6YBpGQCe1hrCP1uBoAnE8UPd0VyhWhuXOEXJzbwH5LQxeNfYueO0BZQ7FpllgjCpfE6hsJyn
	Z7NiSCA/w1PFb
X-Received: by 2002:a05:7301:3d1a:b0:2b6:f142:44ce with SMTP id
 5a478bee46e88-2b76433995amr894413eec.2.1769398134582; Sun, 25 Jan 2026
 19:28:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-2-79d9b8d5e36a@nvidia.com> <DFUBUAW9WMGC.3KY2ZOUJPERED@garyguo.net>
 <DFY76NDCE2HU.AJ6VJ1ETD944@nvidia.com>
In-Reply-To: <DFY76NDCE2HU.AJ6VJ1ETD944@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 04:28:42 +0100
X-Gm-Features: AZwV_QgfVtwxoguOeiLzjS9rhNjBfLDypqpJ1dMODKmwVO_ryGHve2VSVtev2aA
Message-ID: <CANiq72kddJ5Tx_vLYo-kkS=er-8mEy=sMAPvC6yjFGujpZuDMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: num: add `shr` and `shl` methods to `Bounded`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:24=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This indeed creates a minor conflict with `rust-next` as it includes a
> couple of patches for `bounded.rs`.

`rust-fixes`, i.e. it will be in mainline soon, but yeah :)

Cheers,
Miguel
