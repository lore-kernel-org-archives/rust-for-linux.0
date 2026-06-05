Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABCE413227
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672788; cv=pass; b=otuKZNXXLAoDSRdsIHZ85D6DWfkVif/iyUjp92ZAdlEAo668hGxvSTJjcqizUwBqKdJi/M3/1axwsHCy5iRHmzE/OztR5LhZslX+V70oAherM3vxKfAEGy27j0ZKPeQhJjaoYh8dVtltOw5qzj3x//MaXhu4+NWJdRCDKO1OZTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672788; c=relaxed/simple;
	bh=ymFf/rEwZrJs5X9wKSO5OinbMUTtbF8uY2QhuC9pf7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4G0YQ8+EFw927oh2p7i3GwlYl8YhPHHEQ/ymZdKlZiq7dAQ4zMhJ1XL1ajr7tFr7LjvxxfXQmaaQRDAduTgdW7V8M4OA0AdM8O5EiTcerCxPoNPeNXuC4GFq4GWA3uTxJsy7FcaAkEDu8+fXGR3dtdeAGOAJMarBZuilJ4b2SA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dZspgvhI; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dZspgvhI"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-660e9ea26b9so2182465d50.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 08:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780672783; cv=none;
        d=google.com; s=arc-20240605;
        b=aF5+7WWIZvBH3A1EbievJYUwUbrelF7TNyIjBMO/Bk7WZSbEqB5ZRpK+Enr1uTqaGc
         wxdmC+hiNO94sRrACRf9n0iUNOxaRl6mQywIg+Z9qNGEsigbRj9qWCIprgZVEgrUDhra
         BJmwDJxwhh+6uwV3t4yR5WT6dXI9uYSdK9HkS1rt3m3M8+O3AqrLZeJyNBWJZ8hKwbhN
         tJ1KqG8olqSUYo69B187vCIUN1YV9MnVD/FL9rcftV2YLMEe5JctxGI6TEhoq9XgALPr
         UvEntEi/RG5OM8EsvSu769n7yLxeH2NUvVNyjG1J4xZ+TiwG0CXgFhlyfdDJ+I/LAthV
         8rnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3m/KOQvsG1uJHDvO1PZnjraMcJuZMi2RUKvodsmX6gM=;
        fh=sy0yzJiJyEJL4bPtD7J1cUmz5gqPC28gzpYKnTyJ8G8=;
        b=Qsr2lYFvpVle1j7tg9lrThgvmQfoR9SLZpwEV+IbRnawqKVxahrjxHK9LgZRhr/L7P
         t4tOazzPXIl4h152h6B8aa8P/yQZhnK2q1xoeWHU5mhQPvEhsS+C6KUxqMQ0IL3VPMM8
         Wc8GKt8Nv/bYMq0x13ANAs4VlJgwQjSl13mQdrjM1B/FGIQLgb426hFxDAFI3bW4H+oL
         4AM09D7dqaMrgLjSfTR/l24H63cfWxgFp95FS7JLRGI05E4milAzeJFrJ0g+OTVZj0Py
         SHZ6rtiMAvwdURCe16JYQS4r8qWRQ5aulPa7VMWSqZEsItFREYJLmGnzej7ANmuNoSHd
         3Dow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780672783; x=1781277583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m/KOQvsG1uJHDvO1PZnjraMcJuZMi2RUKvodsmX6gM=;
        b=dZspgvhImrxDp7hNtUv4CCE7zrL0eVUrG75rI5ARz6iuBvEA5jp1X7MtBl/PdZLcpl
         KR9WtqrKqv98P4+4sPm3nSZ2fVPOTtnfkFkZG0NwLBzbj6RnpnbpuBZ5/QONeGB89cAg
         fIGh96QMPkQ2BcbBa+4O13TX0gNFlTCgbz7UMMZqDq4LqThmcyelyW/tjAtG5O7KCyge
         gOTVqceu4XeorfE6ndB045Xz7yMWuThVMJAhec7gPLdRqj1S3HU+Yz89k/NYd7uvaOha
         GgPtlLY0VUgXpQMfYSd1gtlVWx/KnzKsYMU/++ayqn3btLoN3DaAlg/UaGEg/0QSOk/a
         rKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780672783; x=1781277583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3m/KOQvsG1uJHDvO1PZnjraMcJuZMi2RUKvodsmX6gM=;
        b=Eivye8CUnL+oM6JxC+dtfvc34SVy9N/J4m4nFk257xSh8lteEjocRJ3w845ZqwMmlr
         bJHt5ze8iIu6u2HC2vt/31HnqFqK/lf7dkFv0WbLq9KpTu+Z+Mf+/esver8HPBXGc63h
         EilPcOHeX7kq/OlqlpQaE6aWi4sdT8uvomB/niPMnhFJ7Dhxnd42mKv58TVDwnIbjlvt
         NOi/jJmA9tIeZPuFmQ8zW7okYRSzReDq71RaXzVlYjoH8Kx7wR1txxkluyzmJq8ZpYoa
         4+Xxb6dygRVNZIm1ScMRi38C8R/a9JbqHjVW9YSyHv9AdfHlVC3JVRHuo9bu59g2y9NH
         +8wg==
