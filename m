Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601618;
	b=h2EtsvgC+Wb01XRn7bCHC6SFABuanvKer+2Ji7ybjnAcqUDYcLYlYFzYb7H77s8waYOv
	 QzYdphfqntOt6mQMRGbbV3R7iRh8IGPun4gdY4jDb4J3cU/zHV3yRmRWSqlDNDE1uh5kZ
	 VAI3geFtmAPjN8LAJtEo0IrokloZSOixwRWx8GUkU2pS+jWsReoj5q9P2t/FZTQ7zR3cb
	 xYZlUwBCvDIDTF64nAubFDbtc4cn0eSvjD9DsElR9/7jTNALXI+LKslmMog3jsuNUvLWO
	 IuOdO/grB3oGUeenT3TB+DtL5HPcBBioKka8bUAp5HicPkP64zUOn4vw0v3eJaVR1Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=N51TD8kOG6VzADFHEc9ZSbuydfiGg0bvUXx6UT1l3jM=;
	b=RuA6/wP0CuK+oIJSzc002pfy4CK4cIADA9FaXVxM49nreFBx21s9Wv4xtqnxacCxjuTZ
	 xjP3kij2U4Ni74RNl7S+wenyJRT6IkgKYSdwX8IYUKX73nfHS05jMdZY3tXMB7IWqz3dS
	 FndnqfcoFOaKW7nBcGaeeAV8jJ+uCCsiUtzYLfy1q4kVEaV78yXqQGqgwkXjqLUVQni0C
	 Cegnerb3UyxMCnfLsFnMCbzCUzszGtWRNxgLuwf/VJe6BEeiNzaXWxFLISwOLoAgltAPp
	 DFpkYGRAiQijQ95u7SsqP0e284XHTwP8RZMv4gJc0b8OIreVlMwdBq/Cg4mB6BiB0BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJuoo3LY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72700606A891
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 20:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72700606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJuoo3LY
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f23ddf32fso9918366d6.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 12:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601617; cv=none;
        d=google.com; s=arc-20260327;
        b=j3DFUgIhaZySRQCXefxC+/3z/VU/KYraMr0HcT+Kmu4YVgUtX7aaM5sZEOlqbP2vHe
         eqQWna/IEM1PkdqfH8EONApXRUeaCVDEC2jo3+RksQgU0NKNCBXeV2eDkb5yiekG8Mnr
         LOOCUTp/6M+5f7Bh7sOWFfogGymY4CjONyBgvGn3dUVYXk9WXmzlhMNfMC44se5IY08g
         5SaqmELCOgqVMeydx++zvMXK78sf7O2l7U29zn26driUQ39n1GYo6EnA3Lq3fn5C/qEB
         GsJVxyr/uS5poslDEkeNn135WHOYlQevN79HtaBqxdw02nwZNxLkiXuYxWfIbFO+5wjd
         DsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N51TD8kOG6VzADFHEc9ZSbuydfiGg0bvUXx6UT1l3jM=;
        fh=k/G057UmiCI4Hcx7Gp0UtMQpcx7X+nZSuuH4prvDS9Q=;
        b=U+KFZXdwUwzLZqsNFU9dHYx+YcgQbp2fDnIk4K/iicIpDA9nhLRm69F1p6jPCF4Xnk
         fUuu24UfdkXIXnwmRHUlTMnOwD40acSHoqDg5Hr4zt9qSRrvp881k4/KaliPUStyogC5
         VlA5EXv1HQTkY6bGbdrlpXS5aav2UD8vl1wWc9T1eFhMqGQn9rca5lD1dXqwVBu3ErbL
         XwgJhDqqafzUycMQxAkGY8rN1kR8Bk+hymA+OfVk9sb+hkqZNszlRrstYxB9ghs0s9qM
         fTou/BnUcuBDhGp7z5MAvspJcrGihjURxZGeqrbZiTYESrXhlnr77fpdSWIButuMmpAl
         yG+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601617; x=1795206417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N51TD8kOG6VzADFHEc9ZSbuydfiGg0bvUXx6UT1l3jM=;
        b=yJuoo3LYPuQUIE1yCLGwbdPXZZ/s9ZZb5nrp02A0PVgQAdyv/3ENMtS6TlJKI5+lvQ
         7gLFRUOC/lPw7h803x9+gpnmeprfx/BAFpptO0Xjs36LlKG4llAoOZnKESvjAvOAyNnr
         p42O2f6sA9d/lpova3ysL6uWlz+iVinZ9DT8P7f5ryyBMtE/jzcOXJY5ARfqzZkv9vm/
         LNhtd82GDz4z9xRWAxJJlrZNfA0Hf1ymj3qMGx+sgvCgMICxGMaFw39w0cduockzaM0e
         3QuxVCyWibrvQZgL6d7L3aEGE7e0UxHczkG/R3gyWLv58y4BDCg6eIy61Iidw5BMgA7q
         5Guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601617; x=1795206417;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N51TD8kOG6VzADFHEc9ZSbuydfiGg0bvUXx6UT1l3jM=;
        b=RSlGrDwj9hZpro7KmC+RR+byvm4vUkRa4OXnxZulMueJfUHg/WVxeox9Occ3fZaXJq
         FzklIyzmzSVo5o9gYroXRUFLQCgu30UyEWqUff62qovVLrHMdZ922fCjBvJp4tKcB+2D
         GP7Xegy0tpzKHHERRIsyeiv24r+QsSP5w77jAtaaEVF4V8Ga6foSU7xDPQDasKxwScHj
         Yr7RClTIl5kLdmfkmrTmRPhb62nPLo8CxrFqBI/VCDB6JKRox1FKmUGMmq3RMtlM6SX5
         IXGWp7krmW5uowbSuRZirvTACkLjKidlJAf4g5Q3w/rFoJf5+cd2UUrwa8yy5Wg4gr+G
         ZUZw==
