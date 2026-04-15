Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC325487C
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 00:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776212520; cv=none; b=qSR0oX91goW9nDICPNmoIS4XDIq8eYPRv3EElWS+jdr3znftuYsPCZWjTfRPFnbN9uiGGGOGZUSHeO1w9yNbtdbBRt4LVH7WQnkr4DRhRSrPSHQ0jT4g1zZ1FCLSHmVqXGoRtmdNqo1NGXgK2OhTVss17eR4shCc7vp8zqe6yyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776212520; c=relaxed/simple;
	bh=qZN1js+unGFuX2cTEHYYML53rIJKJMQYBlYw0Bkmdfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrxxOygMeOmOqekVIANowN1vJ4J7sjNZvSS3n30sdJdYzg6pDR4coAdQoPflvgENTlFkGiAlVVeJ4GZNibujJ7vp/0hBHkAgo2r5fi7Fpzpoyu5GpfCr8WOstvgo8sDPq3CwIr29GbzWcho5rvRhy0peH2a2B7wKJd7rgJTiabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPxYSOCd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPxYSOCd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so47206655ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 17:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776212517; x=1776817317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4+QDgTuLnDmaUgBh6STy2GIqoluFspSjKSCu8EQ7sw=;
        b=BPxYSOCdkTSyHlB5lLZ+kTLGN0xcGodXonlatfRHBhx3cCRxuRSxLcF5yO7/zQYLyP
         jxrDyR5Y0Tn+WnQjrz84iknGHUDfy4f4nAFKgXxlTZP9aMFkAHz5Ys0xRmgQpgMqoULJ
         AzQghAnLTUjO9INme541YQInFvIwqN+7/8wdZ1Iv0IGplnfcBV4mFDn14peM7slf9tX9
         b7BQ4uo0pZItaw0s+S7oLo3YiGtVh0sQZ+gDWhYFtT+0FcJ/osKPGRTdWL98/GmxAYjK
         Nut/GFWKvYspL5A52VmyvuKTGJArIbE/FQkqStGBdnvc3mqh5oYvpcccBKajBgPf5BQ9
         PgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776212517; x=1776817317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w4+QDgTuLnDmaUgBh6STy2GIqoluFspSjKSCu8EQ7sw=;
        b=nm685Mrx4owax7Hq0LeuK1s3y+FsxxNhyAYcpQfgrLWb8yupN5ACFeUxDPPWsZy1u8
         qZtlqR9X1rbtwYWP8fVw48gTSrSrXqYF0bJsZLi36XNznYNGIpDu1q1VLsksu5V5jKCj
         ilBQit8GbVFoUYmTr+Kd0e4x3a99XlMGlagUgPpkRg33bw+AJsezxBuJMnigBJqcDMty
         h4sDqDJ2G4A4x1GZogyCCu/MoPGc50LSTr6QGO/C56KQnsRThF7cYuH9uRtxLxeB0DpH
         Z1/BlX1iSDd6EamzU3bsizE2/RyEslsYZtNhZzNJLlxBPA0GXtz44VsSr6Xsqe1bAqOx
         FSmw==
X-Forwarded-Encrypted: i=1; AFNElJ+9FxOsnFW023riFiWNzvlq9TIuhpPykGYksr76zlUcF+LqHFn8p5ytHsaQV04j+xKwdEZ/PJ86L0SxdGDwRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbuOg4sNq0wbC7MbzmmaHlQSeEvay0BwGmM/c969oU2h6aB/1Q
	9q3UakZnm6Jlk+3ju0aiFmrIDYltI3mG9lj6ZYLjj6IDpLP6DPf4yfu8trRWAzi3fog=
X-Gm-Gg: AeBDieuTlfucUQ/U38h8InCbHPJ4GYgblamZ6NEKLc7w9qc1Im11a1Sy1oMFKlHDICk
	1dniT4sfVfNPTjRreYwnIU7/U6GFzRalgGP0nzLZ3sYxMkoXF9D6LoLFJTXOzYYpz9/JEmgrKXK
	FePM3MtE57A3FoAhiYW9MjNFmqkxM9Prm5FeRS85RtWRHMIdgiCs30aATYPByl7Z1W8Kv67evR1
	a5elBCCegnmLwI1QevG1blUTRYazkUBuk7g/wRXzYP2cZGjvHxterXF1RSdLHD8zaOAL8xgTWDk
	ACxVmuO7BDD21ZEIw9w66h+HD624dE6vF6uVhxB/Sypq/+P3iL4tQ6jilXeThqCSqx0/t44rIqZ
	l919rSTPLQ3sfgwDC4G2Tsi+vVGdtKUvI00yTLOCRSSFnbSBzT/wz1UwqePgRKcH/i4aVwNnKJf
	RS9cf4d8tq6tH9jdB6GU5BsNkVi6p30xlkQhEcgAMTR8dWgw0yuBeD+olELQsqr++TyjhJot/wk
	VwMKxoRHjHU0kNi0XuVvqsv2dTMUbefgmfibOoibsC/PKyRlfiyCN5MHcXcZyx0S7U=
X-Received: by 2002:a17:903:1a67:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b2d5a8ac9bmr206973365ad.38.1776212517223;
        Tue, 14 Apr 2026 17:21:57 -0700 (PDT)
Received: from coimpiutair.tailaf23ad.ts.net (202.128.117.41.nsw.leaptel.network. [202.128.117.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4780f0428sm1260325ad.9.2026.04.14.17.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 17:21:56 -0700 (PDT)
From: sempiternal-aurora <myrialsarvay@gmail.com>
X-Google-Original-From: sempiternal-aurora <78790545+sempiternal-aurora@users.noreply.github.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	stijn@linux-ipv6.be
Subject: Re: [PATCH] rust: bindgen: disable GCC latent entropy plugin
Date: Wed, 15 Apr 2026 10:21:18 +1000
Message-ID: <20260415002126.1577011-1-78790545+sempiternal-aurora@users.noreply.github.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CANiq72kfBZi7_W0=CZYinQc3ZohNiBWt_Naoqe_m+fvCj8ii+Q@mail.gmail.com>
References: <CANiq72kfBZi7_W0=CZYinQc3ZohNiBWt_Naoqe_m+fvCj8ii+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Sun, Dec 21, 2025 at 9:17 AM <stijn@linux-ipv6.be> wrote:
> >
> > Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
>
> Before commit f1385dc670fe ("init/Kconfig: Only block on RANDSTRUCT
> for RUST") we didn't allow any GCC plugin at all, so I think this
> should be instead:
> 
> Fixes: f1385dc670fe ("init/Kconfig: Only block on RANDSTRUCT for RUST")
> 
> Cheers,
> Miguel

Hey, hope you're all well. I was just wondering if you had an update
on this patch series? Would you like me to resend the patch with the changed
Fixes tag as you suggested so we can merge it sometime during 7.1, if 
everything is still good?

Thanks,
Myria


