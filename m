Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1D346E4A
	for <rust-for-linux@vger.kernel.org>; Thu, 14 May 2026 21:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794858; cv=pass; b=VIEBxV1uBLeEggRp4nX6sCHGTNi7z4Dx9KRoZp8moZZmD0AsdX9P+0YGQhw5VMf1VwckYtnaU9otCi0FLM+j4cq3pcxmUI6BSQP4CsIad1N+s2TPRw8EYilaYKi/49M2g9JrjQmNaajzzfxnvtwg5+Ctw64kZDr/bJLx8VIlI6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794858; c=relaxed/simple;
	bh=4QdhMJYjhQSQrGnhQ/y5tMkKIuBDrBFvbElSNQ7NqaY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=daasVV2s/eqwipldSBlD9WX7RMR2l2Px+bs4xz4jWgqvqQ+lt0zkKvtXjWEYaJEE4H8M8N9nD+IjtCzY7KJCLoIoLklrpNZQGwFcMgHKdGHkyjdkkIXPp9iUMZ6L5cHMhwcQ+P8EXmMpoq5rcfsB9M7CI53otA8DLelbdCS3kus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/Jjg/VR; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/Jjg/VR"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f1b00a75ffso575447eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 14 May 2026 14:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778794857; cv=none;
        d=google.com; s=arc-20240605;
        b=Gsj7KYRBoZ1jPi554AnsSFPO7tbMH6tQXXDEK72TLLzFaK7/BYNMikkkTn53oVRjIm
         lAwV+zk4mMBDjHvCf8HaUnr3hkJK+/PN/cgtUx8/dIg5lFazetWTwe7Iu+b2SdawMHEl
         Pib7PEiWWEQ3D1ggFtqWLzncHEs+gkdV5eaSEoc4hahexpc6Qm2MBvc6oVcdxTDWlLVY
         Wttbdl8Bv7eO9DbO4Zczb1z0hJD4LuLMB4dqqpxkaVB5QMqCx9Zl4d+pc0oDWJxMwf7q
         GuTpLGK1vfh5xcw0q0LqsLyDIYB3TZz5wAr5knEUoBKmjDt0IP1r4+WAueuvbnrO8sCR
         RNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7ALtIhXEfZ4FmbESY8q+CAsUDlaQF5zLuOJIcavh7Wo=;
        fh=ZRZB+9TyAZKLFnwK3MRN/RX4AUCEoFBrdnYS8eK+J7s=;
        b=IRzR7lO/DG0ilkO0QOWcWOufJ0pCrLoL9Xifrs7oXEMcYYkKeg5H3pg9XeVuUEl83b
         fQZFydyxwKw7ySoezr3ebBCjDuCt28PkXMZHyoASNP++OaYiJnni1BcdE4RU+bcr7LzJ
         KoHNHdF79xvNvpQkaO+ouk9NHv+KCOne3gmgLSLaoovDezWIQnCgAWlF/Pfa1a3xlUlB
         IxIeTiq6HPxXxzCXJ3OO60Nluau2QxLhv8dJ38GW6LTDPP/liDEqhwJ/dBDckbYe9XIb
         ANCLNqIAX1TkZEGzn3Agq4hLQ9jyJRUNtZGXKOfZFCz5Z2nGF/bObS2DcCbjmKxV7Dd0
         SG4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778794857; x=1779399657; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ALtIhXEfZ4FmbESY8q+CAsUDlaQF5zLuOJIcavh7Wo=;
        b=M/Jjg/VRAC1TSeUe+ICCsTh1nn1IZuTgcxjQQWuJff+K6dDM2Fsavi61d8I5su8D4G
         pOE33BXaAnN/snk9hzhoWZ4lAER009IDCRtwLqGo9+pdKQjApTH4HE7ltuq9XsmB9S1O
         8j5JsdMoWjGij5rary3xh+fuBtoCiHiqgPWhLC06XRsqnXLsFoRClLoO/J5X6g08DISI
         XgTXDh23lJqYn8J0xd5f5zBRPV6pPtqN5SWMaimbnvAeU1Vf9+5U6RFKbOJnV0ajS8/X
         +W/yqyP4N6opyDREJNMeyVqIZBI49o6itRfNR0zRKC6i/SVXjRet1odD7F4EIXvSOruw
         IaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778794857; x=1779399657;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ALtIhXEfZ4FmbESY8q+CAsUDlaQF5zLuOJIcavh7Wo=;
        b=pdEnqdb3Vdv+o9sTcozhA5Z13vvb5oil69eGaPbgmMMq6ZyCzUMXaQhUCA5s00cmmA
         6eAaIHCnzLDahpqoiIJLRrWl+hmCrO0aGqGii6ri1G0D+pNDmQSTTWVX7zIubukyJEQP
         FwQPG5r2QrDbvdafDaRs8jj1K6rTl+X8scgXlaKuqe6bRJWKMDqijUce7RhjggeBAE6S
         eUCBkG9WGQ2h8QBcYSnuYDnczGkJKBaWAuS2Z+r9UZIIeUF1YbtX/1xRD/V59vmD6EBn
         Vg29rYiK1KQ9iI84uxOAzzeWHPVo+I9Evu97qmpPIQ5Jqr002JxhxwiqSBKW8e/NJW6Z
         sjtw==
