Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B639733E
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788688630; cv=pass; b=Z7/jMJ6eWxnofUDeKGJPIQ7Uwi+nSBNusjCjMoFuGWuZ2JR24dFsIU3w5Sy/RktA5qwGN79IOhwosrYwsFor3IwKrVEJZcdZ/k5SlnZqeJ8GDnnx6tXyVEXQZaty1jVMtk5FgN6vChd58wczVjlLX/w7D+j1oAJ1uK5h8PIV52Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788688630; c=relaxed/simple;
	bh=U13cH0KPgJnKYO004jjmqA/IoRiQ83LwE2ozRFiKgzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbhMNaCFLdJIB+9cCN+xc5htQdP4AyEJnPQRYrlep+JsMjsUV/7eNT7NHNIVc64qyCaAxphSIft/lwTI8mHLeqgyu9ASrTx7ZgCWRwtkDOptidUIsmnVgCHcItMrsf80zTk/aK/nldQfnRs/9LeXqULZoVcAhQOzl7IO9tR76KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hu1kb8+D; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hu1kb8+D"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-399026951a2so293536a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 02:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788688628; cv=none;
        d=google.com; s=arc-20260327;
        b=hFhLlJk88hs0SeQYu0Grwvp4itrTWHumhocPE1C71SnOj4UGJAolrRX4ZNWREGe9Fv
         dlJolVCafimG0D0BPeizyCAMqaG+qDet2oxB/kTQONM1+oiqKz9e4+79NhCjYGMkxBQ+
         EIfOrgMN64wjQfkZ1+uHmfZ7vCU6+M2jlCxvQ8tDoxjjnHhQ3PtTAN/q+RxFW7ZaRPog
         chb5GsTUcMAvJYardhRqa0PL72CXbYck6NBsaMxK9r9oyYhbYozO6p+d9yu7X3lyxfMI
         jCOi7M2JqDFZywtfjoQbEdLR+ureFJzWUq5GfD1mPYLk+KQ0BulkvBzmpqOB/W1M0KKb
         CDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        fh=B7YAmcunTQzWZ+3ja3bkW1eJMQp+Ybee3+hyLOH5owo=;
        b=MzGFTAXaMxFL3Il7+QSbCjWu8hbE5NpYdRFt6uugSy93Bq2BaFlJeG5T5IYohhj/6d
         F+93KTSLVarwLuK0qwjBGXzkXP7o0zYD/A3FkDhzxBIXL0aZ5oLDD7kYnVT5QLmHwQsZ
         Jk7QdaFxlJTJSovEdYVHHYEvy1gzDa5r70QrkkVz1RpIRyixOFzuaCcvSNlPki8YyIv3
         VuopjsrlKM6XaRXO5Hy1qApnVJM8JvRBnCpEJHoOwVfQJrJZ9siSs2fbJUChOpmXJAzc
         0PxruJ4bNb6JPxG3saMGteJFZ4RsQ2psnb9i8cWZ49hCfiEWqz8VBZpF6CgIark2GRhd
         mzsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788688628; x=1789293428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        b=Hu1kb8+DUmdvY0GX1WOsprHnENusDc4jSlgGCj3mcghmMb+WlfnDPwlMYM0IyKGMOy
         1tzw703XU0Mpx5z+/H7gI2UBM7JxK5s+TKYSzGVy7uPnS5kNn2mZ0fOFx1a9xwIQE0xP
         IcuQ4nHYGeYPDAnrIxNgwQkbGKbeWeA2x2DsyPZ5isKx7iB12bqx1o+IYgftxwzujq94
         cuxeKdaA8m3gHTSHcF+6LAPL/weAIS1XjCCyoA2/nu/lkaeJ4LwPC0V647usK4vkL5bL
         t1FCDcObN5qvRdfpZkTwcvqLRWw8jBBkM13EkmiTiI12RpvK/t9e4KP2km57A/cKYe/s
         NudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788688628; x=1789293428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        b=OqLmVGJKzhd9E4FEMWJz4pNtYrLwvWe6OqqX+Bvc6xo6yGl6AJrMGdNqePIs1+Rtu8
         L4ffBRdTmu/pKPpjnO79QNPa76ym+eCRQR2h+yrc7frqElsevG9gzZ4trIO3CgFFYdJO
         JE4w9sZib5ohdCqD93NMjGn0IzbifW8QA3TDLxL/wlblft4Tqg7cvQHncHByX4uJ1Vrx
         CKLoWEUBWjGRNCTN1GCOfyfNmSThHTzzxqamZwjeQ5Q1PjOIykD+LsYGarvwSS1GZzLl
         mTWWz/J3pKp7+0N/m3btNjNFFb7+oveDN21op4hCNzqARCNTVvklK/i1Omfy/oMx95qP
         ZqAg==
