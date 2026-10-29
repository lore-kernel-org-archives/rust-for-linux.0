Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280799;
	b=PBHz9Z0aihvd8WD99Kk/BmavjVtUIuJw8vR42efPrcosPgJP0CwBrtDuuAiocXZ6nhBL
	 BYhDBxVuc00yvzO7PEZnrgVokovRG6lseQDyDVclWOsW2VfwVgeE03oJo3NYZC0a70HKJ
	 CCpyYgvsDy4tI5jFO21TAKewSs7WK80WKf7jMpKp9rZgTVvzKgvNolkoh6x9YxKKEkDpp
	 TmdM53Da+i+DclxJYDtcpPzACvuIdHXG9UCmYiFTapPd1HIl+08QZPU3p/2Vtd/L05Ybb
	 Y+3hG7OItA1jpPRTNL9rL2ifk9b6yUwT+AVWS6kEPr/eQaYlkbcTkdE68ley7g72fMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2i3HYlB+GbvhTKq0vS61Mj8mgAms2UmILds9Leq0HNQ=;
	b=B37zCngmLcFKhJIV0FGRBF3IfBNtf0U+e7dIf4VwrMW+xIzZrSibaoxwpefmOJHHYTXU
	 GeIM7p++zZS4GUBVPoioTwcPBc7aRhFAhmmzBqVPhPTljrH7nD927T4FxuuW24+7Zg7VL
	 D90mE1M+mIYjW5uknerjTQWZ0uzle9s3A2OofV6iPnyGG40bLBECcAtvY76asmDmcXZZR
	 pRpH/Db6U+qHq3DgmJIUZ4b1HpuTTEwKMkoNkKbWudx6f7d+WU6upgy6SKw8QuaO1tmuG
	 L0sGGm5701AUVIJyXKg94ezQX1xZIXXsGPC/8k8eFygryujfLE4FWeQkD/xHT3c/6WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBk1Rza3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D528606A31F
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 13:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D528606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBk1Rza3
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c162febb9so19188646d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 06:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793280797; cv=none;
        d=google.com; s=arc-20260327;
        b=dRCl5/PVS4f1gkaMS5HcQxLSUYNaf6WF30O3dvrS4Fia6tI8jroROW8xq9bj0rn8gh
         jlvA5gJUwqRrzkRWvF0rg62yuCIMfhYCHj3TkzhaOtX04I+KUh6OWACNDA4/YT5eHD0l
         fhhSp95n81LnspsdDDaWyC8Vd/isH9AG+7KmBVl9MsQu8Y9I6C1GxY6C2OioP6OBDA+U
         eDg+e2tfGJ86tN1D65U4znS6LL8jA+PVUiQ6couK1MruKUW0uEBn2vvEFmhlJPzaqufo
         uLOiOlS+aYO1lIp/zEndkOVp/RwWtsgdU/5Rytvu2sTp0SuepiccPkLbqRHJ73E401A0
         kIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2i3HYlB+GbvhTKq0vS61Mj8mgAms2UmILds9Leq0HNQ=;
        fh=4Y5RSAth5cHDh4xJ9tJRFvlucIJPYcPWh8KvssfWwQE=;
        b=iKGJChNFbgW3LeyVlqd0oW0BeI/xZIgsKuEaZhTlGpsT2sQTu2ScW4ph4BIJvuVcuf
         6Jsk9UImwxofplY1TgAmbFkdVcLGFm/LcfUjY6iqFY5ba6THqYfUURBDJrxhD0F2fGkX
         2552Ju7aFZLvRMxj0p+381REx2aKXzpqnNRMSjgU529ca+bhwlwGc4yX8lBcYSB/Odb5
         /0lcswJvMofc6oZ7Av0zGY0KMBKiukcqTESqlKFHfDJ8+Z3YbZYoV5fwLxLiXhm5UVov
         TIItDHyygNmIgw0fRE+FD/GPfuTT7M+lTpUfVMl+AgV913BFH1ECBZHvDWoBzjbLfs0b
         3GXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793280797; x=1793885597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2i3HYlB+GbvhTKq0vS61Mj8mgAms2UmILds9Leq0HNQ=;
        b=rBk1Rza3nDUnh651/Pwns2HNDnuy/0lby1QjU9+b3t9q5BL07PwHCmGSDtDQ4PIZug
         Kx42Hs6ZrSeflD/Dq7B3pRfWwQ/ZEc8oMkPyGE8kwCz9NqTt3KtSHDgR0eNz3xdzFpTv
         B02ZVtutkAoPAQ70c0A4NLpq0i6Jp4e1Kf3f90oAPLWsCrr5XpX2TjxqLXoTVkwWRBe/
         fDxnPtQLgDBGvnYCOP/LRKhA8EmyIxEbQ7+9RGZ+nZmsE2FF7HEgK9DFNIm6XvCs/Ph1
         DqFipXqM3CYZ6xkNqoTWAZZ9klLdvKP2ch05kyi4hmVOTNeMQrqc2/4eKXOLfrKdGevR
         fxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280797; x=1793885597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2i3HYlB+GbvhTKq0vS61Mj8mgAms2UmILds9Leq0HNQ=;
        b=UMvKB2YNhT1eCNQqwo2dlXNz+Uba4pb4pq/2BcvSDnuS1WPahhKYAuJFIObMA9Hboy
         xGfzfy8nfiU10b4ys62Gy3wqqZEM+sM90tIc6GA8JyHT1lmIlHOTd6/a14wjzVOdhF3I
         obEqKsxqKZUPilqxpWDRudrp/SMz2MrcAUnvGR54kryW0xmjjUAtr4KClwmTOUGzHvdy
         ye+4yZaG/uyL31k3KVCNMo7pHo7wSlxgHpLLLGHQiXAa6XlQeH/nyOzutMJDDFvMyjPe
         DIoDl4uU18Lxgz/8RGTZF69JLz+mR+9frKRZa3/YDbSsZGtmM1PRN1pIx9I7QhWu8/Ui
         IADw==
