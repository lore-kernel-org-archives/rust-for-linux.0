Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B4723AD
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.219.177])
	by gateway (Coremail) with SMTP id _____8DxOujrXZ9lWCAEAA--.4059S3;
	Thu, 11 Jan 2024 11:18:04 +0800 (CST)
Received: from mail-yb1-f177.google.com (unknown [209.85.219.177])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxXN7pXZ9lqT4OAA--.37381S3;
	Thu, 11 Jan 2024 11:18:02 +0800 (CST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbd715ed145so3698965276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jan 2024 19:18:02 -0800 (PST)
X-Gm-Message-State: AOJu0Yz76GeyYitIWJz9ce/2eklRAdaDiUHQKRwjUiZ0VaezskI9Z2PT
	EPOmaAdsFInrZKEo6xhlSdGGBw+/rmekgSD4bFjGs1jR8alxlA==
X-Google-Smtp-Source: AGHT+IHpSM/8N7+rGcy92dZLNMFLoixFy6IEJVvgwPI+z5PwBP9sjyoT/Y36ExtZ7DIfK/4FNN0TteYtrQWLIRHMQSQ=
X-Received: by 2002:a05:6902:2511:b0:dbf:e0a:c642 with SMTP id
 dt17-20020a056902251100b00dbf0e0ac642mr686949ybb.112.1704943080724; Wed, 10
 Jan 2024 19:18:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106065941.180796-1-wangrui@loongson.cn> <CANiq72=M5TrUL+9Z0nqKKcD=KHwyDA79fNYHgU2EJ+7u6Ct8qw@mail.gmail.com>
 <CAHirt9hd4W25p1kVNYXbEXrLj6NgT5r=EPWsoOmHZzS1qGR-yA@mail.gmail.com> <CANiq72nw2UHd3Kek-Fmvk_3zE=z56wYJVQJq_syYagru5+wo8g@mail.gmail.com>
In-Reply-To: <CANiq72nw2UHd3Kek-Fmvk_3zE=z56wYJVQJq_syYagru5+wo8g@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Thu, 11 Jan 2024 11:17:50 +0800
X-Gmail-Original-Message-ID: <CAHirt9hD-yYhA4moQemOPizSGrgdkBgT08UuuZai41gsbGdMog@mail.gmail.com>
Message-ID: <CAHirt9hD-yYhA4moQemOPizSGrgdkBgT08UuuZai41gsbGdMog@mail.gmail.com>
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
X-CM-TRANSID:AQAAf8DxXN7pXZ9lqT4OAA--.37381S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xr1rurW3AFWDXr18AF4xGrX_yoW3Xrb_ua
	1DAr97ArW8GFsrA3sIqa1UJFyfWaykGry5u3ykXayvyw1ftan8WrykCFykJwsrCayxGr9a
	9r90ya4093W3ZosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb38YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxU74lkDUUUU

On Wed, Jan 10, 2024 at 7:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jan 8, 2024 at 4:22=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wro=
te:
> >
> > Thanks for your comments. I noticed that the refactoring of the build
> > system to support the use of Rust built-in targets is still ongoing.
> > Could this take some time? In the meantime, let's proceed with the
> > generation method.
>
> My pleasure! If you mean the first patch of the arm64 series I linked,
> we have been waiting for a while for that to get merged (hopefully
> 6.9?). So, yeah, as you say, it is probably best to continue with this
> and then you can change it later after the arm64 series lands. Thanks!

Thanks. I'll do it.

Regards,
Rui

>
> Cheers,
> Miguel
>

