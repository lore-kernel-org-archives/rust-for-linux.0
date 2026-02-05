Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B5029E10C
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312656; cv=none; b=qeBnMlzeiqFeLQy2Qhe0MSiSiL7Z1xlblsblBpN4+lW5G/me6tUWS/SjN5hGRh0tF7s1ZxTM7deLWbsF6khlxjduB1vCbRWUCqQIiKSCXpS7ycDEz1U09Ig2hmaivXD2HJcODE/T7VI4Kg05lAqcG1swx0w0TlCkMIBwXnA9ZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312656; c=relaxed/simple;
	bh=NYMWDUPXh5i9TMfT9ZkR6S3SB3/pBsXfMit+MAuMNRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4sAveAgQpHqnaOIp++Pm0oiOpexY5/b4PV9z293T4ZIAc/2bITUv2mHMqv80VCizYgtvRGZ5GlVV9Lzx3TMsg4mp4mLVgjemqtCAJKzV1yq4KBDbKKhNdwRWO/w8dXdOuT2OVayZHZHYTJVqDZLHUOdLu3ymHaOziQPR3gHEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFC9HRX/; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFC9HRX/"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7cfd95f77a3so810955a34.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 09:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770312655; x=1770917455; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDZJl3VWBMgWhsMDZCRhkLiKo6ualtcqNRxB4YFGLLc=;
        b=QFC9HRX/htqnr8aH+n9IHj65BSHLOgfJgm3l0jPYGzvXCuzXRzAeRx1Cr7ViC61o8q
         KLxSHbII4FF17Orb7rIouw7qenh2yzDiVuvajxgzfT33HLYaCjX4obGlDkfDM6VFClvS
         RHENLEw4xJdBwhy9LZsyAeF7beFfDqktWbrW8JTQLmzSDsvCvEQxhH/1dfZPSk1HsUyn
         eQdLuKMIQSXrGVHilRxDzyat9to0yDJTGfGvNbzn9invPlvvWxiTm1U6Fb4wNZtTl1SP
         MPIQUaiQ+Vo7b6JBgg/1KciUNSLfqlGjG7SUodQDGR/SySe+M0ryyjPcOyxz2p4fpqOW
         OEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770312655; x=1770917455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDZJl3VWBMgWhsMDZCRhkLiKo6ualtcqNRxB4YFGLLc=;
        b=KsMoKz9UdLF1XRN06ZItqf1xl10GaPZNvIwnBAVZr/HuZoWZ6fT1zYGGH8UAgXs9xV
         RCnUuSXlmhvFPd0GMp5cmYY3VAQfr8GE2AwV6qSYtLlr09BaRY9ZT/5uyeoexsU3sIyV
         QvlvVV+eMGTcD787M2nslhRWEzjCbdadr3K2m+Sh8LJUyOelsv7EQUg3UpSXqtQScBIU
         sNg33q47EBevxTtOe/BaOlsJ2PJlzYIc4QEyu3hfa7cBYk3i00ovth85GfXKAaDmidrc
         v6+9SS3EPhy5DFblFfMWptsNJVjfzKbd5OuKoCVcwjheZpGUZpw4FsfMnyEt/PigqNnZ
         ClIw==
X-Forwarded-Encrypted: i=1; AJvYcCXwJffhUZTnQJGuHbH6+3XyHyIiHTsvkI/wV/WfocXln4/QOcRKHZMa0qg5Bawwufy5IZqc+y2LsMil+SNDVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAui5xRU6Tz9HcFHQAvtFYkdz6Sjxd15PKEqcL+U8xtlw6Z88s
	5ni51WWGJUTUeTtkqQEvR0nPiVGazvrtQM/DAF4EzTRxyFMPe7Bq8SgMs5mzdA==
X-Gm-Gg: AZuq6aKjWtxvjBTV+jB1HDk7Q6s095Gzvq8CelqcEM6hNGCKEbkcCXe1EuW0R9xrVY2
	2fdINhEYKheo83/0K8Whn3/hzgiZPYXLw0LJXBaJXe2bNhAnlScKuaD4ylx/cuUWEsEOyRh7TBZ
	AI32G9DmkW6a8SDn4m76f+DLtWRWwDzSl/WPQRKoWQnSPM6zsl+BhmJAy0fjHnCvHabVBYEujph
	yEXHWZzQfRsAJk9QZqz/X7clwWMbV0oTLtlwlCrdF80BgV9FIL1ye0OoemdQn2+eiMn0UW7uBTp
	ZFcfVnfBXQjP0kxn2HZi03nZW/osv8yEr9yH2Nf4ik1mtcjXgSzhJFom/IvF1/NNOwdmBjBBSkb
	JqUplROVMMAZEOs9RAdB+btVu6ObTqzx+Emqk1jKgtr6aNzrpcbv0z4xQBN4qh2wa8HGgUn9twU
	7rH8EWi3JII3JEfl9z9RgmKR2YenjnLpwynmot08wgfQ+UzNbN3DhKC2og
X-Received: by 2002:a05:6a00:39aa:b0:81a:d633:db03 with SMTP id d2e1a72fcca58-8241c6734a1mr7102468b3a.59.1770306362810;
        Thu, 05 Feb 2026 07:46:02 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8243c22f991sm733144b3a.48.2026.02.05.07.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:46:02 -0800 (PST)
