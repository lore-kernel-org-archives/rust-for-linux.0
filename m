Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDBD1A9F85
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769403820; cv=pass; b=Z7nYthIM/xYsFT5mBwaL9JFQW7TyR7XRskjZmMw5zlmmZ+xW3/Q2ja78bMa2M6EsddOI08ZLwYgQNy+gVjqnmCj2/2qTjtZih1hHZaG2GXJXnoFyjklbJSD0PkdJpsS4APE3/DYJu2lrYsJ4OT5BL0TtQoGsSYXGLVq2ZYkkq+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769403820; c=relaxed/simple;
	bh=Z/BV1qND+8bE+w8jS5eeT7SzTDDoW0z/wWehsfyd19A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5fvJQdkBDYa9sKysXbB0b5iu+j32onuYo7EyswoWCTaSV9gucH1+IL6kjh5GvABcDWcGFRtH69YbHPjfaTaBRUdn/gR7KpYXg2hMEAhONZkXwUtKMhRjKpOoBQ/TM/BgIkmYd/I7dkYm46XMsNtARYd+ExXO+INU3QhisKEcFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMpS7lr7; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMpS7lr7"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b700c7d3c2so114652eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 21:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769403819; cv=none;
        d=google.com; s=arc-20240605;
        b=eAV+VaNhFLxZPc6STk3r+kQRCKextkB/b/QkwLNHRsLsut2mOexuLbqCHxv4OetRFS
         DuXI7Do+IkguiEr6Vnu7jTsaEoqBlztxphsUDLV8jCx7JatgVZ8W16ld01qYK8/m9+Dx
         PJQ/giamWgeGlq5Ol3Tows7miiavR3SuN8e+Ss5LlVPFlhfc6UPAwWgNGuniyA9VpqZq
         n9jbTAbVYRGM9lUJ3fp9/uqFkztbaAtRkK1XvAKIJs+NQlLyKoZQDRx961lcYCJWtTUm
         AriQGG0K0tfcgyqeR6hw4HakPXNlyXNnh7K89kIbjn1sITcshDcxcS84/pqKVddRQR9s
         SsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z/BV1qND+8bE+w8jS5eeT7SzTDDoW0z/wWehsfyd19A=;
        fh=X2BOxF7dUKTu/e65KgeHRuH/8AF6saOaQTqxbtMH5vA=;
        b=VbKWshbIJvrODsnFrE0GDBASOs/YFZXwBTWMSkfJs96Te6jj22tWTl9O6aZDKXShpL
         4wDtkN3oeQ5UKrdfxije0gGBy1fwCu2TfAzA/+hccXdTy/CWYmwpGSax35we31pKoYKN
         YPsDMgi83nshFpuOgCa0X41kPlXMH7Bz9RRlsVJvRXTCC9ollTns5STGmjld8P9GUK9N
         muq5RXLReypmZmg0DlRUDByvCnXi/3JhhHMlFnYSf0tjBZCGPXQYA2L8ohDqvtgjUoUN
         54gOO0q4/QaGnxhJRY2Q+1ZafL9gfApd/eV1EJaIlsn/eKkNCI8uL0hsQXfZHouRtN/o
         z92g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769403819; x=1770008619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/BV1qND+8bE+w8jS5eeT7SzTDDoW0z/wWehsfyd19A=;
        b=ZMpS7lr7Roev7HfhtaBrQsm3gij+Ml/eITV8w8PNWsz5oA18+xZQsAkqB+59B74maE
         T8hoX8sxH/PfR0OXDC3pCwOX7MuwRKXYRi80pyL3OoQqP7cL+mHBPw5rMM6UpAT31UsZ
         tptw7TPhXpgSjpEmkUjDvLYqgd6CnrrVptc8Dg48bFVLP0hUPrqIdnbXCESCW5bbqbhg
         k1mUJzNCp7cJQWEALiZMp4Yo90+0XUXXPPJv433UCblknqw/7WkLpIyVPcppXJfJKH2R
         Ku8Ff1FvfDjMhi1ayLf3G0I3Y3wrWc+9uDcO7klg1sDPLNW/SYb5ExTAIkpkc73Rnhmg
         fYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769403819; x=1770008619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/BV1qND+8bE+w8jS5eeT7SzTDDoW0z/wWehsfyd19A=;
        b=wB7wRHZ5nVVh+qs7gKPuMneztbVrQlGsYekSh+mYej9c/UV5G5DLMs4oH9noPoPI1z
         3QV6lJ5lTAUNsjcFFdVMauLDjX+vtGaSOuKauliQb9IKMOagpmpB9hkIMxYLqAanuUAK
         aeP9Qk5Oju+4zTe+4afVzY8SXihhweaFENui0iLJr/oiifpfwTdv/Re++VafrHI3ry0h
         bl0QZAmJbyTfQsAlDUCK7t4kdACduN4SvERqDCSH2Bfd4xkDTfZvay6qYHfQP8D218cC
         cmI2eTGwuk6XW4wJKa8SkmA4loLnyaaC1XHbKOhi9Faio/7YGDsuIYYLlXeghc2t4Ut2
         dY3g==