X-Forwarded-Encrypted: i=1; AKwUvBzIvd9l45o3KXBO2QjgHc8WlximgmKkypyLTvulKEtR3VNL17dLyNWbJghnhvmdKOobfUhUN/ewaKvVt+yrtg==@vger.kernel.org
X-Gm-Message-State: AFuF++l6lySGW/vhbq0oegfBfTWVFdB2lOhibvh/eV6jcdObTNS5emTB
	YZHvePU3Iwkvvpw+ANE/Ew3D4gU4ErMLjtpMxs+URflgE2L30A1kRq5RSmadMEho0WVpOETVmEw
	+QPfZCzOQaJXiY4Psk1O8KHbF/ceuS6E=
X-Gm-Gg: AYBFou1qamxPjkNMFujZtXlpmRXtnCgRxWTBSewi9lLEyjCC9fqO/g1zaoI/lMD/91t
	p+tPekvSHsMlwYobbslAfAIxCLIZrZ9VOHDOK1kfQjeQ05n1Zl+FYhhuKWYRnPu5DACuADBVaHj
	V5LBcA1fFox1vzN5PDsUEH73qBrozCn4ciDqCjEbftfc4KYfqidf9B4W3XI1tOEITnkdhroyWbr
	qdu79TlcPQQslK5ZCe7MOYAeOppCdlOv7vhoAA9IVocYqCyAxmFbyftJM8d/WzCFbAEGcUubbr9
	+l11F5xhscxUuV42Vv/6D5HFWEJv1iQQhH0JhXHHQ5gMwyMnpF/qWhn0lLbvQ35+4gkK9Dqli1D
	TEOj0ea2/9frCmao/fQh7KLyb1+oYiP68KAQOZFovT94mIJxwHI01znnckoBAwczsjimt5e4=
X-Received: by 2002:a17:90b:1d83:b0:398:bad2:c10 with SMTP id
 98e67ed59e1d1-39b3d85c011mr8915334a91.6.1788688628452; Sun, 06 Sep 2026
 02:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com> <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 11:56:54 +0200
X-Gm-Features: AcwNN1WxK9zUI7wnq5z3F0MENjsFCu4a4OjUAQj32Gwuj-9LPj41p02F_uyi-BY
Message-ID: <CANiq72m6YZhqzE7GWEakmsZ35QN5UF_HTcVBavKxbq8cV7yk6A@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
To: Kohei Ito <koheiito.dev@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 10:46=E2=80=AFAM Kohei Ito <koheiito.dev@gmail.com> =
wrote:
>
> Add the top-level GPIO module with minimal common definitions. This
> module is the basis for future Rust GPIO extensions.

Thanks & welcome!

I see you Cc'd linux-gpio, which is good, but the GPIO maintainers
should be Cc'd too, since they are the ones that will be deciding on
this -- doing it for you in this one so that they are in the loop.

By the way, it is nice to see GPIO again :) Now that some years have
passed, how does it compare to

  https://lwn.net/Articles/863459/

?

Cheers,
Miguel
