Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558CA46AF25
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769037137; cv=none; b=o4BltBTiF1LZcrlIkSbAU6oQKtVULM6Enh6ivpXqivmdhUzuW098ZwubmHsjXgx5DyeqshOvnq1jOqAHT0YWJ8fq2gz7CzGiFXsF2B+cLj2VQgta0/cCVcOG6JkKu/sBLajF5AdmfTp+JDqpLZfWIPu5LOUDspbf9ql5HmUcQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769037137; c=relaxed/simple;
	bh=nicC8+jQs+KtIj72y7cCmjx0QatbClmM3BMjEzyUHcI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jE6rTYM5JmQtyCKdE1ypjRKVc+rOeEVKU5Aedc3lXKopjdnFeFfxJjVc0UtOXnWbVdN/r1UvcBECQsOzmKy9EBI5XlHkRW0DOTvZ8S50M4ipnfQPtGNIF1pcrwD0n3rbWOWC7uA0jK0bsjWUIWYqDR/rfjjySqA4SYYHD5+eLHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JInWRjBb; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JInWRjBb"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-81f5381d168so395220b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 15:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769037126; x=1769641926; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc/mNIGKOkGXOmNQcditc1e06kj6bQ3nXqqocKQMT1g=;
        b=JInWRjBbfSs0kDty3rjrdtYrcZcctlA+ZclKrWtQWO4t9rHzosxzNQl68ytW5ecIfa
         YjRS9Ok0gDKYye6VqgRDYBCGd0YReu/isWO+0E4WAD8rbFwqGMCA/9d/sUubwVaLSVI4
         lBE2w5loWbHfkvVwF863Fn4JacA+3ujiSL1uGETqTmzBl3xmaDjv4/kjyhVPTOhI8XAG
         AAQtdAttOI82UkfV5HeW53PHm/ptbn1uF9A83T/76I9jE3xY4oWwIXNiVKBki9ZfGA8Q
         HdkWwLskMTD1jn1EeG8jMPL12SZI02ABZbyNrFzzLGMh9XlrZZBLEQDp/m193g8MpWPK
         YbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769037126; x=1769641926;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sc/mNIGKOkGXOmNQcditc1e06kj6bQ3nXqqocKQMT1g=;
        b=lAQ5OQqeNc3ULA/wRQ73FSZ2H+l5IuzRP3U3OoHCZnLVG8FBEjTk5O5Yd4qw4hEddr
         /2b6T+w8v42YWk7nZlzybjtiS/0fqElzEOc5lFI4lPZV9JsO7pAZdyIt5tqb60l7exOK
         6ijPBDmLv53pPmTOPo/fxrTbDBjoLxCloT2d0fyLBFa1tk8mfpSoJFQSDuIU5fHE2gIe
         9u23fpy5UgGZnrgug4D+Oqsx3g0lJfmZIDSvaK+97IzFuLtrd9WVlZBQLm1lHeynEkZr
         lC6nZosFVrxwMTWret0OFAn2qLTIMqkg3QrZcoFhbQ2tuVOFlySr6IRfU03UHedkcc4Z
         mNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpO6yapiNG8sMhvpXF+KcbTr8DPIscq1CSwzpXLpWqyBm4MC6JNhYr7qUrBo4GEviaEUu4l6eLOpaQi1elSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzakFxJjzs4pL9lHvXE4FL+f1nCmsCCRUrv1HmaS2pDkk2nYTIQ
	KfK/MNrR+HDDKTismt2sU8QUV6aIFsBRab+Zw23Tc1xqLCjCM1TYwwYg
X-Gm-Gg: AZuq6aIKCcq4Bk+csUmRrNBMnMZ57ef5xedDySjU1h+jWAtV3k846SKgCFuAim+wsaJ
	5Dt4UPkj5dbZp+nJiBMiaQkNhERYZMztkRYehzJ+c+XGMjbeCAFiCy+dBYq4kyILkA8qDklG8yI
	VZaQBmBuujbWKpLvLFZwgmOABVa06il1RYrIV57CxyqhasCF68OaPLZonYtP9E9edYjJPOC8pjW
	2+gGyvQujsBjVpCqGFrpIminLxSa6HLki+MgrhpXdn3Nb64r1aVQp5Bvswro2wWl9AdtjzRNLCG
	NKxY+rgiRst4WbnRL6XZbrEhhpe4+g4Sh+svFwpYsWerYfKW1tsAHPF1aXbxsKE43wxnCFS1jMl
	tKBBwyp+eF7c4ZyvcqJA1KmqrMRXXif8mAem2feb/xgVqeekYt03Bz53fq40Qa+ICzfCP6ZG6n+
	uWuwkmlw==
