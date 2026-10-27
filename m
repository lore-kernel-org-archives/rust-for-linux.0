Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793107210;
	b=ixOXXQEbi6Esn9FPF02acpbW4gcT7dHtuDLcwsK8JFo59mCNJwAm/7zoX/D9Z5TV0dSI
	 Fp8c+is+1OQhz9TI5qTnBEgZtqdEFQmDvVDAyLK6QJeZPcI0czqCdkYPN5iiAnsl/7Vs7
	 Mztei/uV7YwGZdP6esM2y4ivn+ZHkaPdU9IFdzYY++i7uEXJHYyXQQJvFvpw86KmC69Td
	 q+OpJbJ4j2XZNjxebEWhoSQZE5TWOFem7GEn2/6C4s26wrSg2+Uk4mL8ngtbD74B8sxZ6
	 mVlo5X+de06EHoYm57PAw1qlJ1yJDy3gdquQvsJr6bNOAMJyx0jTJPXjxwyOKqB7xrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b4XlHG69rykZdY7UFDMMd4dGaLAt8RQaxs8vJ62P5ng=;
	b=R8yq74tWh5OPsuIFGPGg7eAZt5/L0YBvIiA16bsjV4J/mnhVuH5eeg+2LYSMcmKgOmAJ
	 0tQrU2j5uTCBiJY8tnzN7Un8QOuuvSPt67mTx3+Cumoxdsxgrj4YHWI0lQg//ufZvKNpr
	 g3www1AoGIVZj9QEVrLnMVmgOgS4E5C/tDTOIkR62aHNmHnGOpQpTX4Gh5hJWwyg1gzN9
	 Lm78deC8rYWcR7MpIKIiRE+eUuoS+aE0asSVRo9//D80tcE8h3uOQ8ezAaCHuLvKfz/dy
	 IDtjHiu9onbkYV0tF0TxGTLpj53Y/Kvr2HZFTjgTcnIh9LmLUxKVM1QpOIGS3+5+xwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KwmXxI7Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64562606A31B
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 13:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64562606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KwmXxI7Q
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-34c522572bfso535546eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 06:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793107209; cv=none;
        d=google.com; s=arc-20260327;
        b=LvmgINhvcHA8ZquXyuRM8YBtS92tdLUba8v0htZRBA+3ktY0MWr9Qq4I+lD32H98KX
         iP/fbVzQVUYuwvt47Mi1UrRlG/sSiHM7dFlzV6px1Avx58ZtaetbLuxdG73681mD8faN
         ZbFDLICaFpxoIqdpG8USUqnbKpADMY/vLmK81nfnH6ut0tRMLabFSJKnpaQ7Bivn3RBh
         eqwpRZK+hRQZAPxT2gN1QfNH++5/JdFFixGT1Dfqeg+cflZfIi88dLG+QtjzQMBBHmvS
         bo8t2kqrcEIK989AarwCY2rwPiXcFzJvfTGQDhXdRIZg/vXIqIpHDEO6wR566kuVmWqF
         ukwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b4XlHG69rykZdY7UFDMMd4dGaLAt8RQaxs8vJ62P5ng=;
        fh=XPhKe/NMJE2SJx/N55/NSriu3dKvUcKYgDBD5Yju6T8=;
        b=IOiSKgXxjBd9bhYL4AgV4RhLYI9DVEtFtT55AECUuucY3q2OOUW5vITvyE3BvDo5rw
         shEhUrUgRl4cr1ni4be7T3pSsiI3lOX7QI+WHEXvO+xslMm8dDE1slL6RNKJqPjmaWaV
         fYverzdltHbE+twDCFGYserVG84hAGQDPeztE9Q1u3hyEz1LkCJRUPB18jGYefhK3XeP
         yuwr/9Z6FF1mOlX9vL4rO8BFJnjSdnB7m9oBF9JPTSYeALdUfg79Way545sCOSnbBauk
         951Ig5JazECkbLxkjKVfjEzHGGubA3OZevhGsYzwfXzrrgM8+NRShugF4iGippEJWgn9
         yEIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107209; x=1793712009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4XlHG69rykZdY7UFDMMd4dGaLAt8RQaxs8vJ62P5ng=;
        b=KwmXxI7QR3rV0LwEuF7BShBsVedgcPi8hai8PBobx3gkqKirVpQcBTCe4X9ZHRjS8t
         M14IQzNGZsu4ZztRoW39NVUxZXvcM5bs7xFhcfttkxagYdJMJG2NmsNxEqs/yqY7YQc/
         ImZwrvRUFoNCML37bPj7ZRCT2eT6g/M0tRhDr3GbRwirXSjVr3Kr9Ia5BU98BgeZ2SkG
         epPhWGp0UIHP0ktg328MhtG183M5XggsEaNwijx6cOirBfhy9UAS2wyTCzeBzE5pCmsR
         RPjhQWPw/SH1q+rzEVMGeKdQfE5nMr/gDetewjQmFhLg1zBP+icxHKGYp81oc3aKNDiH
         YnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107209; x=1793712009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4XlHG69rykZdY7UFDMMd4dGaLAt8RQaxs8vJ62P5ng=;
        b=2gCcrX8G196i+V6vVWXIGkXNdtBusZUpi1L7Z2fSRmgookRFXMfYVJPkcKZigKndNV
         aIlSKl1/cMHQ+thfgXEjP/Pe7GGVKqggkYb0nh7wGfvO1FcmpUNaucgcH4AV84NFgXt1
         lo9D5jNPegkIVgTVV9Mu9juj49/5m/z4QN/X4F5FFDzeTQdwfBIG2CXjiISJVxv+Z2yb
         eVm+5Vs1scglEkqVKh1mj9JrBobqTTqt5L/ykPvpI6LsMtCNReLM/lz7rhq3D+utTDv7
         EkP99udFGyNsAUra4qhO9m94HQgCl9D41liSMDcGiW1nPxbjaouVP6ajVV1AgI5Aqk0i
         0GQQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ+Xak4s4Q89G//XXP8546oM1ZlMw6ahC/O91M1zmzkk5fCuQZ3wWI9GnQ59ktrNH+koyz+Hl80Of2RMIidw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJET9K4OBQaVJvPt5RuTzr9QbMa7XEgAL5HMOtJUid3PN+pUYQk
	ocUeClazfB7+VnKUvQ5OaVpnI6okfvYN4WssN6dXR2U6qgw+Mn3QUBgA+ukj8JMcdJOgH1MkrKu
	5Ezf8sQ40DRmyiZJLpPnOuP2dFxEQjcw=