Date: Thu, 5 Feb 2026 21:15:52 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYS6fdNFVSEqoRY-@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aYSgjPD5KRcNN0j4@luna>

On Thu, Feb 05, 2026 at 02:52:12PM +0100, Link Mauve wrote:
> On Thu, Feb 05, 2026 at 02:31:25AM +0530, Mukesh Kumar Chaurasiya (IBM) w=
rote:
> [=E2=80=A6]
> > diff --git a/rust/Makefile b/rust/Makefile
> > index ae22f2c5f0b3..c3961fd0d9a4 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
> >  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
> >  BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
> >  BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> > -BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> >  BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
> >  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> > =20
> > +ifdef CONFIG_PPC64
> > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +BINDGEN_TARGET_powerpc	:=3D powerpc64le-linux-gnu
> > +endif
> > +else
> > +BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > +endif
>=20
> You define BINDGEN_TARGET_powerpc after BINDGEN_TARGET has been set to
> the value of $(BINDGEN_TARGET_$(SRCARCH)), so it is empty and bindgen
> then gets passed --target=3D which makes it fail here, with this error
> message:
I am able to compile it and boot it on ppc64le qemu pseries and
powernv9 hardware.

I agree this might cause an issue. Will fix this and send out a new
revision.
> ```
> bindgen ../rust/bindings/bindings_helper.h --blocklist-type __kernel_s?si=
ze_t --blocklist-type __kernel_ptrdiff_t --opaque-type xregs_state --opaque=
-type desc_struct --opaque-type arch_lbr_state --opaque-type local_apic --o=
paque-type alt_instr --opaque-type x86_msi_data --opaque-type x86_msi_addr_=
lo --opaque-type kunit_try_catch --opaque-type spinlock --no-doc-comments -=
-blocklist-function __list_.*_report --blocklist-item ARCH_SLAB_MINALIGN --=
blocklist-item ARCH_KMALLOC_MINALIGN --with-derive-custom-struct .*=3DMaybe=
Zeroable --with-derive-custom-union .*=3DMaybeZeroable --rust-target 1.68 -=
-use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests --no-=
debug '.*' --enable-function-attribute-detection -o rust/bindings/bindings_=
generated.rs -- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc -=
I../arch/powerpc/include -I./arch/powerpc/include/generated -I../include -I=
=2E/include -I../arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
ed/uapi -I../include/uapi -I./include/generated/uapi -include ../include/li=
nux/compiler-version.h -include ../include/linux/kconfig.h -include ../incl=
ude/linux/compiler_types.h -D__KERNEL__ -mbig-endian -m32 -I ../arch/powerp=
c -fmacro-prefix-map=3D../=3D -std=3Dgnu11 -fshort-wchar -funsigned-char -f=
no-common -fno-PIE -fno-strict-aliasing -msoft-float -mcpu=3Dpowerpc -mno-p=
refixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -fno-asynchronous-unwind-=
tables -mbig-endian -fno-delete-null-pointer-checks -Os -fno-stack-protecto=
r -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fno-strict-overflow =
-fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplic=
it-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werro=
r=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addres=
s -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes=
 -Wframe-larger-than=3D1280 -Wno-main -Wno-dangling-pointer -Wvla-larger-th=
an=3D1 -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-string=
op-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init=
 -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-=
variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncatio=
n -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initialize=
rs -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno=
-sign-compare -Wno-unused-parameter -DGCC_PLUGINS -I../rust -Irust -DKBUILD=
_MODFILE=3D'"rust/bindings_generated"' -DKBUILD_BASENAME=3D'"bindings_gener=
ated"' -DKBUILD_MODNAME=3D'"bindings_generated"' -D__KBUILD_MODNAME=3Dkmod_=
bindings_generated -w --target=3D -fno-builtin -D__BINDGEN__ -DMODULE  ; se=
d -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const /g' rust/bin=
dings/bindings_generated.rs
> error: unsupported option '-mbig-endian' for target ''
> error: unsupported option '-mcpu=3D' for target ''
> error: unsupported option '-mno-prefixed' for target ''
> error: unsupported option '-mno-pcrel' for target ''
> error: unsupported option '-mno-altivec' for target ''
> error: unsupported option '-mno-vsx' for target ''
> error: unsupported option '-mno-mma' for target ''
> error: unsupported option '-mbig-endian' for target ''
> error: unknown target triple 'unknown'
> panicked at bindgen/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch
> If you encounter an error missing from this list, please file an issue or=
 a PR!
> ```
>=20
> Did this work on PPC64?
>=20
ppc64be still has some missing things from the toolchain side. For
ppc64le it does works, atleast on powernv9 hardware and pseries POWER10
qemu.
> > +
> >  # All warnings are inhibited since GCC builds are very experimental,
> >  # many GCC warnings are not supported by Clang, they may only appear in
> >  # some configurations, with new GCC versions, etc.
> > --=20
> > 2.52.0
> >=20
>=20
> With this fixed:
> Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
> Tested-by: Link Mauve <linkmauve@linkmauve.fr>
>=20
Thanks.
Regards,
Mukesh
> --=20
> Link Mauve
