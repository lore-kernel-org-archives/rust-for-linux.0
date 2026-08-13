Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0C3364927
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786652440; cv=pass; b=Ym4PbsIhYUz+kZzBNKBGeBEP60snZip71/OVNo0wN1ySmfmZBuhFtTDuIyb/59V0doN5iVCaeBFtkKiVp2MzcWd+V9FxowUJjWu2PD/CPG69vV1QW3RaZ5jsEwOLbkhJOiOk1PP6kPjnH2fSBIqimLCFGS35Qwa5oDEtHg07Y50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786652440; c=relaxed/simple;
	bh=cehTam5I/PsI0xQ5rE+zJQchPnCweU4qjkmMXExiRUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+CjZisFAzsQOjA5E51TpWUZXkKrpXcZUfiMUAFLYfhq134aPS7l0TD/yNSC+KApckcoBKG2DTMxgxvqWkTeUoferhJz1kGZZfTdNPpUH3Ygy5LqUwPkRh+ZJWijYZ/+UBUYSaCFEksMlGqzJ31bkCHq5OPoYNBTbyLRsJkpAv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDdxP6k1; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDdxP6k1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca132e9c54aso20502a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786652438; cv=none;
        d=google.com; s=arc-20260327;
        b=S2R/sia8csi1Zm69I9MLcwOtnQ1Nh94+mbNXl4MhwFhX35kZfjJ4K2rG+sgA2EAj9W
         7ulxExdmRdFRhnfiNZMMonUlDgzU2dj+JcCg5TAmdFBYA1qf9UMvSuX0CbQ+30CSb8FU
         6R6amCtKK995GP5PyyPv3bWxEc0jS4VabvgRLkJY7R/YQoYxEXyDfBgotOlyViMQdCYA
         WaTJM//XrN9rz4GxCl9Gw1KmAaAQDepQtwPWvRXblzAMstOkz2HCMjOC4HZ9hOLJB8Vf
         O2qzdPJUZTF6RCHsdKDK9ceG48XXytsH5jF1bvsxTT6HVLmnPaJkFGVv/j1V+5cAbptZ
         Netg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cehTam5I/PsI0xQ5rE+zJQchPnCweU4qjkmMXExiRUs=;
        fh=M7IssiEyE6P8+zX52OCPmHntY/sxrdVPav/qsaLL4t4=;
        b=bfgH6spE0vJgomdqRRjBtFB39MtdCFxNSYvloUOmK0nuMg8DTcg3Exeypj2jM4i5G6
         Pp2lS3YclvjKHGUw/abWXrg1lco6Sqs34Rs1skkP8wp51oUiR+pTmSX5pPDPKVyxkYvl
         GqJUMe3Xu6tE/YNml07fkx/ZQv6Ks/CbPchV1w8MWKFizfO6asEqu0Lc2wikx0ZnH5yI
         KrTepn550E4kGlPcVRwlR8PoBGe7sI1Z7w3qNy4K3Zjv7+FZ0CDVxdv02dyEBzonW/T7
         RCpc1z+T0+52zO2p6uY5MuFjljKM42SSZZLOCgJJPvYznGNY/tmSRW9s8NLIM6m3FkH3
         p9mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786652438; x=1787257238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cehTam5I/PsI0xQ5rE+zJQchPnCweU4qjkmMXExiRUs=;
        b=BDdxP6k15SkyE/oHwi++Zz/2y9moiD9OZuAmwpb+ROSrBYQYV6Vnkf8c+VUDAiUQYM
         Ssi6+4wkxSc27E2yGvjkKlG+zI5zhHqVriIHXVKux8V6UQTryBNr+1259ZEkm6cK/h7B
         mWApAX+VpcDOYUeLrUeDtc3s/ykCZtoJedRL84EG77PB/gYeYM4y2Kd51h8B1RP8dJQJ
         j5e2tgckfWDt28STSy24oS9qYtkWc89gqEtAwySR0t/U4uGLOz/BtZEom1Ci6AGTyJs2
         1/0OO+rEqAH1ddvcfb4+URM2OIawLU46N+URw/JKSyMGRzOS664Q+EyPegw//1RFR7UF
         fXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786652438; x=1787257238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cehTam5I/PsI0xQ5rE+zJQchPnCweU4qjkmMXExiRUs=;
        b=f6A4v2nmj5M3dckvx0NnRd5yPbln2zCmxSJIKHD7+60iTDDutcPYSqDd3qSQcqw8g0
         erj1lRHObUiI146JSWfByZlBj5p+RGvmn2iybdXEbKfD4Qey+Zfk9knolEmTk/ssjEW1
         s+ojqQ4dSOTJITlS4kof7gVYRK/dGLunt6yrbMKg9KUraWvbuGLHqVyvr6/SZdXR5ILi
         U8u4rVyqPg/hgu646MQ1z2PyeXA32DgPH3r0DLKlJQ2y9MZ+LsdbYrMTSB0wh035AolV
         7KQKsYjXZom4/9FnipaBetpYDtbG8vQKZ9JcnjFrJaaxG3q7lhVIs5kxt4QGWfwCdbmj
         J0WA==
