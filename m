Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1CC27D782
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756039002; cv=none; b=I+HsAMGMtnHohDu+PG8NUWsvWHMZi0gQv29Ja+cKMIUs96o4wSl/drEHN5bvYlBTvqoVgEnEJG7zRE1ydAXrGBG7D5LIIstLwP7DirIV6Q/eLECApRh9AkEjJA6WnPh5wtKTm+q/Pp06QQ6wsKXimDFH1PK/v/61sTbmGC30Ngs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756039002; c=relaxed/simple;
	bh=FPVMCIoNdsRqqHXS6DrQM4fUzctcxByTeW0rhgQG3vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dt22bjjhOmZbmh6luxjU4n7bBZJebRPgwDZrXtQxffbgblBtVjuOTUIrYEDB3cKEaUIT8Qt/tnwVRDQAOR4tlLx2lDB6U5lTo9a/j13xNlKEconnxtoaisRCUTY2QOKAuz6xyVQGm0LMK8pZkvv7Q4HUHvpchPS030lZ16dC8VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GZTbDK8b; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GZTbDK8b"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c68ac7e238so897004f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756038998; x=1756643798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1rvfNHN5EBKyNOHUU8ULCvyPiJC4yatsNx2Khd/v5w=;
        b=GZTbDK8bx81VfZVzL/Y87nudTS0C5otKqH7Am3jG52z7KYAg7s6kQzW/fYj4D5fEE2
         JP8fKVArGzQGAIDTVCFF5U3Hpq+Z3n2zF7U9iIj1NPA7Hd2HAEvdfuVyv+XXEuyipvBc
         6xjysZ2u0a2+ABdQXveyAmXQCQdR1i8aAZFEKhz6WjBMD6d3HY+iO8vbKjCXvOxxDffk
         9VDeOyVLiwvEvRaK5DndRVZJuzG+IOZfdYegT4AwRmZj/Bt6VsGAi5wcMNr4l8qfyFQO
         eIytMbCJRlsSSqVJHrflHSk2kBDKmt2Tjci+ggUBZFFI9yNM6aHV3crWIEbGzK1MTVe7
         WMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756038998; x=1756643798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1rvfNHN5EBKyNOHUU8ULCvyPiJC4yatsNx2Khd/v5w=;
        b=MiJXCdbbQFQriLTsNR+/+B2/1iNMccmACawhR7ptyw9+LYuufU3NyyFSlhCTBdMqmF
         2Ppv14MwAVOsNt+TTwiztekbHacjrOv8z8nnUmGSYZeLksS/NMUgPgPuro8xU4cA6t2d
         PIvb9ifjJPzxy9UsxWF81BtoZNFvqwiLTSxD8u5FUbj0WE9Ho1aKJ3FIAaLF8W/O9JTJ
         1pIWsP+yd0TKSgUMkicu0RB2HL4eNY3WjS7w7V3/Ki25O3Tvfe2GPYGQs8JUSuzN/g77
         GaNPE+AEa7DrYPKZz2ii655xWlRRmvOyNeKybviujgMR6vQmjyIsItY6Yyr3P+FInzgX
         SZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCUXPNMZlioE3ZCy6PgJQhNilTnMsKPo/MgLQMZX9JHQSEOTb0TDGJZfJPlyu/RxMuwZoqBk2Ix93ay32H81ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQsRiCd8/2NFMvyfdkFDqGCTm64HwtoPEPcY7JQFuEPjxiHao
	R4qeApRJ0lDbkNBFptjWUodfx7OdZCxBAaggo+Si9dEV2YUoJvevPx7/2ljtTus0tbM8NXqCKec
	9UILLuWvApQkTbYFFBtkMfqb10HCdRuHX+RgMmvx7
X-Gm-Gg: ASbGncv2Ni/GWA2E1NrcLannHPTBy3R5PgLLF/NYpmGOl9k62kv4uk4tjhUY18ej7YJ
	X02DfHT2V1iAquHo/XV15aBBRR22cAIrHIWehrhYG9G2NAXohVKAxQfbmPSACTXjVwLgSyr1lbz
	yw1Mp/5RdgpwU3AFs3WadeZQwQHeN/Wv0i0Q5ks3Vj2w8fFtCcjptj7E5si7LdbAuJXQiG/+pcI
	8o6uNs/rEUMnjLul4ymYgBiZPIw1P7OhlYAFTS7ZidJW0w=
X-Google-Smtp-Source: AGHT+IGAL5ULN6cDtVMn93M/6ltr7rdoUlydoLJ5qmCG4isos1KCUAU1xW3/q5G82kK7ZLVPIwo+5OAa2y0XrKB//9s=
X-Received: by 2002:a5d:64ec:0:b0:3a6:d95e:f38c with SMTP id
 ffacd0b85a97d-3c5dd8aa9e5mr6585495f8f.33.1756038997507; Sun, 24 Aug 2025
 05:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250824120656.208978-1-dakr@kernel.org>
In-Reply-To: <20250824120656.208978-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 24 Aug 2025 14:36:25 +0200
X-Gm-Features: Ac12FXy27UlG8cvRS22_xj_eY3EZjdfdCW0w79oJGZ1pNncxo0nvIdODvAPLrn0
Message-ID: <CAH5fLgjkqcyzoZD7PP2i4g4r2uqpdbDKVW5hLfm6c9ysbxkPuw@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: add missing trait item MIN_ALIGN to Cmalloc
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 2:07=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Cmalloc is missing the trait item MIN_ALIGN introduced by commit
> 1b1a946dc2b5 ("rust: alloc: specify the minimum alignment of each
> allocator"), causing the following error on the `rusttest` make target.
>
>         error[E0046]: not all trait items implemented, missing: `MIN_ALIG=
N`
>            --> rust/kernel/alloc/allocator_test.rs:37:1
>             |
>         37  | unsafe impl Allocator for Cmalloc {
>             | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `MIN_ALIGN` in im=
plementation
>             |
>            ::: rust/kernel/alloc.rs:146:5
>             |
>         146 |     const MIN_ALIGN: usize;
>             |     ---------------------- `MIN_ALIGN` from trait
>
> Implement MIN_ALIGN for Cmalloc to fix this.
>
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Closes: https://lore.kernel.org/all/CANiq72k0FSBTB2yOjiAy9PnAuyM=3D-PHxL3=
uQQ_Cv+zwswnr_bA@mail.gmail.com/
> Fixes: 1b1a946dc2b5 ("rust: alloc: specify the minimum alignment of each =
allocator")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for taking of it. Assuming a satisfactory answer to the quesiton bel=
ow:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> ---
>  rust/kernel/alloc/allocator_test.rs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allo=
cator_test.rs
> index a3074480bd8d..0d3c78ddcd69 100644
> --- a/rust/kernel/alloc/allocator_test.rs
> +++ b/rust/kernel/alloc/allocator_test.rs
> @@ -35,6 +35,8 @@
>  // - passing a pointer to a valid memory allocation created by this `All=
ocator` is always OK,
>  // - `realloc` provides the guarantees as provided in the `# Guarantees`=
 section.
>  unsafe impl Allocator for Cmalloc {
> +    const MIN_ALIGN: usize =3D bindings::ARCH_KMALLOC_MINALIGN;

Is this the right value for normal malloc?

Alice
