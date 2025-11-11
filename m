Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7D3730E6
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 19:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890872; cv=none; b=gtOsdzuXURqoG7pGdIUUswEsR52nE6f99p8NvUx34JP+Nvf7rTHGF8Ql8VOeQBbEd8NFdqaD1yrXzhhMeD5XkZFNI5OSdIHW6QbagN80knoRWua/0zfvy2TbnY2azNQDu9J7UIkLDWAwcVDeB+A7iCgb9hRAh5JtESx17zk7Rls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890872; c=relaxed/simple;
	bh=s9+a/eFiDoDkgzy9Ul2SUezw6cD2/LMwGt4BI4jMuWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axDwPQ7dS9S2p/YVSPx+nQxUWwuqkOwUKBY1T6i3tRMevq4bljWPtpffuRxfiU0Nt2Rg0CKqL4oZrwhWbcyTlg6gd8HPkJgZoEF6FgwssgSHYLjcWEnaWc8nTsPexOtS9BzRH8auToF2dLhz+xreLXtrAaOrkrQvHPkPTBNkfWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6wvzAoS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6wvzAoS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29800ac4ef3so147305ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 11:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762890870; x=1763495670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9+a/eFiDoDkgzy9Ul2SUezw6cD2/LMwGt4BI4jMuWE=;
        b=U6wvzAoSkY2k15T22W4yOdF48wWhxYUep8p7av8A+5FJXJeWTUfLdLpLZYKS3DLqSR
         iSVHdagTiJyGuZXe+WARAcFHhC+0fR56yDkUJGJb5AK2UD4pNQJQbBuhH2zZe5gjO7NB
         gqET0z+VnG1o+FsVCIebqUAQ87rxaPs9jgTU/5Uq0DG6JaYxUbLlHHNYfv/M3IfeiAnb
         1t81oYQP/XTjyjHCeP6xYbBFGD3ECIHDagyZ0xG7wiOmSF21DnbIkB/txTDO2M9Anoqb
         0fxlNU5lf8EAXr6okY4e8iky2RpUwSa87yX7Y/tATPtUyBsy+9bZc8NF5hGPdxHa+l5S
         K5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762890870; x=1763495670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9+a/eFiDoDkgzy9Ul2SUezw6cD2/LMwGt4BI4jMuWE=;
        b=YPhI92daAvwPPa/t6bwlgi+y2Q+gOHgIexh1ZJWRylXhsbOaHNTFcSJAvfQfVM75hU
         KjshR0P8hTe4bG777cYoO71CMxsmEgjKdhakjvRB0dKCQM724v7x/1MwL/zpzSS4SrLR
         TrUwfh8BuHrs6VRUCwWjhr2NQrQ82azRTCxVDdWwdMS3MUoB+7gSFYN2dbKHb2wrYxSV
         UNk3ARpn6jy374Wh16AVJZO+/+vBV/osAjWEi20cno3ckh/0vYVPgv4J6z/7AE4h5WI2
         811xba3wAGCiSzFnpZvC8Rq8K6K5VrVGaCxqv7FpSlb18517iTpB7kg8CZKQVXljakYO
         TOxA==
X-Forwarded-Encrypted: i=1; AJvYcCX6HBWZfkJEroqMdmzp3ynFH7MUEW0o+4yZHQUkTPhVXUUO33KN/uSbubWWaptZt4OCpzJYtGIfkNR/us7adw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSMMxuk1+8ItTQsm8xxLreLR3PbXC859xcDOUcHFbDDkDIb64
	DvB1cqc0TEl3umCrg6So0h1dJ/6gtuG+f0t6Pm7pSVKyowSAMUfiJxIYsvK0fEYzzenPM2O8AWm
	2DKApuSEIjUPPkCXR/EhV2FL56X5tz34=
X-Gm-Gg: ASbGncvXdyFD0E4e1JXRHJDy96CggAyX6aePbVcPGRYwT48pfdcI1EgI3sESjLTMk5W
	USE6zrxwhhh48RIIGhExHUuwC5FaZUrE24XygS1w8mwcWW9M/XuuHXZkaMkZ2AB/VXZ52hLFBsu
	4Gy/s1sweIcpcDLCMxSxcm5suUYAEWJ8kVR2IoyfCVhsuHkFvrGZw9cKbW64BrVaFa21e9VECaV
	cDZT5K3Ndmgn8LnHwc0d7MX527+pEDIg/PqUpjM1gsYhy7lFnwrPM7CQA16Kk07FtwHLOGVa/TJ
	16yOGe12tMd/kBeMCMWHyxbHh5t/F5PJGZk4l0pXdpJdev5Gm43wHcksuLJ/iffoKQ5/gQKlbtc
	m8Lw=
X-Google-Smtp-Source: AGHT+IFGIw0sPldyd+rtRft0su885bkTxqqUTUuhpd3lcLBUxXPnk/ZZeeLUF53/y6iwwN8RrfJVa1Wt8ImxuyYODE8=
X-Received: by 2002:a17:902:d50f:b0:298:371:94f1 with SMTP id
 d9443c01a7336-2984ed2b38amr3798265ad.1.1762890870059; Tue, 11 Nov 2025
 11:54:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111171315.2196103-1-joelagnelf@nvidia.com> <20251111171315.2196103-4-joelagnelf@nvidia.com>
In-Reply-To: <20251111171315.2196103-4-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 20:54:17 +0100
X-Gm-Features: AWmQ_bl0L-0Cea_Wx26TMHEqrDOWgYHY0NBpoDZ7Qy4Vo4Y76uHd2eVw2Y9spcU
Message-ID: <CANiq72nuHUFGMsEYr-KhCB4oMjX72YskG0s7uCB8dcVtTGW-jQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: Introduce support for C linked list interfacing
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, airlied@gmail.com, 
	acourbot@nvidia.com, apopple@nvidia.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	jhubbard@nvidia.com, ttabi@nvidia.com, joel@joelfernandes.org, 
	elle@weathered-steel.dev, daniel.almeida@collabora.com, arighi@nvidia.com, 
	phasta@kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 6:13=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> there. I rebased the patches on linux-next. I can also add MAINTAINER ent=
ries
> in a future version, if folks agree this should have its own MAINTAINER
> record.

Yes, it sounds good to me to add one. Please do -- thanks!

Cheers,
Miguel
