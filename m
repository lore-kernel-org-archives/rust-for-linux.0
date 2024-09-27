Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBE3189506
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727424238; cv=none; b=pRGXfwaOd5SITn7WRPiBY4WU72oJyJe1RGONVPWsTZXQwDl6bXui4usJWRjBRbxrMG1N6Q0dSRinbL7xIl2vXLYOBhAC+veJFGCqnfuB5tzuOmZ000eGpKi+4SVMYUAmwwcx30XglZFNHHUM1LZhEdon1PcgIX4YXri2x4Xnb+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727424238; c=relaxed/simple;
	bh=fFbAPqbDu9yWueoZi9gudChMyPvYM+Znoed0XRnAt+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAl/TLcObNxdq1RvqsFjg0mrn4Cl6NgW6oCrQSYMHe9DZ27ApICwJ6aOJVYoTDei1Kvpk4yBwz+u/FZhgayu0tTCFOkmU11amLQlVQoZzU61QFjiS9OX4eKozjRtOTveO95YWaDPUTHt0bhbT69jPuyaqDAmOvj9fQ2fXLdgCaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G94Bgcmj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G94Bgcmj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso11741295e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727424235; x=1728029035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFbAPqbDu9yWueoZi9gudChMyPvYM+Znoed0XRnAt+w=;
        b=G94Bgcmjam/RhJa4TLAaQ925JcClMz8Uinz9BjVY/GW+/cKILC2FA/T0HNN7K9zLa3
         MWbd0dvl13fz7tVGyKaBcju/yMowATiDK/wMlZGFdjCprc3WYTgueGb44HpN7pmqxpdd
         jUjG7SVHQjuCF4xiPYHLzXl6Iqqy3N5fc33utzWKOhwLfokJeUSOjVQArmMX8xaVz6yS
         tMThiUWffvpiL7PE/OPD/ypWGqaMHzq2Ac+x+Q8/ga/UTFkO2GbFh+M9Ja8YomyatEyd
         iVe6rWY0MrhrDIRv9f9GL5svzabsq+/GjgLkzdvdPKImWjIazG59p+71S8MmdEe7vraT
         /DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727424235; x=1728029035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFbAPqbDu9yWueoZi9gudChMyPvYM+Znoed0XRnAt+w=;
        b=hdloZ3tTuMObUD07deToNbfRjj9M656rX3vpH10XAtPoiAOGzYWB0/8hqAqE/GM5tc
         HRS2CkdUo/gQ2KcxZV2v6arzwKquQ2Us6P6gnff+QhPkk35nqXq5mZ5D46JX103hxbNI
         GPNl8lStkwxYqz9/MBCyh4mZZ96/qPuVjZaT2rFyQCdZBk7TrxwkhwhoXxb17aGLnXbx
         O1rTuk3+Ht8Rzt+ZwsaMNBNUXFl7qzGjLFsWsK+p51YkKWDRy3sPDOMatyT/b38W0A0B
         WAjEQuox7oI9bp2cYsFWkgmH0LQZSLvaVy8WYeA98yaRuBK/8U3o6UXFbXsgQG+P2uXD
         lLXg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4sfJ+MwIB0mRaf18lLSDMdtUl1lui9rV/+t0GHRSf+hfG3CzD6sRjI9zNvgJuO6wC2vw6NXHeYGzXYOB1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLw/+HLoGkCVGn+ROu5qxmLSRahHFxtxD6tIy9RQ7l7PvAIz/
	rqanEK0IDxaVItQeMgdzl2pn9WxlwRqCfk1TudNDxTIvqynNxXOfzLYhbZU6o8gBFYo2OMdBTlu
	yLhy/XrzFPLZbCyLleqCB7vei88FaanC+/UUh
X-Google-Smtp-Source: AGHT+IHET5IE8YvG/BHxcblgKNz1/OcBsQr/praxbc8pTIV5MlIIOZ1RR7QTJ6imuIV407Ew9bFoRvkf4XE+pQo57O4=
X-Received: by 2002:a05:600c:3542:b0:42c:bd4d:e8d6 with SMTP id
 5b1f17b1804b1-42f57f5d908mr13572015e9.3.1727424234867; Fri, 27 Sep 2024
 01:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Sep 2024 10:03:43 +0200
Message-ID: <CAH5fLgjLLvaT2n9seJRp5WFTHG9kNG1wEWAi5FUWzR172tf4cw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: add trylock method support for lock backend
To: Filipe Xavier <felipe_life@live.com>
Cc: ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	benno.lossin@proton.me, will@kernel.org, longman@redhat.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 10:50=E2=80=AFPM Filipe Xavier <felipe_life@live.co=
m> wrote:
>
> Add a non-blocking trylock method to lock backend interface, mutex
> and spinlock implementations. It includes a C helper for spin_trylock.
> Rust Binder will use this method together with the new shrinker abstracti=
ons
> to avoid deadlocks in the memory shrinker.
>
> Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@goo=
gle.com
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

I guess there is the question of whether it should be called trylock
or try_lock. One matches the kernel, the other matches the Rust
standard library.

Either way:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
