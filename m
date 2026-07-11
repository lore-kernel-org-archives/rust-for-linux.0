Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC0372EE9
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783775382; cv=pass; b=SWVr211h43b0MF58eIrb4UgB/6LCDUBduJrhYa9uHAso5rdFsV0H22cq3JjVTQ3bnVKRrKJz+mjBKiKNnKAmqnyyzzYiUanhXfn5MI9mrFzbnR1QfyBXALt9KYE8d2yC/cB4iePUPSoCxQooWa7LrmChxsarDBNpdVClS4Dk0YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783775382; c=relaxed/simple;
	bh=/2UfdN5Nqu4lM7RXRcLv27MNGfJkbs9IexWElOspdQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAqyU2xw3R8putDB46T2QTkBJmoKtpRewt7wfFQlpkppHadUN83bkTgjZXPrYPMvDVYMuYNphxgjPGAgGU/d/ZZAnN4yNmMpB6Q+8f4kNb53/gmGiq4tEU6vuetx/03BW/imA4vSMbEhKcabOdrCIy50K+HC2psg0HEMzjgkwQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5M1L7Rl; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5M1L7Rl"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dd9c4845dso6761a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 06:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783775381; cv=none;
        d=google.com; s=arc-20260327;
        b=FOvx2Kg65OXEzbRH3bJIN2L7J7iW4ulww+kF0xkeByuB90PlazwTCdpoU60ezAWokq
         BT2C+TaetvDfSxno6XAbSwoTvBPJ2zAOcV8yDN00KIIykGiBvMDTkXFGckZTIHVFm2Q7
         GqBtwgd1MNnCh+vFmg0ZUcv/J8jLUJTRQ3fsOJvWdZw2+QhWD2txtdcRI24gUZNXBOso
         Vr2rGR+yq7u7HU8iqACG+8CbfdL5gox2xdnRI0VCFdUqgdtolxieLss28dAa7jWufXWZ
         ckPVwBcEknrpKZ/G2YY+DmBQxAKj8Kiu7upREHYkxoKZru/SNCXMZUYe7J85OgyojfBx
         vQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/2UfdN5Nqu4lM7RXRcLv27MNGfJkbs9IexWElOspdQA=;
        fh=/kPkspdEVkZCeucrv76fqtATpw8Uagkq0tgQewwNgFw=;
        b=U3jsQwnmdq1hWnui4mGcDWbasN0CwjtnqxcG6E6Fa4jqE/LdyPYJXG0q4Nd5hn5rb0
         GBc+/EP/cVow5QD8IrnWfBaxn4Tj/NjY2yRRiWcHeikeYXdtfFS1c0hP60vLbsRv6pab
         AefePR5g1A87l/3MM3t5URYDt1Xc9J/65Neap+OY/ks5qt/2nurt6cYpJu+yFVWMQSIc
         xjieUyMYBdK2KG8feINUshZIi7Ho2clNoBlssqQB6UtD0oiSyIr37SspW96/sR5yKeK/
         O1M8JgzUwKWvFAAIGYXaXRUxq4AEgk2jKYhaTCAqV2OvuAhOW0INB18ZbtNDEmyJk96x
         mAzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783775381; x=1784380181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/2UfdN5Nqu4lM7RXRcLv27MNGfJkbs9IexWElOspdQA=;
        b=n5M1L7RlsQ/ynbaU5jyg367CtZXLJcD7sTEfqnBk5D5kMI3/kDtOEJjevpbTj9XpOk
         0H8PTtkA6/J1Q1FEG++IoH/9z4LtNt4yyRFpByi54FdROQxwSqADGgWXB9/ysJ2M+nnV
         soVl4764AD8lXCUPezk80W5L6ubH1HK0wRcT/0/v0ccY7eLKPXd9ODj+ICH44kl75hWs
         Stb7HNfI/D+Uu4uhr012mT5ovBQkkQoo5NfGogp3jK0d3c8qVuQhzWvlbFhhXTXc3XUO
         meanXp2EkLcHETN0ASOqvNTccTx+Cmu20cxcuCAsyXs34A7tzcD/3SAIrIPNkJ5mgJDs
         165g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783775381; x=1784380181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2UfdN5Nqu4lM7RXRcLv27MNGfJkbs9IexWElOspdQA=;
        b=iFcZ9L+ubnv8G8QcuekcCkNfFZyLkPx+8ZZ7sEeW82FvbnVqYY8tm8nSExxA09V5ZX
         VzhEIcbJ/6/CrACGroVRHqhPR2zG0lub2c87hkA3e4A2RPjW38UMCPBhdb+KiNaaoANO
         HzIJFfcr0nImC+2XdWQQltz1RMgGHjKOEuJIzahCya02vMjuZTz3EZukiuvKiMWpxJqJ
         JVq4zjaiTfu6nKxNKy+CwJuJN7znjV4aN/Esm937//JDjegNhD1e7HDWB4hSiqvEAW0f
         nzzF8a35cqaj112t0y/YUkH34a/e87jmKQOCSh40b6fRXzQR+D0qAmZ6VF09Mxj5dSx1
         yXhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1AdTEUQHTaBWMa2uNm9WMht69utqAIwanAXNzyLpcNTVLjEw/y5MMYeKTLKBjPA741eXTfX9xekHAhyvRng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1G6jv7mN4toh1+779mF56Z5m1RtCicAZBQVpiS7MpJ9JiQXha
	UOLugQBaiGNCsk0zJ7qbFTdmdOoQYRYTmGhX73zJeaNjeYtViVSaLWOrLA0zDxDtjIlIF9rZrTF
	Zubegj+021IHcnnjBnqZXEIO7LgsnRo8=
