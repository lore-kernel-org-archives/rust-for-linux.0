Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7EF3B71B5
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289148; cv=pass; b=gehhAMordy7LphyEAVswdoW9TbwkAJvaJJvegHiWBMRdh8wphX+Qkt2TNqQ/v1/sZe1LRhqmsMvVTBDq4GB6YpKnBBPL35CGq2wXoU0erZgr8Z0HuKQaMxSX0ZB8UcbwI/I2PR63VXjVaOq1ZhH3HJpPXxGP7RAAD2SuFeUf1fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289148; c=relaxed/simple;
	bh=JXmR/1i3kSXbLKDwpiYQDilxM5OQbH5tXgOwHXzOIyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2+xJGC/QvlDWJG1PYt8Cs7Q2XfrSWKYA0g1uvSVV6XUWLd/oskJF2pWQoE3nFj+lSprgrMCrXnt7B6/J0fIQfNN1YyAXYK8tU6N5aSJ7FEVja1ThGfiFXNZYbG8EF1Uofgr/EPkcrvpuEhNRotOFIutGgg1J9H379aNQEo2mss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YenaCJAj; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YenaCJAj"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so1041741a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 04:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784289144; cv=none;
        d=google.com; s=arc-20260327;
        b=Q+aAe3/tGSoI/AKlUzkvwF4Vd57X86QGs6jIgMV2J71YfDfvjzlqTQ8C8vtahPe+9r
         LKe5UJ9xb6Gxv1IdzCQk4jqlKXCbo7bKlqxoknMZWmCvaUbLxc3wRc0PkwNUCmcH/WcY
         2q5SyBFsy0DTNUU9DQEW8PjuzAGZpSP6h/mPAZvkqgcUidko3B55vmkSc3H+rX1K1wsZ
         qOD+p4ljqcpYpBS7pzcNjdGXd08l+DjjyzJM1sVXav7YYGGJNq2MgcpoEQZO2sY7w8oS
         3aJVtTzk2BrSn/iAFmr4WstcVgcQSF4TT1szzpQR3sM1t570XJmk6LmOSlrcYzk845Wy
         Ly+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JXmR/1i3kSXbLKDwpiYQDilxM5OQbH5tXgOwHXzOIyQ=;
        fh=UwE+Y3c3hyMgmN+JmtPfl9ZsJgqCCmHzzEEzFaN06yQ=;
        b=RTp5JklBZK6TVAiRG6fTiRmfdzzr1V54CraXiPOPR/JerdyHCN2I+9br5YN86X/7Di
         bF9vLA1kidn1d69RRzUu4qP/TvNDb5RcESuZgSvouqXClGCFIEaDqHKEP30VtQo4HEn1
         D3VBZdrvBztORE7K17AK0JdctuuhB8qSts9ItsUJ8/8LBbvkrNi3nKwXGg+ApI3mm6Fa
         wd9KWrCa0ZJMC1BPSUR4/GXjZsm7yEwOSXdGFRXQgglgfDvi+nT+iC05+mOmWdOH+Dyd
         simHv2Tx+DVKW1ve4fB3qfQ7Gb99A3TWPSRkmGJkaR8kIolaUT0vQrINVGAkSGvNAuzq
         01pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784289144; x=1784893944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JXmR/1i3kSXbLKDwpiYQDilxM5OQbH5tXgOwHXzOIyQ=;
        b=YenaCJAjnnlPZcTGwfOq9oVrjjm13muWS5n3zHEyqI6wK7d5zrhi8SLc+7B4pe9GpT
         sRMXUA/5faX9cIA83Z4EB7TWq4GBVpcIwTHRk+PoG/0a/lTC28eB8ACgQf/L0r4GvqSZ
         CteG5qvWsc3WifBZWCxFqjDhbMwVpmUted2gQFEU8+I4T3UoxkEbzGV05aGkEVn3ePuD
         xS62oLszdkPAzjBpgwRvv3sAYYnjA1FIR0qMLCLLxlegSWDmeXUmoq/DqHdvGizeo4kP
         auz10m3dBhJShprSvzNGMtd9DEIrlMDbohdi4zVkLKlGu+86Y10y/3a6vxdug+/60mbd
         5+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289144; x=1784893944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXmR/1i3kSXbLKDwpiYQDilxM5OQbH5tXgOwHXzOIyQ=;
        b=NM6Cikri/Ls3ifmZwHW6n1JA0Z+H3pRWtVGgYFXhjHOWZgSZRTn9z3EAPb111BhIzH
         vQxJBksXG2Iy/b4o6SAJzGJriLctJD0mhxjqhNRnnp2ahdDXzlUAniS9V3qfn5R5lCNh
         OCDP95CVvfGWVW6/l6qowfLX4k6hHSsSmx8d1lo3uw0Wmt7QjNDwFYMvz+FAdFCCx6ll
         zja3EsndWjcpqwBfWQgeY0PkO92AvzZ2AYvqlTE/tpMsz8e/FVe/zMHy8vnP9rkSBx6H
         jki6A1eQRs9JTRwo18zV5Lk8fmRcmqCUkg6TxptHD2qhocjNNnjvYSB3YwPqN0KDaiUl
         7gNw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+o+Cfm7xv+kqpwnoabFTRvbpLvU7fVSh6BDKHXaU8Pjsa5OUYbb7dq+DO1gzmdkYiDmKKW6yIMYkhacz7DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJDaitD8fXINhgaN2/3Dmlsa8Swj05khuj/oNHApTZFScMMKbb
	Ou/sbMMNWpVE9oIFNRnjBqSjVeqZnooLzQa/zQbd8afuEtKEsR/MC6TuqLHTckivRVw3RXHZwOn
	B6dWQlk3ZHfhIywhnY2rKauYOhfEnljQ=
