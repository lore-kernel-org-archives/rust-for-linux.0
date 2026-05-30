Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3736F384CEA
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136289; cv=pass; b=a5ZYcm9lMPGjOWXfjVmHG2gLSKH/yC1l9TVCsrfhNGYbmDWGoXCqLuPuCQYyYfNWAVzByWZGzcTHu/a2/dfsGebqMcEPBXAUDQgbjNd+OwMVe6yLojl0eh+/fAwYsIFxTktSCBfq4xMaAKnmX3XbuCjrA5uAYiifCUgq/13XGlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136289; c=relaxed/simple;
	bh=88Mpui27trfRvDycoOcLtNBGUBsAL4SF86wsePJZCw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIuvT0VBqts8eVKeTDYc45TjILP7TuiU5Ii4xBqfEcD3vGSxe+kzNeqiUyCRcTEE/TR1uzDLVZ8whXe21ITR4qbqSEa8pi6Eei+RTFawejx8+WWjR0uTEIBQE7CGkUMAk5rueS946WSYUxdqY7mGcztXIz4MH+mbYLFjoDE7PfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0DwDLWM; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0DwDLWM"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304f9bc869aso115146eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 03:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780136287; cv=none;
        d=google.com; s=arc-20240605;
        b=i8xLIe4b2KTZ0fom84MsFgudeNlSkCNXTpwIK2aoiwGl3RyLad5T3qaOpMJrCqXGdL
         fJE+V8ZL/jNmJcDI4DQ+/AmHiiqEBJjCDUeCI9zgfb9y9xlmUUkVWO6+Lpxdbu3Djd6x
         sjxTvasfle91lKAsB1FX/D1DEV74OLDNYZxzyb19eVk/ElRw8ZwTYeNrjdf/b7lnOqDe
         HnLP0XS8C8kfXvGZkoiK4w4wDmnbokSCELTbvF0i2Sl48DgwzEMXSr8GiQdw+jK82BbO
         4Mr4kzA2SZFZv2KLZibdqWfDlE11KNfasWfP6u02utoMFeUO5zCGa/5V3CBLiaIxJ5uo
         f6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=88Mpui27trfRvDycoOcLtNBGUBsAL4SF86wsePJZCw4=;
        fh=8MWRYkYtpn84vgt4n3JhI3xxpxINUkv+zV/M56qDHR4=;
        b=hz1AYhKLecJa0byUNe3zX/h6MIywVdWPJkIyqjrXDLaSFa1Sf7XQGKiD6ElmABMUfb
         O/Y3C3vA6+Gr9wQ9Nlu6lDqOGusAoGoRg2iQFVxHLzByM6Kc1cn4Gs77ziqjFdmgAEDs
         JwLFmkMlKZqlYaRFgyw9NFC097AlQRwa03MdtgQo6925o0xPbcG9faQBXAfdFLSyrvG3
         qIU2KckKDtjgX9i5jZMdaQQKtvFq26t3/2IMxGpdyB5hPz5M8X3YW+/7d+J5Bic8Xbok
         5xr3T3wSG+fUqGcXxsi7T/OaIcLjeSsL7tTqBHHuAxnmTSh9iZnPyaEUbpk2vgzJL87K
         zIEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780136287; x=1780741087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88Mpui27trfRvDycoOcLtNBGUBsAL4SF86wsePJZCw4=;
        b=H0DwDLWMLUOJyUqmr59prlD0Yla1eG05hxOLnUuDY0mLTQGA40IksdiT8pEgNUU+xQ
         dwdjbH6s+FTuO/6w7CrhkijXQeDd/VGxVmuQPK6sURlaFbllotVV5YliTHAbEKUSwH/f
         q4oCR9mc/xLZy6a9ViFQ4kddrwPYI+EchXkD2Dvgbv6EVb0dbHcmoc68P46lUPp9Nyan
         VEyfhUAJLD08y7iWnLg9U36J1moCi/cniSGu/xuipKyzI5L7fJQIbRl3loMBGmOYvUQZ
         4R8OAsiEVi4AiNCidaLEMFoMFQymtT5b/4HB8H2uG4L31ZU3Nmv8aoA88AdTkTLrm2NC
         D9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780136287; x=1780741087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88Mpui27trfRvDycoOcLtNBGUBsAL4SF86wsePJZCw4=;
        b=K/WsljjUhCKzqKzgjWSWqIQ01QxpdusAJnp2SZRIWPINosFckQGAatTQRPFuhhW5HP
         p/JJ2ARgpEbJRWk9isFjV6Yd3+Ncdj2eHkmdIHMQU+JXYrHdqtJsf9viAIgafurPGXgh
         bWZu1q4Mzu7RGCwXvXbL5r8RSIsuzDpbpFTZNn7fO0kfr1Tl2Znei4IK/rNBRTwFk/53
         bp2tiBHd3yKLXwKzZl+273VStuIpaSvjn7YqUlSFnAQPNnGtrNqb0PfUHNwizdwVbFEe
         EyzoBtuNZ7YS9kyPizRjonXK34Uz3GCmJO1ihcO1bJ73HnHEvEQoNbtLF2e/a079wbhi
         A6AQ==
