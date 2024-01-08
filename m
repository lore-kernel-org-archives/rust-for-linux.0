Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21AD611A
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jan 2024 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.222.173])
	by gateway (Coremail) with SMTP id _____8CxqurpkZtluQoDAA--.9113S3;
	Mon, 08 Jan 2024 14:10:50 +0800 (CST)
Received: from mail-qk1-f173.google.com (unknown [209.85.222.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxXNzlkZtl_REHAA--.18144S3;
	Mon, 08 Jan 2024 14:10:47 +0800 (CST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7831389c7daso166890985a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Jan 2024 22:10:47 -0800 (PST)
X-Gm-Message-State: AOJu0YzRzIodWS9RHcZYqutv5Aa9jV9PJ6EUV0wnelMU8ey6l2HmjgIW
	v7thPsx2z6PlrlSfIP6lmiDaOraA60OzAhs+KD/CFlBMnisyng==
X-Google-Smtp-Source: AGHT+IGKnCG8TykNKu6ZAbyjwnzNC87gaoIpVZsuDDN+mlXo4QRoj8lgmpTyYllZ7a5FmM235WXdm/gN/LQ8AnX4xlE=
X-Received: by 2002:a05:620a:272a:b0:783:251a:e5d9 with SMTP id
 b42-20020a05620a272a00b00783251ae5d9mr445312qkp.21.1704684114109; Sun, 07 Jan
 2024 19:21:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106065941.180796-1-wangrui@loongson.cn> <CANiq72=M5TrUL+9Z0nqKKcD=KHwyDA79fNYHgU2EJ+7u6Ct8qw@mail.gmail.com>
In-Reply-To: <CANiq72=M5TrUL+9Z0nqKKcD=KHwyDA79fNYHgU2EJ+7u6Ct8qw@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Mon, 8 Jan 2024 11:21:43 +0800
X-Gmail-Original-Message-ID: <CAHirt9hd4W25p1kVNYXbEXrLj6NgT5r=EPWsoOmHZzS1qGR-yA@mail.gmail.com>
Message-ID: <CAHirt9hd4W25p1kVNYXbEXrLj6NgT5r=EPWsoOmHZzS1qGR-yA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Enable initial Rust support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8AxXNzlkZtl_REHAA--.18144S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1Utw17JryrZFykCF1DCFX_yoW8GF45p3
	Z2yryxKr4UJr9rJF17Ar1xXw1qyrn5Gw15Jwn5G3yUAw1UJr13Jr1UKF45tFyDGr1xCr4j
	yF1jvF1DAF4DJrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jb6pPUUUUU=

Hello,

On Sun, Jan 7, 2024 at 10:29=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Jan 6, 2024 at 8:04=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wro=
te:
> >
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  Architecture  Level of support  Constraints
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +``loongarch`` Maintained
>
> On top of what Huacai said, it would be nice to add another character
> and realign the table so that `loongarch` it doesn't overflow (perhaps
> best done in an additional, previous patch).

Thanks Huacai, Miguel.

>
> > +    } else if cfg.has("LOONGARCH") {
>
> Would it be possible to do it without a custom target in
> `scripts/generate_rust_target.rs`? If it is not possible (e.g. there
> is something that you cannot tweak otherwise on top of a built-in
> target via the CLI flags), it is fine to use a custom target for the
> moment.
>
> For instance, this is how ARM is doing it:
> https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Jamie.Cun=
liffe@arm.com/
>

Thanks for your comments. I noticed that the refactoring of the build
system to support the use of Rust built-in targets is still ongoing.
Could this take some time? In the meantime, let's proceed with the
generation method.

> Thanks!
>
> Cheers,
> Miguel
>

--=20
Rui

