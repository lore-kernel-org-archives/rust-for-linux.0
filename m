Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BCA430BBD
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772321918; cv=none; b=GRiECEeKOcuZYE0ZtqfMQc80pXI7zR4m6Q29p7Ln8t1ZfbzyVXw7EUrktPvLhT1FNgx/mhlhaGKX4pOekCX59cjUDo40dleIJNVFrRG54hWpkKQv3RKwRyhf2DDRGcBUxf0zfu/IatkBcRJWs2XMtn6gof3fyyPr0ON5I5k0GUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772321918; c=relaxed/simple;
	bh=AW5T9Hc4nbKkDkGmRXK+0jMJLHNhZgY/umP29NnIa7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BDBhP+DhyciW9xB7hkhAy01L69Y2wmoKPVemyn7j4BumtMD2969MAW2R1JsmpC15lWSK+MhwYcaq2JXDnqAUS3QeP/QXzWTPxSeegp8H4WQzYdB7JxuPEhQrgKmeGot3RQnBv04TUuuldV/eFH1BvTLsxhtqXCMIw6x+UjdGEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+62m04m; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+62m04m"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdecd00ebdso4015023eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 15:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772321916; x=1772926716; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hziZ8HwNJIKxde4jYjnTUIsaI5Anyr71P4ZGtylHymA=;
        b=Y+62m04madFEPG2Egzu4UaSzjbGXDICKcnrhiGXXheiJIWV8XF3Ust9Lzm9XRj1NOg
         NxhlxYWqHfePx190ZNflO9TjXEQusCNXYWz83MgFxaozOytFzerq/9V+8uZfNiZNTmqg
         I2Xukgvhy5yyMIjnNFbXDXsRFHnzq08+vLusCHGX3tNvszdulkTZO2A5CRx6QM4zGw16
         Le9evq6pcjjH/ADl9nr3Zi5Q/NYUnRSe1JbL9XbR/o+QkVbteknIsqaQTv3MitFMVuc6
         aAKwQqZhrUgL6ix1dd8js30UPZKEl3mraiY9wu/kr7LU5Rxm20KjYYQWodwNMeEsRi1U
         Yo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772321916; x=1772926716;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hziZ8HwNJIKxde4jYjnTUIsaI5Anyr71P4ZGtylHymA=;
        b=wJSJvONCZ0zTyNjLDfTjZldnHLjtqcAPkJdxXFrzqloz+PUFiP1Ponaw1OxSQyhFqC
         2biSwjUGLu83i+UfzQTRZDBzIxLuYVXd5C1Hh1zUx6obeUJ7HV+RZhOC5V8KI1fGXYOq
         Vivm3yJDlos5nqN7qJaz5rF3/lwQLBGMEcjILHk+pUaAcQV5IhimahoktV97mi+nEQek
         G2NWtCEq2rZCHlWyrKrR+IxYzn9+Lejo6xeteW8bAtof/ZpdvGqaDxHii+a2GjsYpiG9
         8fBOvEWGQn1pYr4IiSa/WlneblF395VFvwNzNMEHQgRv8eeIHA1NsJnXYf1DswnEuc7I
         GTQA==
X-Gm-Message-State: AOJu0YxyOwdTXx4ZYeffQIgftEDyCR0D7p9PJzK05NohJRvw+JJzRAn/
	4dPLPDP+QdcNmHbLXXIFd/FCe14dNy5SAQvSUoU3l7c9UjUfeRtBOefx
X-Gm-Gg: ATEYQzz2T6d9PfIgxrfLx1f4Y9GWPuOxcqVLEe5FoYSmhbEyDjn259l7WwcAgy/YRJJ
	dmPXO2RpyY1oh0RpYdI6s4y2gxShxRQGXUYbwh2PiM7cn1Peebk7+aH9gp8X+Xmz3d7i5sda9VZ
	08pmkZV6UovSlhp5GmiLhWk3GQxmKKM7LYwdVg+om2a07LQJ9hvlK37SNwYs2/iRugnzAvIzPPY
	9KOm+Ibh7n1LAQWUHgdAjDRJ14TdYgIogc8Jeu+e/JFUQ9EbKE15PShd91dJO288nlKRa5pTvZM
	g9M/oUD6CSsVhXk9tNWLJE1ea0eI6/gLLykFxP3N/uAq8PwOAIdhj8Euki2Nlq4YkG9HTqlYIjk
	Xm/282IcUsF8NbecRjlPiSuM2t7a6NiWvj21PUmjfLIui1U68wv58iqR9DTNyvp6Gl2f8CVCIW5
	9iRATnaLTeObx+Lmb/IUor5CcYo+vo1Od6qVz0MOn2I8HE
X-Received: by 2002:a05:7300:a198:b0:2be:694:5713 with SMTP id 5a478bee46e88-2be069458e8mr203613eec.36.1772321915822;
        Sat, 28 Feb 2026 15:38:35 -0800 (PST)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfb3f898asm1293640eec.29.2026.02.28.15.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 15:38:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 15:38:29 -0800
Message-Id: <DGQZOLAH72HC.2OE3REDD7M7U7@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: add projection infrastructure
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226154656.3241736-1-gary@kernel.org>
 <20260226154656.3241736-2-gary@kernel.org>
In-Reply-To: <20260226154656.3241736-2-gary@kernel.org>

On Thu Feb 26, 2026 at 7:46 AM PST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> diff --git a/rust/kernel/projection.rs b/rust/kernel/projection.rs
> new file mode 100644
> index 000000000000..186ec194f2b8
> --- /dev/null
> +++ b/rust/kernel/projection.rs
> +unsafe impl<T> ProjectIndex<[T]> for usize {
> +    type Output =3D T;
> +
> +    #[inline(always)]
> +    fn get(self, slice: *mut [T]) -> Option<*mut T> {
> +        if self > slice.len() {
I am not sure but shouldn't this be `self >=3D slice.len()` ? I could be wr=
ong but `slice.get(n)` should return `None` for slice 0..n ?
There is a similar condition somewhere else in the code as well.

[...]

> +                // Check unaligned field. Not all users (e.g. DMA) can h=
andle unaligned
> +                // projections. (e.g. DMA).
Nit: Comment mentions (e.g. DMA) twice

One question regarding the `in bounds` check otherwise LGTM

Thanks
Aditya

