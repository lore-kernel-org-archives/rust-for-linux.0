Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7821CAB3
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773558101; cv=none; b=ODT1uFWe1z4uMS6Tkz5A+h1LkjK8AZhPRNElH6SbFIgEO1LS8UFcxAYrT4mEJRUYPcaTcKWvCvAK9zwZ4jwgf99rC/BSV/7jPboGKAKVoYqnbbnxt+LWCx5bNyphqoX5Gcnz0AqzO/QxUHV5qGkGEa9MYaTbByrB2M3DPKZ6MPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773558101; c=relaxed/simple;
	bh=Qwnct5hfl4aDX4e0/uVWd4hdxcIfCaHXFeCrtc+ElrU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jkZinKXNDuQbxNv9nNEA+W2/bPRnlk06BbQD+syvKZsW0w1gI4yb8malcp08XbquhZUKvhEi90l6ChUHV6cj+MYNJsSTZghDP8GogIOPnwuPHzPWbzZ3CiDPD61xMVAuG8307V9AVyMJzb/mNCfrOJ3kV4NNpjP0S411zcHZn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSGSh/BS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSGSh/BS"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829b2018c94so1931616b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 00:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773558099; x=1774162899; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Stw1VtKTyQEZqbQreF3Hq8w0VNeLF7WhkuhGfVCcfS0=;
        b=OSGSh/BSTrdHxl1E7j7bcLN64gev14a+f2R1yMQH+T2yMDsd/jRdoQDEzRCaaixY6p
         HxxYfZoU2B2dM5EqFFkoVdyxCaoYsy2MgI2JvsjnG5qnm9BxqELTy98TowR10wUjPubj
         eYgwgDlcKECBtIZJ2UxvKCGCckf/DPc05Pb6vwW+vNCcQTExguBVC9BTDlck9z1I1ypQ
         rW3JYrb3A6jABCbo+GMb/fRBh9V1yIK8YGkjXlXht5mPh7Sk/8H8sTp1dS0J4ws+DJUT
         dw3rRN691NB/7SnQZyRCH+WyJRCWHs8JfOAIhaSfDNpJbug8d3LPzX7244T6l4AgTb1M
         ByWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773558099; x=1774162899;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Stw1VtKTyQEZqbQreF3Hq8w0VNeLF7WhkuhGfVCcfS0=;
        b=H6iMj1A/hjKxH/c0npqyl++CaPdAE7oqOdaRxEzcTkKVrSDge6YfIQstyhFBvsKSol
         3T4lLTcLxTS1C2OItbNDj6U9h0pW7eg+ZBLzPpKlKfUwfAiNkVKOv6R1QzOE/irNwUM0
         yMEHJo3NVfFB980UYg6qdEcaU3p5BS2OP5InJVqK13tSM2Rz1l04wd3+nLD0JIw+7Sx5
         Bo1aYpZ5sBle/O+83LGk4Q/Gj+8htVMtxLBiUf/REgasBZu3PE9xJHGr1KUZJKcXheue
         /OUnu2Vjmpi5rrP2Cz6/BjXDDyFQCHnSkkch6/uesdjAo06pXnoH/vmdIt4KHjlhj3no
         /KhA==
X-Forwarded-Encrypted: i=1; AJvYcCW2kYnc4Oh0AST6lVxnMOTV9MJN1exdPzdlbrUpRRP9HAztEz4zGjefBqSDyCeQo+qs0roHbxAYzo1xHNA5sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtJc/tcgEi0I0St2NsI7aHfK0h3HuotokwJO99C3tomxI7ZVqA
	khA3KjhA8sC0lKXvu6O8gMvWBT9Xc0PP+TyAggeehwp+SGiw6DnqcBJS
X-Gm-Gg: ATEYQzyz4ds4pEmCPP9My2zpXaF7uS6mACgwhcxoso91auQm7JhufejaYIHGd3s59cy
	RiS7rWRm0cHtHSmnrWc5l1OYR8CGprRINCJEusicDDfKRYF/WHhoYzn70B30eRCCLH2SUMbACK4
	vT0Zm4rLOw2sksnti1dgPr50ljF1oZEQqxsPkQE9Q9ekxuxl1e9PBUVznh8O2aBkJPwJtb7Kgak
	5ndCLfnOtgpfbj7DfRubx/o5nOzIWtJxQnJfr/NPHushLrkmIRmVZ2KgrB6WSwkTPYHGglxd2HU
	wIQ4bav17AW9KUCuSnoOQzuSAg4Olcevpq8wOUCFrsKEmIY9igmHZcfAup6SnkG/fFbUzrDqTN7
	hpMCOcp/5IcTqooUaR//U8pCY1t04istWm8Qc3XQoAzoU22obHk3hUHdnmm/VCXAdodbeFhU+Zv
	HIs142QdLay1QV7AVdkw==
