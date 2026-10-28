Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793218453;
	b=FzrMjdTbwjYCmq+mN1DV3bSSs6TV8GYAA86/KbtpETDHzMSoHMJ7MaD3F/UsZ1Dkgykw
	 mzYja3FW8dD2eR0vZvVftYzKmLJZxj9M8QNNUNnGXhwIoSHV1W9SrkLrjZhB+lzXfiZVv
	 DuNEUmB1WSNIl7pFk0W+m+71+x0SBpgdPWFT45o944TghFQIKvCg5nuTCeRc+wnjlmTTx
	 o4L/52lLVupBYQ00X5PaI0lF0JWww33+lKwrTqHCvBA57BQ+HY2VS4uQ2a2hOFTbQTpSf
	 AwiKCGZrePHaWiysBggZRGHrvgRQ10WYwtdUOs+MDVfd59D7K3hgaJD0wQn3nhD1fjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=csQ/box973kWuUGXHjUHnb+JSV/cr2As/2S3bZoGtKw=;
	b=TbjB30Z/BFRWhRmDTIX9who/nGkAuCQaK9jOpprHYVVh5I2ntDacvwr+BoaOgOKGWQtX
	 wKKgqNrLRr2gK5LOkptMsyQxvFDKo3Z2JU8sAEvbaKy6onzs4BOra/m+3VmPeBEq/3fzB
	 ZaaoGBRv4ow+4kpLEbkuXk5KVjHl8/25aqpIMM4VGc9fgplUxTbnf4WddTJbMjEMoBbMI
	 C3OY63bjPTd/tsDUyj+ZSkWVp20SuxTvt0K7qo6WXhCi6l1qAjAwkRLF4+1nSJsDhUPYE
	 NnPhsR5tTwvJl6wNyB01xcm4MOfjX1wsLN86p6FsXBq7wDz8Pax1mn2lpcHnWmmZMkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrkbgZj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3356E606A321
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 20:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3356E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrkbgZj8
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53bb57f1310so16950511cf.2
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 13:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793218451; cv=none;
        d=google.com; s=arc-20260327;
        b=CFHjOCLIfCF2sxQ7focc4NUcFW9kBfYMELNCz8Ye5cQDD+UG2ziU+iRh5rqUsveGNA
         m685cA5T3o3ox3nyYl9dTiI4awr5e9ItbfA6oNyy+CH70l6z/+KM6iHrM+eg2bo9voVp
         /Y53X3cunUS4lpuAs8aBZKXL+C6EhDOw+/Y8Eci8irOE0bGglIDbQLKbDlL2g/NRATY6
         sLgN8WnZt7B+naRkZgb2urjW+6CesdlBFSXdNx70aqsyQfsw4gt0cLYGIOv5HNncLCC3
         SWhEDGC6Y4siSgBJUAV28IafILqiFu3zhkU2MlfjCDrzDHV5APORxGSzDJz9mygaPPZO
         PXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csQ/box973kWuUGXHjUHnb+JSV/cr2As/2S3bZoGtKw=;
        fh=YzlSmNJVsMJGe7HTPzaefNZE2VTJ67+GvEf9TeyAw2A=;
        b=g67UugAZkE4PVvuO7zLU0/AmIrJ+040r6UCImz/tLvYQlgCagjwGvd6kaV9ftsxpom
         XWEo7e0ei+UXpLDYHvlJizQ+vbLUwCSFwZlgzwgTP9lHNQ06C0E1GaeneBcpA23dzt9F
         DZhlOE9Fs7wfyzLoBqxqrAmA8KBx/KiFYLPnov5Soscbo2lZpv6BlUwo2SQrSZhCQf3v
         SbaLUka5/Svj+Xxhx5nSgu2kc0ZVRehPGq9jq/vfvualqAA8sflev2sz+QzTT2K5K+/X
         8fmxG8ATG7HcMpPQInovZRUCws8NIfGFlC+ZOHJpl7h6+D4eK8N3OSXcsTmE5SBXVImw
         jm9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218451; x=1793823251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csQ/box973kWuUGXHjUHnb+JSV/cr2As/2S3bZoGtKw=;
        b=GrkbgZj8YBEsBwIO1OQTS2rh7snbAH21CTecRXJlz60RQzoxkzBiqwCplXDuMntJnY
         OMyClbsk/Ai2Qx2glN4KJTcPlWQWqCw1v113QTDp/ioJ6hLLy19gDuqDMpdf6ZXHElVf
         4AHWl2McaG4h5wW4WJrovav4XFIbirEZw8urzto5qjM6OZ+5C7PvMXScrXF2PBgsRMcT
         SyyN+8XNSgEq1bSxuIMeOyUPHTGlqhxBPG+XsATLbHaDEi7lMr7YJc5xb/XKGH7lR/Sg
         tEoFudP/e1M2GvReYGX3jNqb8ou+i28WftcaHDKMd46o+kg7m3WVtndlX+ZYIsHtBZwc
         khfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218451; x=1793823251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csQ/box973kWuUGXHjUHnb+JSV/cr2As/2S3bZoGtKw=;
        b=Tp1n7ieqNFJXBSGVZh3f+JdDsuDCooihqGOEXBUuW9AldZ0Cum9WSCamesLAMFKvV5
         E31QzM+/dIeyc2GXrKIB917WAfvYHzUT98wL0SX54aJ0MjHehsLg1PgWpZo/WF0NEGzD
         CrVb7hVjA6PZhc5BE1UrhZPhbKj1ZeDCMIq5G7FL+9H+tbP5Yx9l8S9bfe1Y4jRewOrC
         ejBo1j73hhpXBx+gJ1I24svLxYXpCK/Ip0QggDpPjwRrrazEdjd7asg1rGWO5i1VCWwr
         WrC5qvFv1FBlIPuG9d84xm1UlRJlkQhK8SSETB+HDOXeZaYi4HZ/GZDRe/XVdEz3qgFr
         IWZw==
