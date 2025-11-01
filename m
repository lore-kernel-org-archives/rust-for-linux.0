Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD1B13D891
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Nov 2025 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762012084; cv=none; b=ibrV7eeFkCCPcC254QaqD6FwWm2NtBoGmWNNTWZRBcUTzUllS0Cjd4mLoP0ozg+iDV8EhMJwIXfszM3LsdLGyY71mCW+1+oZVFc8ATS2A1aBot3TFG/9fIa5HrKkdkX0B+ClAUUFoqwxdsFWFdNxq7bgLkqWRfK8AHM5w+uTn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762012084; c=relaxed/simple;
	bh=jamIEloEQhiPyz5eXgKCJiNa+AjH+v3pihsy8kT47Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7i7FXSE7/5yZgudrQUplbTJP/SJemokBlw6DZnWYrwyIrZdvI5w5iTsLZjVFHbvwUVjltWQ0RrrN7w8l/nIRdmLgvWKvwx3CGBjy4rnQVEsNXwS9NWtqrxoi9P2URieSnrsE8fx3Wx4mVJ0ehEnkGPS9zSc/2HuUfoJSq2o1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U27pwbkC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U27pwbkC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2952d120da1so1202635ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 01 Nov 2025 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762012082; x=1762616882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jamIEloEQhiPyz5eXgKCJiNa+AjH+v3pihsy8kT47Q0=;
        b=U27pwbkCRvpSp7ZnJF7pCchM1byq4luxz92KMKalmhBGv/g6Mtuu8FjqmeStTQ7kFL
         mXob26AAb5xAH9fqmMO25cL6tdd/Mb9I53KPcZhjOcvO7xYqbPmqw+aMNIkwwDqXi0Sz
         BgNqu0cP+yOkBzSUHEa6WROcvKpEIiHqWZD5gvru1mtxHHYo6MP2h0WNslkV7aYUZamU
         T3HpNrJUKhhp8SnglDWX6cBEBm6VYbNTE+qs7XUD1lksu2u+UEHK3ntt1DTXw3K/PFFz
         wvGMmATE3FGFZI0hQ0pgsTydqQECIZlPoZdF5rhb+Is21A44LyYAzVVqPiPCkrLJKMuJ
         5Kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762012082; x=1762616882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jamIEloEQhiPyz5eXgKCJiNa+AjH+v3pihsy8kT47Q0=;
        b=umINAu0ZQ53YJCdA0eA/zU4ozL0xxTadEGscb7GKGhl2dYIdQi3Dn1/F9Yw1oQ63kP
         Vhgl2eP721hBxF6AhcvdicFye5BzjDxZ/BJX+ounWnQaGabO/+6OoZmnuY7ZfwyD+re/
         mPg5t7iABFAhj81vfDwzFmkG3de/WxPaf1T+eAruRZ2gp31AXeIS3v4uXmYS3xxRcxWZ
         Mq3cjeHNXn3XMFh6NY7G7Rq/G3Y6mFMXX7UBgo39btsVXIMd5wOLDymMdjCmOxt1X6+C
         JFZRvedroKacQhU4Mb2OaRUhvGT8IBQn1PFbFPxOEDbKEd5R3lBAM+boYm4y8IexDA/P
         rphA==
X-Forwarded-Encrypted: i=1; AJvYcCVVkeVFEBA+SkRPXDv6eSYzaYhYT9iuA8JHqyMsYWDEd9lHSmggovh9NW/AjKh9f459iHJ5PDcnByhtDP3umQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRF2FJWLpkUbv8YZJlJDbSlYi9G7vaGqNbz6n3dY6nau5Jf9E
	sh1O9GWaBbNTWEmdBFGEoDdZnWaQ3xP/HUc1+E/NfcKcg2eDu6aec4FB1IQIEMNdaXCS2XFvgFC
	ljBl7Crd7F5ZXfuoXz2FMC+55QE4ZRXU=
X-Gm-Gg: ASbGncu+ijHH2YMloWM0OUpOHG4og6d7AmTmBtlXgDuxlK2THkaGDAlKdXQ/fptyS0f
	I+8Y90U2A/wErffOkPEozFe1ZjaD1R0pF4k8DBwej7vM2v552TGInmulSa6+PrcxL8LjAOy7jgU
	o2jzeti/Qh9FQlycSWPzekDx6vfAt2omylm+OUR8+cdu3CfZROxG+shuhnlFwiARXdI8nw5Ml/b
	DlC4hqgNEj+2wrCTDh1jVWdAwRQyL5/pHDCRXsPSLyiLAXWZPRsygFUCI+vbIcDAZ40l932/1tF
	BDhe3ZckNY3nTYymYHt2WLGzLB7NqdysdYvUyzrHi3c7gqAvlE0PMNVS2zcRvWcg/Ne35VyoJZg
	OAvt9agsCugFf5A==
X-Google-Smtp-Source: AGHT+IFeUdEiRDYhzdYh9fW3/jmt01WqbIkn5Mq3SaBz0gC57ZxcOJdIQVq5xYtfcf//SPWY5i1+n1E8bScNYE7sAx0=
X-Received: by 2002:a17:903:3846:b0:295:62d:501c with SMTP id
 d9443c01a7336-2951a3eda2emr49742475ad.5.1762012082347; Sat, 01 Nov 2025
 08:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-3-joelagnelf@nvidia.com> <DDVYVKDW8WG2.2STCJ4ZU00MZF@kernel.org>
 <DDX1Y0EUNNPR.1KQ7OF9H4T81E@nvidia.com>
In-Reply-To: <DDX1Y0EUNNPR.1KQ7OF9H4T81E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:47:49 +0100
X-Gm-Features: AWmQ_bn8sxdowUb4pdCsaJVkR0Kpv-lxkf62UR4OPlqQBFH0kCL_DBSvQwqzdW4
Message-ID: <CANiq72nJEGMaV7=omoM+9pKvQpUTq_sXNB5APhEY5vg_6KFoNA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] samples: rust: Add sample demonstrating C linked
 list iteration
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 4:53=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Yup, we can probably move this into the doctest examples and have them
> serve as examples as well.

 +1, in general, one should consider whether a test makes sense as an
example first.

Cheers,
Miguel
