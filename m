Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502A31328C
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801273; cv=pass; b=d+VYjvwFArVv/8LyY3hZaj3sRAR5IhVrEUpg1HicELLBKpMCMAdQ/RnZohtj2oPEoiqi3I+ePTL9aefHKTYMUHOcEUYaiwOYF+eFuot0AqOh4X3K3ElVIVS5TQMQk0VNlMRaGpq6xclighGMlyeAX+vJ6hCrhUVWKpGf4qushtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801273; c=relaxed/simple;
	bh=jzhX8aUExH+tPlkIe9SsNqXDM4K/iyQcLa9dIBG1ZSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fp3NSpsbjpS4QUcIxU+olyVVqTuoXRQlsAtSoLtsUwFlDF68w7nSTSMcPCpckXOpaB4uOnFITCz/w4qb0LTMpQOSkNh04jbUOzrWuQzS3Ohj/v9wgJX9lV421t75p5qFY2flbWHqBKXR4iTrR/tR+ZS0GkYVBR3y8lioYPzf9ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaYq0VlC; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaYq0VlC"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c18771d582so83429eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 09:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801271; cv=none;
        d=google.com; s=arc-20240605;
        b=atb8KwBXAu3D8pBdBkjKvXT9XdIEkO6x/Qv9UXrOXkQcK7UcA1qyVFzZgE0QSIHrGM
         8ywPRmfuVg2zqzLlxLJbkk9eWsfwymprjJZlVZ8StN9QMokOHA9E5n+LJr4iR99CB42p
         LzqKm3r++xMkV0boF3XnobJ1+kfAf2uVaj+E19A3jqXkHHomJeXshSc3s9B7JuoCwG/q
         ot8+dy8IiN4UlhU7F39rUBKvE69DXe3xNTajTwOgCncp+w/lpuXC/z/wU4GKMor5xMRb
         hBz0feVUp28DJSisr/cyD+DIZmRLi5o25KpBQgFk/R0SdlRrK2Clmx1Om3gBhfWtLRZE
         76Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jzhX8aUExH+tPlkIe9SsNqXDM4K/iyQcLa9dIBG1ZSU=;
        fh=EWYgLOIbahRqdzVbc/NstKBACMbfsRTjiU3U/TZzYqI=;
        b=DKNF71rO0XBLH5WGzcqRq/E4lXfwH3nxkQCv6xxUhOGMp/oTlQH8OD+UcUmLi9QoVj
         D1a2Iah54tQj3jdi1euoPEUGFoRQ1LhMh74/3ZRfAJcxKktLIYmDvZXHtXq0Asv6HJIO
         FsYiONbAzPdRMkzj5OFKFqaaFCuaSv7nns+Uust1OpgBHDjbydq/JQee1ZVj1RoDaLho
         pPySOR3ImT94YLqvtnTwxmvSf5/i6c3ZV2+vINKtg3qAQua1KMTuEfGSm6mPOT8HzagG
         uPDUqkYjE9u8aZmkcXXIOXcsB5PL+FpDsJlXMHQ4acLk1AwkLNDz1Yxd5qhYEwbv+wbi
         LP+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801271; x=1775406071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzhX8aUExH+tPlkIe9SsNqXDM4K/iyQcLa9dIBG1ZSU=;
        b=JaYq0VlC5DlEL/yJtzJslRLBk0ryoueEVqFfzcAYWV16XauxtEJ2RmPf+cwhqsjLZq
         7WkfLXXABSVb7N7NiRnWvmcjCa6iLNbOSIHF/AYK+EkCmc/2jUTk1jH0QP8c3zJEbcgT
         kHNXBu/YjryxUqOe3BxfvdvCh87FIiN428VFMB4ASxgrRC4aOjySQIvDDPhZ0VGrTDpj
         iM+ZNoJ7u9iEbBSxvUkMJR8esYcQJE2hmnP7Q76hOeXSN/J6AhjOca/8AON4ItDHuzFN
         LPhb8lEdAIomVFDcbzkj8s1TAKaTX43y9osQ7xNEvqS/fd2j7doMcuvmsPJZYev0h/ec
         zHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801271; x=1775406071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzhX8aUExH+tPlkIe9SsNqXDM4K/iyQcLa9dIBG1ZSU=;
        b=Hm0DZ9JlCDwOS6D3E4bFSnErD3b9Vmh+b0wHtUJQ45yftO0oPDCkT0W7kIQNdNn1uu
         +gwM4PbFCiUvPRSBCtNdLtRJixrOhEO0AJuiq9ZGY283d29nORSy5pp+SZg09b/bQl4J
         kMvhZnVmasKWvYc7FCCEDhlJs9Ul/0lN0A06Ehe0znamdtPMKndsyH0fsRlawXULsDvA
         04bsW4AmwqjQ1rfdmEHE0fZRv34i39VXIIRAJXi+xq0IxFCio0XNayXxbOKmJSE/05IW
         YhaAeakRuFwjvE9RIXcjzuI3luq9T5un3SXFpq3fo2kYtyI5UvzFyCUxpjLxWUlv41bW
         SvoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjOVX3LpdDBOpUemDmeIooWtuaegbaMQPpauQxF2FwSDHs61IGlKJEC2GwjgN5fL6sR/Avn8xd8ow4eIAXRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxYxekVAJ1E2NqdXPyssrjPV81Dl7LcSwYMFa4qB/HPH32FNA
	tOPN6sczu1bDdlBU76qKse3VjEmOtQs+izVIUKA9RRoCRB0e6eGBGd2Ld1KvJno/TemJMFlKypp
	6coyBZ0rxZbJoSgHFlqvYhF2RdJ9311s=
