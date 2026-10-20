Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492487;
	b=tKs9ntRGo6vMOJq38bBCPFQ5U+AIutD7oGSoQARlQ18KYxaz/bU5Yu3ShuPPTBD0bpt3
	 whH+HqY4wdQ2w4WQTj8h/XmHjMb1156LHZ4cJmtaDVbi5RDd16uhr5Asswmxp+ZxbZ4AI
	 As/mID9jzfrAtpiwe0plb4tO51TuQUv/3999qMi7DeUGjm8xm8liTnZ0pkwkEpJrRcaud
	 G+bbrLJUj1qTZwM82+j39K7S/3joTNP5IkMYCvwt/21fOf3PtgbDYUnrxWQC9x7nUj4xT
	 1Hk7VcSolhNyhxGkGLmW1s39wXbIgjqQOGfYlaWRMPOP2fhJSU03+p+bF8RnuS98V/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
	b=HZHjdl6yKlS+05MHjZiBrNXpNwpxuDFlP0dVihFsxP0wnsfNu8j7j8kKKFDxIB8Pxsqe
	 93J71k+cH6v9HHyznt9D1YLDPjBP6Wgu6t5S30+4YA76kqOIIssDOyCSEEdc/fm9jtjSE
	 pa5liPOPoAGfs0OttgUJS/TtMObp66PrBapl5rST6mw1QuupuozahWO1gB3CJMprxbDTu
	 izV5PAxk9+BRdLxAMjTuM7SD4Rsr9Sdm7ZKk/2dq6+C2Jp7gEBPA7fFewiXhuOA6fqMbn
	 IgYEZwX9F83SrAlqvgbc1I80UYNgZLkdfnFn5VPCZhjs968MQ/bsIjzpdLCKeQQ43ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD425606A31F
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD425606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso5732241eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 03:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492486; cv=none;
        d=google.com; s=arc-20260327;
        b=mT68crXoBXfdLESgp7sEBhYtTFNlBYIUEhrT2MzqUjRjIuKNPaGnJc1VcBVshbOAEc
         CMoyzEVebhw9bQqqMcNgJwhMUPA4HnrGoycTOqHaY5/r+pC5eFqYhghAc54RlZgs84r9
         SkjtjDHfY5cIrtzfWkuRTd4Hnj1mNHtjaXCLseTrEd+gde+A4wtuT4YXlitNjTbaqc2x
         DRuzKEH2KZtYMoCrN3RaQQDDyL0+vWeHO6FP9kv/wAW2lXCX0iG4NQqKn0TD35uo2l4U
         WWDx5SzVo1PO04U9Dt3xw6LU7JNUVOdIik7Tp5kN2srw2M24EPBdOg2G51MHq/89NOUy
         wh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        fh=aiAYWl9TKqjmHtFK13daDGH5ZLoqE8eVYE+lcZYe0LI=;
        b=afDA6OLsa8NQfG6JskoysGV9Ez0ob5WtT/NhyKkznaLoG5D4VvNjOEwXv32/Me/lNa
         mwWNucqkKklFItKTEVnwURPNyTgBzufJ6mEF6xFBW5lxK1SP+Ta393tIj6m70kAjAXhe
         lkEjsNlUhi/1mvE3qVCMf4k2k79ho57Mv0ppXQVD7SWETYNrjUNfaDzH5Sc9Yzn5qhuz
         QH3jFYuOA+uPvms+fhVgwdsK8S1xwVcTSm379LiUG2nBMz+PM0OyIK5+Q2qy6r2e0Nns
         iGHwdnz851FxUEqKFtaWOIaEgmBG6HS1h88hbHHZU4AL5YK0u7OvIInC37aHEJo/blN7
         6v5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792492486; x=1793097286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=cI4IJybIWAFbUhFgiqBGwhfqjgpLGre5R3ot79Ke3zI83Rv8hsE7zK5rQQywe4d1ep
         r23usjXDN6ONg5MR+VjsdgsKNHxDDg0RrsGtvGgLLY7pBHRzQC8h3/H7kxTnExzE6Qmo
         QpZbMR5D5TDURKfX9iAKFDKoEOuHC/IePb6qiP33yxaGOZL4qmuyU3HaaGQSjnc/0vAN
         VhzGtkVCEK9aZxDzOsE877SK4MI9vgdKQQaC/5Oj8b/f1ETaawk5swZ6s8fSIdJzKSFn
         lbaG7dr3LzHW2i+qbB5nZmgclId/Y+2MInJaqBdwT014/GtR7t3ednJvS8omieNK8REW
         ob7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492486; x=1793097286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=qXltVhIh1HP2Zj+8i2VD+sHEaeqmObDKpi0wEY642y7bJBhgCraO2b5xBi5JNXWr+W
         pbEW454myLP6072bMXGW25rEIAvjDMgTs+ErLohioJU7V63RAjEeSHJsjGOowbD6Jkyq
         hYSLoN41dZlgkm0/JQ0yMV/+Xl/sScMC82dhuIqjEHJH3LGOV35WY98y28wUSIJsxSpi
         bNYXMMXphyPxyZt1ju5PZ3abIKrWSJaHjMC0ndF3eUjCD3Xs2cGVQzUzOPH8LqMvbPyb
         EUidlzAfZB84Dg2Rme+t+Fd4grQuut4W2Ol1S4BNrJoaC3N2X7jB8eTMp1mqFBQ/fxjd
         DeQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS5K2PJ+q/5f4GfmJd0bDG3N62yc6iK1FP3CHTesYwGWvXrg6C/bVaeQ/w7lBKOcX5neX55EFAK/a/GD0GBg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI1QLJsGEw3T3FzPq3DrytKDMpyFEGWhfhSGDEC9iiW8CZBsgrt
	xQjGDRkQxVpnYy18kd72iEtSloCVIthdzVF9mef78/Y6BoqkEGUoKrEyNF3EGJZlhaudHy9BRxi
	9b3GZfxU2vmAPSZ3Omcuvt+ZX3fvHbvNR7ls7Zy7H
