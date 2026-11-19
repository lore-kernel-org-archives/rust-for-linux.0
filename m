Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079816;
	b=qGwBYlgIjfXfL+KDo1JCCL6O3RJrF4cUrTKKwGnCYnX1rz667xxq/gOeUGQo7mi0rlNx
	 nHv18kFSxPEiSdndDW3x/NtH8sx6oHOYw5/O5kGx1ILpDXy9UtmLf/XQFFSLJ0eEJNomX
	 s+IMXtAj1FhxNedYVOzLktX3jNF1hXaS6EsbCwN3hqhfS9XKG9Nt1v+YJ79K180bh6enD
	 av2pOP/EBHma/PfLnJ4xipWB9O2YJzU2jhj6Il92BWQZ+V/vawA171+BsPmv6epb/q31W
	 Et2ZtQRPnFEkVK5yYQuhu6RBdGLsJT0690/dBYG3Z+8+SOjJVg407P8aBSACrqqjHKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uOnm9VgyV9A6nAmgpwHr/sD2iGFNDk3FeSWi3tD2RIE=;
	b=5BozKn4uTRZFmn0wgV4LKrZBcbtBsLvpUChIdFQNgbauniGZ+GFP7JqjhJnY4Q3jcI2O
	 KN17RJLJBxhNV8elFpt/26z2Kxm9wmuBg2Cs0GSCbVuqxGhcaotqHxwS641nE1VQz/G52
	 qQ5j3QDXOzMI07E2tlGImS3wU66coz0iX9RVtnvmrArZq/uVa7+Ic64twsCs9gra/T7NW
	 N4EdOM2njtspkwCpwhF4OQ8Wc3vWa0fQqpm77geLX6avMd9k0reslv31ZSb+XS9S3RwXh
	 m4H07AXs4ptDy423zrKUfXzsimz+QeRsHWiU3nDMJqor5LQ1g8nLHZKAQreZ83OnCYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H596OWh7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDE606A32C
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 09:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBDE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H596OWh7
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c00c727a26so144810e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 01:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795079814; cv=none;
        d=google.com; s=arc-20260327;
        b=XNVcKGMUnyBLINVBZe8J9kZMEMWK/vcJEjdhF79eu+9xRJ2FmZvUEnGqajD0SNT+0j
         OMXu4TyjPUvDayCapKrTfEImK6OtYreSijPQ9ZvkS5gp0mHefhSkf7oimbU6CH9s8YB4
         gPQ+l6TSdBJF9/M+6wguXGz28z+0tKr8iO+LDhWIqSRrSXccKm+jpSsx6BKpTrwNdgfJ
         AsMGX5JwmOKKBFNib0s61Fmi6E91BVGGNzOJFEMbODL8LE6NiXJxcTKv6DoDs7+fjbKH
         GCc0zXXS6rycChUpWQvJzWggpd5cirRLRakkL6ZrXOUa8YpvO+ouaMpZ/NqyJFCPhEIt
         Sfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOnm9VgyV9A6nAmgpwHr/sD2iGFNDk3FeSWi3tD2RIE=;
        fh=fTwL0rb3sGtY6HmpnIg/36uAz6PrSkFl18WZpxHGquc=;
        b=prnN7Ai/FIg4dDvKoETdvgPD1y2uwY2jfvThevc7z46gVMvdhiZbRcIk3h+JcnqwZS
         XybTHPjHS3LmP/+rnzE3s01fSRjZzOj8i8ool5Kl6I4KygJ3PvaSX8xuO9d5Aq0JuB6j
         mq6qlI7Kgai4cd84hQzktj6zEzHZc+eX1EDzpV3Nw3GumJKRSmxnrhXk6HWO3aS0YoyJ
         Y25vwU7A5S44+hjjkJKgc88benChQSpgZUcgKvmjoY/eWEiOn0H/PoTX64HCSp7g+BeF
         7mjLIxJcRitvT9z8WLcNOC2A6gZNHNjPRW0hxCXnt1uRkAK7HiGIpJqbrajSNdMyhCp+
         Lw+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079814; x=1795684614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOnm9VgyV9A6nAmgpwHr/sD2iGFNDk3FeSWi3tD2RIE=;
        b=H596OWh7WXxL6ryFZecYsvKcas6rAUTOPK4ZTv5ocNVMX0XURRu/lYyz7NsLH4fUML
         zMDv0+OZhtGOsgKTeZvgmDfJe+bvPesZAn3gCEqbgpSXVN4oqX1wgJG4FoJr9gOceOjh
         xpI7dwtooFHITIzrQsWYgFLp/cc1/bNJESflFInY7eH5cYorVOLC18K1geyh7wVqlFNm
         bo07JTjebS4lSHVfymO+dfiyAK3Tiwb6HCGe3WwDgmbkBLN+F6gmNYmngzOatT68+8AA
         59Zx0D7Kl0eEaFFBuAKVJKIpIaSXpBHif+UrISihXARPUJraW5zH7oaor5XJCSdnhO6j
         cSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079814; x=1795684614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOnm9VgyV9A6nAmgpwHr/sD2iGFNDk3FeSWi3tD2RIE=;
        b=FrvoyDVpjFadVVOMW7KCzLckqepoiP9TT1RaVTXu9aUfxpUA2VSveowZQMWpicAB5n
         +54Pv+4FO9fLSRt95mNlAfP2cGiQiXSWonTKzN+jo/uetpr2fgcbckPVsXqKxxGpAX4A
         PDJQoi64e4F4nD562+YWqF9/NRBQCGN8649pySOPKNWQR5ABdsZc4cue+mrGpBfRDQkV
         WijUS4tzTvwEqlxynH9otnJFVr0O0zUAHY6puQDU47ROCqF3IJ7CJHUtzIMPhRZJw4kw
         adcZijmjeH48M+wdWmsC8PPzM8zqmcJKphpwBfDA461y4VGBwAoAlb8eEXAYLXlx8pZa
         Popg==