X-Gm-Message-State: APuU4Z8GHrlRPHnSbTMgLKpRXRMb1t2XwaZG3KzkuIAzx0jOyOIL/V5K
	OXz9qQ3oBWoy+JDpy+ZJg+U5qANkc+Z7wFXvvQZKoVlHcpLODqdAa/jguiUIHnpOzlfZE+rUgWE
	yGp4ft9aWUyiQTLi1Ca9UxMHUg9XLrO8=
X-Gm-Gg: AYBFou0Ne32nGJqnTociPlcXJRlHtnBtY8Nwf8AcPP0ofI7gaeUQmKJGdO2T5DqRfes
	PlRXCQe8N+yGJveqNsb1I930vYhaI213Oyk7Mn1FSaWIWYX8/qMbL7ewepvmJbxVmbZ2vfUxBQI
	+15ZQkFKYIa82JlGIXSxoAWof1jnAPSadISehk0OOAKLALz/39AvOl+SGNgzuIP+6Hu8DCuzT8g
	uu+TmX06eIhm4ZcgawOgp8ghmLv5NAXSzAiCg1wERcjEst7mkXCF+QFrM6qmTOEXK4nx9rZGsPp
	/zUKwfUS6bovMJvA2RRA2WK6ySO59BS2FbbS2StKfc/AX1TA4l8GVLnI0BxJT6Xb4QkKJsHmjE5
	L23CqdBnoIJ+ThRW8abYQWaOyhmvnB2KJ9ohj
X-Received: by 2002:a05:620a:27cc:b0:944:9dd:b6 with SMTP id
 af79cd13be357-9494bccea21mr604768185a.80.1794601617414; Fri, 13 Nov 2026
 12:26:57 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029150147.11989-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261029150147.11989-1-mbkchelofficialdev@gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Fri, 13 Nov 2026 22:26:46 +0200
X-Gm-Features: AclHuK_cLts48NcMLZOfdSwAc0RmjeDt92FAQwRPmxIr9mwmNz79maXKNQR60UI
Message-ID: <CA+YDrKB1wBCo1iF+tTqa_oG2C2EssiSN-sCAdqriJqrwz5mmuw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: add descriptive doc-comment to internal fmt function
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

    Friendly ping on this patch.

    Thanks,
    Ivan

=D1=87=D1=82, 29 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:02, Iva=
n Tverdokhleb <mbkchelofficialdev@gmail.com>:
>
> Add descriptive documentation comments to the internal formatting functio=
n,
>
> explaining its role in parsing format strings and wrapping arguments into
>
> the Adapter helper.
>
> Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
> ---
>  rust/macros/fmt.rs | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
> index ce6c72493..676156dc9 100644
> --- a/rust/macros/fmt.rs
> +++ b/rust/macros/fmt.rs
> @@ -6,6 +6,9 @@
>  use quote::quote_spanned;
>
>  /// Please see [`crate::fmt`] for documentation.
> +///
> +/// This function parses the format string, extracts named arguments fro=
m curly braces,
> +/// and wraps arguments into the `Adapter` helper.
>  pub(crate) fn fmt(input: TokenStream) -> TokenStream {
>      let mut input =3D input.into_iter();
>
> --
> 2.56.0
>
