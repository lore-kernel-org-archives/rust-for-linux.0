Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793918452;
	b=jLj/Er13AhHCtiRAJ0sGNHR5JhXJePP4XQqqh20BITCXYDX7Pl4yPlgQb7ZHGfetU0AG
	 +MFc6LWzcV5rtl+l8+0UmBezS7EuL16FTRWVwBpjwcPJW/lk3sA5KLf569KebzN3FHCdb
	 4lTH4IqldW6sebFmOlS7/KIirdLRkTY+sTTU81NVRT3DbA03hY9kd+2hztZ9GOSiFknyp
	 F/0yIdHFB3UgsSCZYiksHp9PWAXaT0GpJkRl/Dq54eNtdOtFeFGR2AQtCX4Jb6HC/a4HX
	 XEWluHBEYSREhCyJaCgpS7nS15KNe7xa1w+tQW29pI4OrfkeDr3mnOCU715vbTLQlOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
	b=4rtotL2i6BT5u+ZyE2kTdErZcHa7QZbQ2oja+qGyPrAIhu6s0mTaE8Xv8Wr7WAMkiqyo
	 VDTdL/o++N8t9Qpnw3PkToWT40/9dGe6Yg2Eb0jk4U99nnIe2S+AuQjOnqwk0hTcRK+GA
	 xCVySdnPeuGnPYKrBYpWRkEFhmhOHRD3eD6TUE7FHMf487HLKQ8iuB/ukUpPKanWXr8Na
	 q5RJ/FFMZeSp+bXb945neJC/wXFse9HVo40KlxyELlMEV3dIV4bMXcSqtk+8TxgRzM9Vz
	 ureYxamNquMXOixxlpVZUznLvoZ30271sp+KSvoEpEr+Mq3ZreWCrN2CH9tAn2cnKsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RgLRNkQL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB90606A326
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 22:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB90606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RgLRNkQL
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f540ebso34032f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 14:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918450; cv=none;
        d=google.com; s=arc-20260327;
        b=KhdKnADFVYGBIfv+CCX8lQKVioBkbydJLIloIfoYoSzH1HDwHAZnxccjx1sm5ldLKv
         df34G/SliEyAEf53FzsU2zny2BNube/sYStoA96q7663OGX6H0ZeE0mRCVcdi+TI6Rxh
         pJ2/aEiDIDDjNWHm/khKQb/lD5IV+M8KsXbk1OMtolxlGeiiWc//17hIxiqfw3CNwNIG
         eoU/Y6+mtxc4Vnst3N1OhBYWrowrTyoAxIuUGDbRbnhHC8YPOPw/yA1T11c5EXVuRNk+
         0EcOhrYA9IhdDXooKg0dCIEiVA/si96SNri2zgddCzw3gothFb0zKMpcDc2BNjyVzHC0
         LT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        fh=cscm+X00xxp5q0m9Q1i31A68pBcG2LMbXuFSX4msLxA=;
        b=A+OvJAmEaVz6eEHZfwLpA22GUo12LB6LUw4yZh9ASUnurB8xGWoE3lmxm5dCLmj9z7
         1zXKjFCNj6HvY4pNg1wi9x7QO2u+VyYMVGSTJbfMJDIgmLjv6MHieGoRPFjKbagQ/4du
         wKgAxXxjX0zeMUPapwg9AGZPoEVGq9oNCy0+IzibCAest0Mh1RJeUvq/Sgvspa995BZU
         o06HVeIahrKNGntq+zTk4FH1RemkwcmboG6NwMC8LnAIQ3tNtVnyIa3MaVlD8PvrmMSa
         KazwL0x5JWAER7mAVCNfT6DJcdspY+jJXt4JdS5oCNaU1OsLgpJPB28fbD3ljWO+jKaw
         NHlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793918450; x=1794523250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        b=RgLRNkQLo0+/Ugi8UZpgCB1l8VFl7ffRroxPbtHZ4YNEaKqjtzdw7GXwpZ1DXMUZDd
         FRDGAJf01FCLY2PbU1tVMy/K3opwjWIfrABgQrTz/H2e2O3L+5KxKMH8RUCCXT1VWgqT
         fUE9YKkZE25MM7dhJkEVEvn/hvChYgKruV+t4R5688c/h7bue49V3bjhP3vk5/VKhqYr
         OG0Uo42RD11B7RfTJN7AkVa6Jh/9MB74t+PGjKFy3Y/CSzhdMvL81tSxt3YnMscfprrM
         EdfMixRG/B6d76i+GAjV2xzW9bHlMrNTFMx/HBn4rH17iBxMGSeQBhzc7bhHA/NL3rfV
         oEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918450; x=1794523250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        b=hq6CuLG1fXFBRKvawlPulS2h7FSiD/e+llrQYlgjGyBis3Eh6jSXSINI5lVi3xvzi2
         SAj0K7CsRvPK6nw3fsqRy3B1Hc7AcWZXYrQ0u0vLRmnvmhI2mYFucCnA3YejMjkE1TIi
         FKMa7pN2LSIFBSAVnpQgTiMSKYm1M8DEwsc3TI7WiBZewdfz234iICR4LVZP46XUUghL
         6jvzhbU9W8GJezKZaGXogbjZstHsGZBLT22/u7h5n9jrq2kqQHnDpjQCcH0rnxNP6BuR
         EfDcJIyf3QlvTQSCv+DjDFetWJ+hrGzL2+MRw3BJ+o7Z1wWc+z6mxrOlz4OJcX17Tmcl
         osUw==
