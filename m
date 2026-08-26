Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACDA40A956
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763352; cv=pass; b=IMtsWyYWfeWG9d7GUJXr4n7l3Q9Hd7tHU6gwcAugieyQXVSl3oVVvzjXI14U1EJ7wk0nIpCOG/KLojx5iY2VMPIE6HaBFZ7LaE/uq8D0hkmYnJJSbCGrasghYOgum4Laj8xw/W3/2bn4B3TmmBcvApQvrUkGUhoR1qqoaycOhcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763352; c=relaxed/simple;
	bh=GW17/ZxJ8MNDoRZbROrkv3KzmlyE+9Ay32tkfuqbqJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgh4b5Wnxnbn50Xuyz5wcgR7/iyxlXUAPZV/yuxLmJydphUcO+EKMq4UcBQq0wTR9l4yeDS3wrX1hnHFZc2BNG5+sBP4CgtJSV8r5bkHNZLTQWL8IUQrftKqGZEeEhICMNluhJOcwG7NZOaDrUj5UuniseB4byZJzp3nYstr6Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyG2llWf; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyG2llWf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad68425a7so859325ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787763335; cv=none;
        d=google.com; s=arc-20260327;
        b=p9ep9Y1v+2flJV5z+twyCxEo097ZBVDBdvKzvttijfOp6x/vQVSy/vnkRIXSp5nkcn
         dIfTrxombbkuvDFQRO2m09u+WSePvmh5eVcZ34YggQxqyCENYrpGSm6ShhbzlJdg3bbd
         rWts74s0LxPz5B/9fDVGClJIEGIP223W7m0ri/GLjfrAxH3uQxSQcaZbRQYqeHcuhy3X
         StSpmlk8QtA/dkuvRNwsAUvKHK4GQgkQRh9T+iz/6zizxh+AZ9uuYaXY7NvY+pOGGm8k
         Hq03q37fynJcXCsZpZTUNY0XvDqjCOxxV+7LSKg3IRPuV2MyXE/UKnuVqnbJAHxanqx5
         OhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nSbpEAS6WMmICAlTJ0UBJ7KBdfQ/8TLnB7NiZ5/ZiLE=;
        fh=p8uGFFzMASyQgk0UNhrYvQlEXauj8npGFZyIsjDKqeo=;
        b=e2enzL4+wRP44t6NJjiWy8Fs5/wS//T1U4bKoYKaVojgQQ6blsc3oVvipMhPjajCVt
         KGt4q2HoIs5oPLzXvukaKkDcm2sMcY6in8DMc47yVhk0x3I+WsfetpbyFNVORIR37ykd
         pY/7N6F4p3tC8WEIsG9BTJyx3Nd5TbvYBnL2Vy03Ax7EbdCXHJSm2TUc/W3mXGZbGxWJ
         R994vANXVFjxAI/MJvVYNAdCUrN0KQ4R5V4QI9GMhp10IfcwwtkOuqYXDwVcJ+53CV4J
         jmZkGfmbcn4Z8BD4IjeeGtfMXY6wZBC2uIXKQzh21QFxVKzPZjSYR9MPAcXtYstRn8uF
         5NCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787763335; x=1788368135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nSbpEAS6WMmICAlTJ0UBJ7KBdfQ/8TLnB7NiZ5/ZiLE=;
        b=SyG2llWf5gH00mYe9dH6nAPoqcho4yZctevqFfLhRQCzjNwLxlvScuD+4xN776qjC0
         XeHGcaAbAN40GWoF4Kt0umvxpgncWsrSqLUGLTYEwS2rFjzhkO+O05bUOLZAo7l9xN5h
         K1XYKRQEEuK+aQxLcLrdAq3yPr8YpShYLM+ev7y9jqUVlo0eA0iJi4lM0qmCHx0L0EKU
         FoWG/GO2cOfZinBgbld8vD9XZ/ayPGSGq5REO+015lnKcLZQDTVS3JipF6nPZuSGuurW
         kBIAeS/+wl3pZFk6uhNwW/b4FSWQKD196vaE3fAgGxVq6MjVv5dtXMOR46LZypY228KT
         n++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763335; x=1788368135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSbpEAS6WMmICAlTJ0UBJ7KBdfQ/8TLnB7NiZ5/ZiLE=;
        b=CHk9tDpb9hDe8MH7xo8H8TRmlUkyL6qfg8n7zdHgXhXgjDhYoWe4VMjPDvuzbY8/9E
         7KoUH0B2/uxwXjNf6Fja0Bm2G4qX3oi7XGsgTlzz2bdqm2ELs70lTK+fzUoJ78VD6ykX
         1GCoEvUtapArvg66YfFT3qJJ4iG5hpXtNNgu/nKw72PKolXLQ0a9TJlEtG46pGIHMEQb
         Mhl5nNkU4d0biqCWuHKjARjWNK9XVW33MpeM2j/kaihJrORY8yk8S7oqOJNAzOhq9YVG
         wWw0ofiR4lxTsNQDptLJDrhMRrVuRiPaP9HcWe/BhezqOLA8wxIjyjiw+qfxMoK7ozPQ
         /nsw==
