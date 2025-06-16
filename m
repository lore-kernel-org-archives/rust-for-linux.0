Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936DF2980BF
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070996; cv=none; b=YBTHk5zzJtyeQ6/3r80Xvgux0BhPX0awoGyrdHAZ2UGv978TPN518XEpL6jBiv9+jmEvQgKmPoazfhp/gPLS/82a6A5nRXX2EkThBHdhyL6RQG2BTGQV5SSVxLJ81CCq0BlEY4j9bhebpdU4vXtXIhIJwScXFteuidCPz3Sk4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070996; c=relaxed/simple;
	bh=fgAbH+bqMDdFSxa5Nsg900AieTB/XPyHcssZQxwzQvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kt8DR9IFCU9giHu3Sg9dA1wwLti0T973Z28owBKBUWUt8PqOI9QAqeFWGoo7EvMI5ilLuJQ9+8UhkF4I0Lhrops/IHSIlydlrhrd5R63chZ5a2j0eMqPdBZXjn+vin2ajnuxghQ+/auIi0yJzw92Vlbnh8BN0f6k5g6eTveSCZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OBcnlKMa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OBcnlKMa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453398e90e9so21367855e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750070993; x=1750675793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noASFFqKv9QR1JcSSNjGq2HTnkr+7eqAct6g0x+3TVU=;
        b=OBcnlKMaqNC2WOlTeGBmZbP1DYtdgWbUgbvF446lFQZV+9M1F/mYJPw4jjhK0i38hT
         2sLxaBiWaGUUL+azGAhFL7zgpJvqn5g74oULrWoFX3gtf6CISW11jNPRkOtgJ+YL5dAV
         wcgQ5dlzJw/fuWqug4MpRYDfVU5sujAiDB6TiwUhrIvrO1xrTmZyr4YPQ2NwiKQ5YRze
         KvuBYvuveubzHWWKXUJ7PnnhsfMTrwNTDAfrznQCyInKOh0+ZV4HaaBwgJ3B/QLcHB8W
         JuLA/mbHQAsZoeDgxrt8BoBZ/4AlYLfflvevd0kKUgd3Wvk9BMSTxul1yaTSB53Njf9V
         BfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070993; x=1750675793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noASFFqKv9QR1JcSSNjGq2HTnkr+7eqAct6g0x+3TVU=;
        b=H800oJifUHG06gls0Ed9ZfWEdTSmPNj7xZ41HKxiMUGineIn6V9d2IkDUjWRGBav21
         vu3wvcxmjy/BTpUw5gOdjvqi2gsMmx4ZfjLk1xBl0+ItyfmUmx6DvZGCFWXLtqOVtPUn
         SkI6owizD/xw8Xc6IvyrzN2rG2xEXJogaQqQDDrAiZSPZXIC2fAEAsd7vE7Vze7nZR6s
         UT73pa2kfzz4+tiHFv8fOyEi2W6ob8uZvJP0IXBKqq1jfTbabXqj95TyF+CfXDrp1epA
         mvTD3/8ZEn/OFBeO7IcSETy5GOrIPmCIMIUkBBMXfkEe+ujJHtk/SD90hB+TRliZd5c5
         NSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzUHgLxoUBMVS3/ewsiIhH30/KC3309R8NjBL4svJlQMTghY+ajSb6joClOrZ3pIaiXDWC/7uDNvTwsB0ZEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFtZQxPAqj2gZbHU96S49FnRR3KqMdsp7xKEa3wrSI5CisOim
	HDRXACXMwXnmaNls3RH3dNunS2Kc9rJbKuKHycWSXdAM8mgkRvZaspC85FP7cjQLoID10aOx0nP
	WxkPU5H++SgVWS+hxpvznUWe7vMDsVoWb8qq1tIm0
X-Gm-Gg: ASbGncu/cZ446QSaVtmyMbfXCoGaM4nV4VC4AAGQACN5H3Ia35QvJ006Nw5i47V40Dw
	X8W20kdnLkbF+8/0UWm1rhLtgIjqUBs7ASieR7ji4vwO/9XpHP+1ATkmBMcivIWLXIGBNHrkMV/
	tNtE9QP3S3UtaooZ4bXSkp73lf+EEjuyj1dQ8FYyMl0S8cWd8s3tzPbjI=
X-Google-Smtp-Source: AGHT+IF5tKVn0HH4+Er7S+XZNod2FyfrS9dHKNqy5QhSTc4SSiK6Xgx8ZEz8Nlngk9yhomQM63HB2J6yh0gSTliC484=
X-Received: by 2002:a05:6000:188b:b0:3a4:ef0d:e614 with SMTP id
 ffacd0b85a97d-3a572e79d24mr7089351f8f.33.1750070992846; Mon, 16 Jun 2025
 03:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com> <20250611194840.877308-4-bqe@google.com>
In-Reply-To: <20250611194840.877308-4-bqe@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 16 Jun 2025 12:49:40 +0200
X-Gm-Features: AX0GCFuTb5n8MBWBEa5YiiJmxDs0pB6vkofAmmHr2Oh2WDSvt3-JtKcoydHZXtM
Message-ID: <CAH5fLgiMCZuaCSYRDLCpZjaa=EZ=Zaw4y54zDED-7ox9K9++2g@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: add bitmap API.
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:48=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
> +impl core::ops::DerefMut for Bitmap {
> +    fn deref_mut(&mut self) -> &mut CBitmap {
> +        let ptr =3D if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> +            // SAFETY: Bitmap is represented inline.
> +            unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
> +        } else {
> +            // SAFETY: Bitmap is represented as array of `unsigned long`=
.
> +            unsafe { self.repr.ptr.as_mut() }

Nit: You want NonNull::as_mut_ptr() here.

Alice