X-Gm-Gg: AYBFou1BVgmkLFWOP0kAkZaL5fC3A/cNAvfc2+pg5oSULl2zpdKcbB5lzSbXJsfkAYL
	An4oFsLkAlZwMA5BXSpFBdsruW1Q8DE/UgW/dMCgbnYlS/l8sxrZXfYruVK+QYTNgqM8SE+L8Kk
	ZKV9nYBu3mVE6o6Sk5lljgSUuCU45Q3eamCFC9nsAmlJ+3fXcfSRPgUxLs592gb5WA9abWUlQQP
	0oY9AMDcfRrKwS6bG+dHI5xpy+OPGEGN/u+r3TWW9/4sJvVix0bmSJgHAyVWhwle5+X+H/2WK8/
	iK3zpjgjDSH23WW54GJUENEywNO+f7CXPhYptIXRamUlsagMD/98TNruUyyAxI1CAjnimC/rEDs
	MiQ8bsOUIQGQXCchA/rBq8rPayjUw6n+1uTnuL/jnojU5jdylq020yT4bmkEslgSb7dt82mh3Qh
	T5dIteb5glKPGT/L8gZgCWcUo3gkGdKkPGFFqvlJxRgXm57F/bj+lVnkrvKzsNwhU7u4jm0IsK6
	aQEV4xl73t93AmdGgeiYhxZfRFW26FpBsO7
X-Received: by 2002:a05:693c:8817:10b0:36a:143d:98db with SMTP id
 5a478bee46e88-36a143d9df6mr3896465eec.1.1793107209313; Tue, 27 Oct 2026
 06:20:09 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <20260928011123.450800-11-alistair.francis@wdc.com> <DM4NT7TFX4X9.1GFI128LI5ZQ4@nvidia.com>
 <CAKmqyKNEup=x+bwmPD_8x0s4ssPkqFnQtSGqJ_82z9oDP=A6cA@mail.gmail.com>
 <DM58HRC3DHSS.1YC0E53ZXANT4@nvidia.com> <CAKmqyKPwirjmeBQvXgheY8Lh-M-RRq5pdbv=5mB4duhw9aCbGA@mail.gmail.com>
In-Reply-To: <CAKmqyKPwirjmeBQvXgheY8Lh-M-RRq5pdbv=5mB4duhw9aCbGA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Oct 2026 14:19:55 +0100
X-Gm-Features: AclHuK8O_cUPC_NV8nLehaHvClvws6tvszHDrs0qLddmTGSO7twgLKCazt9sU5Q
Message-ID: <CANiq72n=eqh6W+iNWPdM+rrc+HujtZVRtVg=JB03OMS8rc5hiQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] lib: rspdm: Initial commit of Rust SPDM
To: Alistair Francis <alistair23@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, lukas@wunner.de, linux-cxl@vger.kernel.org, 
	akpm@linux-foundation.org, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jic23@kernel.org, bhelgaas@google.com, alistair@alistair23.me, 
	djbw@kernel.org, linux-pci@vger.kernel.org, wilfred.mallawa@wdc.com, 
	gregkh@linuxfoundation.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, gary@garyguo.net, ojeda@kernel.org, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:19=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> That was kind of the goal with `SpdmState`. The issue is all of the
> drivers calling this (PCIe, NVMe, SATA and SCSI) are C drivers and
> won't be Rust for the foreseeable future. So there aren't any Rust
> users.
>
> I have improved things a lot with v5, let me know if you still want a
> Rust API. It just feels a bit silly to add one that will probably
> never be used.

I mean, it is true that we don't want dead code, but in general we
would also want more Rust callers in the future -- so I guess it
depends on that "probably" you mention, i.e. how likely it is. So
could you please elaborate? i.e. why is it that you don't expect
future Rust callers? Would the NVMe Rust driver want to use this
eventually if merged? (Cc'ing Andreas)

Cheers,
Miguel
