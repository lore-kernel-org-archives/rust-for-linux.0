Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C86548E3
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Mar 2024 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709629518; cv=none; b=ZjqxnBI5m8VY9qlR1VQ10sYToaq6fCz8n9fqK7JzoPvLbUY9j2prORlHp5rfbsxWcrbOJ1p1rrJk1tEBL5hGWnIbGdNBC8/XKZxnVMkT26a5ohkHkUhy2KFa3tznetXLf2uo6LYgFgJfudxRISQOy7p+0cV2vZ30Dxsw6OSQ+lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709629518; c=relaxed/simple;
	bh=Z2qwct6XTybj5nj/8GILqcSdKhOgcrszVOS6anSnpTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uj/ofaAMzr0xi65n2an9RL7+8ZFVCvlt9ysJcEXD+RhyupAJBzHz3tp0SRjgRwoz6e96lYSfDYcMYGgMpZJ3hgFDR/LL/kwQlLmC+6neYX//IlsHBdK+x+InscA6rNa9qIc7vHY6ikP63oZ1gXRAhqBhH5qVDadBn+2Dr4Qj0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.210.174])
	by gateway (Coremail) with SMTP id _____8BxVfFG4OZloa4UAA--.52173S3;
	Tue, 05 Mar 2024 17:05:11 +0800 (CST)
Received: from mail-pf1-f174.google.com (unknown [209.85.210.174])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx_c5D4OZlum9OAA--.11889S3;
	Tue, 05 Mar 2024 17:05:09 +0800 (CST)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e558a67f70so4841572b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Mar 2024 01:05:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4pAKZzZfePoMuBOZezoQHmuhWOv8w1ZRITxPrmUtlyCl+Ub6krigsukdnBNSzmC4vI2dJ+/fa9IEvDTcAcaBRDEO8plvA1QZmOkStzEI=
X-Gm-Message-State: AOJu0YwOQrzANPNtP1svWBO+56mK0ojfPyduXenxVwwjQMXh4UysOVzd
	ujdB6NiYVOrFdbTJ6FZBJrjHjoVQzfdfeelKUXlnvTxU39GHSEZBIj4mIG04D4V9Rsds1BEDMVZ
	zEFREhvgUCjBA700QRmDNq51KB+dcSHuENauS0Q==
X-Google-Smtp-Source: AGHT+IFCOgUQy6Yrg/hGm/YPDL5pf6cIPrfQwg8VzhOdB0PFiQXbjuVLpWWugLmSn2Wclxftxj3A7UzLgXYKuu6Ie90=
X-Received: by 2002:a25:1803:0:b0:dc6:aebb:168e with SMTP id
 3-20020a251803000000b00dc6aebb168emr8119664yby.26.1709622525779; Mon, 04 Mar
 2024 23:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304141426.163517-1-wangrui@loongson.cn> <CANiq72mvdVrzN19PC8pNrvuBLkOEEQ3yX0WG6JcWc+RVaSM2nA@mail.gmail.com>
In-Reply-To: <CANiq72mvdVrzN19PC8pNrvuBLkOEEQ3yX0WG6JcWc+RVaSM2nA@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Tue, 5 Mar 2024 15:08:35 +0800
X-Gmail-Original-Message-ID: <CAHirt9iNPjHfMRS792E1MHbCQk1v6GnNVcb6LAvhskyyVg8bPw@mail.gmail.com>
Message-ID: <CAHirt9iNPjHfMRS792E1MHbCQk1v6GnNVcb6LAvhskyyVg8bPw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: rust: Switch to use built-in rustc target
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, WANG Xuerui <kernel@xen0n.name>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8Cx_c5D4OZlum9OAA--.11889S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtryxWrWkCF48Cw13Gw17urX_yoWkXrb_X3
	W7Cr1kGF1UuFs7Za48JrWruFn0q345tay3Z3ykXFsrXr95Zan8WFyDGa4av3Zay3yxWFs3
	Kr1Fvwn8uw12gosvyTuYvTs0mTUanT9S1TB71UUUU1JqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jw0_GFyle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jwtxhUUUUU=

On Tue, Mar 5, 2024 at 12:09=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Mar 4, 2024 at 3:14=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wro=
te:
> >
> > This commit switches to using the built-in rustc
> > loongarch64-unknown-none-softfloat target for LoongArch.
> >
> > The Rust samples have been tested with this commit.
> >
> > Signed-off-by: WANG Rui <wangrui@loongson.cn>
> > ---
> > base-commit: ("rust: Refactor the build target to allow the use of buil=
tin targets")
>
> I couldn't apply it on top of commit f82811e22b48 in arm64's tree
> (which is the base? -- the offset differs significantly in the arch
> Makefile), but I nevertheless applied it manually on top of that one,
> build-tested it for loongarch64 and boot-tested it for x86_64:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>

Oops. The actual base is tag next-20240228. I just want to make it
clear that this patch needs to be based on ("rust: Refactor the build
target to allow the use of builtin targets").

Thanks!

Regards,
Rui

>
> Thanks!
>
> Cheers,
> Miguel
>

