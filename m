Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC513C456F
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774616; cv=pass; b=KP3EpNePHJwj3J4JrCvHrk6ITBG6HHFxU1XQCUmYrUX/tFU3Mj1m/sI07BDY945OvkQTwcRERDO38vYNbp66ixpoRzukT+0Ni+x3iUKhHArLWb+p/6XpEdY0dwR14ov96JIcIH7I403c3CRSFcIAk2ydvkjNLj+k/2qz7W8UdAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774616; c=relaxed/simple;
	bh=cr34BVttG6VMuUWlKjc0l0poutE/RxT/K6tws13Z0Rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGe5HTeN329T73LrAaUTSGIflCnf03wvVQs5CZv9MgHl+TYuXhvtjd2gECX3Z2STypnI47xV3QCSfzzNY9pAt9NgtMfJKYp+wTa0Z46qQnpYpbVdML07tskeEIwNCnp6Slyg42n0W6kuwTio0bRS/P5dBiVmsW3Ytv1zgBPYn+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yqk8f4xw; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yqk8f4xw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c7ab2b9dceso6449755ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 05:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783774614; cv=none;
        d=google.com; s=arc-20260327;
        b=cqcpkL9eUUtipRurxlr/t5Ag6mIU6yfbxgc9tgYKYcQghed4T1n6MMCWT6HQ0doXSq
         ZUiGFF9WAF49jl3DLsSKnvCB3ahxPar3NrSjLO4rRikOwNO3fVAWo9E+Pq1lpA+laH1D
         o1khd3thhmmZX17AJ/+MqG2ky6JWWje45onbLk5V7NbnLCN2Wyo2ZZxii9Cm5o4A94CK
         PbrSf6sZ7UBPGrNgbti5IafyoCtUKcmT28J+p/kD3AqbP4OIKyLvAymwpn3l5Wu/+mS6
         ByD2AyXF2kwohEy1fYOrxDZqi1/w1VA+LGsCOGXA3Npee+NYyrzvSMzUo80ssFBkYE1Y
         EMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j6tjRunywnAeib7tZl4T028gbRZoamS1yIZMH8Mrn+c=;
        fh=cw2lfahT8eYZzmzUT+jcwEjdSOHJnTdf22hV9qIgW6o=;
        b=AEL+4SsXFiswISmbwFWahEqM6ps7zLySvOtPYLfpHpZE2u19SGx/IGoHzNIHIuMH92
         8WGZKyMHxbo+cdbiXmOHXin3I+k+2uygvHOM7cHxOzZGGHaH0cn8cN21m6GSHaaRgStG
         vgRO+CS2jCoUnCiKnAwhyxtGDj1wLFg2Mn8F9/WKcoWJdWbUElQ3AZGMITC0ijCePCpc
         TloDqEt9YiVPIBcmgEqSoj9ifNZZkEZF2oCHPN0jt3Q0mNyM35jHqa3ohhkasUW0mzmU
         y0w543owdHzFKr8V4IVSSrBbvbl0Ghgx4ccXOcjT8OPvtGGT06tPt3fGexkO0Gnx5BZO
         3wjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783774614; x=1784379414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j6tjRunywnAeib7tZl4T028gbRZoamS1yIZMH8Mrn+c=;
        b=Yqk8f4xwFspb2Jf1SdgDpPV6fIDPKMymG4NwvuGGVykC4CR1YS3oBPypkTCAEB5492
         AEUOeHvfWl4rRppx8i4DRPCYeMaMWdklNqCaAtbtJ0bsgDfEn3HCnxYfI8tHi29XVHTN
         wSZj31b5nLvaBR+fTjjV2jHjORZMz8DOEmQ4F57ny1I1bgCTedRqW8z68WicSiH0nmnR
         80O/aeQeVkApfjhUL0KFVN52GcJT55eTiqZ6DOOH9npMoSi1OOVgu9bO5pGs60zunpMX
         eg2H1oho42FARcDQ0F3dGqXuq2dPLj1pLQ86gzsCOpC+aURsGwZmDnAMfeLGUIw6Mdp2
         T3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774614; x=1784379414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6tjRunywnAeib7tZl4T028gbRZoamS1yIZMH8Mrn+c=;
        b=Sz9JTBwKV7+H61oUqjI9Hp0OxCmgt39yz0I/IpKSgFom2I9qdUl5Aeggwb6PMkmXWG
         r08UC6QKE+O9aZzBHtbD4bHZwBgh7E8h+47ezfJL6nZPS+JxCVDUm87FZ6aRNlY4uoaF
         vFNUHMRE5TlRpURb2TcQMqCSNeJMQcvTzfB4fFpRczi1lDyEZEFm76qPRR4TJ+Cy5i/I
         qj12TMDUAP2c69OW9ujrE9bWeGW6oO5VSYlkBcJAs2sW45KgzHX/WAptl6OUEh4wgx+s
         H9Kx70pVX4V0fwkb4tCceATCA9OfNOkGBSga489SO5q3csm/VgDXoOClMczh1ex6waCS
         qttg==