X-Forwarded-Encrypted: i=1; AL+hErGtiIfisgi/43kLeMHqz/PvbBZ1/nLBafZY9RpkKdvSu/n2tegH/la2wcTYD3tTCCddrkq9OIvWN92OUAJdng==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FPfzhe2gTL00K4yztLpniCr1tL7XAIlvEvsws9KQH3CJOf0ZO
	vmZnv+fjtuiIhRj+b3XJDt/hnOzMvtBsQH3Qo2m0dAGse1Hc439j6+JEhFNnsaQ2QAsZjLbEn4o
	jKjNJLe5IzaFaXCghDVeZ5q5V8JN3yFA=
X-Gm-Gg: AYBFou1l89uDn3Nu1WO5r5LqpYPfeDI2y7t0N8LnP88Vu5tvFDrFJ4uiHWMnPyu/FrY
	bJxQP8RPlBBRr6nf0u4zwDpzsXT/0TSMjOsODRAJsPu4zFaYDUdLT4V1+B5pRDp6U4u0+s+puIS
	pRrDXg6JOqXkUfNJinaWShjiffUZSHSPeDPLRmhYX0zqWqsq4uMHXXXtFpmZlEZcwT79Jed93a1
	MMj0ml/7pZcIUlGk40IRJT3KvlPwjzs1TC8zoInw3Fnl5j4/dfY0s10iLkII8Ct8prSkEbmNGNT
	kSkVWX1zm1XxZijOxi1Z520/6bSEO3/yLtFoudvaC0yUQSpgddgL+fFw9mGgu6g/hPP+eC9IPSX
	dn1x1o5w0+AsB4V9+QtsiF8YVIDsyMJ6tp+8lwnk60m1FL3WI/ZoTVSXuo3V8r4+yXySCqK6FZB
	K/PdOvMLQYLhMTk6beJ4IaQgZzhMTUvbZk5BNpCe2xrfLek/Msx8cryEz+xfnr2p/gHoE7L8NDa
	dIXzm35r48LS+mqFqyzrctsKZjyy8GVuc48RFO9bsLYZLXBxU28y2UKkLJyOXxMwg29JyUu
X-Received: by 2002:a05:6512:6201:b0:5bf:ba43:fa67 with SMTP id
 2adb3069b0e04-5c1aa031659mr2118221e87.6.1795079813531; Thu, 19 Nov 2026
 01:16:53 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-formatter-lifetime-v2-0-e216d86ffb57@gmail.com>
In-Reply-To: <20261117-formatter-lifetime-v2-0-e216d86ffb57@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Nov 2026 10:16:41 +0100
X-Gm-Features: Aa3M54o_6SezOlJoJCWSx-bUjKVqZp3a5XNbhlqM7Ub90ktijfyQoMBmQTdWto8
Message-ID: <CANiq72nfu9-4PzxhFeVZBdzFOmowWw0VRLeYAGxv67wQ0xAeNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: str: tie Formatter to its backing buffer
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Georgios Androutsopoulos <georgeandrout13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:57=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
>       rust: str: tie Formatter to its backing buffer

Applied (just the first one) to `rust-fixes` -- thanks everyone!

(The other I will take it through `rust-next`).

Cheers,
Miguel
