Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9D2773C3
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184143; cv=pass; b=e7N/qyH9H3tCaIy9IWBgrRVxl0ewCdHuKxn0ZCL7rV4bkpszPxlgq0rxp5rPmayDs6HobbWYcCTr3ldBJ9bb5v4Aw1AXMe4t/e7NBAkZQyRWukp9allwuBrgLCD1aMm+tlbI9oUd7/dIsaz2/5RBD+sK46NjuIP3OIA6iUBy7KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184143; c=relaxed/simple;
	bh=mAM73Amc5BetEJ2O77N5X5NzdHsR7hDEbChlDdG8czw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEaO3dQmiZlb5SKHmAbsOoYutaxHU4fHkVDvlSudHMBfEIcm4k1mI5cfQGGrtaZgcxzoSgtPs25qew9ukdZ7xqlxoYeBf86Hs+mGh8Hdog29WHuEePwIymRGu0I7nJ/NRIg63rR57fDCRE3UWtkfxQkiPrvH+GK3sgtBWTrMZ7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGAL5DUR; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGAL5DUR"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304cf9a02f9so459065eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 06:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781184140; cv=none;
        d=google.com; s=arc-20240605;
        b=dnryq0FIQDu0HZHOXIqCWY8PVck1ER10Jnc6rvPgSRmAyn2xhx+BlY4nnBO+MHx3S6
         h4htPkEEce5gJdChgZZG9J8fgqElwnZ09qn05S6FjucNnTxiI6+Q79g9SwrYjrm9jTtH
         hrvJQOJPRL7220LnIqbKjJdrUNG1yaAhJJTTVBoZ9FztLKFwyHe8oo0+D/24F5VINEJN
         V/jYo6oM+I70H5rf8RfMN7wUByA75Zamu1tu5vl5GHoVhV30xDtlNKm8XRdSS4KDznSV
         D/rp2kGItIPbuR8AQ+1c3P5RZ1BKYnOGfqAuIIPxv6auzsAalpulxg6ZimbUrrSR6ojC
         Cnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mAM73Amc5BetEJ2O77N5X5NzdHsR7hDEbChlDdG8czw=;
        fh=UzRQ6QI783ctoloZyuoRvVqgdUm1bpqMVzIDvrdsrjo=;
        b=An30I5LjKHAARMh46bDIChOEaMaiSiL5E69MyMsMXNFGOT4M+DUXppU46Q8xMcgPV/
         gwgbETJiGusYioF9xunuoNHbPfgZkK1OfsH2cmuB/eqhrixKdG0g3BxGAIxgO9LC5+v3
         GLuQwhY0q/dDYK1nOCJBER8kA0pmHFUvExKrIJ5hMZe8x8mJGWHoePuctlFOlU6vBnjw
         guqC1qLNIaMbDGRpdTT6FrHC9GDLnz9dZL8KG6bvHlYpT6I+E5V9kz+yX+qFKXBF5QOA
         aR8Wz4VRs1d9WY5FAZYB3UnqWVxArTslsfocb3MeiTZvJ8UuzydEpEQz312Em06hmrVL
         pdgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781184140; x=1781788940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAM73Amc5BetEJ2O77N5X5NzdHsR7hDEbChlDdG8czw=;
        b=bGAL5DURDgHNHvmkadSgOFiCJxeD7+zCfPFmVczQsQya+qJP6WDkBBwE6B8GA0wezp
         9wAx6TFMVrwcG5+y7AHtr4fxPbSSJ4t6d+n3fHEkAgAGYyDWG8rUAOYKP2K82oLVnmAh
         39u0G60GtCNTuVp33WJpv/n/9tRyRi/Ti+vEuuSOlSNtACkuk/o0dTgvjdrk7w4iT7xn
         gtUSk0TmnJ6+5xtht9ZGohpNXPTCAhuY15AoqyNRFVduqMemnmh6FJFvY15FM+r4aPwW
         GlPihvkl+J55yEDxnb+Wmx2PpKCkRmXO62J1OwBmrPgyQyJh4wRpSlaTlu1iz+KAxZoU
         lydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781184140; x=1781788940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mAM73Amc5BetEJ2O77N5X5NzdHsR7hDEbChlDdG8czw=;
        b=lItdtnb/XNynO7HfXccqtYHgK6h3+vOutkbbhrNtXRgyh2V5Wi92sRcdhJZZ6RxeJl
         pY3ucSS646QR+k4mYbFYyOuC6o3whoTyn9H/ZjvE/sF2zlyDwsjMAoJltQ9mRjLI5Y5R
         cjVxOyfjbwlTzvyGONXxSB5fqaolGLDNuNAvjwvi1BWeP2RTvVotHjyrulUYBemtHUPE
         8/Wz99ypLqnQXS0jP7gfMB96Hza/IaIJ+WQNf3KsGv12UkusXyEowF46Nd7xPy2K03Hn
         S1UI7J/1AkJjCweSIR/8qJ7JHPNtCV5H4QKdlOL/7TrmCiTjMP3geUEZujoxm/YYLdrr
         4SAQ==
