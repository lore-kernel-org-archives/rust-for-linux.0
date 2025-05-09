Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23DD254AE6
	for <rust-for-linux@vger.kernel.org>; Fri,  9 May 2025 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746817785; cv=none; b=bTyEvq/fMeTBaFecjMcF68Gz8nSdOB9ejO4MemQTPgXAriireEbYD8C3pQIvLaqGSTTicMPfwG+hXcEO3dWG7uSeAOpRaSFDPfx+gNT4xcMKhhLABmJ3SpFPlqIivn0os6PffMuKnI8sqNMMMpSi3Hn647trDVjpf5b4ytNYX54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746817785; c=relaxed/simple;
	bh=qQf8woevCJ8kA3JtZEEcQ/O/k2+45wGHIZ83vkM20q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCrZJKB2SmISE+R1kTHeuft5tSspaAgfXaxRM1GTPsLli4wwUQ/YxdvwNSX8YDS7vM7pIhrbNe2+Izk5wB85+q4DWxTcpSdR6YP20zPLBpKzlfwZuYFZgwItwYzWGIsO/w2OlZWR3mcS3cDAcRnZ5msf3XUR11zsHlif+W88hHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XbBkHXwJ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XbBkHXwJ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4774ce422easo27242231cf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 May 2025 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746817782; x=1747422582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1US4Tot5ZRLUbVOfDIYuDUcAOxjlfPVY/WTxWnyy0tk=;
        b=XbBkHXwJlR+m1DWsn8aX+mEqfS6zwzImo8b8ZSZPzmCZqGydJEQ8q4Orw0vgDItTIe
         1ELzIcguJpTx8ZQSluuML4HR8wuFf+voLyOAqW/7hgizPNb/eTR4Bu643hi5QHFu+ulR
         DrlBj18g031GYq+WlFw579cU8Nf90++gCtU62qOJ5w0wP6AbKg1iZ8wg6vzq6vZuhqG7
         BDXkwqasa6A5zIKcAaJufmy6jdsVLpgdWX6l64wZHGFP3U2Ag+ejLK/c56ZtUjF+nP4s
         YahPcLcJBv0Asx86qkGrnyiQ2OTrVaKD0+QSNkFRZcVM/GTBp8VGN2zT60fMYJjvaSv/
         Hljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746817782; x=1747422582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1US4Tot5ZRLUbVOfDIYuDUcAOxjlfPVY/WTxWnyy0tk=;
        b=XgQPYE3X75tZDbq3vXIHtiVzlSBPi0ESojlswRmgnC650LkLYYvprFsPePYXUd2ddZ
         BlgpnBY8WOKXZRn9whWHregYeg7AkNODKo1TpCYCstg8XE3UQaOjxMVsNwZAKKXPaWEK
         ES5upHH+FmTSu3tfxDZqWKVvbILXUqWJ4OlyYC2qDuRg25pwFCw7nykfigPjEU7sefGj
         Vio2sqVijP5ulJqXmgyQVu2u/hMRmFoixXHRTdnuMcvP44eJMQwzILFoneUvdpzclPBB
         mJ2mkDxG20G3mrJZIeUxcz5evPa1Io/tl+Hgkp6SyYU2xiLFwKkw8KAspHBpRmEVCIpO
         oHbg==
X-Forwarded-Encrypted: i=1; AJvYcCWnWYoCpi9v5aEtjsxNKY2UAecIy9CDNJCSwskrhtNJGzZ2t5f+sFmsadxsCSqkzFp1WPm0bv+dRYXhYzgQuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydLPkYac/WFUIdn1oHt104oxwKDGhGn8Uw+b/pj70VzSvnixUb
	51lWTkTudt4ZGeBlHlGE8JnUHbhq1bYemxXN8ZHPa69rsCu/21rKUH6n8U8iHKXpRIHx4k1/V43
	cBNEGfTInP/OkMx4T7rB9V8kk44I9jqsF6ar7
