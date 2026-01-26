Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF07314A9B
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439174; cv=pass; b=nPncPIA2VashOyPip/B7noXlPHEdm1jr5A4CTe/H6B17MVNLKzm29QhhpUGnQ6exPAgpJZRnkQ1AlVJV0V/fWW7jCnEemz+VPCWgfjAyTZjqzv4M4GF9T8xkmMG+YsySN4HFCsMpEJfE7ayY3w6/w+FyqWziJFtHc3AaqP7u54s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439174; c=relaxed/simple;
	bh=8WI9i84vOeIeBj0PM4u3GrfhAY7jOg54KR/Jk3yRG1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAJvEzriiWxMStEHE0/BnYW1xWBXUMWQXj4N3C3QzJnN6Di5ceBZcJS5gWSGyXecitI/xSrTb+cZkExn0yNn+idiOCa0ypuDrz+y2yQqgkLHKwwdilx/WE0v2tw9djD6WMgw3Y4VPKDIyT1Pm2/wdD9Sek8JpEcua4hulZwYSoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lh02PW4b; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lh02PW4b"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1233e05c77bso384452c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 06:52:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769439172; cv=none;
        d=google.com; s=arc-20240605;
        b=H7XHP0ZdeO8uTcAdjmqu/FhhzUAy1vPR7m3+f5HRqkbF84H4fUcCaaOIYfdY6P1lJm
         KaZ9xFGJefH1r3S7G1xZ4/ToijDsFwNBCXMTVHse38n1l9/OHU4R79X9iMJn3CY+cxbU
         8vou+N5g6oQIyNdmKOH7MuffUEfgP+Stxu5Zh+JC2DItaoePFrTOZmUljMBDTE7nnHkk
         c2qJaj7aoXRWZggAXdj0ov3Kk2BTpBTKirNGN+haBrTA/ZZrXwVnomZlqPUXqlMWoUCx
         3J2jZlZK46cxkeql8IwdCjeNaxmGnZl1rG9EsRbIF+XN8mj2E60v75TwwQZ5dbDdgsJI
         9xiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8WI9i84vOeIeBj0PM4u3GrfhAY7jOg54KR/Jk3yRG1M=;
        fh=lC9eiWtNtRRSEy3eKFOc2xWN2sP6n6e/vWwlnsMvsl8=;
        b=OXumYHgsLTAwoTktyf5RB20cxay3KSpH2NDxk1E/VLp5GCI0El1ET5Oe6+ofJUW7MS
         TBpOmwr6Uie9JF+S3qDc0jfz5rwtZiBjRv9zpyVWRn4KT7GtzkDH76bKnBYqnc7ggMCV
         WKIWFKfP20sRVOAHrWze8LOKwNChoMM++ndIzq2EM3/dFuz4j5Fivm7mRnzS4prZGg0t
         NUtL5YAXrLf7VchI1L3W/2S12NPm85bgQXOV2AcB4qMk4H/GD79MAfEVTPa9y/Nb8E1N
         cg5H1fV6gW+HPpHAgAhTc/Ls33GQaemfPIwaC20sAtEvCVZ3ARW0Fo+Eh589G0P0iQ7c
         cVjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439172; x=1770043972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WI9i84vOeIeBj0PM4u3GrfhAY7jOg54KR/Jk3yRG1M=;
        b=lh02PW4bTqQ1H5CwxmxwT0aRlnZ9ANj5+1J1zIjEqRGrXub4EOsEU6ZCg1OYTs+eSQ
         l288Agz8fvVX4DdaGITRdfsyMmQ2e8Fp8Xr898i+lt3SEPswF1VjV8P+oLVTo8x8Ixj0
         GZaHl+GFwHaxJ7sg5EE3BaH9hwiPQUlCI1gNz3ZvgNjzoWNueBcfKwADUl0u6Fxh5bs6
         GfYA6F06gzzeGDCscGZjJAcsOmG8haDGM/V6BpqXbcTYR44QSSILgrp/m/aqzlbW1+fZ
         veenAiBDetYZlTSI7DxAmu5+u5ooOEEcgfOA8bmPdaEne8t4rWnvxLfy++X52hJDiG+y
         DxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439172; x=1770043972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8WI9i84vOeIeBj0PM4u3GrfhAY7jOg54KR/Jk3yRG1M=;
        b=KkY9GSsz0P8oLR/9/RtRB2B16WTeEDqWi+Ubf53oXFVMbQGh6AuyWjAaUaajYuL32U
         JAcfw+OPVCyYoVEHFSs/WwRJdZvYlDoJc32PgxKOEYINN8SsXRdaSR1UVeMdCA+N4rvc
         0lGbTtDDd/MX9z9hLW2g16QbLijhJJ3gir4b9+PBEOF1RdGEaWg8hlSvRi1LYLoIkD/6
         D/8x/a3Sp/E/jri/bvG6J1bhb/xsqSMEa76Qj/EzCN54D+N1WmvWtbIQogdph69XmzHE
         UHSWyCTl4jcA431U1K4xE3LALLFxv2JAsKHbi5nj3bLbFoveqqma7fDNRcCLbcPKoows
         y6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpZNmH9p6m9YqhrSP/apqwBIknTJzYRfNgIwfIJS2RxWCykZY88UzpSN7lhjBnGPrddn49eYsxNsgyRT0uKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8GI4aMHikY4TPthZzN1LFlyobQGookSM5QjFqf5PiIkrj2oZN
	WKbEaau8+4WDD1zQWkyQa3DE479xFzJnYBkx4HEU/SRAh9LZgSjlRS4lQIyuQPlm/SX6f1mymcf
	ASdypQYgK5H2nlKJ7oJGb6EetEcxMOVM=