X-Forwarded-Encrypted: i=1; AFNElJ90hGEH+cMCo9iuzkrvxqgvUdeE/UgsA9emirlWtscYn6D84VGAcGgEW37xFYgXNYpRYYLoyVDxjG2EXzsTfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AackVCF+PahOX8SfuLJyd19r59BM8z/dh03kqXmZBytrj0Ga
	++ULIfBw+dzqJ+8dhC1UQryo3F6LiIQcCZ42/xqJHgO9R0M/2ZgUD7+TEuY48JD8k2irS1lNtRS
	r+hIJZ6gQrcfKqbIJOL7d1LmJZ5ORm18=
X-Gm-Gg: Acq92OFEuWK7hRZLCYBLIIUN0zGZQjQyamWj4tFhZPmup/EoxdQOKvdLWj+5ZP4Gg88
	C7AQYlT9+7EFLCWbAAuDOeNeeJanUw+hqO/+BWXlPWVDfUSLfSD2qx/7E3sb02SonBwiFadW5gT
	Y855FXiErJQKgDpx7rZeIaPRFBZxR43Z8k3EgmzeigQvwo4ZE+w1+lZ0MxRGEjl9jvF7PS5iWqX
	B1MjWTq0z0FOugUwooEMXzXCUYtwI2Gag63Zxu+/ifE3Kv4i/79494/yxRZnpP0xGtU6wIzP1U/
	uxnqw0VdrZbmSRgI44SaHjHRW/Hv/rZk1uFQs4T8H8fo1Wi6cnqZF0gRU8lsZKh+lUoz2WIQ5x7
	rECjBIMrmqAvMpu4P+vg287LrA2c73uOXLQ==
X-Received: by 2002:a05:7300:7f95:b0:2f0:ddce:8468 with SMTP id
 5a478bee46e88-30804ceeeb9mr1095975eec.8.1781184140022; Thu, 11 Jun 2026
 06:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJ5ETQTN0B4N.G35D5N46VX13@garyguo.net> <20260611081525.73734-1-ojeda@kernel.org>
 <DJ65G8AYP0Z3.3RHM7OQS48RC@garyguo.net>
In-Reply-To: <DJ65G8AYP0Z3.3RHM7OQS48RC@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 15:22:06 +0200
X-Gm-Features: AVVi8CcqhtxpLE-6x1PkUgchRKampRZDEGSt-PYH6DreHtQiYkRjV2MSsmONy7I
Message-ID: <CANiq72=Q6ktctSdC_Ej6YbvDJuaLk+DJ64fe5AM2KQC2hWkvDw@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: add ownership assertion to Node::add_death
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	brauner@kernel.org, cmllamas@google.com, dakr@kernel.org, 
	georgeandrout13@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, paul@paul-moore.com, 
	rust-for-linux@vger.kernel.org, tkjos@android.com, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 1:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> If you're using gmail, you might be hitting the receive limit? You can re=
ceive
> at most 60 emails per minute.
>
> If you have more emails then it'll bounce. My email provider will retry a=
fter 15
> minutes for up to 6 times, so if you're consistently hitting the receive =
limit,
> then it might take up to 1.5 hr for you to receive my email (or for me to
> receive a delivery failure notification).

Hmm... I don't think that is the issue (I only noticed it with you so
far). It is also way more than 1 hour. The other one, for instance,
was about a day late, to the point that I got this last one of yours
earlier than the other one (!).

I guess I will ask the admins.

Cheers,
Miguel
