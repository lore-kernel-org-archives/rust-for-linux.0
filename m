Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E91F37BE89
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609834; cv=pass; b=mh7mD0Xq+scb1jcB3NNYkDqPXXsikLfSrWJ5sDhLm8p3b3w9jYCUwcbVOtX2DaZ9rpATojSGb8EYiqJPE2K0+R9wz+seOsxCafbyEyz2Hpl/g403or25026iArPWDFcHDc55KxpS/8SVP1Mihj0obqANa5VKxHMrOm4fl+u4/GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609834; c=relaxed/simple;
	bh=/kdN5n0SuCqXhMQVYZqmHvAu3OPExzVr+GRu5HK2q44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWZ0Rc7A428Rocbr9GIBBYVH6dZnxvkZe9rffiWBqRE+xxrVIQ9r3YC15di//olcSWI6doh/Cx9UfZFthYKSlZxXmC7jlQFsW8yzORjoK5sf21ezGOeIml690DRT5IyB4kUUDg18ms2Jr98e9CzLm7Z02b+7W92IKT78bVpHmhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkFK6Ffz; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkFK6Ffz"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128edc72f3eso208642c88.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 14:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773609833; cv=none;
        d=google.com; s=arc-20240605;
        b=abGIdGojijyYUqe+K15GuniaJWyRtpPbhdOMEgJ659G0E3FmwVYRcI5vucWW0zZEfO
         IEms421CtPyM5X9vPnIEtHqOuOLpqfOXds93XyeV1xffKzpJDFatzV7GpciwNV8XJf2X
         nmatNy34BXkuHTlHifc+zXESg8EDV/neTXNrmswoTph+9Hw0ojukE6rESy8C0Bfi4Oi/
         TbG6W1HaQOQPBmARjtFcQ0WaqnRyc5QjVZNg+vCJeSCp4wFkKfesaqTQv7f0ceHF9lud
         tHwgy7YXCmE0ydIHp3NWvCa4IzKXDtKulaiwMIwUy/C+fpta4nqc9tIg/arnuOmwve79
         WOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/kdN5n0SuCqXhMQVYZqmHvAu3OPExzVr+GRu5HK2q44=;
        fh=BdHXsIi7/cgOMS9qqzRI9OHNCr8inHl0/kp5AGzeHGE=;
        b=deCmwO/ES6eHHnP/qqcZgPa/e3Sw1vw7kgr9IzjhSf0uUIP5rxmqD3LsaKo06WyGMC
         pGX74glPGSfOYkp6D0ejvzSSkp0Z9fYqqAxdOv8JvRtc02dNtCchpc2F7UMOjPcgEJkG
         Ptt5/JkbaB56GyTrjTRD/ThiKAq8gDNR612OFHJ3e+5ZyGCF42xhPO58pJ8bS/r1Xmum
         D9ekaXF3uEtPwHWtjMK4418sxAeu2JLvpL+kjSxQc6FuFryrU9qoYwZQhJlmK7bUVOLt
         cb0JworowhvXLZtHZl4gTITzmwxrLOJZKhlUnGnFT5Hc2SKFkDElvrimaHo9D4RYNSoT
         SAIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773609833; x=1774214633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kdN5n0SuCqXhMQVYZqmHvAu3OPExzVr+GRu5HK2q44=;
        b=EkFK6FfzSJYE56lR5hNIMEwxO2XMdlN/oqrO3RCphZ9pB+hoBrHl+XK23ysPaHBX0T
         mKW4c4s5gCznqcw4vCf9iPMpupr91L4Y21MS2w7VChyxXMoVVM5SjpMvVcMILUgeOk9n
         xoOo+ILuEsj7c9DoP2uZ9KJr4ACt9cF77yYC7JQJHj2yY81rafFzgrq4lvqGfnxQnInE
         LqVrPhSUW8t4Xr7p6f8vb+CmxOw67SZcmSU1h+DA2DWi11SOJwv741Bonq/y8EXdfHv2
         0yASOIvmVefJPPZsks5vmDLCW07SI0AGvNpN8KCPFgmm4r5hXDPpmdhAj2ERwitlXSg5
         6Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773609833; x=1774214633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/kdN5n0SuCqXhMQVYZqmHvAu3OPExzVr+GRu5HK2q44=;
        b=UMQS9aC931ZrZsmnbCWR8n83bOG2s7dGT4BPTg1OF35o5fKF1a6P1qyQpt0iX/RFr8
         19FYK/UoRP/yldCBZk5/mA87BhHJ7ax4BAsTb8DnZrvHuH7l9LPut+YRSb0foo2+pCeh
         pCKlgXqiWQG/V83HBYCX7FIrDk7eLJrzGyMJqsA6JpSmIH2WaaPkG3tWoGSnX9GFUgfs
         2Y49LJoGss6J5rsGPcTN/YYIIR+yj6/PjhWH5HFPPjDeb8m/XvSuA6zclNR5pVmjocnJ
         Po5kpbV4qkAL6z9fivGh3o4hH/3Xp1Jl8e50IDA2HTX0LVwB9df0F3OCqL2/bMxth9kK
         LOJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY+0/oyfhqaGqjH23QhkzfjUHGSA/5f/jWIBIbYUGA6s+n37Fs960+fj9mhTPGiAqJm5SY6yNKduFdSTKeCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+Jj/4MPmMjHeS5csrdvmEQaw4X2EChm+VAuExg47MLuEJ/25
	PEXHiKUkBZKxf5RMP/fMxZzBoQcsnJbCd1yptKNNAyL2y9Qqr8KS/fQtLmRs9KV2bupH9O8Ov0/
	W/oGM8BcbFzMaLYqLsF/ZdC9BHnOa8YA=
