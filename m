Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D318C48097C
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709465; cv=pass; b=H+y/xbEV7YxqpGgtmrLt13TGpTFJzfbl37Id2KQhHY0lEkDEIrKvGTLETFr3YyjhE29zvEiMcb3kYQL1ZG/AtvWjKYBJjsYtF60RCmbnhuW4Z2CYdglqsqD+ZNKcDsR/9F4jN5ug1L6q0ANDe6YU79IMbuODr3BnVxxnqsvGxnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709465; c=relaxed/simple;
	bh=NZ4Sy4JQrTP/q+p8S8QsQ6CBhK9DKzA2TcsezRmBCVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwWXGO/ZcF2TUkhR+DRYF3lyCME6W9aZ5AJd8sup53ja85r+yj0Iu+G3G2IT3/KDe6Ft/4BxCCXb6V9abJsFrbM5tErLErsswGOkCL5NSxWXq/RN7fA2U962lXIEv2dN7f2UhnBJFsc+o+RFZsPIlYedUnom2Fvs+Kuq4muKxVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3Xy+Jy9; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3Xy+Jy9"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137e836ccc8so412695c88.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781709462; cv=none;
        d=google.com; s=arc-20240605;
        b=DtaezHUarJ7nUcY8dJj7S0z1JR+z33WrDJ/zKjqguzo11Pg8ot4qSOHJW4I9QRNhZ2
         EAhCiWSQQXY4+Z15LYTz4MRTVKyV4khgok0LKz2vCFFaBYI3p/FCsOsHukBo0L1k9Nt3
         QIHIGzSEWppO5258aGl+P1T4cnDsOX/n+7qHxGIbPRntwMpAiESSuMONpomUWdFY5MkC
         MjRnFoZvO7/qe9hQfynE3zx0qn+JJViW0/to2dOLppw/Oj2yH9y/v5+a3qvTAIlYXE1q
         pzSt35YtmXqBDY+EgwxZxq/e3s6fAXMprLnxYfLui79oL4H0sDus43b8X16oZdrzDw2t
         YOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZ4Sy4JQrTP/q+p8S8QsQ6CBhK9DKzA2TcsezRmBCVM=;
        fh=2+V5rRN5cEprF/ap+ZJbyuUfq78FfVyPLTgUvKaP498=;
        b=W0JxhaKwMK+b0mDmF7JUP+OTGhlcrVl9P6BNJefmudYmktEDcvI5D01V7yoC8hGNL6
         Tq1UYzfmyOREuIGFk52E/1BM82T45s4+l7nK7lPbowPtfv1h3FIwFHgUVF2q6s6NqrN5
         OXU7W9Qe5HI5ezQHEz0d7zbiIxjqSTIOC/4Mz8bEKixTPkSzgr6d2OK1nrmPkWDJrZd+
         OwMTpiMZsBh8/+KQ9kbTJ5/OITwStrYqrzoIenI/YmRz2Sc8g06vjYKJQPIsgpK2sa0w
         FP1O1zU6X7WKFdbcS2TtHqP6GWww6CeQihn/pbvhkrmgy3FLnSimL9QVezyyDlxkkiHy
         16rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781709462; x=1782314262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ4Sy4JQrTP/q+p8S8QsQ6CBhK9DKzA2TcsezRmBCVM=;
        b=k3Xy+Jy9WL8uRDBX521eGkR5yO414sAq4enMMrvEOmqm3PimUgpON+Qjfipz9/WNBE
         GZARKCDL9Yoq1Tp0okPz5T3lc8jF5qOYnnukj/9izrFeuhtv72TSE1vGr72TZhh/rcCl
         nUFySju94/seUem005bcG2FcETq38ojaRVjqZtIgbGE3ddbvu2D7kXfjwWNFw8UmU6K2
         mB5y/NmVRczfGLuaYUSJIUCppsDkv7Pe7Z9XUfFCgQX7hZNZl0JnAllzHvPGfU/ItCF2
         eki0VB7We5ZW7ICYS+Lu5uh94VdjptNmLlPenbUabhIT5juOXMdZJvhiSdBxs52/F6bm
         ypMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709462; x=1782314262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZ4Sy4JQrTP/q+p8S8QsQ6CBhK9DKzA2TcsezRmBCVM=;
        b=qJQtxFAEDpzWrjBMgfPjiSj7ch2KjDB1/105x34m/ZfnGVwhuhQukOBVHvOYUiU+8Y
         7REIPPGpoxc8xnCm0zKG0UwFGn59iYnJNf5TZWenv2hy97S8FXzDTrb5dBgM0OZ67bs6
         cC9nnRpPvQztkx2J5dnjaz+ngGTw0dQkir2uUzJvaD49CRYkF5By2HaQnGLBS/dOksFP
         Yhw169CCUskW7EvD3spaMau1qpBEJ7P2pPlqjLYCraOkArPIIZE+TtzEbXhReKcVEEkK
         S+snfXjOHq1T2nfZTVmAF+VpoTeJXNs3ikzcb/uoTTKDMBrDgU/bHMswFyonO4sSdhL1
         6J6g==
