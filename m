Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377D121B9F4
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 19:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752175820; cv=none; b=GuOYWRLd5qd7MPTS1YM77Rttf8up58xaTIuwCOBSxCYoAw3XqJT3YfaJ36aAsHv2S9760DXbLvPjoJ+zIXuC8l7O2GIwYtsq8Jsb7mbuw6XXgovFR5cWRkuAB7ef9y4/+d8j9Vmfd7IcaeXSoG8RklZspbo0ylFHmD7plobEahc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752175820; c=relaxed/simple;
	bh=EJ6s4tjHUT6RtbgUP+qOWodtQci0cx0J74QsTYz4VVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogGJmA8As5K9CxYI6Fu+gi+KB6YP816n6yP/1SCw1G9IZFyBrqaj/k4nxDDZMq2QQLIdhtEnZDjPDC3CXaaZ96o3yhlzk9EdVqD7J76vzFKelXjesOuY0ph1jSzjvF5guVO/M7RfZPvg89pD6loOdjsfBiOKmceUHJtpnaS+AbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D99Dt27d; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D99Dt27d"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6face367320so12795896d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752175817; x=1752780617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USEIpL4apCBHIBMoQ7JPvYpW1LrAcOYziqZdXP5+KWM=;
        b=D99Dt27d141/r5XQ/AIfIN8sEKybEgVy7KPWWfLB2K8kxh9YeXPGm4liw6icOra0Az
         RIrzbkR6FkuMImrnm5UBZj3oYgGJ5pDuTkqnjW85R6LZUEeIrG6lTLLCHkbmakuFi/nt
         5St2wwFFjszvFIhC6rB5PcvHyjNm/+Cta8yC9FYvUus+k8SeQGVSzjmOVyc+8rZtyR19
         0r+ztu1MFTnXkSE0DKGmZ6QO9K4RusOtR2F1lUDdceRC9W3fpkopsgMkFLPl1lBw80cY
         L4WmSlDwQf9WrLvhmx6w13iLs2Qc9KMuFcdTVCr5xEfsNwYrXm5d6SMgRN1EhMo0T06C
         Yp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752175817; x=1752780617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USEIpL4apCBHIBMoQ7JPvYpW1LrAcOYziqZdXP5+KWM=;
        b=Wf7IDNblQknGJ3iiG8hjn3JMqgnLny+pIlKkZJlMEVS33T4t41hfqoZXv4H23hv8df
         8Yuq1lDw1AwygWkbL8QdAKwBbE4YDcSrdAxz9rB+T7kpp3dyxRt+D1PWEX1e+T8V9xry
         EIFTS+Dwf53gsdPMgFmNIRstxSR11F+skQtHfaUgIrLqNVqZDtUnO8wuC00bhR370wmp
         7ot86UwsFxHu5jTMEE3rRwSFfbcRXHhrY0oZpALpuP5gkqWc3/wiovXBF+vWQ+0x4p9O
         fXsqR6BsuLdz00F6UkN624CauTuzoD+Oec1jAmnfDqhyedZHc1b+VnY/nSnB8WKe8+A1
         7hBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUTy+vZoI1ueDmJGoHUPH4dOs0Zjm02NMLZPbXxS/bPZ2FgCMh/juOlrWkAqC3N/jHug+xNm+V3Dw28g9g+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBsoNu3XP0rn2vVIetDTjoy5NSlObwIDOyrxTwtem+Bn23t7Y
	h/l4MC7Zp9fccBQIhtnQnVFrInmnO+XqJXRaRd7qOK4yfpczpChPXFs2vAAovZr27Pbzk32JpNI
	XUDbl5tL8y1dWXERtr9DQ6hKtyS2t7i46lDPP/bzu
X-Gm-Gg: ASbGnctW7p004ZRNJqBdCG8CFstT91OW2Cuih2oPISu4nvtxSE5ZxnvVDG7IM8HEtxx
	GMAgtiyCdXanTLykoiklZ8deEuDati95Y58atfgxtFXL5B+MSW7NrtwXsnXEYEPZj1k+DWGHu+H
	6j31Ie+d8+VySTbAFj3AMa7o1eb8comd3eBBLIWDVZg233gR8KVg5GGEBTh6u0byMG5gHrN2Np
