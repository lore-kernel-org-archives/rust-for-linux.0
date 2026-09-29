Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89423D5661
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707057; cv=pass; b=cHcsuj4aPQal2nMklFZFIaEc1X1PvrR/q7OUd7jnMMvEWdGhuSV8RZ1daomOA2rj7AqH5TXCiM8tEqRlXlk9m7+4BaUARUxkfouDyK6dk9AQdoApg8m3OuKuWdDCLILHmBsfxY/heabfbZ7fIYBoOc/OBygJh4Rvv5GHDOJLwX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707057; c=relaxed/simple;
	bh=ph05rTjXRg/mueK2r9FcW3ofqvwfI1OacqquH1kjvVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4ADgtMsHqE0zzLl5kwUY0zgsrbr3wwmtvnjsCi4sTuwUpbyFhMhnDVozNyfLst7WHje7QN9oO40Yz0tu37lThZk44QI9oIvXKMsjCsJV7y/iTAUj9X+/v7ldOR69GB8yuPun8nfSa2jOoaEq1h5IQs5WzEuxD5ZRVPiNWQXLsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSMwVGBy; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSMwVGBy"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-343241d5d34so267128eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 11:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790707055; cv=none;
        d=google.com; s=arc-20260327;
        b=Zqn/+qcdroHH8Qc+eg7sIKwmBcm6tPQTJxYzJNM7vvGgl1sSqY9kwKyKNilhwGt9op
         oFy5YOEqOpmMBrih5QirLGQRFCsGr878M+gdw2cTvksyqFWiCzDp5IqGxzA70MkQDCFl
         J9Kgt49DOBrOGBw/g1VcX+5yvBzxUKcgJC2nlVF3Qy3Omeu0FSj1pzacMQeS4UPqgn8z
         9V1lMMu+pI1/s7dLxy7SVfl6d5b7ImOE+j4MNjoiDhff1KahJYKBQLPP97bvFB4tm3QC
         cnmGw4BUS+Y4mV29CZDEZy+QsfQjsXpg2khQnW8i+gZQlr/4iwfUd2I4DQCfhZ0z0zW8
         qLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ph05rTjXRg/mueK2r9FcW3ofqvwfI1OacqquH1kjvVg=;
        fh=iQB+5/VZzm7QEU2CelMPWtEtkfFbNAj/4RhfvZ3bB1Q=;
        b=hRCeTH2Av3E6jy5Bx74ksiQVEmP+ArYf87v05ad2yqcKlHjpgSdGHquixJZt/L7OVZ
         7hngYxCdDZL2Sz6qKsOYT7B8ya8tSTbNzgMZmkf3BBSyhfLVN5wOr4kkEJ6c0uPdyisC
         znNkpc2PHom8XevWvDfxeTq6cllbKbITqxz4025NMbYEDYLZfPWTPeBpJBkGjZPYkLxa
         iVEO+TWvRgM65GTuJw+cEI8jriSKc6E3SyM7goNDV35IKSeNSXBTa7FutlC712mAO675
         NXqIsvo2fEEig4lJftV2Wv/T5X5Mgvb3ccIWd2FDuzYicRAG+/64+7nj5LhHwPwBJYgR
         w9Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707055; x=1791311855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ph05rTjXRg/mueK2r9FcW3ofqvwfI1OacqquH1kjvVg=;
        b=XSMwVGByn53OXYkVK2vEeGw8YveIyJiPzg3lTUSE1xlaxJO7JhfM2MQjnw6M1zrtNl
         OoKHtYIQVdGr349OE8ssPjcAQzpgELW60KGBL6l9pZX3TpC5bmyBKFm40CnAkJU0J+H8
         +pMuGJ49O7MrDBMCqJeWvXIAQ9ohUlZjxeYmgiXB7QDh46pi/KxMvoFiRPMTAHKVOqLv
         mDby47cRcN9n/Ub4lV1qtHs387jzB6oRZHa/jo7PorT5KyOrMes6RXTzAzrXFC/RGYzO
         z0jgL7tylQrBm8V28O8K9qSxQ+EioJKS5WnTSaEYGSi+Gzc2z+xWDI4phkZ5WmtD0SC3
         9VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707055; x=1791311855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ph05rTjXRg/mueK2r9FcW3ofqvwfI1OacqquH1kjvVg=;
        b=nR/vWySpbJEdRRQUA9m4wL8jT0FncKTuStA9O0CdF++IW591bpRvTfIGTf6oMKLNpV
         N/9EqKVwtHRq9ODBgjXuC9MC9IgtzBmK+95heVjH9P/re6u38CCK5UqUgZ5CYeRsnzv4
         93yay2HUB6bhUXGeFFNN7V+Mpaoor5mKfdfKvh8KHhq5bQAC2MlFfc3NM4vYl+cZhbpt
         KclsvOy9UcNy7JtipV9fhLdc0cDWBlKGY9gM9or4sehFKxEfJSKxMGwUdpkE/ooPqCKk
         RYskBO0VaWs1FOeHQeoPAmS/AJjmeI7NMS+IUm349nN5YYyiLVuq9v3xsOkaYV4VsH0B
         QEmw==
