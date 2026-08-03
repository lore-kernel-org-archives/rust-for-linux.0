Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBA038422F
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 06:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737158; cv=pass; b=O03fecMpfrggc085nhMJ3VjZIFPimLLxnA2BzijyfNcNVMcuDDWhjJVzvzJ6a74lUSGpviG+pfuOMi2gW+1TI8sb55I5DgndU9LaGMH50fSGlR6hqOvMpkqvnsqt/tx9xC0/Erm5tG495CldGiPk/xOCEjLQXaJz+UQ19wHRqr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737158; c=relaxed/simple;
	bh=cbMsgIAsr92sZqOpPBreS3pSOjHnikg/aVfv1zZirv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSKRtwNuXLtB11VWBV7ggnvyeX9OMJ/H9M8I7MBQ4VAb7hd6xUNFGWwsr8uf2BgFnM8eITjYfkSE7Xfh8vSVQ2or/Vb4MbtptDLXPgcyjqiGRL4aGFKC9t8XjeNdAnEpXJPUUdWH1iNMfl1sCWuEje2/e471A5NZgOChUBT+UKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvSQdEvU; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvSQdEvU"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8612812170so94327a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Aug 2026 23:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785737156; cv=none;
        d=google.com; s=arc-20260327;
        b=idRb8AkgVUf6p1bnW8XsZB1Ad7nrc9/L7KOa3ti3V8YoSKZgvNRdYRQPZLngfDb0h2
         tmQrqXIJ4D4fCEw+XoLFFWLP4pkA5nzVTZwrq+s27RTMTsg25KjAXxacqyNjaoOEZMCP
         QUtB+qdzJXc81rS6Dqc27wwb6j8jPGD9v2PpqH/OZ4OeyR9MFjf7n1FD/wuss9O1IKxp
         0GIsuUU78UR01qsjBt9rjkbQvgreK5gA6gGk3OPV1vxPrgQEju+bQUKDjNG/T7wWUqrz
         5CovP10sNsOS6ooJ3HYtNYR4kO8O8WDAe+Q9tMQcZXhaEq7XLQT6vK9knaknuru3ETzQ
         OYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cbMsgIAsr92sZqOpPBreS3pSOjHnikg/aVfv1zZirv0=;
        fh=YrtJyVmICUdot4CqIz9kHnJtPpp3hO8sS6wbB0RYWlI=;
        b=i7xpcfbdLgYhQGwwxkNBEDd/CQp0S1IDqLlMruc9jyzC/wLtPeAnSuxqrefJuHRCgX
         AlfduFbC2rCcikKVBqoUyLSu5AZYETy5h/JMpqaZk1F/sJ7rkRP8+vWjDm7WtT/HuXBc
         V3gS1VcGrr09AvEJnAGYhxnTCJ9q4gPgtz0DK0e+BYOccaek0XjoRZ0ZDwUCOOPnSDX2
         aK+z1vorBmr38WH7UEBYxJB+m4WkCVpIadYNn4vXvud2M1F4ilDl0pEC6Cv+7K7viZEt
         8YczegGKvcvK+Zk8uGxQ7jU+6a8SLZ58AW8dj2Z2tMyHPvvz2WALSUjVAwTwY+VflEdP
         +4vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785737156; x=1786341956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cbMsgIAsr92sZqOpPBreS3pSOjHnikg/aVfv1zZirv0=;
        b=lvSQdEvU11yJ0Ey3f11qVOBcyjR3bvIQ9Tj11UVoKVXlOthUx2LII+HTarMqTMBQ6l
         kGBC5V1FMz6KYLnKf0s37iP4YQvY4XDUzJMz/Cnlk+63IlXevtejBbwJBCJaI/usfMoU
         S7wX4MCgOWI8IKYXE+ieCnrsOXhCfu5TiswKiFHqwIRK1/TrLm4zX4eQ0Vvv0WT0TGHg
         jwQeL671Q9PODToOQTq0WgICbbOFe8SuvU39SYKa0cedOdgpbQVdDGpHHVGQz5iyxZlG
         44NdyMhiTOqLRyPjPdWP+XPwasiqjZE/oaF1o4GgtYhQSsddhuzp76VQ+ESxx9fdMlas
         Ba4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737156; x=1786341956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbMsgIAsr92sZqOpPBreS3pSOjHnikg/aVfv1zZirv0=;
        b=W5bQVqspA+AOBA/OSnho6DD5VoRUcSbR1D8VIxkmveKzqWStTeHo2opvsQeWn7Qc/F
         0PimxnFVtvhFtA53gXOfzxRFtElU8fiJrHFfNGZ1v0VbTmjh04sEHbtc3cLty8pA6Miy
         pKNLaVGhZDFOv5Yf7qbTghCT67Xvo6sRlqWOLhogzwgvzpypk6zBGrXbZbiwyjpSsCEJ
         pymVpG9xIQ/2LK8ie2nCatg2Qr7koP6Mreh8B17TOxq7H3yoFZettPgqhGDlMNwambjv
         wxeYJ4JEE3bwQOK1kKmdagJ/qaZSwl1Yuz8oQdqxzok5l0Yh0oIgf1azxUYnq5rnBu60
         aBvg==