X-Gm-Gg: AfdE7clLujbBYmTRWaBpa/AoX3W/Byeb/4D8650ktRyyrJxk4FjZ2xrM5kzIYqNK1Is
	EX7RKpxAKxivYckSqUSTZPW0/Us3VaX+0kLhUo/JlITXcmRDEA3SbokaOL3EWjoct+RULJD3H+G
	cA6qy4p3r0Nxyxr8QpDrhe4AChHTzd3hdbzPr46CIfku34SqOL4GHMKoGcL1F+j3e4JIG/+WgPL
	nQykqiDpx+nFuaL5HFOpA1WTNZ5I4M4r3xrljfbo8+gdkKVxj0gVH4gB0ciAWoMKwilONyKnVNv
	L/ZRI7MRBV5/y78uDX03/NF4JgIKjaKDHBA+UR+bC+oJMx6EeyAkBW3qcHWLtOQ9tcHY35D0csQ
	Fpk/fQbdJCY0q
X-Received: by 2002:a17:90b:2d4e:b0:368:b002:bdad with SMTP id
 98e67ed59e1d1-38dc779df28mr2131886a91.5.1783775380898; Sat, 11 Jul 2026
 06:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709100100.604252-1-yuantan098@gmail.com>
In-Reply-To: <20260709100100.604252-1-yuantan098@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 15:09:26 +0200
X-Gm-Features: AUfX_mz0L0PMjZc5QaihoCm9iseWlIO_uGF5cqSVyeeh5Ceo099XX7o0kud-B7o
Message-ID: <CANiq72kbrtG2vecjXjnw2=qnFbQ0BV6NS1phm9Xvcwu9t8HM2w@mail.gmail.com>
Subject: Re: [PATCH] block: rust: fix `Send` bound for `GenDisk`
To: Yuan Tan <yuantan098@gmail.com>, a.hindborg@kernel.org
Cc: boqun@kernel.org, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, zhiyunq@cs.ucr.edu, ardalan@uci.edu, 
	pgovind2@uci.edu, dzueck@uci.edu, Yuan Tan <ytan089@ucr.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 12:01=E2=80=AFPM Yuan Tan <yuantan098@gmail.com> wro=
te:
>
> I noticed that this patch has not been merged yet, and I am not sure what
> its current status is.

Nit: this patch wasn't tagged as v4, so that may be confusing.

Cheers,
Miguel