X-Forwarded-Encrypted: i=1; AKwUvBxrxpWgaY8vlD8vujh+Uaij+7iyI+XXJxkXIOaZeLkNpnCmqDv//H3/M4tGqf/Cke6Lz6octH+RbtF6biQukw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLWEMOiMjPSIpPWtxOLxaSADEwU0CQksHS1xGFFSQLh2wdGC/NZ
	lUanaFRxy2m68ok//GNTVeHcSSjqv8SZrcaNgotA10zpiwZKmGs5XhMQ3Cj2vpud1FyVJeRxzP9
	gD6cIaEXtOMTIlp2TofuiyVPkSRsdutk=
X-Gm-Gg: AYBFou1VfPKEOeyNLYuQIS2VDqyJEMm+qBZbs5RGmuEY6nheYVjrgzFqGLtRYjlApon
	N7u0ARLh+pBa77zttFgL0TMUxdk9Owre3n6NrnknLbkAbzmb4QrXEkD91bSyjGaatVGzSqfcO3/
	c0vuC5p7e+8EoOrH3qp0QBulT/rQAmcnS/eEb3apYxQ2igYwWeYJPZ3HYuag7TJYOsC8M/OVfnL
	6qHtPzYtl22U6c0ETI4yTUhbCftW8yMSY7JeTWLAS6npc8Ak6OSFhr+IXI+P/MZ5bg4uDHxukLE
	49G04asqry/ZZbTaRKxJYM973yML1yknuz4zsZwifL8judiYWqlNd32VKjMR1t238lx9xVGlaSO
	ciA0SRTAIMgapTH1IXjFaPRWIYOyM+NoC+WzI4aHdd0parEfGAyEdGCuMXcfwAiEBomh2X4Vq5B
	09owk5hEql7s2fEK5c4qKcKw0Pb4EPpy4iTkv7p2yYlg57fS8xun0=
X-Received: by 2002:a05:7301:4d0d:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34c61283516mr382056eec.0.1790707054864; Tue, 29 Sep 2026
 11:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927125622.676342-1-sagartaunk@proton.me> <MA5WohQDVE-anywwlBsIffVgVU36GPYOzQQ5luqbMOCk8jcyKSKBHucUT4ISOAP0lG_6B_5UFZmFSG6YC1HlBVBW4sNL0BRcnuU_Md42-bs=@proton.me>
In-Reply-To: <MA5WohQDVE-anywwlBsIffVgVU36GPYOzQQ5luqbMOCk8jcyKSKBHucUT4ISOAP0lG_6B_5UFZmFSG6YC1HlBVBW4sNL0BRcnuU_Md42-bs=@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 20:37:20 +0200
X-Gm-Features: AclHuK9CP1-G4QvkpDX4V_ulAFTCqpwYn3c59CktMmE7ITpNmjMLcNhq9m1-Tpc
Message-ID: <CANiq72nzgVKu8BcmWSLLXx0ve6zA9wt2GnYZkFoyLnRnBvH6wg@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust_binder: add transaction buffer tracepoints
To: Sagar Taunk <sagartaunk@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 5:57=E2=80=AFAM Sagar Taunk <sagartaunk@proton.me> =
wrote:
>
> Are there any updates for this?

Since you pinged within 48 hours, do you think this should be
expedited in Binder?

By the way, only the first patch had the `RUST` entry in Cc and the
rust-for-linux mailing list for some reason, not sure if you intended
that or if there is a reason for the difference (the emails did reach
Lore via the LKML, so that is fine).

Cheers,
Miguel