X-Gm-Message-State: AOJu0YyWpe1+0GNts6aKVcuZxzYwSeherZYwRZoTnvPm/0CyT4YahdqS
	eC+qGauNM9vNRDVianm85U++QjrSosh9ApJt3ZokI5RKMiqsQRatodMZJxtUsGeu5MuSqQ7FiAk
	MEz0fK+h0L22nHrkBthZSyjd4N1hZr8A=
X-Gm-Gg: Acq92OEBO5lB0pz+LA/8x/Cc4FyARXn88ygaoOpchO3er90kfFaJtHcSQQAYLIATpO2
	snjiIR+x8mRZgsxqDaK/yrSrmWP4OlwH7HgoNJ3bYaanOflUBNUv6gEYEme9l5rDOedHJlko8Zt
	sItiwMAyqAjma6HmZHwAZGambUtR9ltiB9SbOdqx9yG0zxijzBFA4vmR/D16MpcHqM8JMNH88rf
	u7kqd7Ki0J4qdXAj3z1gulqdMPkuT53IxFUzGBqn3Z3ETO6+DhGbWh/0orkI6XXor40Bh2PVZ+9
	u+NCbPx4pxG531OhcLj53qKxJXTC0wjX9+sIL8phbg6/PbJM8cVZ6tR5OsytsYte/NwwTmUNt2d
	rjDZaEIOordwGtFgqkUSxZ0CYJIwXO76wfw==
X-Received: by 2002:a05:7300:ef83:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304fa67adabmr772144eec.6.1780136287248; Sat, 30 May 2026
 03:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530085821.19689-1-litvindev@gmail.com>
In-Reply-To: <20260530085821.19689-1-litvindev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 12:17:54 +0200
X-Gm-Features: AVHnY4LoscA6yPn51ROUDeMBOyo94K6YEFuKt2ZXOLZkSnzQoiSb5zRDWtZJ9YE
Message-ID: <CANiq72mBkBxGk4CbTrjeNYZ5ZUsD=wVfLVyP2Bcm_v9BExQaGQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope"
 command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
To: Sergei Litvin <litvindev@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 10:58=E2=80=AFAM Sergei Litvin <litvindev@gmail.com=
> wrote:
>
> When executing the command `make COMPILED_SOURCE=3D1 cscope`, the `cscope=
.files`
> file generated by it includes filenames with the extensions *.rlib, *.rme=
ta,
> and *.so (taken from *.cmd files, which, in turn, are generated from *.d
> dependency files by the `fixdep` utility).

The commit message does not say "what" has changed (or "how"), only
the "why" (which is the most important part, but still... :)

In addition, please provide a changelog after the `---` line, i.e. why
did the patch change from v1? For instance, was it due to Sashiko's
feedback? Something else?

Finally, Cc'ing Kbuild.

Cheers,
Miguel
