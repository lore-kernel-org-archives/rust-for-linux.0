Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6071429D
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 00:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467731; cv=pass; b=i0RYPn7fR/Kn2G5XFXUom2mR5IqvSkO+vgNdAguSJ1v8RytF7mj7m9vdceQJ//tEUSyKwCSnOe1UyUJebtf/R0GHKxpV85Pmvadwr6xmwQY/2PauM1ncVmoPU4+SRjv6Y8OGRJfe2c2MWQKRiLUp1zzzwqy/1LgXzug/N3kY2+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467731; c=relaxed/simple;
	bh=xn5PZ6iiiFBX0SCeMBxmphmVE7WTRrTX9RR4bP5Nfho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TluOt7OfAGvaA5tpBOpKSGaa/fmyhvuNTPksp8TFNp42VTyNQ+n+S7KDvBSn0TqEKKEKQPNrlCqTiT7nxKwKIDxbkkgSsSrHQuDst4enB7iMQXTZV/L6Pd3F3IpW1cAz7wEDtAcTPoPD6OGO+TbfO6kNmi3ZBinb3Ly7vd1oS+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mk5GbeOC; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mk5GbeOC"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343bdca7590so18537eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 17:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790467729; cv=none;
        d=google.com; s=arc-20260327;
        b=pdS0nsesFRn/uKXYSTiMRsJ0iQd6gYeCz8dfgHPrm32htJ/IY9Hmz9OGBPjsfxdLaY
         bTQJI2esMLFrH9xGIr8H5o6z5Wa5VsqyAqGtJ+Az71ECqej10WZI+xLcKgH7v5ygeok8
         xPnkixh8inNW4pmNAJNyW8R0JCraE/G6zzQELJjQjWOMma161ytOeRqIg3icX5HoxKaj
         VJ/4EA0Z+CQGJn+CN3muWJnVbLH6mHfAY1Wrvhn4f8uuhq6/r9xMj6Q5xQWfl2UlJQlK
         A4ID6vWwjSKsOuA8sUnTY62kD9wmSwONx4dfHEzu+oJyeVqw4FJ8ZPtJCbii5dxwrZkj
         UsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xn5PZ6iiiFBX0SCeMBxmphmVE7WTRrTX9RR4bP5Nfho=;
        fh=0yfxym5rFT5vOwvBb8DIQGG5fF6xgEp6aaD6bnoqqbY=;
        b=cMOi3iHI1wenB0Xjkx3Jn4EUFbomPbYSmkn0uj9LSOMgax/PJnszmhG44oKHjkKh6B
         7t2PtN8/NjvCM8F/aoq25VyyWI1mWhCq+BESl79ilpSkoz7VwB2Pe62xB0u+9sCZZRlL
         H5VQHEe3scseE9IXSpVfnQhQ8emAWGIlTRF/H/2Ph7tC+RUaCLveJQXSgHC2cBUMp8YP
         TCzNO5n5877tPOLZovTcviB6DEQFulCnsM+sKnXuOCycNxTC/skW5meLcE5N9Yjbe5nk
         8rNsiw3GXCH+T6SDwP/e9vGFFqjSAu7JANTf9mwwyTgaw5zrzoh7gyNxzQbv4b5Slt87
         swHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790467729; x=1791072529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn5PZ6iiiFBX0SCeMBxmphmVE7WTRrTX9RR4bP5Nfho=;
        b=Mk5GbeOC+xAjcUNY+gWlo+HqMyIE/colZ8PwMXiqdJvTZKfM58bPGjFk9bT4i5esx8
         xLUJ43iKPYyGXB+iLOIIMTEtDZJ0M2merNZKVAgh7Q0CCW/oCGYnkijTWWfipM1HJK4g
         2e/nM1R9tDG9Jqg9Rnr/AXArtVBQ6/PAeHGPx3c5+fcFLw+UijHYI2/7m7OSuS7p0rob
         oRy1VU4ua8s0E+C1r9rNOryMIMHd9glHqQl4ZUkmgT4PFJs4tNcIOravw2dogA/2up6n
         K8munHfST2CLVsrgmC4CutcQipN2gqbvmPSBSXkXiAhgk++9q6rWFXAaqFQIuyFF2HQk
         UjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790467729; x=1791072529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn5PZ6iiiFBX0SCeMBxmphmVE7WTRrTX9RR4bP5Nfho=;
        b=F3dHbEOrNe84TRlg5HzOAIP+6EmdRfUaVt9q8bUZmcqxD4qEphyS6ZVwZtZo6IThZK
         RznAnTkmSfPHM6nhZ3uu2YYuXLIlEWcUGoGbY6wgFoRduz3jBOHu219lFiW6c14Hz2ul
         tZnkLRU4tsxjVaIdE1nouHILKkiwC9kn+joBCOf5YNPrBSlHH3bc58bHc+PLvQCeTOoI
         rYsc+N1v5WrR7ZDU2zcwZxoVIVwojc6PvU8/0/IPptpXup5UWL9j4nfV7Uo8W5wadh9n
         tM9jHNvaucIuMcxC0RGd6hoOHOoGC/sFJ+xYEqif7TdYgPtOlHidm+yO/Y1gejLTBJlY
         gPVA==