X-Received: by 2002:a05:6a00:94d1:b0:827:298e:b7c0 with SMTP id d2e1a72fcca58-82a198afd10mr8434499b3a.47.1773558099190;
        Sun, 15 Mar 2026 00:01:39 -0700 (PDT)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0727c40esm9923067b3a.26.2026.03.15.00.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 00:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 16:01:34 +0900
Message-Id: <DH35VGPQ4P8K.2FOAKEK1K2S3Z@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Jesung Yang"
 <y.j3ms.n@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] scripts: generate_rust_analyzer.py: add
 versioning infrastructure
From: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
 <20260308-ra-fix-primitive-v3-1-598017bcefd8@gmail.com>
 <177308129157.19064.2462259833624603051@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
In-Reply-To: <177308129157.19064.2462259833624603051@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>

On Tue Mar 10, 2026 at 3:34 AM KST, Tamir Duberstein wrote:
> On Sun, 08 Mar 2026 08:30:34 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrot=
e:
[...]
>> @@ -335,12 +390,90 @@ def generate_crates(
>>              append_crate(
>>                  name,
>>                  path,
>> -                [core, kernel, pin_init],
>> +                sysroot_deps(core) + [kernel, pin_init],
>>                  cfg=3Dgenerated_cfg,
>> +                crate_attrs=3D["no_std"],
>>              )
>
> Can you help me understand this addition? It's not mentioned except in th=
e
> cover letter as a diff from v2.

Assuming you're referring to `crate_attrs=3D["no_std"]`, this makes
rust-analyzer treat crates in `driver/` and `samples/` as if
`#![no_std]` were specified in their crate roots (they don't contain
`#![no_std]` themselves).

(Actually, I'm uncertain if this is the part you wanted me to elaborate
on. Please let me know if you need more context.)

>> +def generate_rust_project(
>> +    version_info: RaVersionInfo,
>> +    srctree: pathlib.Path,
>> +    objtree: pathlib.Path,
>> +    sysroot: pathlib.Path,
>> +    sysroot_src: pathlib.Path,
>> +    external_src: Optional[pathlib.Path],
>> +    cfgs: List[str],
>> +    core_edition: str,
>> +) -> RustProject:
>> +    assert len(BASELINES) =3D=3D 1, "Exhaustiveness check: update if br=
anches!"
>> +
>> +    ctx: RaVersionCtx
>> +
>
> Could we make RaVersionInfo an enum? That would allow mypy to do this che=
ck
> (using `match`) rather than relying on this.

I think you want something like the following?

@enum.unique
class RaVersionInfo(enum.Enum):
    V20240311 =3D (
        datetime.strptime("2024-03-11", "%Y-%m-%d"),
        ra_version=3D(0, 3, 1877),
        rust_version=3D(1, 78, 0),
    )
    V20251222 =3D ( ... )

    def __init__(
        self,
        release_date: date,
        ra_version: Version,
        rust_version: Version,
    ) -> "RaVersionInfo":
        self.release_date =3D release_date
        self.ra_version =3D ra_version
        self.rust_version =3D rust_version

    @staticmethod
    def default() -> "RaVersionInfo":
        return RaVersionInfo.V20240311

At the call site, we can access each field via the dot operator. This
not only removes `BASELINES` and `DEFAULT_BASELINE` but also ensures
that we only match against valid variants, which helps reduce the chance
of human error. But unfortunately, `match` was introduced in Python
3.10, whereas the kernel only requires Python 3.9 [1]. This means we
cannot leverage mypy's exhaushtiveness check yet. Perhaps I could leave
a TODO to remove the assertion and switch to `match` once Python 3.10 is
adopted.

The rest of the feedback sounds reasonable to me.

[1] https://docs.kernel.org/process/changes.html#kernel-documentation

Best regards,
Jesung