X-Forwarded-Encrypted: i=1; AFNElJ/F9OQqRvJ9CxJqa1PGUgts5+q4YUtTVKEtI0xYxOhVOfoL7pqUV0IIztXtw7YcdtEyGWIptYowtAlWEX5SzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXgMepoHPoKwopLeUZr+ynQM2s7zX24GRuhFKcGXzIItXVU27v
	FcKItTFLuwYC5oDuggPnOme0t/mO1a6MbCR7xsA2OtInLegBD58t+yBfs1oQ3+am9OofrzVrRtI
	a5xQBbQq4mbFIAIByJYPj+DipRwlcVqE=
X-Gm-Gg: AfdE7cldZG2/tpo8J/ah0iZpE0OFaK+FzE0d40Y8rf8gCM4hItcXyr/8747slBjZOxc
	yFodK+t0CZvQjg3KLoPjdVa3g7yAU5bX4yDbaWa6aL9vQ5cZS1caTqaro1MuFOpf3k5Y8Dly29y
	kBTTyXZ6ViYWl4TQf8oTm1s7EoDlo3CCPxNl2FKp5rt9n+ZoPs7XpWK6XHlcJkc0QAawPDyDjrq
	wSBDM1XRWL49VSCFLu61kaILlLNGJUpN8BNWNM8AxZaGw0u2MOP6xF3FXvpXASKqSGuOY1lTEEu
	gVYP6uSIBDnSnGIcyEUi+quEhWQ4V6O9FrFHgUeXHM8mVAE0DVorC0cQq/18o/KYse39rHfd3I2
	BHOnZ15aIdm14
X-Received: by 2002:a05:7300:818c:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30bca0cee9emr994355eec.3.1781709461303; Wed, 17 Jun 2026
 08:17:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617151249.2937-1-mike@fireburn.co.uk> <20260617151249.2937-2-mike@fireburn.co.uk>
In-Reply-To: <20260617151249.2937-2-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 17:17:28 +0200
X-Gm-Features: AVVi8CdpchNqwZLZnXkatbCgAOWgn89zdy44pTjmHVnT8YGKMWGaXgvqWfIOA04
Message-ID: <CANiq72kG56RV7X=UZ0WRJN1t-Ttkd7pCdcg6ibx29uoitLiuMg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] drm/vino: add DisplayLink DL3 dock skeleton and
 plaintext bring-up
To: Mike Lothian <mike@fireburn.co.uk>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 5:13=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> Vino is a clean-room, in-kernel Rust DRM driver for DisplayLink DL3 USB
> docks (Dell Universal Dock D6000, 17e9:6006), a native replacement for
> the out-of-tree EVDI module plus the proprietary DisplayLinkManager
> userspace daemon. It is built on the in-tree Rust USB, crypto and DRM/KMS
> bindings (posted as their own prerequisite series).

Ah, so this is the user for all those series. Is it then something you
plan to finish implementing and upstreaming?

(I would suggest linking this series and clarifying those questions
for future versions of all the related cover letters, so that there is
no confusion about it.)

Thanks!

Cheers,
Miguel
