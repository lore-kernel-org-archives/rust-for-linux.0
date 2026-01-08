Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498EF4A33FB
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869755; cv=none; b=AKBFSinL/8Hv7netK8552yztLKMn4Ke6AxDRVh0Zp3PTh2jpFQhSQZGk9IwdykrTBMTzR6lYpHY0XB+DCrEdLK4HN1PVX+lKzn2OUqyRxsvWF8gYWD1+mNelHEOqzyzcLZ+UOhbuQMZJ/R4d/gi5r229Djbtr65xXxrt4MGqj9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869755; c=relaxed/simple;
	bh=oyvpgM56Ikoij0yrgLTrbP84c0z10O3XMYdDvUa+I88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DerzJYrS9nkAhc6V07miRUtLEJfjr6lg3NPwdwz4WCVHHvSkPuIVujGz/Xp3JQsVzWPlHr9uKhhIrz5TNfW+tImnhDebnfAbnXyYMJ9SlX5JptthYT62ckA1bIvvC8h8eaDkeOvvai1cBYxuRvQLit7hDznKKbStUFduZYcMVU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9gDRX5j; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9gDRX5j"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-121a15dacd1so227127c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 02:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869737; x=1768474537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyvpgM56Ikoij0yrgLTrbP84c0z10O3XMYdDvUa+I88=;
        b=m9gDRX5jkfKWxJ5JdjRLjZ5Ibj4CAwEyGZvg2TkOWwlM+9oiTe+zbCQY6nCvIstQ9d
         TjiM+zgrKVeM4RJms0aYIJsNETEgpqoPoTRnYXod2+SnPq2oFhy4/mWvNy1LJZYudtD/
         MLL51gnm4WXDsOruWr7gPtxncXW2RaRNQySG5y4xbZuFUaTruzVAkV6RPAJmVpgt8At7
         c9pcruJpuXDBRXF+SdCRV5wJn01OON2NUw9lVaqeWCGuM3HfyCd8djiHPbI+wVWGX6Ma
         JM9BA2f0Qbvkg5BvlrFR7OIcTWhRlbY1UpcEOlEE3eJ48979oqgW7EKy7mEHQ1sNvj/H
         nK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869737; x=1768474537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oyvpgM56Ikoij0yrgLTrbP84c0z10O3XMYdDvUa+I88=;
        b=opFkzqKTCl6JAXXpXrSe8Cwi3E4UixjefwNUNjpiW3I8SidcQgpu2m4G0Rx08Vy/FJ
         laaXWy5jt7/KFSkrzSAqPxJuPRdM6rHurAhpk3egAD05B4xSyaFs9xW/TXOgSaX+KcjC
         /vypJLDi72eZ5UoEyiAr9BpkATi/TGn+HDjWG2GQuqChgsX01pa0S0hOLq7J0vkzIqyW
         l0mGLbzL1W1yiSPSNIZh0+D8KAx/EHoXa2aci6gwh66bNpfnhjxWUAR256EVyxoRdPD5
         vzeTWVSZw6CeRlLDAR8lAiqB1rtQd6geI7YyMrUdDRyRwkMdl4AF5FGQ0Mscsc4MmM8u
         +Y1w==
X-Forwarded-Encrypted: i=1; AJvYcCUXxRfy2Eoxr+spYzvrnjC/GKIjyeI2QPUhJ8KJBjMp5qAUYUB6+h/SqREZ2vr4xdJK8nXR27BdvEiFmICrkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPtrk2PEVLRQkuRPHqlqqC9rsABHoDBgoLt7jpNnBCMdmgRNWo
	71Ywswhkw7h3/+z4GdgO0qYduhGtQRMANht5bgnsemIuTuZLdQ+7jelY1Ud5OiLCgPgsp4Acss0
	+kXqOdPUjKna0ZYA/qihuGLWXL3uYOgA=
X-Gm-Gg: AY/fxX5UQCSWDAuIJgXY1ZApkIGZgtlfIzl2V1lxXd8D35rFnXDtFmk4buqRlzgExE+
	oFUWybN3habDNtPRZWhFjmEl75q5u9m7rzrH/BhXpfyzznLInEKxH4OqzoQi+yGu/aVYvZdWg0h
	syOnD8kM7GKBRbjUrJ5hUIBK0nOxFsTYYJ+HrEn7vdJ8CCDV6HTYSzxE095qxKPhZwbU20u3P5L
	VwBwbS515lp7fujs1BoryboJ5Puug6HnxQlYENEoAO239n88x4r5X0rYlCNhAgk6gPPQUDYa/81
	BjwlTOpclW/50wzA79ihPgcwTcILrZ0YI1FhrZvPuEm6Lfx8jB8E9u4k1iSqf/tMGPzQYGTN6I7
	B3OAbpg+qW4yh/TTsI+wdNpk=
X-Google-Smtp-Source: AGHT+IG6yy8sfalAt+fbToPeH+tSP63hSqN/NenXSfXXSRSOUPaalnWnWUmYYZQtDIwZeEIR9WWcMv7KyexQDFrQ1Co=
X-Received: by 2002:a05:7301:2a24:b0:2ae:5e96:9d1b with SMTP id
 5a478bee46e88-2b17d2e371cmr2672530eec.5.1767869737410; Thu, 08 Jan 2026
 02:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108085545.333676-1-pengfuyuan@kylinos.cn> <CANiq72=Vd=Rwi6Mr2vgEZHz+iZ=-cYHxEXvsgJnpA2uqd2tUtg@mail.gmail.com>
In-Reply-To: <CANiq72=Vd=Rwi6Mr2vgEZHz+iZ=-cYHxEXvsgJnpA2uqd2tUtg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 11:55:24 +0100
X-Gm-Features: AQt7F2q-TMTFFqGRhl50bxXSKog_Q85_Szw7KV1C2eSi61_B2fmiI0S9LvkvbCA
Message-ID: <CANiq72=cdUGYcy7Ce3droMT1A0kuP-Biwn8UYVDo05dLZaAD6Q@mail.gmail.com>
Subject: Re: [PATCH] rust: device: add platdata accessors
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 11:46=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks!

By the way, was this LLM-generated?

I am asking since tools usage is supposed to be disclosed (the kernel
will probably codify this soon explicitly), and given the comments and
documentation here sounded to me a bit like that, and since someone
from your email domain also said recently that they used AI.

Thanks!

Cheers,
Miguel
