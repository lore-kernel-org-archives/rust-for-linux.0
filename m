Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A7F231C91
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767123716; cv=none; b=XbH7phI0GXANyVU+7sdFQWamlAabDrGudgcaG9S6dvGCTKUC5hNTS3ScHwM94T4VEIzN2iVeAkZ2g3bLO0Y1oqR36zLzKod1xC8jsc0SlA8B/Tj8hFHsfOkxHePPm89/FN580JsiiUprIzKskn1co5/sYqfYV4V4Q7lpUlwkM4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767123716; c=relaxed/simple;
	bh=ytfosga1cFuN6dRFvqF1Wn61vQ4YevEtZdzPUd7vT6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnkBCHngn1glj3C9Bx5Ms3CNwFCelXlxqTmg6OkwW9kru6YQ9XuQ9MX9B0NKK7vu+WQWmjI/NQxQPw/AeOSrdU2cDyN3crbURAkUjxvOe6waKLnxuJId0ETuoCN72M5fThnkoY12LfmdS0xv9rkehqM9NTb6oNxed9S898cOJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZw3dO15; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZw3dO15"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a097cc08d5so25436275ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 11:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767123714; x=1767728514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANHCCeyMi+NPhlCtgSl+3/HAmBGOzX0nby5Ty8LItOc=;
        b=kZw3dO15C6FZ1RSNsbH+rtwy7I5JxSiAeyYeFfkvhTDeauh5fHZQTDgP1k77C8VBWz
         slKToAWpCHyBCDguUJXk4/cv0j+OpBO+STMhgGFEGpp9eg1F7UzlXP3rYP5loJGMIkzj
         GPjz7cO1EzGOiVXztZTqlTkKN+2mewfv60+zUbwh77W095rAGgWslqUBJ1pZeXyDQN2U
         F0gmQh5hIMNq4fYAwWwYgvo8k6vdsgKuUdRiIO/irhk7hfUT1s3ptKPDaxO+tyFLMQaM
         1pLvS3S0+eT+xHYj8sWpoFSSvBEkam93x52vls4p3LbbfcXnOFPOXcfXyYphIdw9fibd
         rxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767123714; x=1767728514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANHCCeyMi+NPhlCtgSl+3/HAmBGOzX0nby5Ty8LItOc=;
        b=JFDrA8PbjRWYPeH4mv4M892TowJpTVcAGmONmzLG83qazzIDNwhG9XlyZaBHXyfySO
         4UPVXBTxxSMEKAk46do3qRZSvh4uY5ILmQ8Ss+6gnTb7omfMvu1a8Bv4EzWmSd0grLhL
         FTT6OIHDoX1Jp/21Xnhs+MpmcJwZ34BTQyYM/5n9QkI8VVRSjNQ46a+MyPbVyHmaLEqJ
         zcCp5qUBqp3p6A0A07wokDbQtLAK2RT6Khg3NiMA26SyDDOtiVJWppjZAWMMHJEYNY0g
         XPcCgLAcs/40T83enMqEv8yAcYKg12uz2GEyvZOwii2NEXSlNuxlCil4Tsb0/wnyh2Hi
         PGhg==
X-Forwarded-Encrypted: i=1; AJvYcCWr4cH/NykaMJWAQ3a4BOwZ2lVcGoWtNQLcMzWo1ioDyYeXKVHz8D50cpS7LXD46CH5WhBhya2ygXHsspEDbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyeAdwUqa9qkboQJElNIwozqxJqWfGBYoKNwsTN9O8F1wL/2Wq
	WcH7YNJzf8iIE5qhX5hERJ7/kX3Yz8CF1NcbR/FjPlvm9cnxO/E0X+WMzJugrtguVjTiGN5EdwS
	kcgVFE9VPR1fMuvjHsQKhD01uxArMnGU=
X-Gm-Gg: AY/fxX7fD60CjTrvBbcEs3YT3AwOZ9Y+B7ClEC7VUmgB5TNos7QPBMtRc3Z+/VVGnvO
	kq+X0eIpPzFmM8ND0YB7k9dNZvkGWLIHqR6V9AgigHIjkzmm50JGszMDOxKzAFas4nRC1W5MiLO
	nih1yu+X+/fVP1Mj7mVooptijUbsTMg6hBhRhj7qOjRp01PO9FojbGM0yIyRq1r31e6lI2Q0NXx
	x8BIQJ/AUYHLv1FCIDz26uwrlfQsHZ9Eik2Joh4/qeAy8nNxPOIMKwUOsXglq7lInRQshDJOurF
	sAEkfjuPhMkSMcGA6HS2JlLeF6uifJ4sVx8W+gBuGnyEYz9d9FSAqeTs/72bwOLN2rG9fSL1Ckz
	Ks6icJgilatpV
X-Google-Smtp-Source: AGHT+IEJyJWDrSGpVqGBfUuWi4prAVX3F6tbOOWTv8OHWEOlkbOPp8abJW+FBFy6e/OAD49/fUd1Dr82TKSb4GU1Nk4=
X-Received: by 2002:a05:7301:192a:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2b05eb8444bmr13936339eec.2.1767123714421; Tue, 30 Dec 2025
 11:41:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230-add-entropy-v4-1-fa9485b6d372@google.com>
In-Reply-To: <20251230-add-entropy-v4-1-fa9485b6d372@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Dec 2025 20:41:40 +0100
X-Gm-Features: AQt7F2pkiLy0ughZnh3KoFPtNyas5zAEMCXd_XO_Gn4k1eBQRThgoIChSeXABQ8
Message-ID: <CANiq72kDuHeJ9-FBV6yFy6OZXeKQTBwhp-7d5uTuBD9C8cxJcQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Add support for feeding entropy to randomness pool
To: Matthew Maurer <mmaurer@google.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 6:54=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
>  rust/kernel/random.rs | 17 +++++++++++++++++

We should add this to either "RANDOM NUMBER DRIVER" or add a new
`MAINTAINERS` entry (as a sub-entry of that one, or perhaps of the
Rust one), depending on what the maintainers prefer.

RANDOM NUMBER DRIVER (Ted, Jason) was not Cc'd, so I am doing it here.

Thanks!

Cheers,
Miguel
