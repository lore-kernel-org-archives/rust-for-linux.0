Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEEB514746
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680528; cv=pass; b=lt4MaV3vseYTX4xC/wSmIyUT1ILikp+zv1MLKQ0HEKbCBZQ/aaO0OBoFkXrOqvvbt1GbhetM1wImstzShOm0Al75mPqBKg33/t3ICuBhsTLc0E2Ze3owBYTFiHUlYX1AYhhe/qewkm/LGYdQi0H0ornf+1zhXFRObMa1U9NIJ18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680528; c=relaxed/simple;
	bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DonVPlcZ8Eop3pAMtlkA7VkyGqFrhmafP0m6cm2Tj92it3eL9XTSL3ATs0XbSUQYdmAtvi8c/AMjHmuQmLS9TzVXIR77Bp/ZUiloQy3s42gLKPZaNksICOlRksfTh++/L53uYxzRwY7gdp+XvYmlVTQvawwl9Ilpcd0eeC3E0Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rpV38yQW; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rpV38yQW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so30297905e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 04:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790680524; cv=none;
        d=google.com; s=arc-20260327;
        b=PAHQwo3nQUyMOrHOMHKaDc1Z+G7IdMu7n33ER8QuReg4fKkktH12PMFjWdOMrX5cqA
         buxkPOu3R+4a3mOTpLsocBfo+DBTSvX5+jXPw0FOd0FktRsmyfBe6OjtPeLbmqvVwvxX
         NLMttvva9tlAvL8QQETiM2E/fdOLbU+/EV2pxJthCzwoS7bckxk2/qac2pPtDDg30MIa
         zSa7WOsEEn1duxejJc+i4p1N88/BSgQjJh3pRvTE8jNvHLYVf2pOGdsn0dvTLpsji+d6
         k8RecyfeVDZh0PKPstbgaDP47RUtfoJFEb2OCB23NxOjyKkp8o1Eg1PVAeSm2tm356qX
         B6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        fh=19XEM73BwXgJiLsPZgvRHLHFlP+7nl5qWB9MNKOnr6s=;
        b=KY/3+r818q1+/vW7/eDkoi5wSUkFQwU3mw59p64R67KIJyCfF8VFIa3uZbjzex+qf1
         c8Gl/dSxFEAeL3AT8mCaFfDyE8SBWaUanTTnT5mezQ5u7JUusWt7EXa95OXBFgo5/8LU
         lt88QFkj4ULtuUhr0x5ikfkI3ZVDpoOFxZX3UpjZhM3KfwtrqyVoTWyAsGnkIUtsWae8
         2wJFPi9jBRVLVwVMKDqhOTK0W8ZLlSRR8kysqObjye8zhL/JBXWI6YhgQK4l1B4e0WQX
         HtOjy29D0e1ThGE2K2u2JViYfBXmF2OGn/fhGmmVhFoXmPjAn1/yOSp9o5kOYIkKw/h3
         PX3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790680524; x=1791285324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        b=rpV38yQWtOFpUS8caMEJrpkxNtQq47hOTlWvpPER1VUTHzjCVLrA9OO25/NqjcuYyb
         p9J+ITAp1Z/NgVPrcEhUJsd3+teA3T5jOnsyHuRcLQIdYoNZJJ8HelLaxlhWiCPEzSKP
         73TIqx95eNYXoLXDOjQcjjUMUXFRtBHMFOD2eRrZdFT1HpAp0T3l0QoteGIDgNCq3rUW
         Gu9EMi7fGTL/kiHQ+Q9FnqKVOuOuipmXiWEALzRL4k5BJVBWpQOUVyPCyX/JiBLZr/IM
         jHNGocAU9tcMrAnu4ubt42HC0V2uipKdAA5PPeVIsJu/hDz3cDEl6shy5Rabw/7i58kH
         htRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790680524; x=1791285324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        b=EQ4x0ldJ+ob1uDfY5Tm3tB66p3k/0tPH3PVjfXY/1p19Z8IzFCxvKarwFc96tdPuE3
         x/An5dgBbrLSJashFdKd0msxvfdz1fKh4Nrsc1Z7UScUc6Sr8HBfgupEELXZbKDdYX0/
         HNFnJwsnCQodWqThSRBzjX/8U+y4Cn/WYJHkp1P1mkg6DEGulLTKhqwQafYVxcLYCwk0
         FIz/ExD5Vykjw7sGa/XVgxcBw4p1j1bv7ObTwVVgMURAETXrJzQ4jpDIJq8TQ5ySaWFo
         5MXS3UHV+lPSqdU97rfZ+EPfbDkauKn7PK4HGX4LNFuz36K0Hc7ie385EQ7/slgOTt7j
         eTBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9sBZNcWvN/8urrTbybXo6V9+BBFAANIMz+I49dePbCxMpg9LyJ14SFv0h/u9jVL09w2gEE61Dlq3xLFg9/w==@vger.kernel.org
X-Gm-Message-State: AFuF++lLdijKMYzV7EQ/d1Oi/Sl7qlcPine96mmVZtah56JWb+ow14Sf
	UNWpLo/D8Z7PiNyWk1y7Xwpx99JVU8+XEjTlOqcg8dEY4oD477WRhRzKQ0wR59sCV3+w2Pd/oYV
	1updY/aNFMU0Nhta/5ormZLEVrlfx8aaCkK9qrgQh
X-Gm-Gg: AYBFou0zJ/BxIBNrzsDGN+YBWlNof5V9Aq0yJvVGZeVJ5rzJTXjLf4FLwsdkVKgg7Wv
	dQ7ACptbdN3fgddchHdZ56DIyw0h8UuVYNcpvV0t20mdIZOSDkb/Ha27onqj62Er9KnDznd6c+5
	Qknlbw5/nNHguvHU6WJ8fCh6gzC/vXkhGjWEdINbDArxetwolfz42Kb8YfIJ37sXnuVDbIjYtqZ
	gLz6JX9xoHLiWPG6uh+EnPehNaNpj1ziw0Bz+P4memAXWGdE91inVkQ1ZzUjoB0rZ0vdzPgrXIL
	io8KTtFMjYy+KvkRC09THwK4CY3+Vlpgm4tCfvmBcANOnteijeuU77mVYDPDjv5QPHyPx99WXAC
	MrGs0W7dzOlRnOy5yMYyQpcnjRFqw2ve312bzd9X0VkQSSQTI1Gy6
X-Received: by 2002:a05:600c:8b6e:b0:49c:fc6e:8cbb with SMTP id
 5b1f17b1804b1-49fe66f9fe3mr278996775e9.31.1790680523000; Tue, 29 Sep 2026
 04:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-cv-v4-0-547ef5727451@nvidia.com> <20260917-cv-v4-1-547ef5727451@nvidia.com>
In-Reply-To: <20260917-cv-v4-1-547ef5727451@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Sep 2026 13:15:10 +0200
X-Gm-Features: AclHuK9UFcxmG9GmUlSlAWSVdyiMyuABuak7MzbC2Kn8ucmeQP62kVdtbhyOryQ
Message-ID: <CAH5fLgjV=qMfG25TQnTruHeVQkVuitzAyUV7frsx0DyGFA8yUQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> `FromConst`. The value is then converted and appears in the
> associated constant `FromConst::VALUE`. The trait is implemented by
> NonZero, Bounded, and Alignment and lets values of each be constructed
> from constants without a verbose turbofish syntax.
> For example, `const { NonZero::new(1).unwrap() }` can be written as
> `cv!(1)`.
>
> Add the `cv!` macro to the prelude so it doesn't need to be imported
> explicitly to use it.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