X-Gm-Gg: AZuq6aKjv8Ielb9AEr/ksKzSST+NFRRk0JFsazNq6/ls3l0in+ygKiRpJGozURAmlLB
	Ey9+DKniEjyR/goNRZ+zJcGWj2tQcJPgLKv/Ib3tXbrNhw/DZkDksaAumTRvmF6SQdHJtQYrb5V
	iWuCd1v1WTRzZ93UjAWP/wVAU9ki3UmCk5SCY7QXOB8YsABwz5lSN4LFEhR90TeHSLfn3y4vRV1
	5sT0MMPdmtTPHirHXZ0Ehtn8GMwlUKkf9EqnPvgAkwE6O4D892AaXFyV+dQyufgM1A0168ZcvFg
	BWiO/KagQTf5f0qQG/2zU8tT7QRlVNrBJ5IsguFwOXC425M+5xHIQJAHY+dROKE5pWQK4sn6M13
	ObyG6BVpnMiqS
X-Received: by 2002:a05:7300:c99:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b764525613mr1093012eec.7.1769439172239; Mon, 26 Jan 2026
 06:52:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126081013.3616346-1-fujita.tomonori@gmail.com>
 <DFYHRY9IB2ZP.2Z70E6XMBMEL3@garyguo.net> <20260126.231305.17475057092261789.tomo@aliasing.net>
 <DFYLH8C2A10L.1OS9OS32FLUD7@garyguo.net>
In-Reply-To: <DFYLH8C2A10L.1OS9OS32FLUD7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 15:52:39 +0100
X-Gm-Features: AZwV_QhrF2c1W-NkM53pA1vjKVfea8D8bH4OniNp7GNATFyJOURIuK6L_U0AJmI
Message-ID: <CANiq72=s0dE45+yCeAgqY5J71sEA+sT+wA-tg+caN_8e=y17ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: add AtomicFlag::get_mut
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@aliasing.net>, fujita.tomonori@gmail.com, boqun.feng@gmail.com, 
	ojeda@kernel.org, peterz@infradead.org, will@kernel.org, aliceryhl@google.com, 
	a.hindborg@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org, 
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 3:36=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Hmm, Igor reported something similar too. What's strange is I am addresse=
d
> directly but also haven't received the email (my email is hosted by Micro=
soft
> Exchange Online), in addition to vger.kernel.org.
>
> Could be an issue on the Gmail SMTP side?

Yeah, I didn't get the patch either...

There has been recent trouble with this indeed -- just in case, I sent
an email to the admins with you (Igor, Tomo, Gary) in Cc to see if
they may be able to suggest something on top of getting a kernel.org
account, submitting with the `b4` web endpoint, reducing subscriptions
with lei/korgalore, etc.

Cheers,
Miguel
