Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7E23E358
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755504270; cv=none; b=JF3+ZwMXYSqwhSfD2HbeUnqKScjSKacKff6DWjEEwyJkcCcC4nlY8nrgZY/BJYKGJWP3JQML0chhx9L9Zou9wYUuE/D0jBYWXGI1Y7G/hWSEQ9ra9xp06UffTMfDD6dfKdcDdnTZnZwnMkFFkIxpHzJ5EKbJaxs8HMCUZ/2OqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755504270; c=relaxed/simple;
	bh=+ogGHNp5B2vuw8Sx3cR50dRQPqv7sPx9Uj4pSENJ8eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6ehkHc1CvvzF/24ZEB7aJZyqTxdHHTeltkf54mNBtPC3y/wT1oeBV4ktme/j2n9njqZHCgSAcAq/iMh8q0oAK5gX75MmmcQNijnBVcRVElRQQifRwXPz3aB6/ulufh0E/ATgQVG2BpxcrcIeGW5Fy32FFI15Ip5Xi2g9wvtsvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wkolqyu/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wkolqyu/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e418ba08so2168854f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755504267; x=1756109067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ogGHNp5B2vuw8Sx3cR50dRQPqv7sPx9Uj4pSENJ8eI=;
        b=Wkolqyu/+7gjEymkd5EfbpQ4sKgwlle1xv3Omwa66DAwGACFoxKiGJUKVYW4NYZayC
         qMorlle65vAlRUZEKUdvpvA7H/9Q6qr/dwfMmii8HwZr2h9HHl/7579U5ZcBRXhxyO1w
         YF4zkm+KCraamRZD+zrpvERZV50p3Wm5O62lJ9ycez6QjALqOnIu3i6v+0jGbUN7fMxh
         U+NPEv9UQhlcR9xU/7CywN++1scd09szxSxH2vTTB9NkCuxrfMQMNucOhPQmC5iNeKZg
         KQUve7M2X8B+BhwkfpYiae76YCcLxL+e0TMaI1Ycn3nf3a5wkFopn1ez8ibKsNBi9qyQ
         9z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504267; x=1756109067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ogGHNp5B2vuw8Sx3cR50dRQPqv7sPx9Uj4pSENJ8eI=;
        b=fG5RP4beDm84ZOAsNBJu9s5hAUC8oIZf2ywR805bTWkH/jNXeXA2QyrnXil0iTcoy6
         p+T17saBrJ3PStSV+5sLtwAONoDfMt8ppu5npCDnfqAMq1zhOB/MENesysc9nlLr/Lcz
         aD9l4voB166KI+ys4GUz+GwDOkZ/jlJwWZWWi2tMk+lpPvCJMQGDfIH87ZaM5cC97Mro
         LA7Cxbl2wF6D25wBrCt/uzgYtjDc2fhdQwWM0u0k3h0rZuzGYdHWVZo3LazfFEZN98rz
         /MfWapjI37YZyLXRv141KRHTTz4nbQN683MOplixGz6+9tRzEOUnOcdrb8KJlpcW5NRw
         0PKA==
X-Forwarded-Encrypted: i=1; AJvYcCXWLtFb3JafGhCOJZjqtBTotbsvOu0WKQg3tC/pqYG+dEetJJDrxM05a9QCi/8AgLGahnKlmeKUBpsCM7z14g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6h9+MABYlEgQSnB8TMrD+x9vXEQNDf7vhPbkkrkr2GHL6HxJt
	FhKyDveWw5DkBNwgLHP5GumHvpe+yA7JOhBEDCW4wXAsK1SEI352HTO85537Kn07KOttupwWlAT
	Y2Nz33Bw0Eu7jXruP8qJXcEsZQPmbZMlJWe30XTX5
X-Gm-Gg: ASbGncuRKoSUkR/MxcsACBAaV/XEqBOeVE/rjFdkZdOm7plFi/6KzK/hmOsxNwf51l0
	qTvHZonhk6mUXZ6+LO198WlnZfPYmrmZor3uiInj8oLGu0kd2q9vLWQMTX5qB1zw+87TVcjMgj7
	6z6YvItehoGZLd4AkwSptI7L23IQit1Z8mQLSQmi3jmZLyYvj0Ruegx/oYVthYn/EDo6Xl7OvTW
	HVaeBwQgluxUWXecjl4itwHnlqnv0emjrz6l/w34cKaHS5qBZQlKkJiw/Bu31+QWw==
X-Google-Smtp-Source: AGHT+IH5aPA+4lsEWIpz23XPee5Gucilm6/jJy0D1IJSOLJ53lXfZLmhPLBb0e339QHvRNfI1jCf5ECE7BVeDepIOLQ=
X-Received: by 2002:a5d:5849:0:b0:3b7:9d87:97c6 with SMTP id
 ffacd0b85a97d-3bc6aa272aemr6301618f8f.44.1755504266794; Mon, 18 Aug 2025
 01:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818012648.1841387-1-lingfuyi@126.com>
In-Reply-To: <20250818012648.1841387-1-lingfuyi@126.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Aug 2025 10:04:11 +0200
X-Gm-Features: Ac12FXzx_I9gusmbozL2_QUwPunlyuZ1-_AVDrLW-ZxrD10YAx95V3gJEW6eTDk
Message-ID: <CAH5fLgh0OSDnVDwO1wY9kd3UjVqaYvk-jJA-nwiz2ghR0Yu3Zg@mail.gmail.com>
Subject: Re: [PATCH] rust: xarray: optimize lock functions with inline attribute
To: lingfuyi@126.com
Cc: Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lingfuyi <lingfuyi@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 3:27=E2=80=AFAM <lingfuyi@126.com> wrote:
>
> From: lingfuyi <lingfuyi@kylinos.cn>
>
> The XArray lock and try_lock functions are simple wrappers around
> the C functions xa_lock and xa_trylock. These Rust functions don't
> add significant logic beyond the unsafe FFI calls and safety guarantees.
>
> Mark them as inline to avoid unnecessary function call overhead in
> hot paths where XArray locking is frequent, such as in page cache
> operations and other kernel data structure management.
>
> This follows the same optimization pattern as other Rust kernel
> modules where simple C function wrappers are marked inline to
> improve performance.
>
> Signed-off-by: lingfuyi <lingfuyi@kylinos.cn>

Thanks for the patch. Please see the Developer=E2=80=99s Certificate of Ori=
gin 1.1
https://docs.kernel.org/process/submitting-patches.html#developer-s-certifi=
cate-of-origin-1-1

You need to use a known identity such as your real name to submit
patches to the kernel. Anonymous contributions aren't possible.

Also please include a version number in the email subject when sending
a new version of a patch.

Alice
