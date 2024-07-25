Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4751197A72
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721900624; cv=none; b=SCQQ3CNF2X6K0iOFhIK71yQIsTLkyhfTpGQA4vPaxqndtQUHS/36PTdmGxVaB91QN07RYM6Bx9xdrE6biHsJ1hzQVAgaBh8L7glvE5IJRIxjykkABuRsr7uvHC78NFzABlAlaepIJ4SJblJ9gO8Cy3YsPUcZ04M3uEMBl+wLXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721900624; c=relaxed/simple;
	bh=OfRkrMGGgNibJB9z9Co5Oyh5Kyaj4J7TqHXMn4wIC+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEAauWSCYnfX17fnF7oNvKB01MyIaYsGwI456Yz7ikp/3IZ+DSAySVO7tsiSiWpVAXLmMAEmY/UwaX3QVk5c4dIxeMghHZynrIM88remZFEi2NnIOda7aUruft5RFaNW9tlXr9dfuXEBvRDgUY3qqg4g0FJm854GbYZeNLKlmSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iYp9Z+9l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iYp9Z+9l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-427b1d4da32so10212825e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721900620; x=1722505420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=084GPfdeuP46Jz6Dyrdsi8DzZT3jnbvpNucHJZ1TuaA=;
        b=iYp9Z+9lo2Uo2yb2ZX65AhT1LXOZ7NhKsLiJmlLfttNBUDKPOsLqrm//gEpQfDu5GJ
         ebCGmyojB9bR92eXCaLLdZVgTb03fibtsPRPrIjJ2+pGXCgsZKbZ/mi0989O47IloXmR
         nqaDZpyUbmjA6aLjwdX+dGURagKwF/84nl5cmDcMNc4UrdKlIxNx5YnkaRq5JcrTap+s
         mzvybc5TP8uXA1O0ERowcthPUU0rD4npO8AbxshEMxwW+nz9vFHz6ec4Iz7a9aPAlh0a
         C1sON7N1Ae6iwlOWBNFya2YvNOJjfX5mCkmHHxo/AJUSTWBvzr3Gb0my7WcsByr22reJ
         PERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721900620; x=1722505420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=084GPfdeuP46Jz6Dyrdsi8DzZT3jnbvpNucHJZ1TuaA=;
        b=n6wb1JR+ygzacdfZxgtKevs4z1FKBzMRAajpFnDc86ocJBObqaAngjnqovA538fV/V
         GGl/vaUjjULnCUB7Gzf3T/F+m1Bj2HYg9quwzz6fI6IkRewlK3CI6+pGV4qBBD1ycajh
         j1iOew97hOS2BNBQQ2KiDQPOqbdKeju4PUyN2hFcibLG74nAjtOUuNZO+HQesIWtVuSU
         PbpvREb6xWJMetV6YVt8CKfFkPYQhrGaabRD5Uzj7pOINflFXlAK4ruV/dPhclSIZU/0
         hZWj6KY5QVtusw3axaU/pTgNoZSXpvylEVAQsuAhsGfyvyxuu35xKE56+MVFJuIPtUhk
         B18w==
X-Forwarded-Encrypted: i=1; AJvYcCWcdhi2VNTLVHZ4QHgBM17HYuM0eDAWTJ8nXlyCSIn/nFfAi1Gz20lAsXhW+9oEoNZ1F97+ldgLx5lDL8oAL8rpx64tGMytOqeahbUpHW4=
X-Gm-Message-State: AOJu0YwsUW8itckBU70DBCBi4IcyfwlOlxlt3pfQq+xtI5U4fuXOMoO/
	Dl2exXqAUssRu7x2kWLi4c5eFQYu/OiNu46UjtEwKy/DF5m+qpjuV/2An17nMGBVDky/nNBQ1Is
	m13UUFT3iSOj5tTz+HhEiTK/eJPi3m60zusk6
X-Google-Smtp-Source: AGHT+IE6X14IZDQ5Pvi0EHuAL+bLPA+DtdyDVXsBLCAhdXaKVx0/zepn3uPZTG5qlk+pSFE1iO35aByaX/zvkbfjpw4=
X-Received: by 2002:a05:6000:b81:b0:360:8c88:ab82 with SMTP id
 ffacd0b85a97d-36b31baa2d5mr1493373f8f.30.1721900619824; Thu, 25 Jul 2024
 02:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724161501.1319115-1-ojeda@kernel.org>
In-Reply-To: <20240724161501.1319115-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 25 Jul 2024 11:43:28 +0200
Message-ID: <CAH5fLgiCLxe3bjHtf3frY3vOsYucu4cFDtDR1UUZYXCGwxLv8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rust: support `CPU_MITIGATIONS` and enable `objtool`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 6:15=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Hi,
>
> This is an updated series to the CPU mitigations support for Rust. It
> also has the patch to enable `objtool`, so that we can start running it
> for Rust.
>
> It would be nice to get this applied soon, so that we start being
> warning-free (since we already get warnings under IBT builds via
> `vmlinux.o`). I am happy to take it through the Rust tree if the x86 and
> objtool maintainers give an Acked-by, or through any of the other trees,
> as you prefer. Otherwise, I think at this point we would need to make
> Rust exclusive to the mitigations, which isn't great.
>
> With this series, again, x86_64 is warning-free with `objtool` enabled. I
> tested `-O2`/`-Os` and the Rust versions we support under `-O2` (mainly
> for the `noreturn` patch, which uses heuristics), as well as IBT vs. no
> IBT (i.e.  running on individual object files vs. in `vmlinux`). I also
> did an arm64 build.
>
> Testing is very welcome for this one!

Verified that this eliminates the relevant warnings in an x86 build of
the android-mainline kernel.

Tested-by: Alice Ryhl <aliceryhl@google.com>
