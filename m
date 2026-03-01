Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D230277C81
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 23:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772408583; cv=pass; b=mRnc6B/jb9lqTOyvFS8FE6OMjmgcBW17gL1DvHZsltcLz+LKngNAB5ab6OeOWz70BmLQVvOzrxX2jKGnclfJmVPfj4Ah1u4LaWF1BUwboKIxhp+pLi/YVDAtj27iFAI1fk35E4A1iPRzXxHgD1NszbxvmtPeFhjvfYc5rH7xQf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772408583; c=relaxed/simple;
	bh=2lumFFkJ0ZwYBqoADHIq/QJZcgPn5Y+Rf9ui93BHJdQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ISKkfkPiIUKkT7sWWCot9+vAXzRazMhlwY5tvGXIV3KYfQkwRiJsMz1YnhQ0wta6voKB9RWuMb5sz8Zcva6GL2NeeDvjuyNPY98EzTPtdu2VGuEShuFhV6F7PoGq2h4xs2iNI5opIPiOJ+7d6H/VmrlnzvZLyxOSEtvBuyScbUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSxIphTe; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSxIphTe"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd801b40dbso275620eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 15:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772408582; cv=none;
        d=google.com; s=arc-20240605;
        b=QjgepF1eJkv1x84t/yAWDo//h1P3acbtCod9S9X4n7A3Mp8Ae0N9rxkOobQ5Yu/mr4
         Yi2MAiuHMo94RAr11HrXS940DdCOWggiKCDiOekK+y3dQ6Rzf1YCJctSPT/cUmGzczUi
         XEY9UA1WDPmgiS+9YFTNRV9G1PJNV/oVZbbE8kk4iNtwYbVvIIApjD0hBd5W/SouoRNJ
         uLwOc0OR+JzJixJ3mmSefK+aOBJm0vfLUb0JNIIEroLZ+EVDL+xlszB8Kw6vnbw6G4XC
         B0z06xYGRZS/0KEMLVfc2pNDh/JoyGOC4WQ5KWtVdBcDkqr7/ih6iWUyD10vj5ipSVGB
         jmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        fh=tmfH/sSV9PEXTJLPsBEV9vUJMyQUJi+D3Y3O7+N9qJI=;
        b=P0tH9WPZN5wDZIhFGzD4Jp26T9locOrwILw85VXV04+s8ZHskJev+Wd7RK/ZmewqwD
         cdRvE4/hLrcWWd25scsXZupXM+rXmjCe0mUnhADTLpRqnCu0Dfsi6AHdAPCKbqZJk4x0
         qSn5GrHZjB1x+18pxCT/a24Wv2oVf0MXVsrGdHUxqfRzFSa3hLQYbvfL+qOmlKBJsG45
         yUv3Qp5Zk1r04T4UzeErX6qW4kjLmO7evtBVndvea87bc6e8LUAPCql2fkN3seNRgtGp
         eQa7GZvUIedYI2emmibwJxiGJ2v6mmDojj87WyGr0n+5WIwuNjQJxqwFx8SV71QSNj5n
         u/aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772408582; x=1773013382; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        b=SSxIphTefol9WABAYVSZbDyD826ghUxpCNKkpnVrGue96jXXxYYk9jg4mLL1eQSxXi
         jgsE0R3opdRvXBX1yX4tPTILtHDMqYC5IS7XiklsgmrSuATHJthHKWzxwoVKultWNeyZ
         q817mI45RrqHPLJ8RlBtLbuxNTTa1TJU6cUbLTRiDAK9ELRN2IFezhjoj1S0gUI1XGSt
         LihLcir3/+WKYXBkfBndwFOf37bnoYkt0Ng6ec5R3G9D8YT9HU3C16EfNHap+eA2CTXe
         FDjQQHlq31nTr6yTcJKpAkHGxoSLlrvltPSTnHHeDc9e0tGQNUQQTpZXFXysimF51Nm6
         QV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772408582; x=1773013382;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        b=wM+1IokbMcSIaRaN/pX7L48jJURRkBW+YVjKaocP6SRih0gsXE0u0Snj8VhSGdtC1K
         BCTps7bpeCPUllXbfSXkDQkdImcU8n4HwlJDBvN/KBjhbh/c2FBkf3F0KqwoNo3tQ2Sg
         Vif6c5ZS0UmjEEF6Bl4fhNmhJst36VE/tv4lU100AfFNumNH+9fY9QYqLkb4ynNMRyad
         OglW4wOCrCakl1UZQKS/LL9kUwOBtnNUe+skGJ/qlpf5h5YPkpv8mxsjybWDlDW26ijG
         rtdAwedlr8G8I3G2Hv5ISx5ci+6XrrlR8C2ubDDiVo3sA1oG5PpEYuEMxuDUeGu0WZim
         ojUg==