X-Gm-Gg: ATEYQzz+/KYXdnW9VX4jMoBozE2gj7HMbU1lxxSVTOoo1QY1oSlMNBiQvPB5X34BoDl
	cS/EidVQjyKZ5G0FK0pu/8QSscDQ5bIvPcTsDrvMhSTgXe6Ix4jyXsk1ZqcGWn3CLuvvzEEez0i
	gC7i8PvdlKLs4xpTGqhOpt/80Weh5IpXdnUmWZT0E8FBVMnNVghhtQmSQAi9A6IxlreYkYw36I/
	khlkm+Maax0Jrr7/dWfeyB9p0AQawOzVEN4Gx0aS+X+ObLAWaQ0QmoRCccGFea2E0EjYf+tM5T6
	X7t8pkOoddBZoctC+Fo29N/JYA7S471NiKdZjI76DogJ6pR5ANqj72/a6FZ+D5FPjCefLXe9ZuY
	EYX3Gwn9yDjyFVMaVc5pkIJZ07E1ZoO6g+w==
X-Received: by 2002:a05:7301:fa8b:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2bea5537069mr2721929eec.3.1773609832673; Sun, 15 Mar 2026
 14:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kbVRVZCtU_9FWdPnqwOi27RY8Xr1v5DcoD6FQBqaCZ9w@mail.gmail.com>
 <20260311161944.13083-1-shankari.ak0208@gmail.com>
In-Reply-To: <20260311161944.13083-1-shankari.ak0208@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 22:23:38 +0100
X-Gm-Features: AaiRm52WkQ6UwkXoih_tRBC54YjZwg1SVa-f7sRQE6ebe1bCdiEppx5QG5ANGiE
Message-ID: <CANiq72=Lzba+e+nhmmAUsRtuJh_KuJAw2T6E86MHr+hhncpvUw@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/4] rust: refactor ARef and AlwaysRefCounted imports
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 5:20=E2=80=AFPM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> Yes, absolutely. The second one has been acked [1] which can probably be =
picked up.

Yeah, it was, but for that one we were waiting to see if Wolfram
wanted to pick it up.

Anyway, I am picking the remaining ones to finally finish this.

Cheers,
Miguel