X-Forwarded-Encrypted: i=1; AHgh+RodkPexz1Qr6NAZnL3XVYIMwJxjOs1/3vQwcCDFigKQeYyTUEWSOeA5dpa/Ir0yWh1S/LMpKkD5c59XSNLFZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkADTKDXe8X5iwQk6nb0zMYg+JZfT4gEo0qzfozd6IEdOEsE7U
	XdTgCZz1Gpv1REs8y2UCo0M9ksUddcXGemBUcPbW8CayBrbl2UV8uVDOgvS7oVrZhqWaFsYKti3
	aXQ7MnuxX7S66lZg/kQY5mbIRxxDxqzA=
X-Gm-Gg: AR+sD13mqxigqjOJhHZ9sFsSYr2K/xrcehn2MfiVr0U+19SI9ubudKO8U2evV2YJPGw
	hfe1jU4QF6sMn/QY5NtW4RoZXqFVIP05eFZH5g0KvNkTzRref2bz1mu2jKlOxvmg+8K77vUZUPG
	3Qxjy4v6Qpo4LNHkCGOyHgt7rWOBmP2qISYQSdh3Qx4Z6MSmIpAO4pK3tqo9M75wV/405FDq1EE
	/Ozbg1uRTSPPawdKkRGihsqTw6cLBF/1HfJ1KAS4+ZfWEQKcURzEVlPegZk7nXDHiWk59sRVYqZ
	vAFmj62hnCoqsXgs4K184fJSSsKyIx2QXvA9taFA9myIuDzrAtawf183CRsCjT7X3nzPuijC/cm
	2bITBCP6xZ8andhB9J/VQGyiZYGN6cqm3qafKkPIkgumSVE9OZPnofQud4/D/
X-Received: by 2002:a17:903:2f8d:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d052064a84mr115305335ad.0.1785737156031; Sun, 02 Aug 2026
 23:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-docs-printk-rustdoc-link-v1-1-892074948f75@younes.io>
In-Reply-To: <20260717-docs-printk-rustdoc-link-v1-1-892074948f75@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 08:05:43 +0200
X-Gm-Features: AUfX_my6SMEVCiRbdTXLMz9z8ulXVonCWjrCgyOb9Ds9jSmFk8iIQkXSzFIxD-w
Message-ID: <CANiq72nWvP1mRN8=6dxQP4yYC1foSJzXOLXN=Bw4nC3sFbeizw@mail.gmail.com>
Subject: Re: [PATCH] rust: print: fix broken `_printk` Rustdoc link
To: git@younes.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 1:44=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> From: Younes Akhouayri <git@younes.io>
>
> The Rustdoc link for `_printk` points to `include/linux/_printk.h`,
> which does not exist. Point it to `include/linux/printk.h`, where
> `_printk` is declared.
>
> Fixes: 247b365dc8dc ("rust: add `kernel` crate")
> Signed-off-by: Younes Akhouayri <git@younes.io>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
