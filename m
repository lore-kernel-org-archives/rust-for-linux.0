Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117D282F3C
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466204; cv=pass; b=cppNySCMsdQL3kJuuqQG7nUptfmSPuEck2HQF91BGfTjzvxaaBic63tBhJw9x1Qy1WBHbVlvmshR8GInIWrfMOa8CXyrXNqXMwt5nNGBv8liOZO3j1Rqyr4enEN6SVerRjc3r5hzfHNvtisqNOYGsjOeiT25b+Fwlv/wLOk+Kas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466204; c=relaxed/simple;
	bh=R2dHTJQnBLz14FBWbb+c8la9tQYirU1vpp38y1sgoA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnsYx/Sg9ttGwZac/BE/pVpXIXoe6gtlBEisgTBmx2cQErbuYPB1RXcBC9QH8titVp+K2Sw2wtXddrTncubCF2VlyoV0tvuMFdxCTLhsKZ+GgTySAMHd1aB8R97KwMnYQpGJcRt2dt2+2Vhjc3oY2ERV8lLebvalw00HFyxSF5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIATw31B; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIATw31B"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so171492eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 02:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775466202; cv=none;
        d=google.com; s=arc-20240605;
        b=YWBwKPCo7rU8C2yE2P1Qyx5/l5N5nTntRi7DuFFFnv5pSnVnDG/vdVfEtfh2HrsbHN
         1cGhqR0nXNrdkJhkFuuJ2I0samPnWVprkCJXGvvskz9s4YcfAtGTtcbLZTcBhPKxfMpP
         DYTDDF7PioOkABdIuCbiXlLzTal4rQVLDNrSRJ21V7cLC/Lbg/RmxItkjKZYfedlL12Y
         oWVvp3UlRHG7rdA6ISLQwkk/+g9XRqwg6C49jNM9mT+4f0cUYbrjn1gBZSXOY9U4hog9
         v/Yy3LredVuojCYO5V92s/uoTD2NZtTTYYdfFSJF6ky7nBDTBBWW/JCqK4zbqIJRvcjx
         AkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        fh=aT6FqL/ergOuhUWSbvQvHLfSLoUQBdDIYnJsrs6PV4s=;
        b=eTiJL9qBRa4zsaun4mgChBtQakNY0LuzWgPKlgwEcghxsjtkCjBS9JWA1t6XSn4VN2
         pk6aV2GerGohVtoSu2awzZY7j4eZs0ROz94sEdwXQrN/4rRVkWksfdDElOvYvc5/L/+w
         MOvPVgmwT7EV1oQl6CtfgcDPFReNpvqSrQq1shdS0n/IU7q53S4B1fFucJwAikYFH/Ry
         juLqMVof9BCdJDr2Ys41la8M50YOwWrurxUE7Su3T4Yjj+s2gG3KAzSKappIKGCu0aRl
         O0ohygv6mnpsm6WPsR+7LHv32j1+9/Q7s9NwD0TKqVLQL4rujtu6ecHDbDOofeAN0OtG
         qAhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466202; x=1776071002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=PIATw31Bk+3hkggZjJ21LYlWRCEdonuXrhStaxjfpeEy+RZoMphpX1G6fDXJDfirK0
         Lcix84JqgjmxFvtJfqRfPYEpHGb1ZhF83nIFw3O8IG8D1d9G4/P2un8SlPIrkQlKDQvS
         kAjTgHjN9voZ48IaKsTLutwUAdxm01rYT/4srX8EaIwQURRnjXuJteiO0uary5DO+b1y
         eIHYD5+mctWtaH77V7OyvOW7r4QVs3CY/XzcE6cCxPuvfHIp2DtxiKgzIF0EMRv1ON+k
         6WsWVXYwGXy8FB5vlCj+jWDIFXrgcqNUpc1z7vi6MIUB1fjeeM+HBhDZVaiEGtXGmhmh
         Zktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466202; x=1776071002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=aO/K8GiS6jvZxf7l8MedH+BOHlWnkwS5vhBBx57pPO8fJ9D50v8gydQo7irVfDU5vP
         avS3vxjd5VAeuVihvEQkaXQI4TBKponi3SNDJ52r6Sw0tRNih/trv5xhOyjHLUay9GRs
         th8lT+dsNVmNeYrlhZOvZgBrJveSptl/hCwFCaVn++/L9MAEL+S/y2ImNE4MMuhx5Y/T
         +QNAxKyjUzc+3YhDqhAOME885bPJ6BpCsuHwvKvMcdNBBgYqtneil1D/MR3k7jmIpVJM
         zkVoU//h9YtpqNpdq1lJj77e7pCPzd2ocRgSrlrNQMlTdQvZ9zNVqazsU6OVAVYehm7Y
         hq7w==
