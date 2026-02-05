Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BB3D7D61;
	Thu,  5 Feb 2026 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299536; cv=none; b=I67sRhh1Icl/UEtna3cmA7l2rc9F2UIUeaPvHcQntg/7hCFCCaowVbELnq6bnSH/owUnSKv8kV2A4a6L7+WME8Gcs44Czs8rZYhoktybMu/ZpAyRbi3DWh09raQuX/Z9PYBl8qZd8jj/CnPRYRDd2JXfvhvodiAKAYul99aPRfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299536; c=relaxed/simple;
	bh=MJ/TtpdG4VddUlMl0YuIgDO/2eHcxYluLB3WdoCuIf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLZ0+TaFU7Sq2Cay/DyOsDNMFoACOVEIjWjiGSILkg9I1EZoM2a6Bq5XmL7M33iFVUlHK1cEkveuHYoalobPO4grTvimDdhz5bA6RvRRngyxZ3ePmjM3WEdyIr2v/excPJmiGJd7fv5gk4BEmSqHf7IAPnIOXadJAYXlA3CAgzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 92A26F43990; Thu, 05 Feb 2026 14:52:12 +0100 (CET)
Date: Thu, 5 Feb 2026 14:52:12 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	rostedt@goodmis.org, ardb@kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYSgjPD5KRcNN0j4@luna>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260204210125.613350-4-mkchauras@gmail.com>
Jabber-ID: linkmauve@linkmauve.fr

On Thu, Feb 05, 2026 at 02:31:25AM +0530, Mukesh Kumar Chaurasiya (IBM) wro=
te:
[=E2=80=A6]
> diff --git a/rust/Makefile b/rust/Makefile
> index ae22f2c5f0b3..c3961fd0d9a4 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> -BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
>  BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> =20
> +ifdef CONFIG_PPC64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +BINDGEN_TARGET_powerpc	:=3D powerpc64le-linux-gnu
> +endif
> +else
> +BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> +endif

You define BINDGEN_TARGET_powerpc after BINDGEN_TARGET has been set to
the value of $(BINDGEN_TARGET_$(SRCARCH)), so it is empty and bindgen
then gets passed --target=3D which makes it fail here, with this error
message:
```
bindgen ../rust/bindings/bindings_helper.h --blocklist-type __kernel_s?size=
_t --blocklist-type __kernel_ptrdiff_t --opaque-type xregs_state --opaque-t=
ype desc_struct --opaque-type arch_lbr_state --opaque-type local_apic --opa=
que-type alt_instr --opaque-type x86_msi_data --opaque-type x86_msi_addr_lo=
 --opaque-type kunit_try_catch --opaque-type spinlock --no-doc-comments --b=
locklist-function __list_.*_report --blocklist-item ARCH_SLAB_MINALIGN --bl=
ocklist-item ARCH_KMALLOC_MINALIGN --with-derive-custom-struct .*=3DMaybeZe=
roable --with-derive-custom-union .*=3DMaybeZeroable --rust-target 1.68 --u=
se-core --with-derive-default --ctypes-prefix ffi --no-layout-tests --no-de=
bug '.*' --enable-function-attribute-detection -o rust/bindings/bindings_ge=
nerated.rs -- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc -I.=
=2E/arch/powerpc/include -I./arch/powerpc/include/generated -I../include -I=
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
error: unsupported option '-mbig-endian' for target ''
error: unsupported option '-mcpu=3D' for target ''
error: unsupported option '-mno-prefixed' for target ''
error: unsupported option '-mno-pcrel' for target ''
error: unsupported option '-mno-altivec' for target ''
error: unsupported option '-mno-vsx' for target ''
error: unsupported option '-mno-mma' for target ''
error: unsupported option '-mbig-endian' for target ''
error: unknown target triple 'unknown'
panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch
If you encounter an error missing from this list, please file an issue or a=
 PR!
```

Did this work on PPC64?

> +
>  # All warnings are inhibited since GCC builds are very experimental,
>  # many GCC warnings are not supported by Clang, they may only appear in
>  # some configurations, with new GCC versions, etc.
> --=20
> 2.52.0
>=20

With this fixed:
Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>

--=20
Link Mauve
