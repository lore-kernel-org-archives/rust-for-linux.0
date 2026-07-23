Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA0437453
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784816796; cv=pass; b=Ig5D0MJOk5SxPu2JGf+lOsjZN7to60XNIP1TLzG3ZwMYUdcpgViVPxKaNxyppSU0G+TOxfNPAICrgAr/XzcSfQarQLdW+cnPYn/e0LS/BbnD3hdNxbzRnKqo18A2FA0eQ/sBb6adBEAMdu2W199+W9VAZeepnpne8rJh/IX2Yhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784816796; c=relaxed/simple;
	bh=HFR59tIBTFoB6uBOuyvmyPFCSZitnnuxdNVCda5iE0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tX3zRtmazwPqAWzyCPU1iy0yq0dVnVzOvtEevRoeSuUonidsRg7eQ64zic0ThpQ5sWh7rNhsPbzpp613QF+J9+TFCaH6k/RDy7quhRihrAPn6//MpCxOloyXiFCyXh31qQIGnVL2j/9AU1dA1MCp0GOZ12Rhq3SHeMj0vimBiE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrww8Wvl; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrww8Wvl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf110997efso2052745ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 07:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784816794; cv=none;
        d=google.com; s=arc-20260327;
        b=p1QhAQmntvt3u1F7J5Fai/AxvkIL3ZOF/tjHPZU2Qv53ZDXAXeajDEPxscT+vClj7c
         nd8GBOBEQW2vmK9+ytjAuZSSt9C5DLt4SBM5PBn/UtGxYoD+po3t9yeQtJi2YXCjfTfq
         f8e6V4a3hJTXc7RrubCVtTZuoBh1q1YvvEj3sU+XG/xXPr6RUZqJUk+4iHhPseOnrdRo
         ip1TVnv0X4275QRvs3JEVIvwjwl1y9mMJFOPu6Dj3cYUAYkVbfpmbC40GdAoXeh044M4
         LpmySA+J182euvQRkyohlikuY0YRf0EtSsiZ2E9yH9aof2pDkAFL+L/nGn4NuWG/hWZb
         PWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HFR59tIBTFoB6uBOuyvmyPFCSZitnnuxdNVCda5iE0o=;
        fh=ZRZB+9TyAZKLFnwK3MRN/RX4AUCEoFBrdnYS8eK+J7s=;
        b=Pcw9lrIXT4mmkFyevgGudoJLIZgNPU21dkDPEb3snhA+nfacmnKKigPDc32iNOuYwp
         hv4ZynYfIYPNVPHLXfwgM3Hw15RwHKyrrNVHDenjcrYq5ciqhcyxdFt9qwjcwmLtCnbF
         nupBXendqDp2ZKWlkFkn9k7z0IibVz7uWDDFbfo4v61iX84p1weoPWKP0lmyCs6MJDi+
         JCT86BmTqgoKPbYOc+vpH/eu89VSvkqUmzoSlyy03l09+Ksr3Og2eUxOm35y9X000g2l
         xjozvKsWfSiZFT7mN0mYXQ8q43ejOf13aiNooHoV3tMDjfvQETpsCB4DsCWT5X1CR1Oc
         T1tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784816794; x=1785421594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFR59tIBTFoB6uBOuyvmyPFCSZitnnuxdNVCda5iE0o=;
        b=mrww8Wvl9l+ocItc+5rkMXTMWyBV1R7B09HLdLFFUHTYBYtjwKECw10tu2JOkCq2rs
         L1Ui8Emhdws+TE+2aqJT59xQOXCwIT75FFTyYWL7LnEW+I6Bg4fBrXvG0PoefAkwS88P
         vF+fsFkXdEeS4VJoOMa1fA/Bx9MkOWSURPE4NKRaUIx/d8nOhJmY+xvE01HGnqpz1vjZ
         eW+UeF0c8iEAHkW76l2WoNLZCzSG+Nx0VjOLGjRxUhViibjRfN8ZrWJzlpbbCeKQHX4M
         cVx/ZJEzg64gp5vLXwp2D62l/Kz05VP8GaZQI4IQNZ8gDuSsX1G/jRzGbHZ0xoDsUVCs
         aD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784816794; x=1785421594;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFR59tIBTFoB6uBOuyvmyPFCSZitnnuxdNVCda5iE0o=;
        b=LZE0YdXBfnpdzJw/oTk93LTeuhAnLDOOyw4DkvKSPlzdC7rrjxC5GZij2sv7igIixC
         o1wqwJx/ns+vJFYeC0IyDGHOJ6Ng7oDcInprcaGc0cQjbgHe+OqDw3ETR3cdV2/bq8+y
         k/PbyhCnrDWkWR1maxZXSlN8Mc9vZlEyMNkQ1wVTFE3JJKb/3kH1aejaYf2Oge9LtSfh
         9eY5F4VZkKxCzBlz+/T/X7zLYMyBOhoFM87z+BUraQW0aQqaGLttXhMu4OyzMkt3nqlt
         dK6IHuM9UZ2XWNGUD6uGULAKSsgY4fmmdMt1eVlb0HtpU5jN5meqRXpNW3wkwZEHoqK7
         xtMQ==