X-Gm-Gg: ASbGnculGroD7z85ODPEK6c0S4ruqULdjpvgXEP48Dw2TOn0bxktpaFJuasKmJebhyv
	SkPqd82wPc5bwvRSpFMaAPmuHDlztGvypBB6i7LBZJ18XWEyFxckpEhjpRLi2+wtl0nRxP7pbT7
	nGc8fWs5RpiI8pmDlIdrPKx7ZFmotrhSHPYXbJo/u/wvKJe79+vRigF9wvSsyYvok=
X-Google-Smtp-Source: AGHT+IHvCrYZY/d2ouKHbFk+cJkR2aLg9kcOYaj5tuX+qslQ0tF6tgsnOc8lSUqm1Ecbb49tSZUe27RUEJ74/C1rTEc=
X-Received: by 2002:a05:6214:acf:b0:6f5:3e38:612b with SMTP id
 6a1803df08f44-6f6e480eb13mr64668846d6.41.1746817782359; Fri, 09 May 2025
 12:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502143758.23135-1-sergio.collado@gmail.com>
In-Reply-To: <20250502143758.23135-1-sergio.collado@gmail.com>
From: Rae Moar <rmoar@google.com>
Date: Fri, 9 May 2025 15:09:31 -0400
X-Gm-Features: AX0GCFtVkLsLpWqqi9BcnSgHiBSCQbxqkIfVnKy5ylciZiJb71kxGpm9Eprb76Y
Message-ID: <CA+GJov4N+MMYaRKCbma0tqOpjZ7E3iHvJi+aAk64u-R3EJG+5A@mail.gmail.com>
Subject: Re: [PATCH v2] kunit: fix longest symbol length test
To: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Cc: David Gow <davidgow@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, x86@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:38=E2=80=AFAM Sergio Gonz=C3=A1lez Collado
<sergio.collado@gmail.com> wrote:
>
> The kunit test that checks the longests symbol length [1], has triggered
> warnings in some pilelines when symbol prefixes are used [2]. The test
> is adjunsted to depend on !PREFIX_SYMBOLS and !CFI_CLANG as sujested in [=
3]
>
> [1] https://lore.kernel.org/rust-for-linux/CABVgOSm=3D5Q0fM6neBhxSbOUHBgN=
zmwf2V22vsYC10YRBT=3DkN1g@mail.gmail.com/T/#t
> [2] https://lore.kernel.org/all/20250328112156.2614513-1-arnd@kernel.org/=
T/#u
> [3] https://lore.kernel.org/linux-kselftest/20250427200916.GA1661412@ax16=
2/T/#t
>
> Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>

Hello!

This is working for me both when the test is built-in (run using
kunit.py) and when it is loaded as a module. Those that had issues
with this breaking with prefix symbols, feel free to dispute this if
you are still having issues. However, otherwise I am happy to see this
go through the KUnit tree.

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!
-Rae

>
> ---
> V1 -> V2: added dependency on !CFI_CLANG as suggested in [3], removed
>         CONFIG_ prefix
> ---
>  lib/Kconfig.debug                | 2 +-
>  lib/tests/longest_symbol_kunit.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index f9051ab610d5..5b33673d82da 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2885,7 +2885,7 @@ config FORTIFY_KUNIT_TEST
>
>  config LONGEST_SYM_KUNIT_TEST
>         tristate "Test the longest symbol possible" if !KUNIT_ALL_TESTS
> -       depends on KUNIT && KPROBES
> +       depends on KUNIT && KPROBES && !PREFIX_SYMBOLS && !CFI_CLANG
>         default KUNIT_ALL_TESTS
>         help
>           Tests the longest symbol possible
> diff --git a/lib/tests/longest_symbol_kunit.c b/lib/tests/longest_symbol_=
kunit.c
> index e3c28ff1807f..b183fb92d1b2 100644
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
> + *  --kconfig_add CONFIG_CPU_MITIGATIONS=3Dn
>   */
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> base-commit: ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
> --
> 2.39.2
>
