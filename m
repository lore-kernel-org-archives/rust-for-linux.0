Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084555;
	b=wVVEM8g5i+cQQ0HDlnJ/Xrp1T4nhtG5Wye2O9is40QeXYxn8PxL1jEQY+M27mlgGTHte
	 UXOiQQ1P/RKoF93pMRbY5HZKTgVhHtObZqsGcXI+IzAX0Zfpl59mMIX+RElgDKWSt8/EW
	 wvmMnvBpuF6XGEGp7YRPS/WQVH25bmXjZdt8AtyrEPLRYQ1ORYEg7rAdxHVTwVrtSxiD6
	 /wlvCCjNygt8hRlhmRWK/zEi9MDOiaVXVE/KHZDxEf3plLapIjhFq5zS7W2uDWewet51X
	 fV2Mf3p23zXoiCkFVIxEVq/At0G1GISHE0SZGEVB5r0x0HaG166LYzhBouwQjyp6GCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
	b=1utWXNtOMDTNf7JNJpL4QyE7gSc/O77Q9vt9czMlcaZ3VKd/8ROaHyCvgTXfCgPOGO3U
	 m53XWL8SNx8EQVuWDLAWkmDMm0pmKFGu5KfXl4wFXoIBgEGRATsKU/GA2u4DgzHxGmPs6
	 K8wWXP2Om6T3Bo+ItU/xD/LX43B0qf2Jgq+sVDXQMgjfHGEoBnrKPZXc9g8LquBcmD/4w
	 EFhQ+Dnop2j2WbJEJGbWe0eytJQ8mLc23ghApzWFOevrpG1n0xZpQ5MrAq1o9wsEyI+Oj
	 ECgfBDkuYL/gS7qD924mAwLCbx5jzcNtXc9yGXh0XIRYPeHa8EHP8lxMBS09wJfoG5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndNtRwto;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57957606A320
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57957606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndNtRwto
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so105506e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 02:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084553; cv=none;
        d=google.com; s=arc-20260327;
        b=abowmlddEdRjuHec5H+dZaMKXFT0OXnq3i3NFqn0ANxCYOXnc8fxbcbtDWJAJ3YWPU
         z/LwCgScya9dZYL365mFwez9UNszeamvx/p8suGMH/efmYHQjvdvSSCym9McckbU8YIT
         DZ2gl8gPCZ1SZb6uF4IC7tt1ySjujpAEHRRySAbnkdq05xfTJR6uM10qifx0vlV3dC6x
         1XQT2iiu1rbcdZRLGtCnewGptJW1iRFLHG59RJp2/F/nsEjsW5MjWvQhUNaCQvxDOdfv
         POIqj9qNePJjUbOJpMJv7qS+DONah9PmQx1LNxx2zmLyy8JCxZI1UgMpTbqK6Dix5XIi
         NXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        fh=H4665ZmD2hGzULjIL71GR7wBKDBD5sbQuhOudWHZJ8M=;
        b=kgowExlQvzKP0DmW+uF9JoU8YSBnumN0LVhelCJCea0hOdudklI6zb3E5IwqQJy91P
         crQ4/ZRQZVPWKs4Pqw3+Ma/UYyEF+TOi17tufmCbQVphUrmscemvPUemjQg6xfZAI8Eo
         6N1WlwFCBQY+2m/dfJJz88xReFXjr3WNdcs1Ige1lq/CvlmUinZF3c5o/rwJ1veXp47Y
         eiFDzvRVsSxj1cwC9rJ91F+JuPQdAwIlK5pQOlReTiXs6Ob21bDvc0fi4ZUi6rB9XfQg
         ifSwVadPxucvX7oxy7pZqLZoBWeDMFgUitLBziD4MgQkxvL1Svr9h8JvGVj774p9NEwj
         TBqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084553; x=1795689353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        b=ndNtRwtomifqkf55G94YIgPKmDQUiD1m8EZ0+rvEQ5fkWplEwCT3vrhuUg0TybVOFc
         FDFhMom0dL9XIOE8MwORLs3b0sX2v1NcddjdZy61EQI1R+b+77xyN7bQMdYLzPEQcUeA
         GbHDXy1p6acrSdRhEeh5KCPm/a0R4nREHWcqmHYS8rggx0IEtnl3xzZFq5mo4la95cxg
         09VZAgLtvaU3CWng6N+vH0dxl16QWS9xS+ATMjZZiov4ZKGz0nw8A1UYvZFV/N5To0mT
         6wEpigqmx+96yWAIwqBmSPS7X2ChmDnmqaLIJXgL1SspyBHFL96vSQveV7KWzfymuCZ2
         BJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084553; x=1795689353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        b=o7owSFdtcAtNeS75jTSGwcQyeO6PORKB8ZeWy2OPLEAiOom4TPI3K4gcIm5e3zi8Jc
         0ScQFIWvTppsO3VrRm7yVC9tPYopryQx8vO0ZjhhmVTzj0IZVX4y9YOAxuAVs85lVz+N
         Rz68Pe5V1Bt9GkudjrJBIsjeKp3XBrE1wLEoIJLjKSKzECMnKeLryaUUF1LYM5SeaqKj
         ueumm805rND6vT4qI2k4eBVOtJIArh+2xEkUW1w3vwtBilLCNUUWmDjqYjT1G2mzvj/g
         ITbeOdKrYrGMorszL69MlPGJLYuCgErS+VTwB8IuGXIJu1RMDW0pj+jkSeKaAWTwcbV1
         2RXg==
