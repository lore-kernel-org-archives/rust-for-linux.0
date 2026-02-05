Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35D919B5A3
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312437; cv=none; b=t/dENwkhmUyu8HIOmESoLFj5f98ihsfk1Oy7N6J43S/bqgthriT3+0H6CctzDlGxYwG/xY5KEYQb5mKUahKFZ+q6/0yzrF8f0xLa2lvVfPzZglKO3kjPvLDUMQ0syhBRxhwn1SsnnFCrxf6n544xsn2EdlkswAegQLUqLqxjzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312437; c=relaxed/simple;
	bh=izqBODmFAviQ2NKnu7VQeTedhjow1AWYd4vTKWMTCsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBALAWQafpQBGMdhH+XXbRk0mmj2qNe0C5blOg992/HqSYYcbl+bMtqj+X21COSqPrtzIgAJ5pau0rWoTMZ8/s3xjPPaBJS2AlQNF3d3+5ffYjITQ6xy3vr2Op93htYJd+9rVAWizGVG9QjnXaTOnHPDyMXFEfYH8nsTQTfVH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWAj4F6Z; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWAj4F6Z"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-11f1fb91996so771747c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 09:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770312436; x=1770917236; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tx7GpESeBXhVOZe1lCiVB4TdYsATVnhqG/m2mu3LDKs=;
        b=AWAj4F6Zn6uO6xukkccIDiJkfct85hUst3Dvuw/+XH5DDPK5zMHlwsrGZ/+UabVDQH
         LeEkHhhsoEkIIgiBuuEfBACHT2RKL+TFM7QGsmhhFo8TNeuFDJw0GBohCuA6z/7H8weG
         3lb5Cl9mtn1jOwIPj+0G2cuXUWfCfNWT8hwTsRyZzHOFcoIcMNk++w5QDkszEB5lO8fU
         xOm+ahwrppr2xDotsVyBkaXVj42z+5HWxrqdQ498jtbzoJIH/+dAlfrjtlyGWcy5q5tl
         7wwU+S23mLkC49pjLEwl1VUf72RAo4qH4ozg6fvhS5WF9EfnZ/rVRNZWzdsIlgAvXbNW
         /FHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770312436; x=1770917236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx7GpESeBXhVOZe1lCiVB4TdYsATVnhqG/m2mu3LDKs=;
        b=Zr1Ti3sfFvHjUg5p1Vo95Rn7e8PKxXGZ1LKQ0Afg3kahpZLfDa4PcHYcR+buVNd9t2
         w+/IvoQVWs8zveGb1xex4ocBe9KlImTel2aZW8ClvplhV1XrZP1m8POAgeXVzluB3OGI
         GRjqlkaNcr7v5dz8J054hCG4I44bqZ2ZybQDObrhOaVxdTuTsciit3Ff8mqh6GTnUq9H
         /zCeF/pEwPCKvxZwyQsquYpuoF7cmqrJBznQPZez9ZRbHz3bNWvGvIHDcqwmSCHBvAoP
         O4eNSQtfQ4XdKicV+7TXJt1pdCDA6HTNIJ0Zanxsy91F2dNKGvqB4M5nOk3PUczWeO+x
         pUkg==
X-Forwarded-Encrypted: i=1; AJvYcCWp6sZ2XqNVG9rma7px+RJjtmAf4jC6je2iSagYVBu5U66OOxD1eU3ZjDzEMwZQDh79kMfEq2I1Ov47+IWq9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gZYxhgr0ilNgWtf9EZQC6m+qUosuh8u3aIjgfcsZj+/zkirZ
	559kVoIU4UFsJcdr67dQKB74et8+2LhsTLi53c1Cnrm8R1nbkfVk4nLjoy2K7Q==
X-Gm-Gg: AZuq6aI5Z7xvYqJMucu9jlSCWNuQ9rO+4YSuTWBgBmVKVqHi8soLInYXvfB6W9Y/HQ1
	/9vul0j6S0E7JlyOCgZzyEOVEmc0p2D2eWuSGJVk+N5kaDw8JGxUZd9srsAQhT6yL6U8k/4NM4Z
	FASgyISmSSIZGHSe62B5nWcy/doFfRaGLQ7G3EAyYdHagnvTvP4zTRy97c29W44yca5gqf4COlN
	ZuieyYraIunRTAVVek67DZVC1eWRIgXa+sWJMeOocz6n01PM0HPMPPMNfbn5DJgfJETcZ7BkAo9
	ItEnYB/Xm7nFU7xa6YfYTbMrrj6aE/Wmt4g9yxQ8yrAKq1aSqYvsIRJK2g1AlaHI0W3I8UzXPhz
	ibK+TGl5Gak/q5mER0QFQ0OdDXsTOr9rYJO0pYqVvu6HnrbI5D9Hii5z1t/GnXnWf3oWQfeHRBC
	URWPLEtsRqu9L9kN7NXyV8chmN703cE6kMsgBUmu5N5dTcEsZM2PBFaYO/
X-Received: by 2002:a17:90b:2f90:b0:352:f2a6:334 with SMTP id 98e67ed59e1d1-35487102a6bmr6730739a91.16.1770306131994;
        Thu, 05 Feb 2026 07:42:11 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933898388sm74985365ad.34.2026.02.05.07.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:42:11 -0800 (PST)