X-Forwarded-Encrypted: i=1; AJvYcCWaB1da6SwWfijt1VG2qMLTCZUjtS5QF4qkFvaH5JWYL8OPiSOXORUPpSNKBa9ZMlkJcDrn4ab8BIlqHYe0nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsBAiDLRAbcJvptUIliThxKUcAGZm2g6mibZ988WDG3F2J7dmn
	hhkWzeKXIqlb2Jva/Qll1uM+VJ/yiJRXASoqsN6oXEuaUfKkzB1dPLlu4cG03z7HGwMq6srRivc
	JJeoTxueD12WHQpSdctJYg8VnD/EIyimyhtKKC1E=
X-Gm-Gg: ATEYQzy1HaxJDcOtt0Co8VaBGXoXHc/9lygY9C0ILjrlm+DxIGuYgcql+BE2vxq0sed
	ThYPmyOBhemOjqvY2A4vGS561mHV2tyDTjR+luy+Niu+b0pImTfRW9oDzKrEzZge2I7QyZGfA5t
	qUm21PXkLkgBV0aSf5PPSp3z6OT8l3Lno/wCtJ+MnP4eIvdMhnwjBRFydYky8It9mB+RQ6xJ53m
	w7RHoWGz7FUcTL5QfX/cd2QlYIwGL2WkEWcsv2xdlblUFjo3egF1XBtG8cZ8Ao8JcGumjJUiyNg
	gVN+UlkJrwSqrnwHGtx9vxffSCdZo60Cq1VZmyC3zKvacHgwi1GgX0/Kn44v0t9rbXsJt+je00r
	7e4/rjFJlqJ2WaGXeG4JcwTWBHnPR
X-Received: by 2002:a05:693c:2c8f:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2be171c2ccdmr15106eec.7.1772408581518; Sun, 01 Mar 2026
 15:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Mar 2026 00:42:49 +0100
X-Gm-Features: AaiRm52fTXrGz5PlTORiyphpsPMjHdsF2ymu7kB9CFR5ioFaHp3gh72XIk80BjI
Message-ID: <CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
Subject: loongarch64 objtool warning with LLVM 18 in Rust object file
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Nouveau Dev <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Hi objtool & loongarch,

I noticed an objtool warning in a Rust object file for loongarch64 in mainline:

drivers/gpu/nova-core/nova_core.o: warning: objtool:
_RNvMs1_NtNtCs3LxSlPxFOnk_9nova_core3gsp4cmdqNtB5_4Cmdq3new+0x238:
return with modified stack frame

From a quick test, I saw it happened only with older upstream Rust
binaries (1.78.0 to 1.81.0), so I suspected a switch of major LLVM
version, and indeed with 1.82.0 LLVM 19 is used instead of LLVM 18.

With LLVM 18 I get:

    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -112
    ...
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret

While with LLVM 19 I get:

    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    lu12i.w         $a2, 1
    ori             $a2, $a2, 0x870
    sub.d           $sp, $sp, $a2
    ...
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret

So I suspect the stack pointer is not getting tracked properly and
thus the mismatch. Is it a known limitation for `objtool` on
loongarch64?

It is a very big frame, so I guess maybe it is not even expected to
have to deal with such a case to begin with.

I think we likely want to avoid that big stack size to begin with
anyway (Cc Danilo and Alexandre).

I am copying the full disassembly of the symbol in the case it
triggers the warning below.

Thanks!

Cheers,
Miguel

[1]

