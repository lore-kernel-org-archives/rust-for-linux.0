Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509B2066DE
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 07:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759216544; cv=none; b=IgElfDNUX8JAY/RCCpmld7kCsQhgA34hRUGUTzrLfEM+qnubL1SJpsaf7kRxxikSYhnsXRkQmofRMlEj+DMsfuIvB33x40XyH7GAcII96UcefmOUfIgf716mOOgSx7gxbSIbaBL4G8cX0zje05GmBu1227ScgrLmAUZo2nTFE0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759216544; c=relaxed/simple;
	bh=bYKtjmuSp8WHPKGo1stRMHk4Zp8bG7Oz5IVoChYgOsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWkdq3hEQoe3W+rc+Lak0B/pYU01D7W+QKP3mxPHbp9wg8TZe0XDHfKClKBb/omganhPPg+LpaCS1Vh52Gqwaui4yGMbZUWhtBESJitcZmQpkU5cQ9nuARIYljuaUboB+cCsPYhLHnT5kD90dcVA3xfQJniKbl+9JYgkaK8sWAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lv+mSRl1; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lv+mSRl1"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b5b27725e0fso158329a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759216542; x=1759821342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYKtjmuSp8WHPKGo1stRMHk4Zp8bG7Oz5IVoChYgOsc=;
        b=Lv+mSRl1VvllX1NVtIc+eWBArMnEd0v/czIe1dpDDZLSA/2z12+ELTjbx6iWe8BEcI
         uwb1kbhApot73seBboah0ZOb8B4tHBJl+SeHANJzVHRqMFqBnhBGStHEpL5cFfTk03xq
         TZY4CstprQXmEnq8j9Pa3y2Pf451/y6HLgLISgrL3ecLYgClXaoYcHEZmicitPx6mwFo
         sMJQB0ECiYmLqZPNG6nyuFj1yto/WDFs9JkQRjc5jEN3xiJW7lw1JjsOPF+w7UOTIVJK
         ZZkiygyO0eWpbIutO2W8UzhckrphKVad6pffJBo+MLyiF8mKQ+iQcL5RXoUAA5K6GBmx
         wN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216542; x=1759821342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYKtjmuSp8WHPKGo1stRMHk4Zp8bG7Oz5IVoChYgOsc=;
        b=jK4WNd7eGtfpyzyPIbbdBh0VA0sp/ICa4QplT09FU6gIfjyJl2uIH5HwlWv/0Zcx1U
         m+smCPX3FH44URnpXESOq9vfKfwZ9pbdUSnLnSslGd3HByS2E/izAp8O++H2U7YFq7Qq
         SlLJgUuv9L1UaMx+iV1ih7kewJql/U2w1Buj9b9H9hFk82kVnL+ZszaB6M+qMXzjrbGI
         74hGtSzdlYq0pQR0k01YZKrwOpldWMmZsrf++UiX8FteE5tvY2e9ATEZ4bVAuhwm9PN9
         8aUwv1p9KjCxHEM1r1KyEM0PLZQI/wrkAHn4VrU0WBSAAJTKtcxRPVDIXKACzUH4cPpt
         ST4A==
X-Forwarded-Encrypted: i=1; AJvYcCV6QSEqYHYYgmM5bif0WeysdnlX7ELuq/h9gTGsXm6MUxFEBh5hYRQxwhxVeHEU9AUPd+4ccdjgyIAee+vWcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrUhrICpTBcAN6rRaL4qrcU+VtfNooLNYJGAGvt02HJx5fuX5h
	wmR2hL1HzrH402lbcnBIKuDl9dH+4m0DGYh1XdRi5w86Da+M+kKx7o/NMUiFUZcRh6cDKNX03fz
	nxlloAKhB0RLV4r9a4zzkzIBgPNzVbJI=
X-Gm-Gg: ASbGncupGxYj2m5NUdgz6qi+v2wRlVfEfkI2hYUbyn6XYUoTUKwefaJHbsmhQbv43FA
	w5wAbClUQtWPj1hXqXYNK9KhVuCmzptc7vpcVmxVx/vFvLLbEJSZ7XVYU7o0m/AY8bOps2CfZQr
	8ITAif1Mo8+/zZlTSDB0+QspRfIElMzZ3Fqy06AHBxfhJNszQPRXzlBNaUiTnpvda2EfSAYrsCK
	vC7nE13H1pSwfuBmHtAIDBthZFCjWIKJe2ci6ElVotx4UaM54aCP3O98CFVUS1aewJn9qCvLjQU
	c+nFOtcsHHxOJgvTvbf/zRaOtl4JJI9NXKvex/dosW3912g9G0y4Yb4/SqJo
X-Google-Smtp-Source: AGHT+IFP7t5MzVLMeqCeEzPgWwzMMlQ35L2NiKbBPcqBGD7XWZx+ZpB9ob6tpl2FHQgys9W1N33lBcgRC3EHBmH+gvM=
X-Received: by 2002:a17:902:ec85:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27ed44d5f06mr135508985ad.0.1759216542032; Tue, 30 Sep 2025
 00:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930-nova-tryfrom-v1-1-0cc1bb507047@nvidia.com>
In-Reply-To: <20250930-nova-tryfrom-v1-1-0cc1bb507047@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Sep 2025 09:15:28 +0200
X-Gm-Features: AS18NWBXJDrDh3CHU3MG4Bnt1-ohuc72B_SoqOSakBKgfBdQNMLxKs7VmYo9yF8
Message-ID: <CANiq72n_pG8u7N7=jS4LfNjz+cP8xi1nVOxaGH=XXfr1+nea7w@mail.gmail.com>
Subject: Re: [PATCH RFC] gpu: nova-core: use the TryFrom/Into derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 6:55=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> As requested on [1], this is how these macros are used in Nova-core.

Thanks!

Cheers,
Miguel