X-Google-Smtp-Source: AGHT+IGZ42wCwYI6/mUsKs5W1wwGLVBaIdQX9pYAG5+GOjYCAt5QsHm7XxQOSQrB76f5N4QqzG2xfswRS2/KVu8ypPA=
X-Received: by 2002:a05:6214:1d2b:b0:704:778c:3b9d with SMTP id
 6a1803df08f44-704a3976eb8mr7470116d6.30.1752175816350; Thu, 10 Jul 2025
 12:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706201855.232451-1-sergio.collado@gmail.com>
In-Reply-To: <20250706201855.232451-1-sergio.collado@gmail.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 10 Jul 2025 15:30:05 -0400
X-Gm-Features: Ac12FXx5GXs_yCw2SDS55fJaE3Sbr8VfcBVMKoEwWHmO2efRO1bMOT4Nye6j_po
Message-ID: <CA+GJov5eXsoKG2eYch8h5HgLCwnE8+9RA0v-+9DW9TpP5SordA@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] kunit: fix longest symbol length test
To: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Cc: David Gow <davidgow@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Randy Dunlap <rdunlap@infradead.org>, rust-for-linux@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, x86@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 4:19=E2=80=AFPM Sergio Gonz=C3=A1lez Collado
<sergio.collado@gmail.com> wrote:
>
> The kunit test that checks the longests symbol length [1], has triggered
> warnings in some pilelines when symbol prefixes are used [2][3]. The test
> will to depend on !PREFIX_SYMBOLS and !CFI_CLANG as sujested in [4] and
> on !GCOV_KERNEL.
>
> [1] https://lore.kernel.org/rust-for-linux/CABVgOSm=3D5Q0fM6neBhxSbOUHBgN=
zmwf2V22vsYC10YRBT=3DkN1g@mail.gmail.com/T/#t
> [2] https://lore.kernel.org/all/20250328112156.2614513-1-arnd@kernel.org/=
T/#u
> [3] https://lore.kernel.org/rust-for-linux/bbd03b37-c4d9-4a92-9be2-75aaf8=
c19815@infradead.org/T/#t
> [4] https://lore.kernel.org/linux-kselftest/20250427200916.GA1661412@ax16=
2/T/#t
>
> Reviewed-by: Rae Moar <rmoar@google.com>
> Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Hello!

Thanks for resending! I don't believe this has been accepted yet.  So
I've added it to the list of patches to get accepted for the
kselftest/kunit branch.

Thanks!
-Rae

> ---
>  lib/Kconfig.debug                | 1 +
>  lib/tests/longest_symbol_kunit.c | 3 +--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index ebe33181b6e6..4a75a52803b6 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2885,6 +2885,7 @@ config FORTIFY_KUNIT_TEST
>  config LONGEST_SYM_KUNIT_TEST
>         tristate "Test the longest symbol possible" if !KUNIT_ALL_TESTS
>         depends on KUNIT && KPROBES
> +       depends on !PREFIX_SYMBOLS && !CFI_CLANG && !GCOV_KERNEL
>         default KUNIT_ALL_TESTS
>         help
>           Tests the longest symbol possible
> diff --git a/lib/tests/longest_symbol_kunit.c b/lib/tests/longest_symbol_=
kunit.c
> index e3c28ff1807f..9b4de3050ba7 100644
> --- a/lib/tests/longest_symbol_kunit.c
> +++ b/lib/tests/longest_symbol_kunit.c
> @@ -3,8 +3,7 @@
>   * Test the longest symbol length. Execute with:
>   *  ./tools/testing/kunit/kunit.py run longest-symbol
>   *  --arch=3Dx86_64 --kconfig_add CONFIG_KPROBES=3Dy --kconfig_add CONFI=
G_MODULES=3Dy
> - *  --kconfig_add CONFIG_RETPOLINE=3Dn --kconfig_add CONFIG_CFI_CLANG=3D=
n
> - *  --kconfig_add CONFIG_MITIGATION_RETPOLINE=3Dn
> + *  --kconfig_add CONFIG_CPU_MITIGATIONS=3Dn --kconfig_add CONFIG_GCOV_K=
ERNEL=3Dn
>   */
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> base-commit: 772b78c2abd85586bb90b23adff89f7303c704c7
> --
> 2.39.2
>
