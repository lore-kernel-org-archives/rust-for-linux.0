Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9A224244
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177956; cv=pass; b=ukLKzJVH2DZFNg8FoA7PZGDBvyecUBmHEgTtq32E/AjFleYV2QMvDh9I9VA1UCBr37lqgAOzzEKnfSd9WOU6fhnZ2FC1S5xnYyOvB06dcZ+gH0vUPaCFXqIf0qwQ8y1H6W45hnX8qRgSJ+qrBPwvH+rruYr2WKHC2ifnhGR84/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177956; c=relaxed/simple;
	bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lA4iFlT0tkMX0p6NFf9oEKD/giSnRmfrFoZxBCcMz8zj3xvnNAdUaKQ8/L2YQFuT4o5ZWnIWTxPfNEhXR+Gt3ER+T7Sw8zQKQeNBtT/QQmXYBC1MigCumOtJBv9vUDBM3icspUftGT6BRnPBybJCK2iR7jo4rbVAMbY73CnYq0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWcVQFqe; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWcVQFqe"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ae5283dae8so128574eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 06:19:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769177954; cv=none;
        d=google.com; s=arc-20240605;
        b=UOTMxRreSNAYZglWnMxi9ErbchW72YF2mKckS8LNuV9lJf1P499SLrvY9SLdqhT5OM
         ziklzPTv0qhwxClRYaDWAIeNt8VtpBITLVWCqQpR8FVyTPodMXMR4uLJ7+mkkm5U0R4t
         1DSGF4/x1Zcun+aI4xeJmV3/+7kjUd3GU8EEORN+iop8J3IwZxr88u/PHQq1PrF4WtgN
         xNID9lj8+Ve4ClmxrX9zo/O5BWwiSdIfKBrBobOHSlNYYLIHB5Yr/i/YSVdrqTLG9JA6
         EwJYh8ufzxsrNe18/rFm8TOtqVZx4g/6/njSDiHDXZY7D6xRzmqvwEeXumA6d7WWkK8q
         Z9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
        fh=GQTH5QcRJ53m4GO8Ok5HKhVHqEdKsW4mkXgnIlbZDao=;
        b=OMTyk2yHe/Y4MwyHtzjAg2VaXeYo25IkWd3ZaipwUe9gEc3g+Zm0SZmk02zKHYdj73
         JW9ikLvJ6qb4AIQ42fzT+JkxwMI6eztlO05NFKDc/vAxZr2Ikxwipxr7Tnv4VgoIzxCq
         Nm84dqkaAXxXqSufGTQdMCQAcBWTxYB5baph4hcWB0DflldoO9//dp1b+rmnUon8ZRt7
         ukPxyCOkz/ZV21KqgVTxvEOXWgI9es7PqGNlZ23NYqGnA7zhJtlnilmvbKpUiHwkArxg
         /Sjt5SF8JgWajvEyIwYuPoG5R782nVjGVXl10I4IgyJ0O9DjUvufbqFdVOQeEq9W36pj
         YC+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769177954; x=1769782754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
        b=PWcVQFqefVM6AvGXmM/cEIW8IQwE7eXgPJfYrZaE2kMQuSYWhal77yDpOWeQ/YkvbY
         /KM3gtNNDW/q9Oedu2yOk94J0+MJp4s2/MX6GBZ5NhXpNdKAItknPXxxo5QtD3P7axua
         Q42hhWAqzOyyTPVRFt/1K8MSeE6GD8Y/eL88EhPZbzEPeUBgwtYJ/waw8RHNEbDtcTzr
         +CGVDK+lMcv3NRMegJyMBh2w/yqZt2wBa2cHSlHFuC3fMyraXewEgrEQJY5f1jVKBXXh
         4uHhB/ssd3bi9SPu/4zyDcZz+wn8RwQC7OFTl5VOW6PXvWb4j/ENzrmVzqIeqjcyGZo0
         hBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769177954; x=1769782754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
        b=tXSSKt32iBrv84EuDzfdVbZUm4zo1pG0JXiGawE2QyelesMw5ihBbQjyIIXAM/PaZj
         vtBNgY4DJe51tpHPpBKacNtaGaeFaaibpVmiA3HnL6vGNfSeCS8jx9dOmp05G5j7cUxA
         O85vs/BnybETlfK0ThfP6zr6RNqhEgZm/gEIdb3OKrVb4TU0CyIBDW2N4Z2sRVua/yb6
         InIDWkMXlLTbAEXrDbrZ3ylmBk4CcHG8jD7k4z83cQE4V3wxE9j66Tb7i/LHce7euQi7
         gIDwj/STAsjSrWwrMppH+Jv7yZbOc4y50stnb+aEDnn7UWf8V7HwAWrimK+4NYPCo0mC
         SzTg==
X-Forwarded-Encrypted: i=1; AJvYcCXHKMGVXkWJuxoufItKBosYhuwDCgt4FQgMPnLeJQ1fg7b4B25r6UDD1nseT6xYwjxlotphUb8SxVAAAJsNjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4TJkEEVhWXFeAaTgEwPfxQbClNndEO7aR1BCrj8gP4vhKmMIK
	EoxccLXSbFklr57/kZ8uQyghYkPuiRK/aToAYIxKMRuZu3jTfexVS9By4bz4I3LSTVABHYMIn0k
	yI05L5CFb+EIiYE4psHhqtmA0Qo8FUjU=
X-Gm-Gg: AZuq6aJ3yeM4GNS1f50Sbi5ADsxplwwoi6vDJpdJYUnmrxOvcyF5GsBzDZqbnIoQsXY
	HkwpTl6im6s9XJvFTkaTu56QCiq3LPYcJ63vB47ckjbAwCcnpC7EsLEFB4gSFaIcOm+QsI58Qld
	64I8LdAjDnF/hZG59bBwiY9Mbyb1/8Ygmd+C1SiOF/Y199u1jQcflPCoNsMnLEXgX78YTQScHtH
	r+jgk1G69SP5EYcNoWg/yEx6dibMOhcvc4dWQ2desogcLQHovFgiAW3KvpGT+oCL0ZLdas8rM9B
	HUBDyGjdBuHs23ha7OmALa4Frpb8S5p78bD/F3d2QzoCapXc3c1auqfrq7vU/k58hOyeWUq3/Fs
	wnYEMxP+uaDUb
X-Received: by 2002:a05:7301:4e0b:b0:2b7:3835:21f0 with SMTP id
 5a478bee46e88-2b73995f4f0mr880908eec.2.1769177953953; Fri, 23 Jan 2026
 06:19:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com> <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
 <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com> <DFV0F28KHNXP.3JU1QGBJCZBUQ@nvidia.com>
In-Reply-To: <DFV0F28KHNXP.3JU1QGBJCZBUQ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 15:19:00 +0100
X-Gm-Features: AZwV_QhNDrz0erAn3-OGI1WooCKBr-7Jq3HMbGGFubBIWd3KYSPpgYNkX9koyGY
Message-ID: <CANiq72ksbD57UDweA8Y5-635fBMcRb-mPnzZtdQ9yv86xUNkCQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 10:29=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Would be interesting to have Miguel/Alice and the core team's opinion
> on this IMHO.

[ Re-replying to this so that it gets saved in the list. ]

This is something that we have discussed back and forth, including
making it way more formal, even using special notation, etc.

Please take a look at Benno=E2=80=99s proposal at:

https://lore.kernel.org/all/20240717221133.459589-1-benno.lossin@proton.me/

(He may have a newer link)

Cheers,
Miguel