X-Forwarded-Encrypted: i=1; AJvYcCVnjy/kwZPIQaRsVZlMsSiJwb2guKALhWfd74v4svP0kxu7HFYZx4LCx6sWN4wvuApghg5folv1tZxUX1jp5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLJK3nvcKZFuUiF4EPeR1h8cQbCJLDGo2fV0IboyKY54h2t5i
	9SX2gBsPRxe0FBR/0/nsEEXDHTmOeAaVowvLGmZ+7QsbejQwPw5zuHpX9AbRlySpnXN/7RFBnYE
	d7BivZzmFTk8dEIp7e5qUxbcxbDrPKZo=
X-Gm-Gg: AeBDietq1Ym7CP5Fr3yUdPvEngqKqLEbQutGmvM0fRH/rOrsdNtmd9nLORXNrw1GI/h
	+Z5QpUQVutFiCpkaa9DLCOmvukfGxH0y2y6STFQ44DjmuVWlKSjRpOkLDM8y10JMijuzhBfvA1r
	nqroI4WbTfUP0sDX7PNcwi9Z3TngWRmzJo/ro/+veyvjVFqFQ0Bf0ypER9EI4215qw3/5RwpyFM
	vJDcIxk544rp73FO2syc0OFH8mRk4m+BhJUGU4O449Z/ccJ0bPXy6XcYeaIkHmEdNR7KJs8tiNE
	IpMMZYHoUD9jlWHAX1xbRJr2S/wrlpp5+rues0Eo0bLNCbsrfPns3IDAPV/Jkfgs2BRDK2IY/eq
	Ob3xOiDPAX/FX6DeWUx3xUWE=
X-Received: by 2002:a05:7300:2315:b0:2c4:76a3:bdfc with SMTP id
 5a478bee46e88-2cbf6897126mr2280931eec.0.1775466202269; Mon, 06 Apr 2026
 02:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 11:03:08 +0200
X-Gm-Features: AQROBzDwpcCEtASRfptsJ0WJ2jdyaJlOCl6SPsL-e-w0TnWmNnUbHOjTvtft1Wo
Message-ID: <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 1:53=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>
> Debian Trixie was released with `bindgen` 0.71.1, which it also still
> uses to this day [4].
>
> Debian Trixie's release happened on 2025-08-09 [5], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>
> Thus bump the minimum to the new versions, i.e.
>
>   - Rust: 1.78.0 -> 1.85.0
>   - bindgen: 0.65.1 -> 0.71.1
>
> There are a few main parts to the series, in this order:
>
>   - A few cleanups that can be performed before the bumps.
>   - The Rust bump (and its cleanups).
>   - The `bindgen` bump (and its cleanups).
>   - Documentation updates.
>   - The `cfi_encoding` patch, added here, which needs the bump.
>   - The per-version flags support and a Clippy cleanup on top.
>
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://packages.debian.org/trixie/bindgen [4]
> Link: https://www.debian.org/releases/trixie/ [5]

Applied series to `rust-next` -- thanks everyone!

Let's see if we find any issue in -next.

(If someone wants to give tags today, then I am happy to pick them up)

Cheers,
Miguel
