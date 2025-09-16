Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF10428CF42
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758013365; cv=none; b=WUtZcFukvWEoff515KEmadwpI43sRa8CDDfqp2Bnb2QrWTdWGK3HkZZgJKMcj6RNgyAruAAYBcv+LIT2w+Nx+tY6DzRVadx6fYRajlhzJ5jneychHieUTStbnx/RKM3IfdgCA8I7Lqs8W76zKMIYPZfE0CZJqDcsyBvfaMm/Ke4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758013365; c=relaxed/simple;
	bh=iyOGR5OjdcJcruEoDj50e0N6pXuQVeGejPadiPYFKV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hv4Hb5bAVDFA7sAUnf4tuKceIIZjTsRUVEjjYsSMepw1/axTe4t2BUY+m4vf97P9VRVIO0wdWd9Ly+vtutXJ3zSEPE8unwp+BRp2ATQWI4gzbQ4GwtWhaube5To/1jG3CZlst7Id1YKQlaFMC5TgmdB+Ru+P6bBOAVGoWtATLEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.219.179])
	by gateway (Coremail) with SMTP id _____8BxF9GtJ8loLOEKAA--.23163S3;
	Tue, 16 Sep 2025 17:02:38 +0800 (CST)
Received: from mail-yb1-f179.google.com (unknown [209.85.219.179])
	by front1 (Coremail) with SMTP id qMiowJAxT+amJ8loswyZAA--.27739S3;
	Tue, 16 Sep 2025 17:02:34 +0800 (CST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ea5aa2fdac8so459158276.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 02:02:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6VIZjfP2Z+nUnwYEDVrwXjZieX6W80cgSFa9/aHIYm/9n6/H9cxUYr/7KbYHU6JzGUaVome7EJvuY0JTU2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL50YVuhwTbpr5EArktbb01Bn5ESoa/kKoCxnh/NNoqJtyJXGh
	9FyzJTFdWfhGXaBcPl2JSZ8NDCeciyZ5YnslFGPOX7W1VBpue2LLZUWnypiJS9QeDjLoRE6mpmH
	JF0Z8SykOBorXEccnyTZSzho7Dqd0gINIjioOlh67ow==
X-Google-Smtp-Source: AGHT+IGGHRxmXOWaJAAygIfBjG9V73Ij3pe802twnw9XNH3Zr+pFQkBur6uu/hjKgXPTVwuAsWHJdWtS4p+VNQ5WHRw=
X-Received: by 2002:a05:6902:124e:b0:ea5:ae89:4468 with SMTP id
 3f1490d57ef6-ea5ae895b6emr817879276.41.1758013349641; Tue, 16 Sep 2025
 02:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916061117.32315-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250916061117.32315-1-yangtiezhu@loongson.cn>
From: WANG Rui <wangrui@loongson.cn>
Date: Tue, 16 Sep 2025 17:02:19 +0800
X-Gmail-Original-Message-ID: <CAHirt9jbY4yX84Kfzax71rCvPY--SQpDKrjqWsDCHMVnuUuD0g@mail.gmail.com>
X-Gm-Features: AS18NWBxdv3kvW4jqwIz5er8Ma5qQhQbAuQvQ8nyLqYfZsUPrt-rPn9UxPQ1rPo
Message-ID: <CAHirt9jbY4yX84Kfzax71rCvPY--SQpDKrjqWsDCHMVnuUuD0g@mail.gmail.com>
Subject: Re: [PATCH v1] objtool/LoongArch: Mark special atomic instruction as
 INSN_BUG type
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	rust-for-linux@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qMiowJAxT+amJ8loswyZAA--.27739S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF4rJw1rWryDWw15WrykWFX_yoWrWr13pa
	1DZ3s8Gr48Wrn3KwnrJ3yUurW3trs3WrWIgFnxG3s2krWaqr97XF1kKry0yFn5Jw4rKFyI
	9rn5Zw17uF1jyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZF
	pf9x07jbPEfUUUUU=

On Tue, Sep 16, 2025 at 2:11=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When compiling with LLVM and CONFIG_RUST is set, there exists the
> following objtool warning:
>
>   rust/compiler_builtins.o: warning: objtool: __rust__unordsf2(): unexpec=
ted end of section .text.unlikely.
>
> objdump shows that the end of section .text.unlikely is a atomic
> instruction:
>
>   amswap.w        $zero, $ra, $zero
>
> According to the LoongArch Reference Manual, if the amswap.w atomic
> memory access instruction has the same register number as rd and rj,
> the execution will trigger an Instruction Non-defined Exception, so
> mark the above instruction as INSN_BUG type to fix the warning.

LLVM lowers `llvm.trap()` to `amswap.w R0, R1, R0`. For x86, it lowers
to `ud2`, and objtool marks it as INSN_BUG.

https://github.com/llvm/llvm-project/blob/788a25a0f71bfa5e5e1c12ad093993b11=
5d10e7a/llvm/lib/Target/LoongArch/LoongArchInstrInfo.td#L1376-L1381

LLVM and GCC handle this differently, GCC lowers it to a break
instruction. Since the break instruction has other uses, can objtool
mark all break instructions as INSN_BUG? or it should mark different
types based on the break immediate code.

https://github.com/torvalds/linux/blob/46a51f4f5edade43ba66b3c151f0e25ec8b6=
9cb6/tools/objtool/arch/loongarch/decode.c#L315-L317

>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  tools/arch/loongarch/include/asm/inst.h | 12 ++++++++++++
>  tools/objtool/arch/loongarch/decode.c   | 21 +++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/tools/arch/loongarch/include/asm/inst.h b/tools/arch/loongar=
ch/include/asm/inst.h
> index c25b5853181d..d68fad63c8b7 100644
> --- a/tools/arch/loongarch/include/asm/inst.h
> +++ b/tools/arch/loongarch/include/asm/inst.h
> @@ -51,6 +51,10 @@ enum reg2i16_op {
>         bgeu_op         =3D 0x1b,
>  };
>
> +enum reg3_op {
> +       amswapw_op      =3D 0x70c0,
> +};
> +
>  struct reg0i15_format {
>         unsigned int immediate : 15;
>         unsigned int opcode : 17;
> @@ -96,6 +100,13 @@ struct reg2i16_format {
>         unsigned int opcode : 6;
>  };
>
> +struct reg3_format {
> +       unsigned int rd : 5;
> +       unsigned int rj : 5;
> +       unsigned int rk : 5;
> +       unsigned int opcode : 17;
> +};
> +
>  union loongarch_instruction {
>         unsigned int word;
>         struct reg0i15_format   reg0i15_format;
> @@ -105,6 +116,7 @@ union loongarch_instruction {
>         struct reg2i12_format   reg2i12_format;
>         struct reg2i14_format   reg2i14_format;
>         struct reg2i16_format   reg2i16_format;
> +       struct reg3_format      reg3_format;
>  };
>
>  #define LOONGARCH_INSN_SIZE    sizeof(union loongarch_instruction)
> diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/l=
oongarch/decode.c
> index b6fdc68053cc..707f339b1840 100644
> --- a/tools/objtool/arch/loongarch/decode.c
> +++ b/tools/objtool/arch/loongarch/decode.c
> @@ -278,6 +278,25 @@ static bool decode_insn_reg2i16_fomat(union loongarc=
h_instruction inst,
>         return true;
>  }
>
> +static bool decode_insn_reg3_fomat(union loongarch_instruction inst,
> +                                  struct instruction *insn)
> +{
> +       switch (inst.reg3_format.opcode) {
> +       case amswapw_op:
> +               if (inst.reg3_format.rd =3D=3D LOONGARCH_GPR_ZERO &&
> +                   inst.reg3_format.rk =3D=3D LOONGARCH_GPR_RA &&
> +                   inst.reg3_format.rj =3D=3D LOONGARCH_GPR_ZERO) {
> +                       /* amswap.w $zero, $ra, $zero */
> +                       insn->type =3D INSN_BUG;
> +               }
> +               break;
> +       default:
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
>  int arch_decode_instruction(struct objtool_file *file, const struct sect=
ion *sec,
>                             unsigned long offset, unsigned int maxlen,
>                             struct instruction *insn)
> @@ -309,6 +328,8 @@ int arch_decode_instruction(struct objtool_file *file=
, const struct section *sec
>                 return 0;
>         if (decode_insn_reg2i16_fomat(inst, insn))
>                 return 0;
> +       if (decode_insn_reg3_fomat(inst, insn))
> +               return 0;
>
>         if (inst.word =3D=3D 0)
>                 insn->type =3D INSN_NOP;
> --
> 2.42.0
>
>