X-Forwarded-Encrypted: i=1; AJvYcCVVCagT0OqUFkiVmXgP2UFDbjV6XQcQp+DG4wvgRF10qdyu4zIPguFU1NvuXZtgXTtEiEDKm37HasUMMDmclA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwxwjmOzPioNAphBJe4Gb4SqeDUX29fMdvPOVnc8w9u/Sxqmb
	fYMo8HJvuoHwYBa0SLzvbiltEdFd/zFLATllF+8Va9qJcO+QQEILGrXBT5Jt6PVUaGen+LYH2/R
	nDe++d2/MoEUmkmtNZZ6xuhVG0kPRJCI=
X-Gm-Gg: AZuq6aKAUcg1MT+0xN0VARhyycErUlEr2LBuZRU0sitGvKlYyYJxEFC8IJMTuNHSB4V
	ewvsRDWJ4kboUZ5/F/MiD5muauyWVkMYeybLm5+KzXWmh+cMNdBusOVVxWWHSH55z0prnoguJ+D
	Qf1CU4l5TA4Mvd/pgrKCEwZ6Y/LBISy5j7xZJNMRNwTsHZ+XmlXjriUwSyEBjEzQpHGPtiA/n5c
	9ENRnpqT19J3gfktrn6rU33F35b23QZJrCVRgxYAchOF7o5RrniNXe1uFEDjwZsXp9/3D4M5Rr1
	Np6GfAZxk4WJmHnlzIvAcv4p1/YLKlV53ONbQeVLM9vXqvWj7HbNk/x1yj0Tmx03HGbmKQrSZnZ
	X4HRmRen0ayOiCtG6XHkDCC4=
X-Received: by 2002:a05:7300:2153:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b7643322f8mr871439eec.3.1769403818661; Sun, 25 Jan 2026
 21:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115214545.63262-1-ojeda@kernel.org>
In-Reply-To: <20260115214545.63262-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 06:03:26 +0100
X-Gm-Features: AZwV_QiqkZs3XKFq-GhjMQDdpIX21HNFip_ji-DIhWDKFPK-WtKTJXpdXUIsMLU
Message-ID: <CANiq72mBK9OoVjoGd9wbiH_EMxOnVpXSH4afcWfmjczpvyU+Zg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add "RUST [RUST-ANALYZER]" entry
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:46=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> This entry will handle the support for `rust-analyzer`, which at the
> moment is essentially about the `scripts/generate_rust_analyzer.py`
> script.
>
> It is one more subentry of the Rust subsystem. The new branch is
> already part of linux-next and will be used to send PRs to be merged
> into rust-next.
>
> Tamir and Jesung will take care of it. They have both been active around
> the `rust-analyzer` support for a while.
>
> Cc: Tamir Duberstein <tamird@gmail.com>
> Cc: Jesung Yang <y.j3ms.n@gmail.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