X-Gm-Message-State: AOJu0Ywtv8UTMaLfWy5AoN7NExF+g2/WKmaIRLm5pYiiVUuN+4A6kisz
	yoH5SaTLwubJ1zgKwE5Sd1tkPuPTagEKkcyCgY1IW2R6NCEO6ACgE1rwafpFLRr1FvZVIAQeUH5
	N1uJEqisDkyT39JfoiDAM8Rs2r/OFBbpwmyUKi7o=
X-Gm-Gg: AR+sD129cwkTmJZbitfRqMO0IeLPyHm+X+D+qydSspV+OJlFX4Q37psui03xrybQIHC
	n5CETHHRL75yR7ZhWl2/H+5qxZRhi4jrXP0XifHYJ3taGdjj++qRLHDDup5tp+GLgSmv/peNd13
	t4QV6yBhsEx2wGe+WVkeLFU8WMpb1sloXiFMYoz83HLVIrFdAaeIGlUjvixIJvJk5VdcMhG+HR9
	2BLKbgmGDuEJCIjdfArXjZgTPa05GDd+qB5mnw0ac1781NOhl9TeI2JylmLUprLAYBMWMXSbI7G
	jbTqEHJYxiwx2nA671/UVow/JGC/9ZsTT9MBVRnutrgxSskjMmaTZsSojTiv5PrBK6pg84Ucol3
	k2Q==
X-Received: by 2002:a17:902:db0c:b0:2ca:11ee:b002 with SMTP id
 d9443c01a7336-2cfa6c86c08mr32127095ad.5.1784816794362; Thu, 23 Jul 2026
 07:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72k_TgVdAEAQUmOSGg6NNQ_AatJjhLV49s8VaQLsbSxBGA@mail.gmail.com>
 <CANiq72mmw39gNTOv_pJc0VyWEQXsZwC0c+Nd0FEtG16HQ58Mog@mail.gmail.com> <CANiq72m2EA5mg8wAP0Qx_i6dGCN-=a8mvM9qjf2UG1SLZOthkg@mail.gmail.com>
In-Reply-To: <CANiq72m2EA5mg8wAP0Qx_i6dGCN-=a8mvM9qjf2UG1SLZOthkg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jul 2026 16:26:20 +0200
X-Gm-Features: AUfX_myZBpMAFauu-qMsKQR0U2c3Vekj2-bwjwpLtNwcEDCdl5K8l2ISaBfV3Iw
Message-ID: <CANiq72nGQwGqoTka0TwA+aCG21bmUa=htqxfJcu6m6hugXnfNQ@mail.gmail.com>
Subject: Re: Rust MC at LPC 2026
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 6:12=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> **Last reminder** to submit something early enough for the LPC
> pre-registration on **July 10th**.

It is the **last day to pre-register**, for those that submitted
something before the deadline.

Tomorrow general registration opens for everyone.

https://lpc.events/blog/current/index.php/2026/04/06/changes-to-registratio=
n-availability-for-2026/

Cheers,
Miguel
