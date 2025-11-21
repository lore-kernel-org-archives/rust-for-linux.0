Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F133E354
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716094; cv=none; b=Zb1eF759B2k8dYV2qe1M1obX/l1xURRfj1t5n02H1ovF1Um6wLMvBEwnR3gFwnLXw0iiVwmxA+/W1buOlH1jp7N/AGJmfPaTRePfSICLuxNn7NoYy5Zw84f8Rl9so7EhgYd/WU2iCKFg/SDOV0GUx2J248nfqhYC7WrzdAYZU4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716094; c=relaxed/simple;
	bh=/VgZi4aX+4bGSV/xhVlE1Vq10NnhANLOSDD25ABY3d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pThxxR6xdemjr8Z9RsP04jEfLarcuvYDM9eiNrj2eEaTyzZRTpV8HpXjh3kzy4H2o23J4uhpyObQnLZdaT4kAkX9OAvD1JVQZA+iT9F/AAQAkbt6izTML8pZS5I9i45zNVaelD0dScixMUXXmv8SKUW9s13xGMzrbaAYkDpC7AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQuvCI1H; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQuvCI1H"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-43380a6fe8cso9737975ab.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 01:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763716091; x=1764320891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETrr3JCzkruiiBfVI5YFLmlwzMZJrfA36kDNRDzkq0c=;
        b=mQuvCI1HNPLnjfN0hFH5LrSsTWQWw6H33frfD92SaDwzG/zHtYDNi+tuXNSHpgMd4r
         1yiAXRaJzUFgvFOB8KGelpTh8rXlcVWzU+WVpn+K7zKTLYv+epIyoiCsYwBhaSL5VAjV
         LR/lyS/6+iChkEM2YrB6X1pu3hrweblZnCZXhFNyk16rD2YiVw5lPbtSPdq7RVu6JZcx
         QODldobajLkDF5gjjuLUi5WKtmqTSQ8gXACKdnt3dV6n6XZOPmQX9Zvya5xG97pSxDnt
         A0n2hvbd6w9wTmm5LtTJalxH8NGydxOlQSgfaGRHG2XTX7gIf9Mhy0Ip5YSDVEIRKXfl
         sFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716091; x=1764320891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ETrr3JCzkruiiBfVI5YFLmlwzMZJrfA36kDNRDzkq0c=;
        b=wEcYzEAXMy2/cOwIJ87IxJQqNiLXNl5uefgd9kwU62Zgqny+Cy5tTnxUDcoqhiWrgI
         hC/7UTED5KeZ0i1vxnqmo255qVIT/rAR/LFvHj6bJD3bFr+IQZimxkauRJMbYa4430ag
         F2WWSnhQZ5fLmcU7FAPS5+SMZkzi3zs4uV9eQxk72NNBtbCIasTk5TE4Y0wIIPZk4HdH
         DUbDS8oRKdrNxQlsNjtNTO58b5TxW1a7BEqeQz9NOIiyb4IJlcRSZzD3Mlegiw7neqs+
         vWkYsfQ3vpD2n/rd55OXpCV3jmFFnIbe1OgvDvGkLrGEJUTMM+lRHgU2X6FiFYxfAaxk
         UpCA==
X-Forwarded-Encrypted: i=1; AJvYcCVXl5hzRUOUAExmMr9GF3P99eUyqDgM+KbzhULvGer+XejmiGKRQA/Lz+R2zC7HRPl92Osi0qEZ8ldIatYDqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuK9axljOXfotEp/kgrZ9REG4Jov9AQ23JwpTZnnjA5tNC5xVi
	mIpeYBSpPNJfS5lGBjSQoxSE16yGdMPUeMykWC/RC1jx9+ffvhrQ/tk5tQv80F0pFFy0vs8Iu3w
	lwreRRU2DDACxQMciF2foJINZycyrd6s=
X-Gm-Gg: ASbGncteeIRFz5UpejQ2tFMXoFz2OAzbnZEzM9/ZmXEdS4gjTtPFkVld5mayCvnk7xn
	LcLtE+epMW8JjHshkHN7xEyq60K+UXjr0dFYGEWq+Nq/dMyt4bq6mNzQBFcVikN173e3u56dKNW
	F8JpKpcl3gMeDFxBfrwn+W40hO5TUOeWlbdKZitdrA4r8n9cF4Ne5H2wvD9LBKCZ50mBiuD3d3A
	SOI81PIg//0u1eEfpPgOZKdx5s2JXmyf5TDIfZo+bvJi7I+XvQZQ5umcXICTBVddZPsU1aAJCSI
	B/iLMZe6NswXnQ==
X-Google-Smtp-Source: AGHT+IG/3To+AMr2oK2HFxlz92e3h2/vQsBM/+3FjkkwwtK3YTD77aA+5Xb7tvgJBid47+5SozvZZbOCBcUhC9NITZU=
X-Received: by 2002:a05:6e02:3499:b0:433:2a9b:165c with SMTP id
 e9e14a558f8ab-435b8e51411mr12950455ab.27.1763716091414; Fri, 21 Nov 2025
 01:08:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121043750.298843-1-y.j3ms.n@gmail.com> <20251121053633.1594703-1-ojeda@kernel.org>
In-Reply-To: <20251121053633.1594703-1-ojeda@kernel.org>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 21 Nov 2025 18:08:00 +0900
X-Gm-Features: AWmQ_bkKRpQOmfQwxZhx7gcZHJiLyZriJu20U1pwBRC8eMsopftfFbaK_bzrDgM
Message-ID: <CA+tqQ4LX2ihwY11VJk3LNNE-STsONJWF0rdDa0Pq09oA7YRXEw@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	gary@garyguo.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	patches@lists.linux.dev, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 2:36=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
> For using (all of) them from `macros`, you would need [1].

Now everything compiles. Thanks!

By the way, I needed to make a small change to
`generate_rust_analyzer.py` for rust-analyzer to correctly reference
symbols from the vendored crates:

diff --git a/scripts/generate_rust_analyzer.py
b/scripts/generate_rust_analyzer.py
index 5b6f7b8d6918..147d0cc94068 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -110,7 +110,7 @@ def generate_crates(srctree, objtree, sysroot_src,
external_src, cfgs, core_edit
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        ["std", "proc_macro"],
+        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
         is_proc_macro=3DTrue,
     )

This might already be covered somewhere else, but I'm bringing it up
just in case.

Best Regards,
Jesung