X-Forwarded-Encrypted: i=1; AFNElJ9MV5c4Ynzp8Iu2eOSvLadqCXr/niqFHxO26TjjBRqCDikwGvrIu3dRrfuoKTeI4cISV9qqADb0bE0E5zIQsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyqn/+DaxMkfeyREndLxdWxyzrJQ0wuzbcx1hL2TgxN3k/WkEv
	QOYfGDq3X9571OJFG4ajLrO5j95Wsmgb2zJC0hm/OFgJDNfF8hRAKkz6LuGJGtVxKcZxrTRJD1L
	ucN2InMktxnYhie4wRZaa/KuJpYfY4NFIoQdkea/r
X-Gm-Gg: Acq92OEkKAFR0DZSqQS5payV4pbGH1qUbBXJhqw77GYPoWOG3lVbGTVF0Cmw0dXjhjV
	flgecXMOqnrOzYnaOfmadVVzON/Sr6Ln/eaub37Sgq25K5bdmm+D8N2nrLGwxk1HTjDjL0Tid9x
	RJDMp2CPibdp35Idh7iTSeM9N8Rf7oOFWfhl1B9MnykwSDT/LfT0JN8JCBH7hcxa9neri7iRg+v
	SgpX0Yua+SDW8M2HzhPUK3p6GyN7JUoGsfx7N107FaICH0SYTONb8DNZY55L7a3XKvtmSiuWqaM
	NfU87FY5p8lb7FMnTW0wu3pW6tMWnZcLNIK7uWZD1e8nbU1sNeU=
X-Received: by 2002:a05:690e:1c07:b0:64c:9f31:e33 with SMTP id
 956f58d0204a3-66106fbfa70mr3468603d50.65.1780672782001; Fri, 05 Jun 2026
 08:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-4-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-4-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 17:19:01 +0200
X-Gm-Features: AVVi8Ceblw1PVlq_JOUX8fDH6TRKq7cz66at-ID_frny8QXhTeItWJGDPY83a0I
Message-ID: <CAG_fn=UTFnM60LVABGR-V0NwYc4d9C4KAhT4A_+oxduJcSeqew@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] tools/kcov-dataflow: add userspace consumer
 and test modules
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Add tools/kcov-dataflow/ with:
>
> - trigger.c: userspace consumer that opens /sys/kernel/debug/kcov_dataflo=
w,
>   mmaps the buffer, enables recording, triggers a kernel path, and dumps
>   the captured TLV records.
>
> - kcov-view.py: visualization tool that parses and pretty-prints the
>   binary TLV buffer with struct field expansion and symbol resolution.
>
> - eight_args_c/eight_args_mod.c: stress test with 1-8 argument functions
>   verifying correct capture of register and stack-passed arguments.