<<nova_core::gsp::cmdq::Cmdq>::new>:
    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -112
    move            $s1, $a1
    move            $fp, $a0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.d            $zero, $a0, 0
    lu12i.w         $a1, 129
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $s5, $sp, $a0
    li.w            $a3, 0xdc0
    move            $a0, $s1
    move            $a2, $s5
    move            $a4, $zero
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x6c>
            R_LARCH_B26    dma_alloc_attrs
    beqz            $a0, 352    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1d0>
    move            $s0, $a0
    move            $a0, $s1
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x7c>
            R_LARCH_B26
<kernel::sync::aref::ARef<kernel::device::Device> as
core::convert::From<&kernel::device::Device<kernel::device::Bound>>>::from
    move            $s2, $a0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.d            $s3, $a0, 0
    lu12i.w         $s4, 1
    move            $a0, $s5
    move            $a1, $zero
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xa4>
            R_LARCH_B26    memset
    lu12i.w         $a0, 512
    move            $a1, $zero
    add.d           $a2, $s3, $a1
    bltu            $a2, $s3, 292    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1d8>
    st.d            $a2, $s5, 0
    add.d           $a1, $a1, $s4
    addi.d          $s5, $s5, 8
    bne             $a1, $a0, -20    # <<nova_core::gsp::cmdq::Cmdq>::new+0xb0>
    addi.d          $s5, $sp, 32
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a1, $sp, $a0
    move            $a0, $s5
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xe0>
            R_LARCH_B26    memcpy
    move            $a0, $s0
    move            $a1, $s5
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xf0>
            R_LARCH_B26    memcpy
    lu12i.w         $a0, 64
    st.w            $a0, $sp, 32
    li.w            $a0, 0x3f
    st.w            $a0, $sp, 24
    li.w            $a0, 0x20
    st.w            $a0, $sp, 12
    st.w            $s4, $sp, 28
    st.w            $s4, $sp, 8
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.w            $zero, $a0, 0
    st.w            $zero, $sp, 20
    li.w            $s4, 0x1
    st.w            $s4, $sp, 16
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.w            $a0, $a0, 0
    stptr.w         $a0, $s0, 4096
    ld.w            $a0, $sp, 32
    stptr.w         $a0, $s0, 4100
    ld.w            $a0, $sp, 28
    stptr.w         $a0, $s0, 4104
    ld.w            $a0, $sp, 24
    stptr.w         $a0, $s0, 4108
    ld.w            $a0, $sp, 20
    stptr.w         $a0, $s0, 4112
    ld.w            $a0, $sp, 16
    stptr.w         $a0, $s0, 4116
    ld.w            $a0, $sp, 12
    stptr.w         $a0, $s0, 4120
    ld.w            $a0, $sp, 8
    stptr.w         $a0, $s0, 4124
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.w            $zero, $a0, 0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.w            $a0, $a0, 0
    stptr.w         $a0, $s0, 4128
    move            $a0, $s1
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1a4>
            R_LARCH_B26
<kernel::sync::aref::ARef<kernel::device::Device> as
core::convert::From<&kernel::device::Device<kernel::device::Bound>>>::from
    st.w            $zero, $fp, 48
    st.w            $zero, $fp, 40
    st.d            $s4, $fp, 32
    st.d            $s3, $fp, 24
    srli.d          $a1, $s0, 0x20
    st.w            $a1, $fp, 20
    st.w            $s0, $fp, 16
    st.d            $s2, $fp, 8
    st.d            $a0, $fp, 0
    b               60    # <<nova_core::gsp::cmdq::Cmdq>::new+0x208>
    li.w            $a0, -12
    b               40    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1fc>
    lu12i.w         $a1, 129
    move            $a0, $s2
    move            $a2, $s0
    move            $a3, $s3
    move            $a4, $zero
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1ec>
            R_LARCH_B26    dma_free_attrs
    move            $a0, $s2
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1f4>
            R_LARCH_B26    <kernel::device::Device as
kernel::sync::aref::AlwaysRefCounted>::dec_ref
    li.w            $a0, -75
    lu32i.d         $a0, 0
    st.d            $zero, $fp, 0
    st.w            $a0, $fp, 8
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret
    nop
