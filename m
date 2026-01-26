Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98333314C3
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428017; cv=pass; b=Jgr2sifasYKwDvXfBC9bkZGAvbBf8Px4cjtM/ydwYD3QDnCW9mjX1DXyS19L/ZoL+kl1A0zweojbl8PgD2jYXK8jkO9j9o0Q41REWwecfRwYSOU+VZsYcOsuFp7AYKSC1WnWc97kEv9leZIRSfaTPOiBvRWXar7XMhnuun4lCjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428017; c=relaxed/simple;
	bh=/zv7gs+xuWWvjZkXv13V1WD+hmcrWHWguoqewcwWQiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkZ/sxKmc09NZoejGPVPrNs8sZJTAABbvUAm5C/Jbp5e/D7jydOcLj2CP1ctRvRY5HsFFVm09qt380aVhrJfG4Jw9HUq9ELsEgNrcNwfwgWTCcNRWF3oLJpcnZaSgimh+MxJoEXx66GtgRGbnAngtLymYR7VS5lHwMMuGHNrT0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2ZO/sIQ; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2ZO/sIQ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b703e04984so267645eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 03:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769428015; cv=none;
        d=google.com; s=arc-20240605;
        b=lWLvUZQeNVR/jFAPm+P6i7bH2pLiXC2DypTS9Z2512Ygzylhk9So9c9pvxH5Ox6haO
         eYo6Hqke/dTCr6YoEO5eBPeH1s+Pit+2sT2CUfXBtpePYt46KnCUiHwJCuY8Sa4/ceWK
         OzlkaKiDJHK73/pRoRFNXkJgX19etytxeUYB+DIkAaHwQpe0i6bpgSGzQcN5LaNb43TA
         B8mEEevYzZ5YkOHsXhtes3bOZ8bzAxgRZPYcBVykuFE17AMdw3Fqb/2hOB8lZgua5jWA
         eA4r8yoHHvPcQRjohdsVnb54JRaRWtl5f/+pA3PWQfrGpaJJYiryfNLAARgaFSaIYaOa
         kyRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o3x62Qf9dAWX541AJwNkvWxUTiuyvytUehddtIPb4VY=;
        fh=Jvv+iqs/EZg7r4jMW+Nhe2q77yK1M+cwNmLPwxwmDRw=;
        b=WwBTyZIhwJ0CeJoxEg0e7zkDQr3Jr5e3kLnxsSJx1GrkmdA4FSUBkMrZaSx4r577++
         vFMWbZks01u6fyE8ouEjehscsxuxgdzS3qICnjgr3ghoOPXhIVw2bKhlqffaTsiqSr0l
         cHt7hBw3EULejWSgcIlBit++y2B8VsKkrotKRc1XOCKqudGJbc6km9aOI04IbtWlqUFd
         CRnUF2rKChzG8h6Nd30g7GVQQyvpPWEzAt8hxx7s094QA3DwZ9Jw4ksBwdQzVymjBC/Q
         eb1CzptuzL42UohbPPMhn6wI23ttlKAJUwWpjYLD/a53SjFryMki1Gxa2ewIkSMpbT08
         gerQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769428015; x=1770032815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3x62Qf9dAWX541AJwNkvWxUTiuyvytUehddtIPb4VY=;
        b=V2ZO/sIQjJ4L2oZR+dghvNVbk/Dt7wH4ewvltflQba+jTQSsYh/JSz4lRj0dmAi+3x
         UYR8IdKgkVFnjXVSw52MlLc6iJldABmHSx5D+DfMi9GqaF6XzHf8i/BtBBMZ+TtLA392
         lUOzd+kj5apKiXtgej37UKkuhrmoMn7IWTQxu/ZjUUVaznxkQKFAKC4w9w8GID7uapp+
         AVBGuL62FOlj5WjiWSj+qMEBdVz2gOzjF1nT0XrAFxf0/btXwpVug9JoMbFJtpT2RHGw
         PGBCKxqstBXIvWlAsvW//liBU59HlGUlo2HkcEx+e4zXROX+DxCcNXHHFQ26aCyv8umd
         gN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428015; x=1770032815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3x62Qf9dAWX541AJwNkvWxUTiuyvytUehddtIPb4VY=;
        b=EUmbdeYsKd22olSqLfaPWrCxngKFY7nudzryOKwdDtdM+HKK8Y+wRCxrUVJ2Zm6ymY
         kSREjynOAuRe1vhBuPOrPAvN+675cdSpRwR3ODDDgZ9bTw6sVgDiZgTEZMbwWJrCUqSp
         YCCxuULQjkusQwYPbCXQiyOqNh0FdSeZeBntawjgFnrEXqmUtyIc0lwWLiFNxqKddfWT
         ZOAhCRAb45+sWEcEt1324bArU8GWwrjVYr55ftJO5tnhsWYJHAiClnHeOsT1M2uKJNqF
         JsCBn+lnQ0nXrW0GN7ymJSbqarG2FtUtzQ18AAqMqOAUnwEUNP3EOSe+yugWhKz0tBcl
         z7pw==
