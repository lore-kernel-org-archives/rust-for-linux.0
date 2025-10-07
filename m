Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0E2D47F4
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759833776; cv=none; b=NcxYiWpgnAPKGb0yEoGDGsE7XyeVmiOazHd7m354HWw6178aftZ3HNVI+HkYElw4SSS1ZljK4i5L6y8GEiDmbYP06DEaJI3iMw0cREVL/e/3UJX06EDLOQjOzSegJD7WL9r1g7KxvIYBXjatfUtdzpsd5Gd5aTxgjGIO9v5t4GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759833776; c=relaxed/simple;
	bh=t48xr98QD61VaWXPvBpaZ2yaPisBwVUmg9uYlxv8ngk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie5csAJN/Z37+VMZbQUP46cYKnpjoyvo7Szno4hbWjKhxEvnvupcAgP2StILw6hx6/FVvTXd09cu9qulsx2syPLRK0YZAJkOb6BgKjSriC1aOwtUejfWOAQCKrwtgMbN9iy78QjluC07HDFc1SIZ79EYl19NoPMASVfy6eHa7/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw5qDQij; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw5qDQij"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27eca7297a7so8297825ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759833774; x=1760438574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t48xr98QD61VaWXPvBpaZ2yaPisBwVUmg9uYlxv8ngk=;
        b=Pw5qDQij8MARyxaJey5UfIJzutLT+inpNsHmY6VzuKFbvLpOE65FzWAXr6k9IPqlcE
         UoQU3irYMW2e+/JjIhW5BS/2hUF34wijzBdvRIhPjYj6/UUI1ByiM+dgBLzrr70UFDxB
         u9liFpXeVMvsxRmN6FgnJ6KYj2st/S4pu+aTXwrNf4T0eztrSC9L4qMjIqrRyjBzb6wW
         T9+Fpm/tqYjDFBhQNU3K503QQwCb2bW2XnEtBqN5+fAKVdgYZp8SDFeP9rVjI8QEyhtv
         O0yFBER6kX4HqljDxvJ1w6eWR+L1iqdb9/CAcyJNzceofePdx8AZTICTBTaBMCQ6ko2f
         CdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759833774; x=1760438574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t48xr98QD61VaWXPvBpaZ2yaPisBwVUmg9uYlxv8ngk=;
        b=D3JfN6NKOEH9BsCIMbaHYkwFy3uYjK7udO3yUCXxoOBDYO72PER/71SdkDjURkG55p
         yJ8n6ZmIlqxm3NvXx6EOkXhXMbHt4IQmh5jFY/aP2JrD3bVzXp2dBq9o775VNG5/rY5m
         foCsa0Tx1GAs5BGtTTyFq2daNcuBCKLevwgES/OGR6/KqUdNKBoUeCUDJWFJAWuvR84D
         cdFBORnfmCB+za0xmijt9KqOS03zLJ5gJyjSoDz9JEsM7OdzjO0RoCAi3aJJho9aJuaN
         73UbB7Y0OplVu7P9TKG3XFY5iP9TYiCdAOjMCi+n1Bz5qZe+4oVu7lKs8eKKLdAkchml
         gdcA==
X-Forwarded-Encrypted: i=1; AJvYcCVX6Bv3LrBZuSI/zt4/Ii20cOtYolT1HySm7kJ7KQr4aqr6akd6BySGBPRJN2b2SXq6yb8X3lUOqgCVzrKCaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbEO4aUjeymXKO68JCxLX8uIYEEjS9HluW9NmTJU/LJoINOQ9f
	iXZJgUNQNJRnsE21meVE0BKai1odk8vWhjJMsn4VVRGA01gTydo30DiS989StheDsVNRZyh2sRX
	bMOU3EDiM/buL9mV97k49ogd99UWPq1I=
X-Gm-Gg: ASbGncv+au+3Ium6NBS8oKzxqbPtuPYvyepG/yc+0TGGRJFqqyqwTrSlOp9q2oV89vP
	LIC8gPAG00bb8MCp74NTpzj+KESUdcDvfqthRx7QKtP3PWAzlYjvbUUL+0+9KeTUQY/8z5d77AO
	FZkW5FIq6W+ExtExFHnYATpsEzh+0IDVPb8cSYU2nepD+Iw3PIb2oQKGyYY9HCvTC74baY/5i0Q
	Rk+lSqwhT0F/2REc5sGXHFPr0gzCqsnXoiA5DnA8jQ7V4eBg41w4FjmbVeV5+VMYXxGSzroqY2q
	B8FlyGKSQCD1Tg45TfRBsYytuW8L11VrDbPUBp+jRwsfnb50eA==
X-Google-Smtp-Source: AGHT+IG/tceer4xDFHi1fbtvymQWQEX0cfdjfz7qa3VEV1S1lLa9ROogqCppnvlWvrXrppWg7CAeyI7raGFpenio+L4=
X-Received: by 2002:a17:903:1a68:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-28e9a5a2ea2mr112471585ad.4.1759833774205; Tue, 07 Oct 2025
 03:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
In-Reply-To: <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 12:42:41 +0200
X-Gm-Features: AS18NWDpvGktuowJke8BSxfgUaurFD3miGBpRkLVS9T4zoCecLy6NtllLzWGBNs
Message-ID: <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to rust/kernel/
To: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 12:36=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> We can assume maintainership of this of course, but is there a problem
> if this falls under the core Rust umbrella? As this is a pretty core
> functionality. Miguel and other core folks, WDYT?

I think what Yury may mean is that this should get an explicit
`MAINTAINERS` subentry even if it falls under `rust/kernel/` -- I
agree that is a good idea.

Thanks!

Cheers,
Miguel