X-Gm-Gg: AfdE7cmj3YC2vyTGgy3twzhH964MX62DjulHtsIcHgB8tYTiH9YcLLsK0rtQ4DVweQu
	yS5s4njzB5hyIJML8bf4ntDDacp64Eg1HEpwjUSZnO9vtBjhbVtcOBQypLa60N6svFt68NYATOR
	PO2lZkBxYvn0afD4rfPg6NWrNWtCj6ElVdoun/hw226Wwbkvw3lyA8Y0NknlC2vAS1SqAE7GzPv
	jNAN4jrMzNhViS0/imANym8VwtCCLt2ghEcn5IiRFg+hQNSsx97/2neFP7rwmGuyZmc69RxysrW
	kwTOuIi9/m/YRynDRHTuqshlVPPdpvkhaXufZ/HIiXFUK3sUXpOO+obX1yuU/t9wSeqjEUwfZHy
	TSnTegJiWy1Z0
X-Received: by 2002:a17:90b:134d:b0:37f:e7e7:ad1 with SMTP id
 98e67ed59e1d1-38e4b697024mr1934548a91.5.1784289144013; Fri, 17 Jul 2026
 04:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-docs-printk-rustdoc-link-v1-1-892074948f75@younes.io>
In-Reply-To: <20260717-docs-printk-rustdoc-link-v1-1-892074948f75@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Jul 2026 13:52:10 +0200
X-Gm-Features: AUfX_mzLJVaiRBHZIOgftXl-H_dUUA_uHSHWfhmPBqD8U08fGAaLcUtm3GZ6mD0
Message-ID: <CANiq72mR6hydbO7Srrv9T+Np29Dw4NK5wcxWz68S7vsN+UZZUQ@mail.gmail.com>
Subject: Re: [PATCH] rust: print: fix broken `_printk` Rustdoc link
To: git@younes.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 1:44=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> From: Younes Akhouayri <git@younes.io>
>
> The Rustdoc link for `_printk` points to `include/linux/_printk.h`,
> which does not exist. Point it to `include/linux/printk.h`, where
> `_printk` is declared.
>
> Fixes: 247b365dc8dc ("rust: add `kernel` crate")
> Signed-off-by: Younes Akhouayri <git@younes.io>

Looks good to me, thanks for reporting it and fixing it!

Link: https://github.com/Rust-for-Linux/linux/issues/1246

(Normally it would be Closes:, but there are two issues in the same
one, so we use Link: for that instead.)

Finally, given it is `doc(hidden)`, I will skip Cc: stable@ -- if the
stable team auto-selects it, it is fine.

Cheers,
Miguel