X-Gm-Gg: ATEYQzxZW4ZbjdA6+c6vAxQemjmmuxrm5luYsXqkJgOBN20FYs6R5Kw9FoiYy53lVGw
	28PgDiC7QVwtRMd1/rR2ElX78NdKwlVB5byCCcBg8lolv2NlcwMzkrn2c+BDaYeMjXX25f1YdIk
	RlaKWdy8L2Cbx/S8PHcxtCpkiHFBjpvYc7TGYkXwFXHp1mTgmK/i/5KmrlABQWLgb0c8BINNdHl
	lcEnkvGcMepONDUj/VzdrwE0CQivcpVqomlnqJTzVRN3JEiO2ivnVg1k3HMS0Fehr9sw5I01XQ0
	ZYRyf11KqXi2kLS2d7g2T7/zMI/IXz6dmNQVA/Fywg2gYZq7c9mkFXP9vSkHC5SW/NOo2Y4hO3u
	5kd6tNnbTzNy4dv7mU3h6sTEp7/TQsPEeBg==
X-Received: by 2002:a05:693c:3008:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c185edf989mr2411276eec.3.1774801270816; Sun, 29 Mar 2026
 09:21:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329160254.2592207-1-mkchauras@gmail.com>
In-Reply-To: <20260329160254.2592207-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Mar 2026 18:20:58 +0200
X-Gm-Features: AQROBzCTvoth77fiJhrDvkboImGbMF58MaL_C2S-dTbD8IoN3PmaT8yKe1R-C4o
Message-ID: <CANiq72nUf7cikhf+kCdCgoydpMJZ7HuFWR8jzRvHSoGNGCv-0Q@mail.gmail.com>
Subject: Re: [PATCH V7 0/4] Rust support for powerpc
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 6:03=E2=80=AFPM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> We are actively working with our LLVM team to get the target for ppc,
> ppc64 and ppc64le in the rust compiler.

That sounds great -- I imagine you refer to a `-none` target? Are
there any links to e.g. upstream Rust issues or PRs that could be nice
to add for context, if any?

It may be good to put this in the commit message. Also, other links
that we should add:

Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451

Thanks!

Cheers,
Miguel