X-Forwarded-Encrypted: i=1; AHgh+RpdeFhCswpVkzmyBcZc6f2J4qyceMo2bzbhuAlbuOpkKiBSGEkaXVIgp1v7bygSlcj2gKSxb+sXbxeR2bFXcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVEdQSG9y6SeKXunm5ve9rcbB2XIuAo4qAr9fN3nmbi4tIK6DI
	xP4yCOnf+8x3gSvNPbnsUum0AZrSfj7csw2XN1VhNvfarQ3w4iIH97vnEB39wl0gDxmdSye6SuM
	ggvYarW5CBRtYAIQDMduPp8xSsC7/ZnE=
X-Gm-Gg: AR+sD12j3uorUyIfAPPBPzH/mwNok/4a20lSWlLsqnTWTul5A7imAX98kV78ripw1Tm
	fkru4cz8tJF43rfS6tHu8KRZCNVzrM5JX/C0m8dPZG0Gl9P5ioUS5l1u5mktZ4OhH8dZNnvNSJi
	qFIWzJHmwoi7Tyq/QUbWdesWHQBpNR7aNByRI7YEIfwmYrBib1y5lhVd/B7+8t5+Ola35yTU5Dv
	synNRm1+lfvVR4t0WHCgS+M7/7PnXcEA1aLRWSAS5jw/m4BIaedy5AqSVZ72cobxROE3plv5gRP
	WQAylKRE4sh1Z2RDS+CdUuUSO1SI7KBt98wNFN8T7VuCEjZQSwgkafL9r1qpaUpnoR+wB2TOG+S
	vqCwjvpolQcgBKrpvIaY2OVQI3+8U6lxoE8cuh7cP9PClYik2PbeWDQZJj1yl
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2d3b0d7af99mr4135785ad.2.1786652437935; Thu, 13 Aug 2026
 13:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812-chid-v5-0-6c767770b3f4@nvidia.com> <20260812-chid-v5-5-6c767770b3f4@nvidia.com>
 <anzxKO0X1OrNRD32@yury> <DKNN2LHZXRIH.5LUX95CZ8EA7@nvidia.com> <an4NvQBt3389jP6E@yury>
In-Reply-To: <an4NvQBt3389jP6E@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 22:20:24 +0200
X-Gm-Features: AUfX_myQRhMg_1RjW0BdPohelYryX955pzu-Kspe5KhUk7UGyWS_4IH5HccmtXA
Message-ID: <CANiq72mDrC+43kbj-X0dpSKP6zFM61R3QFPa+2_xKEP-RHUppw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
To: Yury Norov <ynorov@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 8:32=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Not OK is complicating interfaces and life of your users.

No, we don't want to introduce interfaces with unconstrained integers,
especially so when we have already types that express what we want.

In other words, we don't want to introduce impossible states and error
paths that aren't needed -- we want to rule them out statically. That
is the point of all of what we are doing with Rust.

The unconstrained interface you are proposing is actually the
complicated one, because it means now you have to provide more
documentation about both the allowed input values and the new error
cases. Not only that, you have to provide more tests for all that. And
you have to duplicate information that types like `Alignment` already
explain if you click on them.

And on the callee side, similarly, if someone already has e.g. an
`Alignment`, then we don't want users to be forced to convert back to
an unconstrained integer just to call the function that requires an
alignment to begin with.

Now, if a function is truly something that we want to call with e.g.
integer literals all the time, then maybe it is worth a workaround --
but those cases are rare, and even then it is likely to just be a
wrapper to the normal interface.

Cheers,
Miguel