X-Received: by 2002:a05:6a21:9988:b0:38b:ec0d:51ed with SMTP id adf61e73a8af0-38e45e8d3dfmr7094344637.69.1769037126245;
        Wed, 21 Jan 2026 15:12:06 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3533527bacesm499552a91.17.2026.01.21.15.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 15:12:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 08:12:01 +0900
Message-Id: <DFUNBMAPQS6Z.4RPBKCCKCMIA@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Jesung Yang"
 <y.j3ms.n@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Linux
 Kbuild mailing list" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] scripts: generate_rust_analyzer.py: reduce cfg
 plumbing
From: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org> <20260120-rust-analyzer-pin-init-duplication-v2-2-a1c76f0d3bef@kernel.org> <DFTVC1IH8KM0.VR14LX627BWD@gmail.com> <CAJ-ks9nVxs5aGWPO5m=7GBjEE+Rn_qS_Yg0HD6qc5=Na6-K9OQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9nVxs5aGWPO5m=7GBjEE+Rn_qS_Yg0HD6qc5=Na6-K9OQ@mail.gmail.com>

On Wed Jan 21, 2026 at 11:13 PM KST, Tamir Duberstein wrote:
> On Tue, Jan 20, 2026 at 8:16=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> =
wrote:
>> On Wed Jan 21, 2026 at 1:10 AM KST, Tamir Duberstein wrote:
>> > Centralize `cfg` lookup in `append_crate` to avoid having to do so for
>> > each crate. Remove hardcoded `cfg`s for `pin-init{,-internal}` now tha=
t
>> > these are passed from `rust/Makefile`.
>> >
>> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>> > ---
>> >  scripts/generate_rust_analyzer.py | 13 +++++--------
>> >  1 file changed, 5 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust=
_analyzer.py
>> > index 147d0cc94068..b96d3cbe3df1 100755
>> > --- a/scripts/generate_rust_analyzer.py
>> > +++ b/scripts/generate_rust_analyzer.py
>> > @@ -35,7 +35,9 @@ def generate_crates(srctree, objtree, sysroot_src, e=
xternal_src, cfgs, core_edit
>> >      crates_indexes =3D {}
>> >      crates_cfgs =3D args_crates_cfgs(cfgs)
>> >
>> > -    def append_crate(display_name, root_module, deps, cfg=3D[], is_wo=
rkspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
>> > +    def append_crate(display_name, root_module, deps, cfg=3DNone, is_=
workspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
>> > +        if cfg is None:
>> > +            cfg =3D crates_cfgs.get(display_name, [])
>>
>> Could we add a brief comment explaining how the behavior of
>> `append_crate` changes according to the `cfg` parameter? Since `None`
>> and an empty list have different effects, documenting that distinction
>> would make the intended behavior clearer.
>
> I don't think this is necessary - it won't age well when we change the
> entire API surface here in the next version of the series[0] that adds
> type annotations.
>
> Link: https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e67f=
e5c38a@gmail.com/
> [0]
>
>> This would also help later when we add proper Python docstrings.
>
> Same as above: a lot of change is coming. Is this worth considering right=
 now?

Fair point, thanks for the context.

Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>

By the way, could you share your plan for upcoming major changes? It
would help me prepare and align my series if I know the intended
direction. I currently have these on my radar:

  [1] https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e67fe5=
c38a@gmail.com/
  [2] https://lore.kernel.org/rust-for-linux/20260109-ra-fix-primitive-v2-0=
-249852a4145a@gmail.com/
  [3] https://lore.kernel.org/rust-for-linux/20260120-ra-fix-v1-0-829e4e928=
18c@nvidia.com/

I assume you would prefer merging [1] first? Please let me know if I'm
missing something.

Thanks!

Best regards,
Jesung