X-Forwarded-Encrypted: i=1; AL+hErGqPS3ORbfFCgWo9MdMODDwrYJBV2cQJQ8wcgrALVs93vrJeaxayfe5YQjRc7hXmTdY2Zkcrx2NwR4sk7nThg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9cMqzyq3YEQPR3ua+j0oIqbC6BlGlKfY+Hc0Fye06UIjxArOYd
	RnHTT3LE45mIIDqMI4PYD5jLC5IdGMKIu5Ckb2yVrzI/1woMMvRG2ayXq56xgLUbK1ovq7TtYbx
	WhVjpH+VoHf9LbD0lnANyhTH3AFoynKI=
X-Gm-Gg: AYBFou0blhbhi8sRK8odNwR+vYtifD3Ss+w52nCXtdicV+PcuYMHQFcZqLptPU9dL7H
	UJSualmyeuBNrwFbirZ0KOQufaWPll0QOM8FuTx3vYIu7BVm+1GUN8Wcsb+QrQ2HenNgkjpfp1m
	Ez3byB1G2Vag1MB6QgXkcqNH3sKXwSB04vgjJgXaV7ulUvLtu5hY4hw9R8Pck3q7K40wfWgT2uM
	ax2CrAm3YQz9J+bIDcv94g9BMuN5KPDXFI4Mj5nbsxeRdRKMiXMrWjIj/gv+DpVVWcu1ZJAExCY
	OT76HFV7KOItsuriq+0G7Hs77xpdsFTxLSPCprU0fx+Ev2VKdgCq+7HnUQIFM2iNdUAEHW7CjYd
	PeGX4B26fDYVqj5dfnLcPKudT3NgcKNLnvfpIWeZBvlhyadJph2O0ASDurcfhRBWw0WEutLRHnc
	PE8vb8+Bbwj3d0HhBb6W+0dwrDeKpQCUklD2KVHGf1z111ZP/4q2Krj5IKS/6a+UGd3FnAqqmni
	lDsCXCJ/C8npbAc7jjoxSKs4rx7bw4niLQ7COtGakypNBLV+5XG5mgyLVJ6/hSm0EjhbBc6
X-Received: by 2002:a05:6512:6201:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1aa04086amr2064153e87.4.1795084553237; Thu, 19 Nov 2026
 02:35:53 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Nov 2026 11:35:41 +0100
X-Gm-Features: Aa3M54oL5-b8rD0ZNwQf4CmOodKRTjORBepmsgS7qWBa91ie7LuuwJN18wbz1S0
Message-ID: <CANiq72m0uZRVWG=SwzUUzHo1nPX=2Q3npz-9jU_ORBSdcoAGeA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:09=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.
> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,
> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

I also added Cc: stable@

    [ The LLVM bug is tracked at [1]. Nick asked what function merging
      refers to here, and Alice writes [2]:

        No, this isn't linker ICF. rustc doesn't pass --icf, and in any cas=
e
        kbuild invokes rustc with --emit=3Dobj and does the final link itse=
lf, so
        rustc's linker arguments never come into play.

        What I'm referring to is LLVM's MergeFunctions IR pass
        (llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of th=
e
        optimization pipeline, within a single codegen unit, before any obj=
ect
        file is emitted. Clang only enables it with the cc1-only flag
        -fmerge-functions, which the kernel never passes, so C code in the
        kernel never sees it.

        rustc, however, enables it by default whenever optimizing for speed=
 or
        size (opt-level 2, 3, s or z), which covers both kernel configurati=
ons.
        It uses the "aliases" mode: when two functions have identical bodie=
s,
        one is deleted and its symbol becomes a GlobalAlias to the other. Y=
ou
        can turn it off with -Zmerge-functions=3Ddisabled.

          - Miguel ]

Cheers,
Miguel