X-Forwarded-Encrypted: i=1; AKwUvBwBsXLiI11ABQJsjC8IHsoT4ZD5T1e7r0IfOKrSavgsp3qKAQ7AhkMBydiHMWPl8qWl0g5oSegz2j6OxlCZIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lW9k5fUbrjfhlBmozr/Stvisq5yzB5QZdVM6LKa7Uqcz6IP5W
	TmGyRWOhjiUnWfIqFsDx/JVmb+igi7faBcwXeXneF48yu+OxSwRVO1qz0stJpneba8FkhstVTkA
	sPulX1PiPaTnbHt1LNpbQvH0mciTBGKIc7yQFbrwz
X-Gm-Gg: AYBFou2nF8Rs0GEfRn2xLCTFC9eXiJ9JjWYxLtosA8Klxdf7ia2O4W0hZ2PNc26K6Gg
	0ql/CzXWkDmP60pZWDDi3Y2LEt8cD5fI2Zmn31rVvNuZ5FEkW0PkH1oF4j/7oDOqWWn/1SP4VqU
	Q+aFFepWL3PWOUF8LwONaosCalJNMI70uCrKHJpEGoY0TGbm3lWue6XZjzCTduXs+9sH/2KvDSH
	fx8BkhR1yGIR9AF+LYS5MQlCdtA0VLAn2GLgeNQpfubTAksrNhTTegsq5ihQK9HcAcOmlKFJ8kS
	4dajZmtSOUNEssXNcIEq8cbWgCvP4igVPe9u8bpwoAeV3r8L6f/4l4G11/xnUYjl3Jvq32kMcRM
	kLV9UkVh4UiqvimucQaD7tHvHRRWOoUaBfGXI28HGCrLrQLZpFjIQ7g+6feKL7xtOdyq7exrIVz
	Z0rUBL0/SWTu9wBFZxDEqJRCLJ/YBoCdzb5l/0y8AuHj0db4PSZCH1JiKk/hapDZwTxt02Rei+b
	fRrGqXsmfiJekuiwfV5jvNeG6Chf4c9AFkfXSw56Yp5WXHYJTqeQvazAQ==
X-Received: by 2002:a05:6000:2892:b0:48e:d27:bef2 with SMTP id
 ffacd0b85a97d-49276a6e26fmr1759258f8f.21.1793918449566; Thu, 05 Nov 2026
 14:40:49 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 14:40:38 -0800
X-Gm-Features: AclHuK8nvrGQbL7-Xvq-JpHEYtxPKFX5Sm9KyXUfS9U3lydEUDZDAqeaU6dAk_8
Message-ID: <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > The issue you mentioned regarding excessive time in applyFlowInference
> > comes from Profi.
> >
> > The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> > FS discriminators). There are known issues when using Profi with
> > FS-AFDO; enabling Profi actually degrades performance compared to
> > original profile propagation. When we tested and worked on AutoFDO for
> > the kernel, we did not enable Profi.
> >
> > While I haven't looked into this specific bug yet and am unsure if it
> > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > to disable Profi for now.
>
> Interesting. I can suggest that to the team digging into it and see if
> it solves the problem. My AI agent says it will though. It claims that
> the default flipped recently and "-fno-sample-profile-use-profi" will

I wonder who flipped the default? Perhaps they're not aware of _all_
of the existing users of AutoFDO, such as the Linux kernel.

> restore the old (tested) behavior.
>
> Should I send a patch adding that flag?

--=20
Thanks,
~Nick Desaulniers
