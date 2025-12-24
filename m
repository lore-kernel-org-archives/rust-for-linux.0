Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFD335565
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569414; cv=none; b=Wo2ukyt70kOQyrA2fI1azzHiZA7NDoenDX75yZBN38NKQXIc/OVwORqnsRTRVDB6w/0dDN61fd57Y2OdMztJ3A3/w8BOHVbGWO7ZkA03w4W2HuLIek2HWmSQa4VSsnhbUBokjJZ2l9rYQU0H93M29OeGLPAwpJ6YaHNB2F/Y+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569414; c=relaxed/simple;
	bh=AXrA3sRJwnZgC6dfkQwPIf3oBdpxwqAB6RNtrpM7rKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXJQlebPz1443sUdwqLuV00bRhOygioashUC8hJVCmbf0+BRJIVpJitn/u1kqb6EvHF46xNORSTprRp53QaHk5SnrdyTdr4n+CHRGERyB5QmXDg7mPaih5rCgeTtMJojoJYCIc1qAQfp2qsGRq/wV7c/OvzatXp9CcUFraRI0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8YBJxky; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8YBJxky"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a110548f10so18583925ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 01:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766569412; x=1767174212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zE5g/APfOf7Doh4n8+ohsSXdsPUU5o9q9e6BCGyON8I=;
        b=E8YBJxkyKDcchRMTyOrg02k2SOOu18ZatgDsMvIJmHbwg8sPtMp6V8zLAKsh6F5yi1
         p6l5zT17BOG7cYR/LtE6tkBNiybzzh9bXFPxfOuDXj9Wt52908wqTOmlt6kqwl02IkAW
         5zZfep/sm1JBcWg6lZMZYrhgo9be8qrwJZmLGIvgCEKHDSLX9eJMbHf+9h1FykXVOz0u
         qob7aKi1olUGKpqBWHQwaCVeAWePfafeHZrHYqytEIeXQOyHu7ct76CF0kLZAWic1sS+
         i3o5TvWPHMM2Y4wBGlyj/5XBUGWT/R6MoJtVOm+8KMXmk6dimleDIekHNuaObRb3pD4K
         q6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569412; x=1767174212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zE5g/APfOf7Doh4n8+ohsSXdsPUU5o9q9e6BCGyON8I=;
        b=p2pEVl88DQbtnn1Zh/3dczTuKmfL6NrOb8Q1TxUAjA58osbPM5JrVoxuPUVgvo5yHR
         hF2NNUra2D5JxKMo9gg+wmRkIc3+5cQv4by8W/mrHX2KcPFCQHqOSXaoMGIs8uln+Q0H
         PY93/EQwZJ/Rc4VgQtHizC5sHP8PQyDfHm8V+4tvzwRzGdKZU7GMgSmGsZMPkG1LbWOY
         ooblPjdVuKMo3MEpXhjjbMkie9CQB63IaBq1v+xs+xuqpHqQ0U9gwzY6MhiXSp2RoyCW
         ZspIYcnmTO1Cjl/7Udy8/q5YfJ8Z/HuzoTEgEAAYzhM9oYW3+4SezhJkgTK6UQCaJAQt
         icUw==
X-Forwarded-Encrypted: i=1; AJvYcCVxTB2A0y56mWRAuMBVwGEhtbLwiiEsw/eDaDsoIXXjd8lqAx/xCJ2TShiPYav16qTNjHtkbogEtJId9yxeLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYcOWEwRv5hTJ0s6tu7m8TUrXzL40KuGCuprx7lv9EYb/15k8a
	VsokPFRqDD9hHCzazSScjaVX6tbCHAxkKPlisJWRstx0/QWKx2xcSVFdAsMLTfUw5bsPoVMgmoo
	uTBhp7XWiF2gWeTRzrBsnExdgdRqqdqc=
X-Gm-Gg: AY/fxX51CracbaiSXQJ/Sa62HR9vkovRNB2VcEhJ8dAoRyFzgHhz6sKrp9sUvUkGHqd
	6wcs26P/sjx2Oz7lVxXlydm5YQsdb7XS9znL6hbgx/KA3CojcSzmYmNdLAaB6KJvIxwtY6npc0Q
	w88+7VBfU7m/LONmn2GQHCsun7fyZa0sScZRSWUzBF5sWjBL9kwsAB28qBoTPTGax4Bt/vY9HYJ
	5Qa757B2UR/8zi6JXP+Oxk2XvzHfUvqYRQ8zPxBmJ57cWUU2a9WIxWrh9SQiiKrZ08dhjYSdJCu
	/0oKRLJ5s3Ia2YNKB1btZH2FIjWsree9QWLMc6/bNhzzhAhiCl/H+nJlm2NguprIVsXRR6X17Ie
	CUU1Oq1ymuulPuMatsdSJ28c=
X-Google-Smtp-Source: AGHT+IFrptM25tDo6OgwVjwNE6sttK8tiJTbTeh1uLcr5AC6QnmieVL8kggrKij9zZwy/QPwpL9ycfqV/YVXijoETTM=
X-Received: by 2002:a05:7300:c00c:10b0:2ae:5d59:3ef6 with SMTP id
 5a478bee46e88-2b05ec8546fmr8341481eec.9.1766569411905; Wed, 24 Dec 2025
 01:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223175216.1353814-1-gary@kernel.org>
In-Reply-To: <20251223175216.1353814-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Dec 2025 10:43:19 +0100
X-Gm-Features: AQt7F2rBPEL7D8SfZ6Gc5tG6d1djTg5NeV01DNU875a1bSh2mPJggyCVC3K4fd0
Message-ID: <CANiq72=p9QzjApCLzbAwgUe5OMAo6qrPadthspdjE8UMQcXRgQ@mail.gmail.com>
Subject: Re: [PATCH] perf symbol: remove Rust symbol workarounds
To: Gary Guo <gary@garyguo.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 6:54=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> Drop the workaround in perf symbol that filter out these symbol types.
>
> Specifically, '1' and 'l' can never be generated by nm -- 'u' does
> indicate GNU unique, however such symbols are only generated by G++ for
> C++ templates, and are never generated by LLVM (LLVM generates weak
> symbols in such cases instead). Therefore, the previous occurrence of
> these symbols types must be due to the off-by-error and can be safely
> removed.

Thanks Gary, this indeed should go away now.

Should we mention `N` which is also removed? (i.e. you mention all the
others that got removed in the paragraph above).

In addition, should we remove the `__` prefix in the parameter name?
It was added in the commit that added `u`.

For context, the commits that added this were (probably useful to
mention in the commit message):

    945f50036169 ("perf symbols: Handle 'N' symbols in /proc/kallsyms")
    4d728bb93bab ("perf symbols: Handle 'u' and 'l' symbols in /proc/kallsy=
ms")

With the notes above considered:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