X-Forwarded-Encrypted: i=1; AKwUvBx1ibQIMsi4viq0p36gwnDVLpALzEf5u33t1UabEpQ8/ch5EbkaQHyv32oNUNejz1vIL8YbFRXN93ORWVJjdw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0TXxRjfunhiQGGlrQJ5/mECPkv97KTmlpnmlg27/PEFHMliJx
	L3g0Qe1FsIetR+lT/jOmi90hw5ByTh3JbwGMe336fUcth6d4hpF/9yDWUEiCQ0S19DyaM4mZibk
	hE4WCdECkYoxs9gaC/57M5X/Ea3JkeRo=
X-Gm-Gg: AYBFou14vCnh5wk1By99P4CfHbggFkwrd8K7YzJe1PCnZzMF/RYdzSh+rUwIo3FlHtP
	5WHXuUprUSk1TECr129dKrYgdsPzsXfmHMCbsKeVUAhMOVHd2JSo9Ht3E+yjCeuLuwQcU5af/Px
	IZ/ETTfYdzFj0Lqj+zx5kunNM7cRa3KVSgAnj8H4PMOQOw5+u+iqe0vbWf3bJyoUMgk/jsl182q
	0Oj6ku+JZL2tg1CuECOyih27i+OBqNp2f41dAY19Vw5FvflLlfQWODAnrIlNOOC/aeAO8ELh09E
	9tZ5VqMAHMk7tTqaG6cooAbf4mo/x9aIMqMuPg/ULZjn/gpcBJGT1Xnn6JqKEDgiAYkImJsh7B8
	j9w4Hk54FOqr6qIYQBj5wJ7t0hqmlGfPotcx6
X-Received: by 2002:a05:620a:4628:b0:93f:1cd7:734b with SMTP id
 af79cd13be357-94408cf970amr830248485a.34.1793280796965; Thu, 29 Oct 2026
 06:33:16 -0700 (PDT)
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
Date: Thu, 29 Oct 2026 15:33:05 +0200
X-Gm-Features: AclHuK9wwROn4TU15KaNzEXIRId3eBxRzEJjMKpQJVL7IKBQ3GuCcnxcaYqj24A
Message-ID: <CA+YDrKBAPZ9MHB46wVSsD4Vd-R8L1Kkz=Vp-F32+WyfJ5FDaoQ@mail.gmail.com>
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
