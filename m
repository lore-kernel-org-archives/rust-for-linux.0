Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913EB1DDC08
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Oct 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761396304; cv=none; b=NUP0yr8J76mmFDR2gP/eZ8zs26tZIir9yXTGb/uyRhOMoSN7R/bzWAmQDvSEqg5XeIfmMODfxjkTyvvh6jqRC2LBGqANdKtJVYV7zxSzcoLFqnWPsGevmd61yq5r1r8GWio2YGB5q5bSknAqqumMFyBZqF0UPskAUKJuZ3HM/uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761396304; c=relaxed/simple;
	bh=C7RCMPYJxiHbIff6uyGxXLWmOareJd5pab4+KHZQmA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccRMJagD9Uk1hocDDRxNTc1BpBkvS5l+cEqnCpDn+f2YdwlUNJd67idPF3GPv2jzvIVBC/ZDeutZxwhmei3n34gPOroVjSR0Ht2aE4cbvKKB5zcsJoB+II5HKqYqkRXalOFpnPudp7bR9kYltlhCGoZxz/2Ddrw1FGDcGfMazFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKI9Hrav; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKI9Hrav"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290aaff26c1so7336575ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Oct 2025 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761396303; x=1762001103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7RCMPYJxiHbIff6uyGxXLWmOareJd5pab4+KHZQmA0=;
        b=QKI9HravYuYwQwLhsLKCL/dtmWKTJGul9bgAzNPvQrM/7AA4dcM/TtsWIsMDQFi29u
         2b9c3DPlRrA4NCfp0gARe2ghRnyoum/ZtV5UHHXMKF+K9wyntg1GfzCgFQUoPTeJoypL
         rpKkVGPOTNuvUj4bHVdt1MT5SN/R1wH6TA07kPTqKL/+ElyLA9fDpYul1jvox6DZADlR
         dOn46Qajidb96sNRuhLmWaaQZNlObM3jCG3mdatsRLJvczrPN6lfzizk/Kkphf1Wolt8
         qjjuWJkaX7IpqP7qqKWZLhyNBeb/QV/1dyLnfLzFtECdzK3w9B84CTKYDS/C2YpRhJ79
         dUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761396303; x=1762001103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7RCMPYJxiHbIff6uyGxXLWmOareJd5pab4+KHZQmA0=;
        b=KXQ4ux0ogBJ1q5nEbrg6zRtU9ogHj0b69eu+9H5yxvPKHPIIw4U1QlowCLtv1e8S/Q
         JL0UPKG+M1c6ruuY7Yzd6GR4R4rUlQ/2oK8YxU0vOoj1qSvQf/+I59wDi1PZJEIt1kta
         2ZF8hN8P0ff+ZW543jLDh6vPHPQulgPb97HdENJfJQnLCkF1ORoKqqpcD+E3dVCtaI27
         zoUr8r/cikvmhUSt5YIpDBMT0d/o05ECHjCKInPZyH32TM4MqrmibszI6dR/rumVfFWY
         Xs9bsclSn7n2049z+i3zeM7xHOLquQ86dQ5vucg8XUJiduQyxijHArkasKJk1DGfBq8g
         dBPA==
X-Forwarded-Encrypted: i=1; AJvYcCW0UNWoBLciKWYN0GOeI3Sf1uIT1954qN12k24b1rv1sAbrAq6c3+u0MFXQJXZPgUGhnkivnMQ3EyLJdvY/Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylVqcjMX0Np7UAebcQrrqu5+7/4cIiXOQwNAzOQO9nqBdFKXka
	IZq4IHS/pE12vofLhGbUhdjVlRaJEjRgY+27hQBOjYWxby5T3B0rWjDbGnViPeufEVzmb2PFRZg
	zHUdeKJ+ne86+BXhFttwEn2fnalHyXVc=
X-Gm-Gg: ASbGnctMsD89TgLCB+77+ET8OUq2Vq8VWvzgWsgEQrMbvY1dUEl61Ooz3NvXABYs2Yo
	Xe2jPhVJbxgqybXYSefdt1xW/lRE7AjwG+zu9derJ8aP5Rlzu4IPiB23RxgJgxkkyhJptBE2BIM
	xA3pY2hko0fImuZJkDMK/pBwIsxzsAmZPbJIDGYoglQWE3P+0Qu99Zo3b9MH9JkZefmx70VMFPE
	f37C2xP6WBCmcjB9Ma1Kp4MIUPeSBVrBFMZqmb2mRU+dDj43pFbSBQb2ortppkPjOK/57Ms1OTH
	/JXd2VA2a/w/IDPOiNw5T4e5SrguZP3SIEurqCxuqBP+t9KFgydgusQDnnYXfzwx0I03VFHp/E8
	WP8Zudmeq0qpImg==
X-Google-Smtp-Source: AGHT+IFnwtuPM1t4cSFlyMdWfosAkAQDsFe7ldATnnuYeEiyjQeUZlc+gbfwi5fU05sJQRiLpWnjw94QHjb7v+hqPPU=
X-Received: by 2002:a17:903:1212:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-292d3fb7f7dmr114055105ad.6.1761396302912; Sat, 25 Oct 2025
 05:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251025124218.33951-1-sunyizhe@fastmail.com>
In-Reply-To: <20251025124218.33951-1-sunyizhe@fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Oct 2025 14:44:49 +0200
X-Gm-Features: AWmQ_bnwo3M8FN9w1gVNfQEyRU5EK1H9Fv1DoP63Bar4frG5RXkcOVmvftK9y80
Message-ID: <CANiq72=d0zXWAryVXHUKLUkcM_dPoC_uPM2drMXAVB7kh1YSjg@mail.gmail.com>
Subject: Re: [PATCH] rust: phy: replace `MaybeUninit::zeroed().assume_init()`
 with `pin_init::zeroed()`
To: Yizhe Sun <sunyizhe@fastmail.com>
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	tmgross@umich.edu, netdev@vger.kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 2:43=E2=80=AFPM Yizhe Sun <sunyizhe@fastmail.com> w=
rote:
>
> From: Benno Lossin <lossin@kernel.org>

This looks wrong -- is the Git commit under his authorship?

Thanks!

Cheers,
Miguel
