Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B13282F0E
	for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011898; cv=pass; b=cW+uV3+6D+9d6EI/fg8LHbgmhj6RF5FAhIbhVjYgsbeeSlBKOay99XytF4nNftTGZImXuCZToiwyvKuw1I4B9u2m6JbrrfxG1TiP8fnesSULtDMMSwEbuNXH30hWz+S+YDqbe7KxZ9SWwA7F5mKqvLGZu72JglSlS59bCtvRvTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011898; c=relaxed/simple;
	bh=sp3vomFJbomNRXwJxSXApRuLFyKOlFqDaIARfWjsK6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIGD6g/+QT5jl39EFjhyHX0jx2KKYa3vhYEKCmmxV73g7XA8Ne+qzXelrKFeSIrsJflMTTzHqrjJvYFvEsCIzqf2Sq3cwm3GXx6yWnOOw06qUBvkL7GoabqKHW5ikxK9wMVLa3qIU+wzUm7elMMyXdxP6mxPms4rffSOnCO6hiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezcd+O69; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezcd+O69"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ee34d7e55aso78533eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 02:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779011896; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCu4GS1Zx7VlFhgweR8/hkag55zDDa0wwjLoxqwl3kuLk6EL+dFe9Tg3ZJxxvmxWp5
         sC5pvPFckWEikSXIqLyqJ8/G1WwzSDM2joIn66ed2d23IVyyg0g8bNeu5YcPa3cMdR9H
         aBt3NI5tllXqw92vMHwVKeSPe/b1WGvU4UyTq0O1MhXiTxaRZ4dydsZ+WYXc6/NC76d0
         s5/R8WuW6uClgUUNPTUPRhqtHavr5ZaxVQqA2K+PTiTS4gkk2vKx7V/a+z2l0RVXb5xX
         tjEhO2IcyxhrCTCN//59iKoXZGM9lKU+WSqHP5GPi8UA46FnZl4MmGkEzIeCB1yDEiMD
         Yntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        fh=fvbRH1hJOohwFet/nAjh9/AJGhDCe9VxJUJJuq3Z06k=;
        b=eCR3Ido5G1uABjVx0foFvz+v5xMc/pFTGcQ2D/h/NCH9+aIL7jwQu+YmTVHsJE+k0j
         TzxHLTLwemSFdGV6iqc4WpxRVuhj0l211hHjMwya3TM61kC7La7wQhRifkwGFtfVf8gw
         3uwGosuj42kGbRE6wsgh7HgIi3g+CBGvdQH8ufElGjwYnoqUF8dLHbEVXqIPhmntoQil
         AtXoFhW28BIR2yWHBvwIqpHvFptD4ErkyySO3pPMAzzog6z0kYKdjqpiRzIddOO1luQ/
         OuVRO2F6zPs08lAyczgb8pg2A0mjCNCmoRlYwfqB4tRjqY4t3vnHE81UUgAhbdQeGlnV
         C3ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779011896; x=1779616696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        b=ezcd+O69uadPZ5Wn6BCRWd4rAgDFUxZf32qb5GJWtHU18iWKQU4Uh21aCs8PGCrg2o
         gXE+MdJsnqk38JpqTQd1LEKAMVOZVNmwLdIFdXhBDFPA8FP8g+CSWLJ6oHhb1M+GtfzB
         Avp0eFXoU94fg+VzXsTkqCLpTYCmglZhhNPTO/AGYo0BCildVj4sFccyyLk6AK4zF9EJ
         8sB+RYGq21xgC0seNiRkF4p5/EqTqfdypgkYudazGubG/EsaOyOuLtKt/myuBbPc7SB+
         oDpNDwzOJZpSV5TvWdBd3kEfBl2+u1ytDxJFY/sgCwQtDuHqo+9dyC50EjUnppd371Uk
         YGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779011896; x=1779616696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        b=rABD2CTfMU3y6pVVxtXG/PWU6aKCTGGBKH3BqGFuI3dFj3jkBFohk+45xOuUy86Goe
         elvkdhcnX9vCW5xUIno9vUouseDdKuhiFMM+jhuSR6r3CgSTtyNLun+3fbWe+VvdmkM2
         ZXlxrT/5PORm4i5S4ZPQ+Cl4PFgxUjF+UW2C1iqO7ypBLB3it8OM9h8mG4LQy+y+MFj/
         8nlJE2tfj3PZDm2swWfJXX9NkXB9qCAI755y9E1iNkdQBGdKaQbsfCTHPkIEZ74d9+eh
         ilgqLt7QnZH6+7bx+6S73Jv+QPUE6N/godQvTpRGdLPUP+HQkvPk8Vc8g1sL5hAj+lkI
         3SwA==
X-Forwarded-Encrypted: i=1; AFNElJ8K/gwZezLzlxYNMcZXdRHznJyZWCNobNGzZh43JTSanTSSWmYrFNKtK7ltZ8/0MtHE8yrWsi60SmGFeQVvaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb1TJlAG+hhjE8WRMlwKFwQS0bVLBns95Qu67LDw683Hf6tBiQ
	L/sZKL9Cr3UeVVuuE4aanNpA3jjVEIqXcmwpyIQED7sYrkpoQl2gjStVrL33g1rv3zLOI53+9m4
	g76HOmmLhTTIIBCDCaqKg00zj0KegutI=
X-Gm-Gg: Acq92OERfbQFRrIoSY9HvqpAB4Bu2JO4hUyaZQvoqphoLbBb3zB023Kn5mMu5dcI+Fc
	/xgS/QqIo8h+QJsyfdiio35az5UC3a7A+VmlPCY09oyri1buAF0hFGSSjnz0w3cEBjvbH+AnClY
	WbY8fqb0o0BhYThuNXWDihZ1ioGO93ZDj+NDyR/eyWjlM+cfn0krc3nmHSgkpE33B6NCrY4yIA4
	Ci8q++2vSsEhrDeDenqsWyWJcluS9g2OOhMRfspwUeAXa6SM7zYhlsP4oKlPDVNuNcO4VPzGzcN
	detFrnRn8QzU5wsOgH/rJ2ZfnPlnN8WWYCS4KdTawUETrSONo9qYrhNKTzjO5P3OIFE6h/8zWfY
	f+F4HmoWrLri6HBNoP0aWCPWqo2TDuH3OIg==
X-Received: by 2002:a05:7301:6785:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-30398176f35mr2482107eec.2.1779011895953; Sun, 17 May 2026
 02:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
In-Reply-To: <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:58:03 +0200
X-Gm-Features: AVHnY4JGl9cz96kI-HTqmFFF02vhAFr-_P_prP7jRQ5fdei8qmaB-O5q3qa_jXI
Message-ID: <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 8:10=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> I think it is simpler to just inline all of this code into its
> single call-site.  The safety of the code is obvious in context,
> and you can avoid checking for impossible errors.  For instance,
> since all of the options have required arguments, it really is safe
> to dereference optarg without any null check.

If we are going to have unsafe code, then let's please build safe
abstractions wherever possible, just like we do elsewhere. We should
also write `// SAFETY` comments and enable the lints that catch that
etc., just like elsewhere too.

(This is not to say we should use `getopt` instead of something like
`clap` -- as soon as we start using `cargo vendor`, then it makes
sense to at least consider having a set of vetted, well-known crates
to write Rust tools in-tree, as I mentioned in v1.)

Cheers,
Miguel