X-Forwarded-Encrypted: i=1; AHgh+RrotJ93Eb+UMoHu4NP6YIxO+Bn5qj4xxUYuucwwRxcZHzKv9NHZelBPUhPREc3bqypQanwYLevSl0ZuinpO7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOIR5U9piR9woos8fBB4KAgdcX1FmhqKlBmiiu6m1nGZChCL0P
	VW1PpcT7EDLd/VXVnq5u8L4b6KXlT39exjDhpJuvNILE8PNssv0kG1XtoZ6F8oD3WKEQDopk8qX
	D1e1w/ATrssBPUMZ/p+P7CZqqm5tNffI=
X-Gm-Gg: AfdE7ckY3//rKE248rPp0AFQj66rGfuYEwCiVe+TKdeMQizjhhF1tbfvcb8IjUyBD11
	bbRfWewLNWbTMerio9lpLFwNSEiAekLnU+3Fo5Y0BVA5z3F+XmVJ9+7qql9Frg6ma3t5KA7fWz/
	a1xB8iqEiWD7pIt05J7if9bdtGPBaz57y0+/vFF8unw0fFfTSbGQLIlA4N4qLtZayMxMLdMxCgk
	oZoWLedvmDX0TFNDc2vqKfoN7fken2oknfHuSOEzCPzP4wu6OOGSp5BKD32k0QYa3UGol+QXHnB
	zbpPPyyqEvoNmok9hcFHN7hZw2xgGinTTdeJMywprM/es5Zjtb9OF8qD6PRQ4P7oyYEry66L27K
	g/eu9eFu5X3aw
X-Received: by 2002:a17:90a:dfc4:b0:37f:ea8e:ab79 with SMTP id
 98e67ed59e1d1-38dc78226dbmr2320021a91.2.1783774614151; Sat, 11 Jul 2026
 05:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708082454.1254320-1-mkchauras@gmail.com> <20260708082454.1254320-3-mkchauras@gmail.com>
In-Reply-To: <20260708082454.1254320-3-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 14:56:40 +0200
X-Gm-Features: AUfX_myT4Cl9iDVoRO-w6Sfw5_PJOQ6oQg6JiFlTfoXu1j8VbTkYVMyuZ_7giAk
Message-ID: <CANiq72nw6SM21M3y=xXd81kT+bPbctnpPVi4QGL4K2XUS6bUzg@mail.gmail.com>
Subject: Re: [PATCH V17 2/7] dma-resv: Fix undefined symbol when
 CONFIG_DMA_SHARED_BUFFER is disabled
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	fujita.tomonori@gmail.com, joelagnelf@nvidia.com, gregkh@linuxfoundation.org, 
	prafulrai522@gmail.com, nsc@kernel.org, japo@linux.ibm.com, 
	lina+kernel@asahilina.net, j@jannau.net, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 10:25=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> When building with LLVM=3D1 for architectures like powerpc where
> CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:
>
>   ld.lld: error: undefined symbol: dma_resv_reset_max_fences
>   >>> referenced by helpers.c
>   >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)
>
> The issue occurs because:
> 1. CONFIG_DEBUG_MUTEXES=3Dy is enabled
> 2. CONFIG_DMA_SHARED_BUFFER is not enabled
> 3. dma_resv_reset_max_fences() is declared in the header when
>    CONFIG_DEBUG_MUTEXES is set
> 4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
>    which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
> 5. Rust helpers call dma_resv_unlock() which calls
>    dma_resv_reset_max_fences(), causing an undefined symbol
>
> Fix this by compiling `dma-resv.c` file only when CONFIG_DMA_SHARED_BUFFE=
R
> is enabled.
>
> Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_l=
ock")
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Andreas sent a similar one to:

  https://lore.kernel.org/rust-for-linux/20260708-dma-shared-buffer-config-=
v1-1-8c1571000855@kernel.org/

This is earlier, but please see his approach & Sashiko's note.

Backlinking here for reference.

Cheers,
Miguel
