Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794422911;
	b=TcTxATxBX0IhYE7ON+Dn9sHV2QeccVkAWec1LV1uit2oUbIPsc0EO5ZRN0WU+UGbivkB
	 5hyiWfyFHjq17D9x+oURPCLCCVeRvV9YYjo5KtpN3Ul7ziRBmSpKbUMCYZJKwxVstAzdz
	 0XK5DG/tONAiczcNtnQ2QoqqcqThaofHJJYfdJ68HxRiZg4c4lof1+G+hMqnIScOA5gIc
	 zcsVkQsuz20XFckKU0TJ852ALyEJuERAg5nqAWdFdWbD5ojh0Ey0H7iAeF1WhnNAulc4p
	 VlvN3VKbtWf8gEwQ5oc3NlfCejuHIem/fhhtLkTWQpRDDX1P1LBsFOIRdYXgaplMn0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
	b=EWQQoxMw8yWvd0E4J2WtrhGrzwK1YwonVQUwA/bzlXGi+37pMPHUvFXvOgTGAVlbHMtI
	 e8p+imH7D7pIbx9MVn6n74Gsi9a9DqhRRoEHxmGmC/+vrzpf1WchOimyKqrftArDl3bLR
	 qPrRQBVkvKUO9dgisffpRPZSU63nQmuBHtoIN6nV53cT5ydrBF0R23Y1bnRByNuIXKD5g
	 PEuVEgW91hzcdPz7STqpzN6D9tqTVQH5j1UOcHzcQxUQjjbCqfCV7OGBJY61xBA9BfgqE
	 OzBv/uctZKwS6h6JhCB+ei8p1x5TJRDDPTyxwKbgjo2O5otgzrSZ8R+YVk/as+L1GcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQvGP9hf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC0606A883
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 18:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FAC0606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQvGP9hf
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e90071735so138605eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 10:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794422910; cv=none;
        d=google.com; s=arc-20260327;
        b=mddTlOM1gkbqM23AXernmMyXOP7S2hnShYYrdldQnbyIPAX64B9SWp5pttuNeMZX3I
         0hdvwowz47b9E0bdWkqK+MB51PeWXGXwhwY2tyg7+ltvC+gaTitC1EN0YfPQCFByQKLL
         VXlVF7Vd1iEeBKWAb3iKgwbXr7ywf5hvdK2BvXEg/rFNh8Y6/0uwkd4Wjp0+6QR2tT6D
         Uz9jiFhAE9uSN+rBNhwrnzKIu3LSIuEbHikxy0BZLlzsuOiC/ex4SJrZyWHMNrDp0AYt
         +siVV2GLrchQ6hPW2tUwcyOu0OGHG/uEnaDNqt5cWYUDuVSKGgikFiDDxZ4o2ehJBd/g
         Qa8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        fh=rhmNx9ofkrrsIEoFGJq+KGIi8k+IXRa3ax2RpWmlq+8=;
        b=K+BPNW9iUD24bTLeEaU2Q6O5cTAMOyFqCDZZ93A3TuEuOCnRDrsutLV4U/iBBcjNNo
         ytfJrCSgzW7zVPcjbUjnSSr9W6YBXb/U7zK3icpk/cUYVIUYh2ks6iuGcKB+Gma0/K/H
         IyVd+7cdEa55leW4sfIKUE0ictZHWGfEC0u+FfRyzDPP/u7jzsj+Ny6tf4qcomEelcNO
         3xv6TRUMI/LYmFe3MCPU8DAKnRYuvwwo0e89SBygtL5+munBc8VQgQAfLkLgQx1NB37a
         qvRUvzjPrRocHHPPzU2Rnx5R8lD6lQ/OBWCljgNGrXtccORkdkorZs3DOdMxXyQ0lcCO
         v8tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794422910; x=1795027710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        b=PQvGP9hfxyl7gyWzaV5E6lfNLMerBHS1TFQeqNTFlBRgy1u2mHjTPPrcCd91suTPNw
         q6Uaf4dfQ10dB87Jez9cMUGPN2gIfnP8MYt4fvSB02tD98zGsncssuArw8oLO8qQtcLp
         44smcorCOoOla3ApsviUxCt5qQlre1HcPD1CCXW1rVJH/qsAwOgwDnYiSivdmVp0xx7L
         wBCpz75zey138eMCPfYNHtAFbF55MWh3FJ9DeyUoLw64eufFG/QR3X/fHQG3aoNdfuHi
         X5IJjIOOyJP1lrz7jfv+HjWLvw4QJiYpCd+oQQEZvYr1Ngdvdq6KHAniGxemBtyICNhx
         xxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422910; x=1795027710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        b=bz3KN91jx8TL+AJ0us+H+iln1N0IwS1RgspFT3D1L31aER0QSQALWQbVuXeuCz4zA2
         AhYByN0VNLrfQA/xsSLqy5mgl24gcxfpFAR5rA4pqxg2NfMBxgb2nBWRzHn3wY99h+qx
         lcJAjzsSTjQsOpk49pU9szNXUykpC3P4QzNg2jsO50fenPnQb3qP7UWfUBUerZDhWQ8b
         DiYwyXwzbYo14jVqFDk635XL178pqA+Kuj/ruCs8K+jihqUyi888glUNJAaIqYLQDlEl
         al8X62LfxpjspaiVMXBmWP2n2O+LGgd67jAmFSPrLaaKaIhnIvKcezMZfpqxjHroJVkU
         gH8Q==
