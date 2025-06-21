Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099EE18B0F
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Jun 2025 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750525180; cv=none; b=KLEMxqpdmU2AzFlnwdHAFYoosjjF6urA1orYWhpCP+qGB6FVzbigOCH5V/CDVnkG49ETSw6fMLOEaXZPoQ75HpwbHut3qc1zsprq16degZoDUu++0Re3VgZQI0tW4hRP4aJ4rLbDYM7t7sGBgQBOglrTr1aZdnUvkhDwgUJ1/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750525180; c=relaxed/simple;
	bh=HWR1pE8eOVfpbLWQNJXabinMXtxBrYYeUGjgw2zUyso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REW0om89q53yIDZ29a6D6Mn0sZWdor/nvVrk+N1BCrHgJIPoXDKUifJLwRTqZrbO1FvZ5n+MwK8ND8zRboPpVtZXAijOROmS6uBkT3YZ5YaRTonQyCaeeJuT9L5SWufTC6aqiHqXxXC/X1BJvGZSPi9p6z+NWFZSWdS44YcMF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldy6MMtb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldy6MMtb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235db423abdso2241465ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Jun 2025 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750525177; x=1751129977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYG+Rkn+IcAEB05t8FOHWwVurU/GHMXFqLuiAUT8ZCs=;
        b=ldy6MMtba5f7NK3/tseQgFB8AKmPR499S8kkxxZ0FJh1/zxJs1VNNzU19N9CasOdyC
         5pH81jkCdvrWfYcsRS7th4Z+vXS5VBLmOZy4pLeZ7M8vv+xX3f0zylSRzL9Rokx8E4zf
         lgI0ep4rsiWi8JB23bPb7Bru/x1osqtABtzBaQTpiTtudSG8gXfosjhiO93ThXe2hIsj
         ec9qj357pgXW6ZixhRz71tdm6vU+pQS+QDQXDcvRlU31/DC5BJrOwRfSaA2f6PuqaPsY
         anEWUDTi+ZjU+I8b5f4mfoRfEwDJOlCgidUWg+WnBEgluCouVxlQaKvGnTPbG0DnCT9o
         N0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750525177; x=1751129977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYG+Rkn+IcAEB05t8FOHWwVurU/GHMXFqLuiAUT8ZCs=;
        b=sYeLi0wtRUlXt+qjBy0s0Yvdn/9QzPP5VGZ8yojaCH0S2ebMD5Gffeb88nqVtyE0nT
         jTx5Bm4Wj9CwdBmlEMRXVVBLA/UORd0uOaQamNCq7ZDvFuiraF1rYcVcri/5u7zcAWtD
         AkP/YAsGPc3J/9RUUGrX+MxZ6TzvXsHihMDp5kX1BBJRhw4DQih+VbBMBkDBCXLwUKkd
         VsY5bgPryFonLIKE9np4oUlKYOTtGSx5nUOaYTCN3mNwxJOfyTxzXmNtOwil264w3t7d
         dwhPvf5gWL7NewgPeQGIu/ZuNDp5e7i43397L+RNKuAqXmP3mIR1hPcu6Yo/04/sDa9+
         p3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDO6wpUMyvpYkxyYTvIX+Hjv5QI4+F0CNzz7H5ldtcLJe94fdpHCcX5+SHtEinrzkz2lSdNoZ/oX3yxWYXVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi6ptq1/8O9vcux2PRZUclNYHCc0q7Mjc/Mjbi1jLsefxv7imj
	13+rAyl3ygUg8LcGsRXVwWeFujXEzwUenG2XBOQVYhuW/WZlSMn5w9a/8AvpBjB13rMIh2/j/Q4
	4t3HidbSg/5mlAM3oUc0hHEtygazEYWM=
X-Gm-Gg: ASbGnct36Rq+NfYyO91vEI58xa/LAUffBHptgBIurn/flOB7RAweFMoh1tJbuiqFxPp
	jdOSQfrLlTk//ovuX/vu8jn9KvEKlG3C1bU9uoQduwj/vAVdz4p0ge+a4IQXzR21Ok3eB88Uu9C
	29TXEjhvkIjMDQkl3N8LTdCtYAG7nmLPGw4RfijL4crdw=
X-Google-Smtp-Source: AGHT+IGi6Z1pW9G4x7UQ+KV77k+gTBsR9JZDk/iN6hmdQ1wpVxFF1JJadwfJUzEzC9ipWc+oUDswUXDnjKo05ghsYrs=
X-Received: by 2002:a17:903:4b27:b0:234:bfe3:c4b8 with SMTP id
 d9443c01a7336-237d97217bbmr39085065ad.2.1750525177302; Sat, 21 Jun 2025
 09:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616193433.2643407-1-ttabi@nvidia.com> <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
 <DAOMQXNTLSGR.U0QOV8BU1I5V@kernel.org> <CANiq72moqFBWeS9RL6y8wzpxURvhdz4D0J8WfjaOBp0XSgufdg@mail.gmail.com>
 <579273832b4accc4cd989d5182f3179c9950966f.camel@nvidia.com>
In-Reply-To: <579273832b4accc4cd989d5182f3179c9950966f.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 18:59:23 +0200
X-Gm-Features: Ac12FXwZubjseBd2MusbxnracUdBVe1Tm-l66dt7855VqJRM7GXL-Tqd3y7Fj3Q
Message-ID: <CANiq72m1W6Do4z0qjKmzxSbYT3az_x1DKZ5C3eLABsPRv55EwQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 10:05=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrot=
e:
>
> I'm having trouble coding this up.  I have this so far, but it doesn't co=
mpile:

(snip)

> 492 |             unsafe { core::str::from_utf8_unchecked(p) }
>     |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `Op=
tion<&str>`, found `&str`

If you are asking about that last line, you need to return a `Some(...)`.

If you are asking in general, then since now you can return `None`,
you can just call the safe `from_utf8` and convert to an `Option`,
which also allows you to avoid the `is_ascii` call, and also allows
you to return `None` in other cases above too (instead of panicking).

That also allows you to keep the macro straightforward and small.

I hope that helps.

Cheers,
Miguel