I think the tests should better go to tools/testing/selftests.

> diff --git a/tools/kcov-dataflow/.gitignore b/tools/kcov-dataflow/.gitign=
ore
> new file mode 100644
> index 000000000000..1f35df8fbd07
> --- /dev/null
> +++ b/tools/kcov-dataflow/.gitignore

I am not sure about the conventions, but a bunch of other .gitignore
files have SPDX headers.

> diff --git a/tools/kcov-dataflow/deep_module/Makefile b/tools/kcov-datafl=
ow/deep_module/Makefile
> new file mode 100644
> index 000000000000..6afed580dc9a
> --- /dev/null
> +++ b/tools/kcov-dataflow/deep_module/Makefile

Makefiles must have SPDX headers.

> diff --git a/tools/kcov-dataflow/deep_module/deep_chain_mod.c b/tools/kco=
v-dataflow/deep_module/deep_chain_mod.c
> new file mode 100644
> index 000000000000..786e23c5d213
> --- /dev/null
> +++ b/tools/kcov-dataflow/deep_module/deep_chain_mod.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * deep_chain_mod.c - Demonstrates kcov_dataflow tracing through 10 nest=
ed
> + * function calls. An attacker-controlled "offset" value propagates from
> + * the entry point through transformations until it causes an OOB write
> + * in the deepest function.

I don't fully understand the purpose of this file. Are you going to
parse its output for testing?

> + *
> + * Call chain:
> + *   entry_handler =E2=86=92 parse_request =E2=86=92 validate_header =E2=
=86=92 extract_payload =E2=86=92
> + *   transform_data =E2=86=92 apply_filter =E2=86=92 compute_index =E2=
=86=92 lookup_slot =E2=86=92
> + *   write_slot =E2=86=92 commit_write (BUG: OOB here)

Call me old fashioned, but I think we can easily avoid the non-ASCII
characters here.


> +/* Function 10 (DEEPEST): The vulnerable write */
> +static noinline int commit_write(struct slot_table *table, u32 index, u6=
4 value)
> +{
> +       /* BUG: no bounds check on index =E2=80=94 if index >=3D 8, OOB w=
rite */
> +       table->slots[index] =3D value;
> +       return 0;
> +}

Does this call chain need to be this long?
I assume it was extracted from some real-world example, but maybe
pruning it to 3-5 calls would demonstrate the capabilities of dataflow
tracing just as well?


