Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24042F2F
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Aug 2024 05:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724477569; cv=none; b=MkYX3MYOBojz08nyczg98JZDYACRq4peiF52K+Vs/OLrZC3WKSC3V1mLTlyHoZCMTIfyJd5MNKwNOlcV7Wx24GJK5eKczijldI3TbxGqlsvTUV2Tiqh9uzyrvwzgOPiPrlGy9eS8DC2vO3YEXC06WZRpnhOGZKt4H8rJt7VYFao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724477569; c=relaxed/simple;
	bh=Cvw1K4vQwHce68PQHEUY32CPqLH+/gHJ1jF4cQ7qxNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hT+Y+vLOTeqchumKGAeWBTyoPKorGJg1R6CLny6n/CAmY5ddRq0JImKyfBH3xc13SCVARgEEw/Pq7mJIlxqjbenocpzojOGNHqGhNx+dbEJhydqfgz+/wTwimrk8dv8EgnK/AFA6oGW2dd2ND0gWpomUT3MgbSTEwlpW++XHQfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=ojDwj3WG; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ojDwj3WG"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6b8f13f28fbso23217827b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 22:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724477565; x=1725082365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2YU53Qa28Il1Dv/pHeK75LfNR6pv6rnLC0NS995GjQ=;
        b=ojDwj3WGvEZFMBLC8+vkS08EVJPTK8xJnOJ1eccDDo/34Y5IWdPe0b9BUQjv1XUXAf
         /l/hI6Lh2k0F1x5L5xp925SRvEjQfK0U1wuOmXSsQofO9S/G/ke3amrOD2b8pvnzHl/a
         3aCgcY0owzG1o2lwgz7yEe0lMN0r4prMxfDNl9cDBhtE0xqy2rjUZFixkJpflocX+JDe
         X6w8Fg9N7s+kzzS9Minsd6W5pgGQT7KmSRoHigfB+n0JGFkPf4KOttS4V5tlZxepoGoN
         +sk0EV1SuCphtXPZ/etoXnVvTurLPblGH9YoyQ4iM1Cw/MNxXInxUWBobAYV98Typ9TQ
         /42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724477565; x=1725082365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2YU53Qa28Il1Dv/pHeK75LfNR6pv6rnLC0NS995GjQ=;
        b=FXAXDaKo8UO9rurqJk+IC6Dk4PDG+w0+LupUxUkSg7TK6lGV5leDXOC18GQvn7b28k
         mNQCsAEDNOoSdgueLbfkG2VMXeA9UVwVT4hb+6GE5ZaGWDwlxcakyicGlSrxRbjBVVc+
         62yKjb/t5iwllBhJOor5Q0/uGshYN2JEjBij8PPvcHYPK2jbSzJxkJFOAOtGoTKIs8jN
         vrjSJlx6Oi4p/yGZjiNHxbIQBylJA2TtfuGU42yPT8DoNgoRZ97TYCFvYMBETCe4Sebq
         FEBEdRTpOTioaZwDL/4YDAdpxeUPMkoHnokeKe7Pf4mK/ACLLJJo7w5cKQezI6pk+rfO
         IRFg==
X-Forwarded-Encrypted: i=1; AJvYcCVVggRDtWvQvB5plJkoLlyp3yLaewocA+ykus1uaig2mBEQRVPgDV56JJvhj4mW8oAHQICu7izVDHvrcT5bLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SSkx2y53EgWCgTgSvH20CfHH9WDpkPrbzN2xQ6FX6jM1VtjM
	rAd0mEOcFAQYLYa4y1u3WM6L4dVeMC2s0FnurgQyz9T73QD8VIprYWEn2oApBS3rdQ/AqxNu12N
	xc+OA1Vv8LI9Nj4dHkZlbuIXsXkSJDEJtH5wseA==
X-Google-Smtp-Source: AGHT+IHxhrVJ1SFncjf+cy1obp0h6/s+XJHGdllJP3Yr5Hemw8ZgH+v7gC0O9jo3J1BfQZvJGQGVLtjAsCrtPkthXxI=
X-Received: by 2002:a05:690c:6611:b0:6bd:8b0a:98b2 with SMTP id
 00721157ae682-6c62538d701mr58172557b3.5.1724477565626; Fri, 23 Aug 2024
 22:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824020617.113828-1-fujita.tomonori@gmail.com> <20240824020617.113828-7-fujita.tomonori@gmail.com>
In-Reply-To: <20240824020617.113828-7-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 24 Aug 2024 00:32:34 -0500
Message-ID: <CALNs47tiPK-TWX8w9abdam=WJBGari3prYCiXZtWHdtgmGzHDA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 6/6] net: phy: add Applied Micro QT2025 PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 9:08=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This driver supports Applied Micro Circuits Corporation QT2025 PHY,
> based on a driver for Tehuti Networks TN40xx chips.
> [...]
> +APPLIED MICRO QT2025 PHY DRIVER
> +M:     FUJITA Tomonori <fujita.tomonori@gmail.com>
> +R:     Trevor Gross <tmgross@umich.edu>

Ack (discussed offline)

> +L:     netdev@vger.kernel.org
> +L:     rust-for-linux@vger.kernel.org
> +S:     Maintained
> +F:     drivers/net/phy/qt2025.rs

> diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
> new file mode 100644
> index 000000000000..28d8981f410b
> --- /dev/null
> +++ b/drivers/net/phy/qt2025.rs
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) Tehuti Networks Ltd.
> +// Copyright (C) 2024 FUJITA Tomonori <fujita.tomonori@gmail.com>
> +
> +//! Applied Micro Circuits Corporation QT2025 PHY driver
> +//!
> +//! This driver is based on the vendor driver `QT2025_phy.c`. This sourc=
e
> +//! and firmware can be downloaded on the EN-9320SFP+ support site.
> +//!
> +//! The QT2025 PHY integrates an Intel 8051 micro-controller.

I think the current state of this driver looks pretty good. Thanks for
working on this Tomo.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