X-Forwarded-Encrypted: i=1; AL+hErFSgkTQQh48jWFUNWSjl1SAX6RNLT4UVUkTKEbctedZo1ArF+q1Rg7HkkdfHqhwa6xIu2WhRYM5pY1Q7U4xLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wfidUDvm4Lzk11UEX5ke+AZ9xY7gy5ro7DFIR8LXk2jXY9eH9
	F+7wSVTj55P3DatEXJmBh22QmgKm5LhQfOF/PbSGAVJUeaQm4LHK8J1/PZwo+HUWeHzX6VrYGri
	02pXr+0DsfL8gpEjQavOz0ibu+51gX38=
X-Gm-Gg: AYBFou0mj7WrTsIg9ARszJuWUHuUNSt1Vc25kOPQn6lj2OMf+FAjcHokXO3aSeVcl5c
	dIiuvH7TS1hZnv8M9sJijo+hDQkt9UJGNPJ3pDZreYhZaRxpaFjNXvVTPyYJk2sqUPj9PRBrBuC
	bnesJQkwHTv7G9VPYgR4K3dKjxY6bfDYWf14q9ub9h7EgJa9bLYW+PntiSayuBJzs9Gb6r1Rxie
	GVzcYdgYx0RCzT3TX7ox51soozfjsq70uJWbtnZZLJNfnzNEmuEDUBORUyDmsJlfDHCIQefskai
	+t9njyzHa8G2Mc1l1wE3KbHg+oA7120ogrz06YnZaZEyXXwI/h51yA88QlJdlfmcJf+9BKmqf3g
	NhuqrNCBmoUdUtZPGtBAoWKzk+LlGKF4Bv6P8yRtCgFTpKcIIOf67MFDzDT7CmDZaQSM3kxtC2Z
	ZtVYyg4zzbKJ6MoAW4Rzb+j2FOUYEj+mYf181mxVy33OeTwXF/eLb89CKNxqISk/obiDrt8XxIO
	bE0JIwWe2NSU1VCr4IYagx7ku2/t+DfC/Q=
X-Received: by 2002:a05:693c:26c5:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-3768460b9dbmr4877420eec.1.1794422910327; Wed, 11 Nov 2026
 10:48:30 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031030807.4101384-1-jenhaochen@google.com>
In-Reply-To: <20261031030807.4101384-1-jenhaochen@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Nov 2026 19:48:17 +0100
X-Gm-Features: AclHuK9PxmaMrHpe5K4M3MU9aV3mfSN5iKc2YgWLgeAIQXIiJu5uOX8RyqAehXg
Message-ID: <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
To: Jenhao Chen <jenhaochen@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:08=E2=80=AFAM Jenhao Chen <jenhaochen@google.com>=
 wrote:
>
> Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
> and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
> post-llvm-link $(CC) invocation in scripts/Makefile.build and
> rust/Makefile.

This sounds reasonable, but my LLM spotted that Clang will run
`AddDiscriminatorsPass`  again, i.e. on the optimized bitcode that
`rustc` produced. So the profile ends up indexed by Clang's renumbered
discriminators, and then the build that uses the profile will not find
a match for some code (depending on inlining decisions), i.e. that
part of the profile is silently dropped.

It proposes `-mllvm -no-discriminators` in
`CC_FLAGS_RUST_INLINE_HELPERS` so that Clang doesn't add them, i.e.
using the `rustc` ones.

Rong, Han: is that expected?

Cheers,
Miguel
