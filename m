Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7EE248F4D
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759173028; cv=none; b=ouOtm22VpCtF9s+c/5wuITtzGh7XNjv23eb3+jAApaTIlbDBc+Le0ApsVuB7DShpZY4VnJsnTI5Yfi08GtMA/fFKbUPtBHpoRmYr8rGcthnOkIswR+kuA1Gse7RGsWvLZXBKYg0b2qtZYDO9dFsOgOjXL8OVpLKlzYAMMMpqCqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759173028; c=relaxed/simple;
	bh=j+HQknQTfzkjZ4xFlsxP9F2RoiYAYddrRiH9YR54Xig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKl4kkLVcRPC/kEhuv5nY7ihhtMfFa+VQi8ru7OZz4K5t8IeldJQrCjGEsn24LVS7YbvJT21DdXPmSHB5f2xKk3bdjhnc/UFt22eRBweC2wWvtqKEBwOPNMSs3I5dR93tcVhKlHgb16m07T3f/0ZYi8iZ7IU7AO0cappu/fhUaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjq+57lo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjq+57lo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-280fc0e9f50so6942205ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 12:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759173027; x=1759777827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbyv5anoG1BNn6L0Yq9G7qMWdoR9ixzEKLdO2/vKKjU=;
        b=hjq+57loC6BmELIj1CTjewr8eqV7mb2WR2IUvZeWxrywn9Hp65wmoEFbrMWH3DYIbD
         4E7vizqV6wb/8SfVF7/G5TRGqKDjuoTToRqGxYHRBmoLSWsbC5bGKASQDYMWJM3Dhlkh
         VValDT0YXTo6j4PQlrCRtdw/LUK3AGgsRtCADQXiM4y80iYOiyDlLF0Jo/cXauy4aZ/+
         thHPS1FnASDNyFLcB1FVskBDrFqV0YihanwgI13vKfgOxTjLW+F5zy3EytxV9QF5pfLo
         lL6ZqQrk2h9UlUBAwRCxEFfKWSQRLIJlm5ssOIEJbJ3YQ5Kbde1jAnvWY41fW8Ji4vZQ
         ih1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759173027; x=1759777827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbyv5anoG1BNn6L0Yq9G7qMWdoR9ixzEKLdO2/vKKjU=;
        b=Fdzhl3HZ20aYFPmSuDD4mrSh6eESt7jLbcmQGFZn9Ts3TuWCM+9ktM1LZvTCo6yA7F
         VrJuK+j+Dq3ku+Vo9IvBtWvEpIZoehCO6B0OMo+/JPQDFcrA+zx31FAZso5D3ghNTvKV
         heJ/zsNjgSm8KX4sI3Fi+kofDXzF0JIpw7Pfvc5FxwOVZ8RHordZqXIUDwcIFm73RhFe
         Api9gMgGCKD4ewICFrKr/JE1gvEImPsHavSwAJHqV1TsXSEUsYr8HKySjaIlS7BMEsL8
         b7XbEDXAWNQ7FZNHaYtrp0QPE/OySxUJd/BYC8RWEUE0HBCTxhfX5Uz9MfIStWX8Yd4Z
         su8w==
X-Forwarded-Encrypted: i=1; AJvYcCV9XhKf2/ehtCkA40sIyLHw5DN4WEcm1056SFbwRB7PYIMvbiNeXps7Du1QgNFAawpXCevDbfufCtEBX1qPWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw70ms+afBoXwxF6nTXZ68k1w6SYfQrkGVofVXjKpGqkZ/AX/yt
	AjvBdeWan3G6srBmeHGkEwlOas2Ziw7+IOlHg72NqAiUFzHrHmGDHlBIrkStXKP9ZwXuisfU8Vo
	M5qG0+9QwIWbaRmosd97DRIBiV8jQcH8=
X-Gm-Gg: ASbGnct5csgOZ4zGnGly8vc7Ow5dVkNHy81iSCHoie7w8MsaCFUbYD3IrLDRGK83uEo
	XO9lYj6AyV9l06cyIpNC0qM38ECiWc+WbAwfF5fv059VirWEihN7UzuDbwaMBVQHWzTfj/5cGwz
	zn3oPZDYRkkLL3rBiToXGoL3TYR0UvTZKICkntXik/sDDPheTaolWOPAZzppl6W0UgL5joKcpUU
	xidQvjrfd08jkaaxxVMrnuD9e+i8wjXU2Fxn8rZ8x8ewNt7NM9tSeQopQeeCicw99YlXZDK0uVP
	KUwObrnLyobUOdxx/z8uts7lkSrAK//BeOjl
X-Google-Smtp-Source: AGHT+IHJfxwimwqHtxPSuwPNKC5Xdv5PQdgeEEYnfZcIqRTmdN8auKfzEBWl5enpV2OwAsXugr39tmET7lj+OfhzNeY=
X-Received: by 2002:a17:902:ec8b:b0:28d:1904:6e77 with SMTP id
 d9443c01a7336-28d19046f64mr5721095ad.3.1759173026637; Mon, 29 Sep 2025
 12:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917165106.22262-1-djfkvcing117@gmail.com>
In-Reply-To: <20250917165106.22262-1-djfkvcing117@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 21:10:14 +0200
X-Gm-Features: AS18NWAGXgc3wBE_CDcBhG-vL1PxyrSHmDSXhC-cCijt9jb47hjgZF0eIevusNc
Message-ID: <CANiq72n7Na7mjgZ9PwXwij5=AuHd5b3qjTc9Yh11ubMqawAYVg@mail.gmail.com>
Subject: Re: [PATCH v4] rust/fs: use intra-doc link for `EBADF` in
 `BadFdError` docs
To: djfkvcing117@gmail.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Onur <work@onurozkan.dev>, gregkh <gregkh@linuxfoundation.org>, lossin@kernel.org, 
	gary@garyguo.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 6:51=E2=80=AFPM <djfkvcing117@gmail.com> wrote:
>
> From: Tong Li <djfkvcing117@gmail.com>
>
> In rust/kernel/fs/file.rs, replace `EBADF` with [`EBADF`].
>
> This helps rust-analyzer to resolve such references.

I would instead say:

    rust: file: add intra-doc link for `EBADF`

or similar, since that is what those are -- they are rendered by
`rustdoc` (and of course possibly used by other tooling).

The change itself looks fine to me.

However, it isn't sent to the right maintainers (VFS) -- please use
`scripts/get_maintainer.pl` to get them :)

Thanks!

Cheers,
Miguel