X-Forwarded-Encrypted: i=1; AJvYcCXNZRBf7CV2iWldyNvnGEgUf6iIzCWWivlH3GdYKQ52DFcqN6+TIL8GHx+dcYeA+xiHqm/kMLiRO5xbtXgiXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzABdQyvcOEFvWw/sk1q0Mt80+g5bVNLV0C4yPYR+28Q9xnL8pl
	K4F8ZTVZxZ0gAN/uJMzgaFyWNe/IsWx3SCrDezpkJO8HEckwSiDKuAKw3G77PJEXxvwdoANWdfV
	P6emotrGIkTRIM7CLc/sjbIcZEZzwE54=
X-Gm-Gg: AZuq6aL9dbQZe6gPqZIjBGX76O96F9UrHVH1LCwJv9xSOiH3g76+pSw17BQGFFRnv7d
	3zrNU0oeVMaHhRbrmwnmruw5Xy+nZI3E0VZPitIx6qMXD9sRVy/nHaS6Eu74MbK675pZtrNWF7k
	YOoyh+Nk/vJv85ceJEyvsWUIlUUGkV3KrZCkoXSWssMKNrNUg5pxK+cqo7sqDGMyxDz2cpLE/Yf
	thvlD9rAVXxqqbCtan00gO2/6P9y7pKzOBwd4cAZEqY0bv67Vet4U3T4HoZsax+WsY5YzULZqYA
	F5kma4wEt/gPHsiVkAbVxdJr8lRCracUmcMVL9dOUYzvCrOanHZu662FyRx0GRepZLkpZ3YITLw
	W872piOI3KA21e7r5ZiSuwKw=
X-Received: by 2002:a05:7301:1f14:b0:2b7:3835:21f0 with SMTP id
 5a478bee46e88-2b76420a89amr1152037eec.2.1769428014494; Mon, 26 Jan 2026
 03:46:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
 <ed48e82a-cb94-477f-83c4-b2d87ae3cde6@suse.de> <DFYG7MT5JINY.1T8ZZ4ASIWXU@nvidia.com>
In-Reply-To: <DFYG7MT5JINY.1T8ZZ4ASIWXU@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 12:46:41 +0100
X-Gm-Features: AZwV_QiVehF8RRi7itklBIsdJdhL1p075lkEaX9CIFh4ljGe-kX6fmrMO2Whn90
Message-ID: <CANiq72kRhkLKcc279CacJ8CnQ18JEZ4A9-vkcg_k4Jw88O4EDw@mail.gmail.com>
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
To: Alexandre Courbot <acourbot@nvidia.com>, pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Zsolt Kajtar <soci@c64.rulez.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 11:28=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> This, and the patchset is also obviously AI-generated.

pengfuyuan: the generated content guidelines I mentioned earlier this
month in another of your patches have been merged now, please read:

    https://docs.kernel.org/next/process/generated-content.html

Thanks!

Cheers,
Miguel