Date: Thu, 5 Feb 2026 21:12:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
 <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>

On Thu, Feb 05, 2026 at 08:21:31PM +0530, Venkat Rao Bagalkote wrote:
>=20
> On 05/02/26 7:22 pm, Link Mauve wrote:
> > On Thu, Feb 05, 2026 at 02:31:25AM +0530, Mukesh Kumar Chaurasiya (IBM)=
 wrote:
> > [=E2=80=A6]
> > > diff --git a/rust/Makefile b/rust/Makefile
> > > index ae22f2c5f0b3..c3961fd0d9a4 100644
> > > --- a/rust/Makefile
> > > +++ b/rust/Makefile
> > > @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
> > >   BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
> > >   BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
> > >   BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> > > -BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > >   BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
> > >   BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> > > +ifdef CONFIG_PPC64
> > > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > > +BINDGEN_TARGET_powerpc	:=3D powerpc64le-linux-gnu
> > > +endif
> > > +else
> > > +BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > > +endif
> > You define BINDGEN_TARGET_powerpc after BINDGEN_TARGET has been set to
> > the value of $(BINDGEN_TARGET_$(SRCARCH)), so it is empty and bindgen
> > then gets passed --target=3D which makes it fail here, with this error
> > message:
> > ```
> > bindgen ../rust/bindings/bindings_helper.h --blocklist-type __kernel_s?=
size_t --blocklist-type __kernel_ptrdiff_t --opaque-type xregs_state --opaq=
ue-type desc_struct --opaque-type arch_lbr_state --opaque-type local_apic -=
-opaque-type alt_instr --opaque-type x86_msi_data --opaque-type x86_msi_add=
r_lo --opaque-type kunit_try_catch --opaque-type spinlock --no-doc-comments=
 --blocklist-function __list_.*_report --blocklist-item ARCH_SLAB_MINALIGN =
--blocklist-item ARCH_KMALLOC_MINALIGN --with-derive-custom-struct .*=3DMay=
beZeroable --with-derive-custom-union .*=3DMaybeZeroable --rust-target 1.68=
 --use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests --n=
o-debug '.*' --enable-function-attribute-detection -o rust/bindings/binding=
s_generated.rs -- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc=
 -I../arch/powerpc/include -I./arch/powerpc/include/generated -I../include =
-I./include -I../arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
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
> > error: unsupported option '-mbig-endian' for target ''
> > error: unsupported option '-mcpu=3D' for target ''
> > error: unsupported option '-mno-prefixed' for target ''
> > error: unsupported option '-mno-pcrel' for target ''
> > error: unsupported option '-mno-altivec' for target ''
> > error: unsupported option '-mno-vsx' for target ''
> > error: unsupported option '-mno-mma' for target ''
> > error: unsupported option '-mbig-endian' for target ''
> > error: unknown target triple 'unknown'
> > panicked at bindgen/ir/context.rs:562:15:
> > libclang error; possible causes include:
> > - Invalid flag syntax
> > - Unrecognized flags
> > - Invalid flag arguments
> > - File I/O errors
> > - Host vs. target architecture mismatch
> > If you encounter an error missing from this list, please file an issue =
or a PR!
> > ```
> >=20
> > Did this work on PPC64?
>=20
> On ppc64le, I am not able to get a successful Rust=E2=80=91enabled build =
yet.
> I am consistently hitting bindgen/libclang failures during the prepare
> phase.
>=20
>=20
> Build Failures:
>=20
> error: unsupported option '-mlong-double-128' for target 'unknown'
> error: unsupported argument 'medium' to option '-mcmodel=3D' for target
> 'unknown'
> error: unknown target triple 'unknown'
> panicked at bindgen-0.72.1/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch
>=20
> make[2]: *** [rust/Makefile:468: rust/bindings/bindings_generated.rs] Err=
or
> 101
> make[2]: *** Deleting file 'rust/bindings/bindings_generated.rs'
>=20
> make[2]: *** [rust/Makefile:488:
> rust/bindings/bindings_helpers_generated.rs] Error 101
> make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
>=20
> make[2]: *** [rust/Makefile:474: rust/uapi/uapi_generated.rs] Error 101
> make[2]: *** Deleting file 'rust/uapi/uapi_generated.rs'
>=20
> make[2]: *** [rust/Makefile:643: rust/core.o] Error 1
> make[1]: *** [/root/linux/Makefile:1320: prepare] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>=20
>=20
> Regards,
>=20
> Venkat.
>=20
hey,

use rust version nightly-2026-01-28

the latest one has some issue. I just raised a bug for the rustc
here[1].

[1] https://github.com/rust-lang/rust/issues/152177

Regards,
Mukesh

> > > +
> > >   # All warnings are inhibited since GCC builds are very experimental,
> > >   # many GCC warnings are not supported by Clang, they may only appea=
r in
> > >   # some configurations, with new GCC versions, etc.
> > > --=20
> > > 2.52.0
> > >=20
> > With this fixed:
> > Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
> > Tested-by: Link Mauve <linkmauve@linkmauve.fr>
> >=20
