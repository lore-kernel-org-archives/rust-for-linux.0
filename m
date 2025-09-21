Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B028F5B
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758448760; cv=none; b=I2ZbhFqx9YrrsEXnl4ftUBp58Jo2PiWB2Ab0ZnAaUutypXdgCqSbgGpWCOO5E0X9Y88Phr7Zi5B7OsRp9zn7SW1PZzHj/KZk/TI8JdDvmZUg96I51MvQY8SvWLCqDnVRYYDFWyLe6RpPCIYIQ+vu0F/RY+reO0RHilndRkCXZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758448760; c=relaxed/simple;
	bh=wQ4XKRzPEjC8IN9Dos/AJv1tyfP3n9GhDuIrZCE5xS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJ7MEcuVAfkC/nHYGobHJgY54Fyo9gC67kiQbMKLkBWq0Y7xzydOosEb4SULj2pIBdcZKEdmo4LDRnlG4rNmFUDjbV83OjvIrfora9r2deK5qdg9qn5E7nUHlYkYwBAf0776Gix++X1nInxuWiCVbvLt9kVqm4y6SrISh77jOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhq/q7Tu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhq/q7Tu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26808b24a00so6384785ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758448758; x=1759053558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWKmsQdl2jsGwScL3RcU3RgGD8V6ji7p/wbvV6vfnGU=;
        b=mhq/q7Tuolhipn8mAQFQ/SjBEj3ebDz0SVo89ri0gPqIHyWjPlyLGw3H38qp17RPlI
         Au5OuqFTXwho9lARQ87YbfVI05BJwf6xhUza0RfzlumBBJrlrBzq6xpqdY5VnMtPPcK0
         IZApttdwP8SnHoX0lwLeHpx3h1ID0MzZ3tex5pUVfrrsCBBRSN/k8rQpHpCzawZap5Le
         q6KOvh5gxrzR5nf5At+UgBIR74bTNu3TZtqUtm2o3XhBIjtfqUi3TPiSJHYW0lpaySiv
         mFq1B24xpuZhViChx3+DYl/M9OWNAoZoiV1YDfV09sWk9Ayv7tBJVVlnQKwKX++rgwDf
         KrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758448758; x=1759053558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWKmsQdl2jsGwScL3RcU3RgGD8V6ji7p/wbvV6vfnGU=;
        b=cHP9X2Yh+W1n6s5MEIcMwX6JuQrVRLSalHAxWG9ZsyzSmNlKlew3EATgtUrTSpJ8n+
         To6hFS85/wDeCxM8hs5ctHpnSK83+HDRsACXrlNQ4cqi46mR4WqO28rSjQI4iQNiQW2q
         Sh2XBcUS3zOnwFV3M0X+tx0tMFMhPYlkJAQuO8H8vDL5pvO/99KSEcPDGeSkYN4bMDob
         TsNgnPVdqvak+UlepIhzJyMcvUZ32a7rlt9cQBVplVbRZenBWI6ANmXhOW/3HbK2J67G
         M9lLB6tHF1iNlZRGyl5iYazNwNKJ1VjwHJBapBDCfeE7IWmXvxq3tB7NoLodP7/CoedU
         rY1w==
X-Forwarded-Encrypted: i=1; AJvYcCX2c05b5Li7LlkGUPIT2zELngIyrkV4oQ3yc2HgJYxYJWcaUxf/UnKbCaIie2rJZsiZieyBXMUAPGbZCDxGaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/OU2qQnvdjyhnT/18GfhXUcaa+4itRyy9BerDLYpl45a0Zy5J
	vsflhJDbdl7oxWEaIH12hQbYU+et6CPnF3a2+qiyU52+evvsFa0BBza6QME389JGkGMOQKTwDFy
	AohPQo/pAs9+kG3YtVVe9/q1f0k2hnFo=
X-Gm-Gg: ASbGncsEDtWkWUM8mm0Vj1c4f/PIfv5K7ysXgzfzurSh5Z/ysXeL3gC36LZ5ytGO4Pr
	TmTjrvM7xiYugFN448dNea5RgI7ktdbEkqqrcTB3L9rlM0vQqOcMceaY9JY4THGhmk+9wnuD4DB
	wnEHqUGdryHlbeMtoaY6I57UHdOLmagCyKVA5W0aN5rnPJqTqZEa4I8224gvaqb6BQX/IahGlzy
	SH+G6njRiP8/YURt8WHaMSjjswIYaW6Eokh+kSXOlQh7i264PVqFCABvnSu1bxSKp6iaRX0dp1x
	BfN9vnyn89NKy6YvmxUHczLQiJnSvjBBc7Cx
X-Google-Smtp-Source: AGHT+IE/M5n7k5EV9oBMoTKSdZYNJ8k/u28SAzpBTSTXvI/1sciYsCvywr3oY6EDALdphOvsgrpqPOmhVakNTvvKCsI=
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr70599375ad.6.1758448758376; Sun, 21 Sep 2025
 02:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com> <2025092157-pauper-snap-aad1@gregkh>
In-Reply-To: <2025092157-pauper-snap-aad1@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 11:59:05 +0200
X-Gm-Features: AS18NWAX2coIcjtRAeKTjf4CFDI4YK6EYgm8hWO5NK1pOl2WGGAfjpcS8VVdy_0
Message-ID: <CANiq72mk1-Ew11RB0kfep5BtB8M_5H6o_Rb2MwamrZd-FmzFWA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Yury Norov <yury.norov@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2025 at 11:36=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> And where does this allow us to define things like BIT(2) for values?
> (ok, that's kind of not the point of this patch series, but it will come
> up over time...)

We have the `bits` module since 6.17:

    https://rust.docs.kernel.org/kernel/bits/index.html

(Or do you mean something else?)

Cheers,
Miguel
