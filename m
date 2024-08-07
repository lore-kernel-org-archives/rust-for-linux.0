Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F46E1D0DC5
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034557; cv=none; b=rShB01rQstGYbla9/j+dXSTrmEdBHHbe3R9ksjmxxsgZv76VSnlhDP0xqZe9nz98yS6JYsu62mdn7b/BPz7s3YQcFGxQakfiXvC8JHbgeZkKj7Q/l81MOlqZy2VYQC4OimTbPU215JaVsAajZTFbPDhR41HzHgNUhgURChHC2Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034557; c=relaxed/simple;
	bh=dC1Gqu+ImAfjVByCQHuV657Tr7jIv7TZOwNXzQfDCT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igx8GKDIeWFLsFPP9w5WJi8gUqLfPkfBGwqBl/rezHmf9HGRfGwDM4xTiRY5S5JCc7RDxNhbNgnzwEVG6LXlQNTkfJjcYPoqnHPZEsUnll2Rr05TdkFou/lK9nJQtyrYHknGnA+2q3FXNp94wEc0X+uQkRbLXCzsz63sDFkTwec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=koKOUPAy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="koKOUPAy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3684eb5be64so1141362f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 05:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723034554; x=1723639354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dC1Gqu+ImAfjVByCQHuV657Tr7jIv7TZOwNXzQfDCT0=;
        b=koKOUPAyxBR4fz5wHc9M97hE0J+oxW4fEmKLMwRbArj4bYyZfpItBbh1/i3+UfUQGm
         GnmK4UuY/bVCQ2VWahE+paYGvn08hBsXXFW4exBA0o+e3wvSWGTaeVtood8jRgHFFgfx
         7dige0ulLHr44iV3xeabno1pP41WAWbV3EfMTU/eGLdoSmQed0m0fZfVDa7H4LWVL9yF
         VVbViv/bE9nbHqNWQtZBMw+A2oG5TPhj89C7GinsS5pQFmUuuNGHcwmZSZJQ1Vml9r9Y
         dJwV1MJI8TpChjYZHvjjYpxgt2j0A28jset14aZmSCASiYJDslaTeIItaUxwM0REMw8D
         F46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034554; x=1723639354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC1Gqu+ImAfjVByCQHuV657Tr7jIv7TZOwNXzQfDCT0=;
        b=CXA12YIPVcYw2sb/6GtABNW6GVUvF/z58MnRNu25E3VoQ4jDbCSr8LHC2Q5WWtgBW0
         gw6Pn67O4gzHcgZC6duu0J8HZc1QXaENyI66zdfsFq7zCaHloKCgSkbpf4ALOWlucBOv
         H5YctAYk7ZFkFiZzgRHi6n1cWGJy8HMPtR+OcAL5WSc0MulZr0TYsciDZsMSQKmaamzY
         JKUN/Iuuu2DFF2XaaPfwMwU6WXxmK2FvLVq3Zea7aqE5APO9mX8z3B+W0gERsN363LgP
         ese2VMYHyu69THQPLhp1rsNxbRqpZFZmtyRIPKDmbeqxsNhF2CPthQ25R43Iq4QWwGXB
         LKgA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Cxa7YgJ/L7L/A0WvNFrGwPs5T03y1lRtLXrbnC13uI74cFGp5fsgcW4He/J1UAdYa20LTwsekqnXudB1l9iRLWRay7GFUL8lhd1PjAM=
X-Gm-Message-State: AOJu0YxJZTM+Vs8ZtKX2pOEvFxp3jYmy+ilow9tLAeM0ycul4DNOyzWV
	Jcjy7S6WmO5yvyKh1hILD3iv5BlZuHEhVTyFjQd4Vf0CffCx+0lnm4FHDRbm3hdbUgDrO1FEovj
	pMWVEWslaw9lhT+QRQljngED9CHuZuBMrxW0B
X-Google-Smtp-Source: AGHT+IHMOwVO5PgoY1ty91l1/Mip8oCnfxb9A32cACdLXHKInsEtqb2h7xNIx7PEOPNHhk73co0BRxXODtmm62aFDIQ=
X-Received: by 2002:adf:cc89:0:b0:368:68d3:32b3 with SMTP id
 ffacd0b85a97d-36bbc11aaa5mr11469188f8f.26.1723034554173; Wed, 07 Aug 2024
 05:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-11-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-11-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 14:42:21 +0200
Message-ID: <CAH5fLgjsHQvJB6O_81O6hBx_XHocQXv8qCEZZXmUeNgQuNZv3A@mail.gmail.com>
Subject: Re: [PATCH v4 10/28] rust: treewide: switch to our kernel `Box` type
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:21=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that we got the kernel `Box` type in place, convert all existing
> `Box` users to make use of it.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