X-Forwarded-Encrypted: i=1; AKwUvBzQrbm/97YoV528YovxSmFLLuED1djm7JKxCwUE9GBePlkRn07UopPCi50RMdBr8i+8XvxsSEd5RrB3kyCRsw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPDiq8O0qlSXzL6gPTvYoOys6hWi7dFBk0aUtEQV23pPaZh1o3
	TNfoOgQ48YD+D1/UI9Ynp8rVKkojFp7w/U1lIyl3FG2rnFUFJGv+c62AD+ubeJli9HI44kQCnGN
	Y4GemSUC3RsKcR7lsSRyRG38b/vtywOw=
X-Gm-Gg: AYBFou1u41NxCR+kvHAm2XAcmyXPrgID5JVJQpqzPMl12JDXFbJDVIHeGP56toZ0hlt
	jkzRw1Om4/SrbSvCv//6rpo4/FoOw9uxmy7SuCb/X4tZIDgoRwZOJbZ1vEnhGM3CMwWXGYYmFTF
	GLV5FLZ6ILndPcGuPRmCJNV03qfiaKhyg0HOTm167hbdQGP6RndWsLazptc6ZVuWYKyGPy5KMCz
	fqCGle9jh2lardF/Vz76sYNix94PNAXWdqkJ1E9/C8vUg1Rxkrpr4YAZTT4xa0gOcKaoZu9f2cW
	9AdF4dvzYDjzmImz6sJY9c4LrDpq8kg6vbeWIoCy8k2BpChxTQ0Z5clJzBGPrpZwIJQSwf+o8t4
	6rQ/XIKtMe7S470utyq6QaM7CA/hhhAnByR39
X-Received: by 2002:ac8:5d8b:0:b0:536:64a3:aaca with SMTP id
 d75a77b69052e-53fcc6caf38mr60121161cf.62.1793218451089; Wed, 28 Oct 2026
 13:14:11 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028155005.174417-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261028155005.174417-1-mbkchelofficialdev@gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Wed, 28 Oct 2026 22:13:59 +0200
X-Gm-Features: AclHuK9QKQWnwAVDv7GI9zgwHXTw8N_TI4_-PW1Dq0nQhME1r2ltFbMpbGG5jvQ
Message-ID: <CA+YDrKBeYvS99gpg+3knSXRuNj1a3_YQjX84xfQzQgNyrSpUAw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that I made a typo in my last name in the "From" and
"Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".

If the patch is accepted, could you please apply it with the corrected name=
?

Thanks,
Ivan


=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:50, Iva=
n Tverdohleb <mbkchelofficialdev@gmail.com>:
>
> Add documentation for the emit_base method within the ModInfoBuilder
> struct. Explain its role in formatting metadata strings, handling the
> differentiation between built-in and loadable modules, and managing
> linker sections and conditional compilation.
>
> Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
> ---
>  rust/macros/module.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 0a7b9e24c..6f361013f 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
>          }
>      }
>
> +    /// Emits a single metadata entry into the module information table.
> +    ///
> +    /// This method formats a `field=3Dcontent\0` byte string and places=
 it into the
> +    /// `.modinfo` linker section. For built-in modules (`builtin =3D=3D=
 true`), the string
> +    /// is prefixed with the module name (`module.field=3Dcontent\0`) to=
 avoid naming
> +    /// collisions in the final monolithic kernel binary.
> +    ///
> +    /// It automatically generates a unique static identifier using an i=
nternal counter
> +    /// and applies appropriate conditional compilation attributes (`#[c=
fg(MODULE)]` or
> +    /// `#[cfg(not(MODULE))]`) based on the target type.
>      fn emit_base(&mut self, field: &str, content: &str, builtin: bool, p=
aram: bool) {
>          let string =3D if builtin {
>              // Built-in modules prefix their modinfo strings by `module.=
`.
> --
> 2.56.0
>
