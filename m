Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3100C288D1
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724046895; cv=none; b=iNKT5olgFGDA7L2LVtjXEirPFR+zjRXJayVpd1/xCrJUytRr28nW2QLRO4onNdJcU3gYur97CN/92SH+66+x5ZqCSnw0lspNVN0bOH2BMbO8udASgSSKWnA18qXj+eigoiwI1F4zszlelfixahfoMY1A074Au2QCIFoOe2b2Rck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724046895; c=relaxed/simple;
	bh=MaBJh8Jz318XFOsD0b2IB7IspiHH9qIG5AIeiBoVYLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iy9iWKfaZ5IxQi0YIWx/mbwdPJmmcy+Ro915Mqm4aN9irHXFeScgTYmEsJ6npkfciOXYq8IgFZMJbK7NdTXnrU+dhS/xeA7XzvqOBqCTnJpWY/ywcJWLRqkjJ7/aMTwRqgJ6fZQzY79SkV0ntscXWJsJaqH8p0jk/oDeZ1UE/+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=rFO6fyoB; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="rFO6fyoB"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6b5b65b1b9fso10773347b3.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Aug 2024 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724046892; x=1724651692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyanCl+W2oaRq7tR8CwFXZyhm3yAxQQx+CVxI8yAOkE=;
        b=rFO6fyoBKMMqkoTQjy64wmAOy3jHAMGJc3ug4pIKZpuzyYZr8Y+ZWG3gdHaovkZuvh
         0lrNV59Jz9Grft6iuYEL2Kg62fA2I4jOilSpVNXeGZfQ7RT5ijvsrSOt2O+V/T6gBIZZ
         /X7HxAbt9lVZGHycI32Gtrf3J04G1PPZX31nE8yEbba7mB4qpOiPjwlzek0EI7srLwZe
         3sSh4a9GIo43xtzIaC9ACKayWlPnTpCVbk9rcMYTE4TZPuaCxZpQ7NbsQOWz1xAqxL0z
         Pve5ld0c72M0KDHXMFVFId3WrYNCSGLIiLx4oUsB64Ni4bfGs1W7cJEaX559STYo/y3n
         n9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724046892; x=1724651692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyanCl+W2oaRq7tR8CwFXZyhm3yAxQQx+CVxI8yAOkE=;
        b=AQeXifDbTPjnXuLI1lgbpVNIhcvURfTS70uVWw2QapN1kxkOWHdnT73fgnF2J0ggiG
         HGfO8n7nDJtjOX3ODVDK7nrsIMQ4IuPmb32DK9r1MuMOz0GPMzqN5xzbMIMqBrMSMSHb
         9PdTUoKLoxI4Lc46r+LWdWHFg5HjU/vOznpSItciYJpq2DrGEL3t3WVcrHPDyeQ0hJ6T
         MuCxEDhf7ozL+rp7F1GVggEeTZi2wx2odQBqsd/G3lHF2CgdMAhlovqm+tbuyTiwldrT
         iXoDDNZlFy6VfhO7LxWH2RcdYDvkVf4DY6kCwgATLYVySvZQQco7+EPHEH1GbB8z472c
         uDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0znfNWv8okWwnYm5XpIltuXaXpYu9/TQXAgVGULzWDuh86JIAS/iZ6eRivZEl5bD3FiaQ3Ha7HoQRDEJUSbWs/xxoU2s5ZyNSbJ6u2u4=
X-Gm-Message-State: AOJu0Yxe37lAEHTyNZPzlDh0u7Pw+nClKWhnE1MlKhr8XezgKECn9RLA
	J3uksziEdqk3JHl1pHM1UzM/O5to4zm+LAob8OWpnk+4xFqdphblbChTfO3D4R9K2C3bZf1amn4
	NOPYcCIHxX8GXG87DnsA62DCWmEiAsdQ7EE58rQ==
X-Google-Smtp-Source: AGHT+IFxZ5+LFJ/3vKVkOEpvLhS6EG4HNHbHMjwC+MehOtQzX3N6262gLFLEvWB1VP7lyZkyox/CaaEUsVggncKjO8Y=
X-Received: by 2002:a05:690c:2706:b0:644:2639:8645 with SMTP id
 00721157ae682-6b1b949d3ddmr88026407b3.26.1724046892173; Sun, 18 Aug 2024
 22:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819005345.84255-1-fujita.tomonori@gmail.com> <20240819005345.84255-2-fujita.tomonori@gmail.com>
In-Reply-To: <20240819005345.84255-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 19 Aug 2024 00:54:41 -0500
Message-ID: <CALNs47uXqvu-48-H8HsdX=Rk=Ah9+UMj9q34J7kA=3JDB5WYSw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/6] rust: sizes: add commonly used constants
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 8:00=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add rust equivalent to include/linux/sizes.h, makes code more
> readable.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/lib.rs   |  1 +
>  rust/kernel/sizes.rs | 26 ++++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 rust/kernel/sizes.rs

Reviewed-by: Trevor Gross <tmgross@umich.edu>