> +
> +       table =3D kzalloc(sizeof(*table), GFP_KERNEL);
> +       if (!table)
> +               return -ENOMEM;
> +       table->num_slots =3D 8;
> +
> +       /* The tainted data flow:
Please make sure to conform to
https://docs.kernel.org/process/coding-style.html#commenting

> +
> +/* Trigger: constructs a malicious request that causes index=3D12 (OOB) =
*/
> +static ssize_t deep_trigger_write(struct file *file, const char __user *=
ubuf,
> +                                 size_t count, loff_t *ppos)
> +{
> +       u8 *buf;
> +       struct request_header *hdr;
> +       struct payload *pl;
> +
> +       buf =3D kzalloc(256, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       /* Craft malicious request */
> +       hdr =3D (struct request_header *)buf;
> +       hdr->magic =3D 0x50524F54;       /* valid magic */
> +       hdr->version =3D 1;              /* valid version */
> +       hdr->payload_offset =3D 16;      /* offset to payload (valid posi=
tion) */
> +       hdr->payload_size =3D sizeof(struct payload);
> +
> +       /* Craft payload that will produce OOB index */
> +       pl =3D (struct payload *)(buf + 16);
> +       pl->session_id =3D 0xAAAABBBBCCCCDDDDULL;

Much is happening in this code, making it hard to review, but all
these values do not seem to be used anywhere.


> +
> +noinline u64 func2(u64 a1, u64 a2)
> +{
> +       return a1 + a2;
> +}
> +EXPORT_SYMBOL(func2);
> +
> +noinline u64 func3(u64 a1, u64 a2, u64 a3)
> +{
> +       return a1 + a2 + a3;
> +}
> +EXPORT_SYMBOL(func3);

Would it be more readable to use some macro magic here?

E.g.:
```
#define DEFINE_SUM_FUNC(n, sum_expr, ...)           \
noinline u64 func##n(__VA_ARGS__)               \
{                                               \
return sum_expr;                            \
}                                               \
EXPORT_SYMBOL(func##n)

DEFINE_SUM_FUNC(1, a1, u64 a1);
DEFINE_SUM_FUNC(2, a1 + a2, u64 a1, u64 a2);
DEFINE_SUM_FUNC(3, a1 + a2 + a3, u64 a1, u64 a2, u64 a3);
DEFINE_SUM_FUNC(4, a1 + a2 + a3 + a4, u64 a1, u64 a2, u64 a3, u64 a4);
DEFINE_SUM_FUNC(5, a1 + a2 + a3 + a4 + a5, u64 a1, u64 a2, u64 a3, u64
a4, u64 a5);
DEFINE_SUM_FUNC(6, a1 + a2 + a3 + a4 + a5 + a6, u64 a1, u64 a2, u64
a3, u64 a4, u64 a5, u64 a6);
DEFINE_SUM_FUNC(7, a1 + a2 + a3 + a4 + a5 + a6 + a7, u64 a1, u64 a2,
u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
DEFINE_SUM_FUNC(8, a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8, u64 a1, u64
a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7, u64 a8);
```

You could as well define the function prototypes instead of applying
-Wno-missing-prototypes.


> +{
> +       pr_info("func1(0x11)=3D0x%llx\n", func1(0x11));
> +       pr_info("func2(0x11,0x22)=3D0x%llx\n", func2(0x11, 0x22));
> +       pr_info("func3(0x11,0x22,0x33)=3D0x%llx\n",
> +               func3(0x11, 0x22, 0x33));
> +       pr_info("func4(0x11,..,0x44)=3D0x%llx\n",
> +               func4(0x11, 0x22, 0x33, 0x44));
> +       pr_info("func5(0x11,..,0x55)=3D0x%llx\n",
> +               func5(0x11, 0x22, 0x33, 0x44, 0x55));
> +       pr_info("func6(0x11,..,0x66)=3D0x%llx\n",
> +               func6(0x11, 0x22, 0x33, 0x44, 0x55, 0x66));
> +       pr_info("func7(0x11,..,0x77)=3D0x%llx\n",
> +               func7(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77));
> +       pr_info("func8(0x11,..,0x88)=3D0x%llx\n",
> +               func8(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88));
> +       return count;
> +}

The inconsistent output format here suggests that the output is never valid=
ated.

> +
> +static const struct proc_ops ops =3D { .proc_write =3D trigger_write };

This file should belong to debugfs rather than /proc/.

> diff --git a/tools/kcov-dataflow/eight_args_rust/eight_args_rust.rs b/too=
ls/kcov-dataflow/eight_args_rust/eight_args_rust.rs
> new file mode 100644
> index 000000000000..11bbe1449eaf
> --- /dev/null
> +++ b/tools/kcov-dataflow/eight_args_rust/eight_args_rust.rs
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//! Verify kcov_dataflow captures 1-arg through 8-arg functions.
> +//! Write to /sys/kernel/debug/test_args_rust to trigger all 8.

Please make sure triggers for all your tests are consistent,
preferably somewhere under /sys/kernel/debug/kcov_testing/ or similar.



> +
> +Reads both /sys/kernel/debug/kcov (PC trace) and /sys/kernel/debug/kcov_=
dataflow
> +(args/ret), correlates by PC, and produces a human-readable call trace w=
ith
> +argument values and struct field expansion.
> +
> +Usage (inside guest or with appropriate permissions):
> +    python3 kcov-view.py <trigger_command>
> +
> +Example:
> +    python3 kcov-view.py "echo x > /proc/uaf_trigger"
> +
> +Output:
> +    func+0x0 [module]
> +      =E2=86=92 a(arg[0]=3D0x1, arg[1]=3D0x2, arg[2]=3D0x3, arg[3]=3Dstr=
uct{.f[0]=3D1, .f[1]=3D2, .f[2]=3D3})
> +        =E2=86=90 ret =3D struct{.f[0]=3D1, .f[1]=3D2, .f[2]=3D3}
> +      =E2=86=92 a(arg[0]=3D0x0, arg[1]=3D0x0, arg[2]=3D0x1, arg[3]=3DNUL=
L)
> +        =E2=86=90 ret =3D 0x0
> +"""
> +import os, sys, struct, mmap, fcntl, subprocess, re, ctypes
> +from collections import defaultdict
> +
> +# Ioctl definitions (x86_64)

Why is this code x86-specific?

> +def parse_dataflow(buf, n):
> +    """Parse TLV records from kcov_dataflow buffer into a list of events=
."""
> +    events =3D []
> +    i =3D 1
> +    while i <=3D n and i < BUF_SIZE:
> +        hdr =3D buf[i]
> +        typ =3D hdr & 0xF0000000
> +        seq =3D hdr & 0x00FFFFFF

These numbers are used more than once - please declare them as
constants instead.

> +
> +        if typ not in (0xE0000000, 0xF0000000):
Same here, no one knows what these numbers stand for.


> +        while i <=3D n and i < BUF_SIZE:
> +            v =3D buf[i]
> +            vtype =3D v & 0xF0000000

Please use helper functions to extract the type, size and whatnot.

> +            if vtype =3D=3D 0xE0000000 or vtype =3D=3D 0xF0000000:
> +                break
> +            fields.append(v)
> +            i +=3D 1
> +
> +        if typ =3D=3D 0xE0000000:
> +            arg_idx =3D (meta >> 56) & 0xFF
> +            arg_sz =3D (meta >> 48) & 0xFF
> +            ptr =3D meta & 0xFFFFFFFFFFFF
> +            events.append({
> +                "type": "entry", "seq": seq, "pc": pc,
> +                "arg_idx": arg_idx, "arg_size": arg_sz,
> +                "ptr": ptr, "fields": fields
> +            })

This looks like it could benefit from OOP.


> diff --git a/tools/kcov-dataflow/trigger.c b/tools/kcov-dataflow/trigger.=
c
> new file mode 100644
> index 000000000000..7fa7b4414770
> --- /dev/null
> +++ b/tools/kcov-dataflow/trigger.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * trigger.c - Uses /sys/kernel/debug/kcov_dataflow to capture

This code seems to partially duplicate kcov-view.py, do you need both?

> +#define COVER_SIZE (64 * 1024)  /* 64K u64 words =3D 512KB */
> +
> +static void dump_buffer(uint64_t *cover, uint64_t n)
> +{
> +       uint64_t i =3D 1;
> +
> +       printf("=3D=3D=3D KCOV Dataflow TLV Dump (%lu words) =3D=3D=3D\n"=
, n);
> +       while (i <=3D n && i < COVER_SIZE) {
> +               uint64_t hdr =3D cover[i];
> +               uint64_t type =3D hdr & 0xF0000000ULL;

Maybe we could use unions to unpack the header?
I don't mind the masks either, but please declare them as constants.


> +int main(int argc, char **argv)
> +{
> +       const char *trigger_path =3D "/proc/uaf_trigger";

I couldn't find /proc/uaf_trigger anywhere, does it belong to this series?
If trigger.c is a general-purpose tool rather than a test script, it
shouldn't depend on the test modules.





--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