X-Gm-Gg: AYBFou02hCFR0CzkFK69QJ3IpbDevGfWZFJmQFKNdMjggaUnx+syay6ITJ11B74TaIl
	Zyud/Lwc+OByGHXADKg2OOQB/mNuuTHrM0Xy4RPzsJQQIW37ZWwz2RtsB20zMm7RWCNRB7gVEAk
	k/TJZHakUh/GK1oIhBZ/xk6u2CGq3ox/gj7Xsjdrt22Ne8XwAywLxffmLWYFJHVfam1jusE/1l9
	WUnSobjAM934U13mYoWhDlbZAqKrdzIp2J7IIYZSyCMAgrEWjUCXhvZi6R6/FNpKeWNneEnsIEX
	JusnQ4YBUxwaZQwRIG73w8IEyEfTJbdZs0w56ljtBA0VZed1D0JGQ30jH8eLe2v7Qa7aRoN1kt4
	1H0bAtZuL+U9ZV3Qk/+oEMw==
X-Received: by 2002:a05:701b:4657:b0:183:bebb:e93b with SMTP id
 a92af1059eb24-1850d3705c0mr13844857c88.6.1792492484834; Tue, 20 Oct 2026
 03:34:44 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com> <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
In-Reply-To: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 12:34:07 +0200
X-Gm-Features: AclHuK9vxwrK8NaLvu2ec0o5N9md4lXO8zMypsPDxXbgQlLlX57bi1hqfmPPF_I
Message-ID: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 at 12:27, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Which tree should this go through? The Rust tree? Probably too late
> > for this cycle.
>
> I think you send KCSAN PRs, so I thought you would use that, thus the
> Acked-bys (I suspect others thought the same). But the Rust or Kbuild
> trees are also a possibility, yeah.

Happy to take it - but in the interest of avoiding conflicts, thought
it might be better suited for the Rust (or Kbuild trees).

> In any case, at least for Kbuild and Rust, the PRs were already sent
> (and, generally speaking, I would have expected a patch like this to
> be in the list for longer anyway).

Needs some -next time, too.

If I don't hear otherwise, I'll pick it up later this week / next week.

Thanks,
-- Marco