X-Forwarded-Encrypted: i=1; AKwUvBx+0pKO5lFZ+4cFDwBn19wgnKIyzx5AFRN4b/ZqE62HnNw0R3ZbxU8JPBnv+S/6IqxDdsqtx7OjILGqmOZ5YA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI8/l1gp3T0G0+fCf+1dL2LX4rw0wwT/Otlbt90SsxUylPlY3/Q
	iVag62Az/7KEfcdNFl5WDJWS+rNRLbe0xLVLmNuoUNAWFwtUZdfVuEJxUf5nxIVsW3wIMRMSMGs
	7bLeQmGNxMPvuxBQ2owhWork4dO8dncS3F11C
X-Gm-Gg: AYBFou0gAUmE2bd0HbGvmXgVuOUMiyaM1zdV3++gjkunAN+wTJRtu9bCIlD65MvYQ6B
	VA0xc1ixr2RZc06hxZV/VTe9vCrWJqjKz2RchrvIuse3QYMMwzXGNrJSG9+j18wJgS3sp11lugj
	AX4PWSY5QTHdfHIRs0PstMESgwv24hDS0lRVgxJYXe1dTP+qE8RYprN2J1lbGLaZwrLeN9UcrKS
	ahrPwxuiY7GhW0cpELV7MzCF8Y4a6Skf53RpB9XuCn6S67HUKQDn3Yr0aXiBcE4Q3yaNuYLVpd0
	rQ1ujoP+BT85702A6lPGe6JxrhxaO9BF2ynp9YH0vFltmmeQjsQuPMDAqmJI/sRu4wM85CtwFh3
	/CvA0HD52/A0H5Y+9uldB8KsLEbkGAqSaluCyBcFosYAXnDF8VEwApv29AEv3SHdo6Svv2+9VOJ
	WzxUg7Z/VIbZy8nbzgqVvyhLDozCW2ELY56CzMy9qtyO3BanK4BNA=
X-Received: by 2002:a05:693c:4099:b0:33b:ee8a:2061 with SMTP id
 5a478bee46e88-3427169bcc5mr8229144eec.1.1790467729056; Sat, 26 Sep 2026
 17:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
 <20260925-b4-gpu_info_intobytes-v3-1-e19bcb71980d@collabora.com>
 <DLPD8RQKM8VU.3QWOV9RFLA8S6@garyguo.net> <DLPE0D8F96DE.91C7E0MAERDS@kernel.org>
 <DLPJT1IUSKQO.1CAWHDECQAFPO@garyguo.net> <DLPKN532X7JJ.14Z51ZIBUIK94@kernel.org>
 <DLPNFF0JNNOQ.14JE7RL8LT79Q@garyguo.net>
In-Reply-To: <DLPNFF0JNNOQ.14JE7RL8LT79Q@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Sep 2026 02:08:36 +0200
X-Gm-Features: AclHuK85J-R98H_gMYqDRew3PEoe-FlnfCLidl5BzuhsD9_CB8w0JZU5OM3YYg8
Message-ID: <CANiq72kvkAWmJEgOathMVwuXFzUURK1dVN=OWmczykVWpSTv6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: uapi: add zerocopy/zerocopy_derive
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 1:49=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think the skip-on-error default was added in a version newer than what =
we've
> vendored.

I was going to update, so that shouldn't be a big problem.

Cheers,
Miguel