X-Gm-Message-State: AFuF++majNRhQxxPuHEUXttagNcpxKe8PSBLoLi/AeXgJHWEUxUOzsip
	fdgBq3s8rIFSM8b5PpQSb9YR40Z5ddZSin7T1rpfMO8fwLr96cmlLgAmMC5uBi+BQNNagboqK2l
	6hv90sMadbM7HEI7SoCu88M8NTh9h4BI=
X-Gm-Gg: AR+sD10dfJxJ5GTveUBLuPv1TWPhyHMkwKwMiraSg7f6vHCZqEdGI3Y4FBzBteovb/m
	eBGtHipjzTb4q0LH5egjhzJIu90cMqTAEsHjbxjanZDN3X3XPw8NtfiJVxl4n5zre/3+GLmDq3A
	PWoEhN3XqZ5k6dS2E50LekzatjtMvuWg34Iix0VIU7q/KmBIgYBJrXVsfBC4FtykyopiQllLrLD
	m4dgX7pmubs165nL0+tVcPwe4i/8zYzUVkgAdCHhNpg9pBjIO0UV9Yn20Em7GAsIaRdKrhcP3YX
	RqqqD0+8cxYUcBJokXvSr/1hRKE2Y9zpMh6sRBXIwtdxjDipe34JWS6DIVdTCTf9pBSUDtWbg01
	oRPX9Hmh/xqtLbaaj1nHfhvG4zWGrceV4VAwS5RiPsEuzIqBfIbsGT0e9p3IZ
X-Received: by 2002:a17:903:b84:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d71e0d8599mr16720625ad.0.1787763311835; Wed, 26 Aug 2026
 09:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826162851.2497-1-mike@fireburn.co.uk>
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 18:54:58 +0200
X-Gm-Features: AcwNN1W1vbX_egm06LItcK7I-iqCsSdSy4wPi_4vCfmdRA4BWPr9Wuaq3tVEUxg
Message-ID: <CANiq72mQRrWmHG=6h0U2n4BMGZ6hi=8+Nohg0eN739n7NevEKg@mail.gmail.com>
Subject: Re: [PATCH 0/9] rust: core abstractions for a USB display driver
To: Mike Lothian <mike@fireburn.co.uk>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:29=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> Core Rust abstractions a USB display driver needs. They are separated fro=
m the
> driver because none of them are display specific: each one covers a kerne=
l
> facility that has C callers today and no Rust binding

> The rest of the posting, which is one series per subsystem:
>
>   rust-core, 9 patches, this one

Just in case it helps: these patches touch different subsystems, not
only one -- some of them may want that you split things up
accordingly.

I hope that clarifies.

Cheers,
Miguel