X-Gm-Message-State: AOJu0Yx/foLK+ybK54EilKjUztBSXn7+72rj+wwZEqN+YaCJ0uZhrYAp
	4B8c9WLTm02LT+Kt5UmyXihiAx3h4hSPpuo+uTrZwg3qxofpfBc3xBbJCuKb2cncOwc+Hcg5LQq
	TJ44aUFmP2H6LMfzZ4zz6k0ACD12FNZ/ibmf/B98=
X-Gm-Gg: Acq92OF6IXD6APUBsXPNkjvMa963hmDEFoTuOUP2ScHbbizGEq+9s8ljxP4trjFIZxP
	k2fzloOeUeebh9fBZZYnWLxAFQMNG7TSWm7A19AwZfR4pX18dUTKLlJcTX8wyKDgi+v5gKFzlWs
	bw/owXtMnhc69wxx3N8ELo1obdjfQldvqohgVqVUkBdB2Cajhz9ZsnZQJluywTjx9X/zTRFykEJ
	dnCp0SG+QLm/L9ZItvsc8dxt4nQvDNIBh8DeMj75iRQDb+SUB+aQdy61fMwWilE+EWi29ErAGTn
	gZ51V/W/hRHNRxoJ+3PIluy/sGr5wUwbEiWZdSWK2Ik76SGja4j5SjxL+jFUdcKO8uYTjxK+DhM
	b+CqVSmI9K0qTTA7KKfGSRppVIBiJaAXGuQ==
X-Received: by 2002:a05:7301:169a:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-303986749c8mr267031eec.7.1778794856796; Thu, 14 May 2026
 14:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 May 2026 23:40:42 +0200
X-Gm-Features: AVHnY4K85fvNa3fnHS_oJ8bDbV8wK2Gf8MjebymOt6y99WKM23HUnK4P_PlZTLM
Message-ID: <CANiq72k_TgVdAEAQUmOSGg6NNQ_AatJjhLV49s8VaQLsbSxBGA@mail.gmail.com>
Subject: Rust MC at LPC 2026
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

The Rust Microconference for the Linux Plumbers Conference 2026 has
been accepted!

  https://lpc.events/event/20/sessions/257/

Proposals can already be submitted at:

  https://lpc.events/event/20/abstracts/

To do so, please scroll down, click the "Submit new abstract" button
and choose "Track: Rust MC". For possible topics and requirements,
please see the description of the MC in the first link above.

Cheers,
Miguel
