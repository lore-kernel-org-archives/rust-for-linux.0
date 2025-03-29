Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1E1EEC0
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Mar 2025 02:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743216200; cv=none; b=I4RLgx2MZ4nmMQ7WrJL+yTZyCjgq9fPfpg3T/6lgwM6UJd1KuaFwCu0p4KqjGPtVSzIOiN2l3fBJF9pp/IthzUrVtIoFsPPwCpCrAXWs0xuVkOcJrK735B58gT52OMcvhhFvv5ncpzb80z2Frh8uY1sSswHIolkCQY9RKxb3Z1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743216200; c=relaxed/simple;
	bh=HcIGeBrGMpCMxWsLaMVzZX0Pv11Can9GqBFjhYG624s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsUS+Uup7TUqE5iy2w0Axy1ociwPNoCkP7VPf8F4ILtfWVBNbPbbm3KPnvMP5kv3gxwim5RyCa7WoGIn8GFXfUUdpILbSQ0nZikaaKOkIJNLyk4TqFP9cl76F9nmNkWrUIwWDRzm+lxYjPw3k4gUVN1dNysYfafcB5QGrSpxJ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.219.174])
	by gateway (Coremail) with SMTP id _____8DxjXI8Xudn+BCqAA--.22430S3;
	Sat, 29 Mar 2025 10:43:09 +0800 (CST)
Received: from mail-yb1-f174.google.com (unknown [209.85.219.174])
	by front1 (Coremail) with SMTP id qMiowMDx_MQ5XudnicBlAA--.38728S3;
	Sat, 29 Mar 2025 10:43:06 +0800 (CST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5ad75ca787so2566902276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Mar 2025 19:43:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3TRA4NAD3kTMROFAK0r6/6Q5rk3+KXRFhqNhEYWSGtOHL53TJC4O4+B0RwmZDRi6QNNyCaApySrt6hBsvRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCAMX6uOEvqV9stJvTkmNkTGwnFc0RhTz7ttojih3uAzYXydt8
	PFnBkc7hHUWK6b42v13fBS6IspycehlV+1B29Gtlkz829qJjHN4v5VAMGweTsg9oRNSZ4WeOFZc
	aHVeuZUnlimXt9yIySEXHwDpuSxCTDar4oUVgYg==
X-Google-Smtp-Source: AGHT+IGk4jLVMMvZ9NO4g+M6cXpWM89jtepREBCULlvcxr5aiChB5Hx8NjFVELFpjOU4wIk0eMDYI9EFrsKCf5pBsNY=
X-Received: by 2002:a05:6902:230a:b0:e61:f51a:a79c with SMTP id
 3f1490d57ef6-e6b736c36f9mr6818089276.19.1743216184810; Fri, 28 Mar 2025
 19:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304073554.20869-1-wangrui@loongson.cn> <aab657d72a3ee578e5c7a09c6c044e0d5c5add9a.camel@xry111.site>
 <CAAhV-H5ayw7NxbSbCeAFaxOz+TZ8QeghmhW6-j2B1vTcjYxsJQ@mail.gmail.com> <CANiq72=AZ+CN4SScZcnRBpkS8ogCaZ=Uhe=k7fhGCVyecyRu5g@mail.gmail.com>
In-Reply-To: <CANiq72=AZ+CN4SScZcnRBpkS8ogCaZ=Uhe=k7fhGCVyecyRu5g@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Sat, 29 Mar 2025 10:42:54 +0800
X-Gmail-Original-Message-ID: <CAHirt9jg2hMJDb7o2H33-6DqnF0boUwdfiwmaJahg5C2=sPi0g@mail.gmail.com>
X-Gm-Features: AQ5f1Jrp_Grtk1mM9tgpZbrZSf0byvB8hoYloKhjBdo_j1DwQ_sq-aJDwVxK7Po
Message-ID: <CAHirt9jg2hMJDb7o2H33-6DqnF0boUwdfiwmaJahg5C2=sPi0g@mail.gmail.com>
Subject: Re: [PATCH] rust: Fix enabling Rust and building with GCC for LoongArch
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qMiowMDx_MQ5XudnicBlAA--.38728S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1UuFW7tF1xAr1DJr1DurX_yoW8Xw1rpr
	WkKasrCr4kKFW8t3WxA340vayjk3ykurW8CrW5X342v3Z8uF1SgrW0qF1a9Fy8WF1kWw4j
	vanF9a1rKFWqvFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU4L0eDUUUU

On Sat, Mar 29, 2025 at 12:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>

Thanks for the review and feedback!

> In any case, the usual question for these "skipped flags" is whether
> they could affect the output of `bindgen`, i.e. could they modify
> layouts somehow?

These "skipped flags" won't affect the output of `bindgen`.

>
> Also, it would be nice to mention a bit more what was the build error
> and the GCC version in the commit message.

To make it easier for the maintainer to include more details in the
commit message, I've attached the original build error message below.

  BINDGEN rust/bindings/bindings_generated.rs
error: unknown argument: '-mexplicit-relocs'
error: unknown argument: '-mdirect-extern-access'
error: unsupported argument 'normal' to option '-mcmodel=3D' for target 'un=
known'
error: unknown target triple 'unknown'
panicked at /home/hev/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/=
bindgen-0.71.1/ir/context.rs:564:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch
If you encounter an error missing from this list, please file an issue or a=
 PR!

gcc version 14.2.0 (crosstool-NG 1.27.0)

>
> Finally, regarding the Cc: stable, I guess that means 6.12+ since it
> is the first LTS with loongarch64, right?

Also, the `Cc: stable` is indeed targeting 6.12+, as it's the first
LTS with LoongArch64.

Thanks again!

Cheers,
-Rui

