Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31672270EDF
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 05:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403236; cv=pass; b=FfNVLue8aePwLfzsnmr+0nFffYrc06eEH268Az4iqSIwFYGTMmKy1QkAzo24zmh5r0JZTAX8L+6aOXfRw1/S93d0bVNXN8Wk0prkrBYwisauyAbse2H/ntAwTI7r92dgdM/OftPBlU9PJU5g5M8q2rNzpHiNjNbzybHm8MvYYXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403236; c=relaxed/simple;
	bh=NjLFoPnv6IxbEHzHsHXAXNpdL+P4lW5tZwXEzwHN8PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl46AgRjpgd7CiJjtp2PaeGxbUycHjxfXuXN7hfCXeEBjhd3Rq8Pbxr2TR8LXnCL4DjjcXSgrNlmarczKsUv8x7f4Uby6H8UAJZHycovB+DCeMKv3S65rXdk98ZEJqlJnvkxkdAoCURt8I9krj1bDYRYtE7IBkr1aeZcjFhb6Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJilzvtE; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJilzvtE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-671ae79e617so296523a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 22:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776403234; cv=none;
        d=google.com; s=arc-20240605;
        b=YSLDFTsV1CHkxxlu1fevND7rYfMS/VoikNN5DkjGTDNgabwOGq88z+QpIMJqwuI4G6
         kJvEr3H+mR9xxpEgC0yzwIVWmfUdrw9cli2co/pNgRCNlM2692BD63jhj/RzrZhfcEj7
         aeTWGyhMu/fmoJn6SwUWDXBZijownIp0DU0V8rtV3IYjTCxYMtirhEpABZhfCBpExFfk
         aAGBDzM7JuT1jrOIRQMoIgxFz5Md/ecsgfbXOeREHB1MOnwtJJeik43+6r6kE845h36r
         /HVdEYUuK+EQDqXhKrfbUXEMia5sMeGc/ShaYxKQb6XPVW9r6vW+u/+fnWjn7SGibQmv
         uHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dDFG+okIhe8PYZxq7+NDc2a4MEwFZQZfmQFdzqFGjE=;
        fh=xj6IofwK/VMKJlbzP9wVbVdJBw27s0lr+1nFRsuB+ac=;
        b=ALEvhABQgXS7YhWmRyF8OTPN99fBLRijapSRLhe08VBfL7PpLaqH23r7S0gTy26yU2
         xF2KbNHARDOI4vgp/iI8ITWvM6avNUieea5VgDZFjcnXH4/CdDO4xjlr/GUSseUis/Dv
         kcn4cMNtkY8eqGW64j7dOtQIP1j5Gs2RDne+fR9D5tm/kIimqODRkErcsWfZPROlhC3m
         ///eHcB/6XrbwNc4/sAsBu4XcrS/KcbLZQwANqM6eOP3j5whlq06Ho+CiRuif35BnuyS
         S9a4JRcLkZUgd4SYMigw8hec3zgV1p0/mLZxPOM/xVmK6ZziHCNac8r+yZr8zJGiDSU7
         +nKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776403233; x=1777008033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dDFG+okIhe8PYZxq7+NDc2a4MEwFZQZfmQFdzqFGjE=;
        b=JJilzvtEH42Cgbggtv8GFG4JwYK6BzgtJWNV1eTOtEtJagXiT+l5ZXIOodGLTBPMN8
         Rnx3eMCBIIyE/XkyUZw+YR4GnTdYGrt1X86QVwWxI/2j2lxQoPOfiQg6dGR9/1l+BtXq
         xyXyeZ/zEUR5UMYNyMQ+/Q3QqzLzD+DWYkjkgDz849BBQFN9ZBzcmbpMgr6SQ8w9HAH5
         rciwvnNu1P6HjQXtwtSXSR2un7oPbXjTQaooiqQvPlEtUtmWuY1P2aip/9kC0+ynRV7J
         wKKKdYovtcK/paxhypL8NCqkAi/YFGDxTHvaOwkmFLJ5flunZ/czLdZ49RpNb37vdZPa
         6SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403234; x=1777008034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dDFG+okIhe8PYZxq7+NDc2a4MEwFZQZfmQFdzqFGjE=;
        b=B2U8xvUBM7BVjeF3IUCZh13V54EcwDA6zJB0WwATAP+f9Xu1V8X0oxDWQs2uhelSOt
         qSQu3DgC1Fstwi3p5yRAWWc+/z9A5F+lFyenhrjDT7aEOY2aFUU9XWv5WVtu174c7+Jg
         QZrI4xdP4umMdJzECMwlUnk00ofg5xnCIT0W08VJWA71dFVpMqiqd2uQ4qObVHjiCtAs
         0l2l0mXqR0ipWysn89zOj9zT9EM4cN/yOdBSwsPkdtEo8/4Vly+PsvmO5qDMkSgcOQ6e
         H1j4xd3S/0B9me2oG/SdBNkAjbge+Xvf8IxPUQAntZKnOdwt3wvNBGyYaPuji8MFeKw1
         TB7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Ibv03NozvsVeo6DU+jvllmyD3ixOIaKNBWlIDTBtOA/n28tbuwg+KoKZXUMBh7FIeN+Il/rzLlk/gybLQIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylFytZhtO2GYKJBi3jXbZtO0jArXPS+69SdcUW/yFLaT2PGy4Y
	NMVYyGfR5uoxb4UDyACvic7C215ImqAbML2QWiod0RUKNNKqX+PGd/azojM5Pe6s+yntucZa3oJ
	msfZJGgdO0TJ7uVKHNfZVEpnSCns6yVI=
X-Gm-Gg: AeBDievkP1SCgX1P3JO1e0fO7lzPVXdYILh7ZFksdPz8qHtv7RKWI/9p7tnm1QS/s26
	KtifE0vEDemoa11DxtCIzt4MOivr/Ytf570kuPgkIzPZAMzfsVs5BA/81osJlj3ndF4/pJCgs99
	esGRijRr0Pgdnq3VMmmJrqZ7YDZ5D/UNstVb/u0Z/2iU5rx3w5iyIFd5e3YtW94+INw1rU0+8yn
	nvtxPg9B/eKS8DOMw5RWb6l9ngeV+BesOaf7nEbmJzAf7WRlJPVMyiYgksfTDij9i8TOlpSjlUU
	wB+OA13N167mSE3I5Y/hkS04Z5fiQweYW1S7JSs+4lUcJmkO
X-Received: by 2002:a17:906:5182:20b0:b9d:1adb:fcbf with SMTP id
 a640c23a62f3a-ba41afe61a1mr47564466b.33.1776403233210; Thu, 16 Apr 2026
 22:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <698d6b7faa190_2e57100d3@dwillia2-mobl4.notmuch> <CAKmqyKPyR165rACXRMJXgyUOp6OUdQqSsym-gfYVFnKLZ4ednQ@mail.gmail.com>
 <69e19c80b892b_fe0831000@djbw-dev.notmuch> <aeG4UnyYd1FKdt1D@wunner.de>
In-Reply-To: <aeG4UnyYd1FKdt1D@wunner.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Apr 2026 15:20:06 +1000
X-Gm-Features: AQROBzBVB0P_lXZKhnqIa7d0_vKgMy0kgTihznkkobGfKMkBxqIBrZfKSba9-FM
Message-ID: <CAKmqyKN3nuA_uH+1o9XPrFoi7TnBY_R92SiP1srhXFdhnngd3A@mail.gmail.com>
Subject: Re: [RFC v3 00/27] lib: Rust implementation of SPDM
To: Lukas Wunner <lukas@wunner.de>
Cc: Dan Williams <djbw@kernel.org>, bhelgaas@google.com, rust-for-linux@vger.kernel.org, 
	akpm@linux-foundation.org, linux-pci@vger.kernel.org, 
	Jonathan.Cameron@huawei.com, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 2:34=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> On Thu, Apr 16, 2026 at 07:35:44PM -0700, Dan Williams wrote:
> > Later in the thread I proposed an alternative that instead of supportin=
g
> > 2 flavors of uapi through "authenticated", instead implement CMA as
> > another TSM driver [1].
> >
> > [1]: http://lore.kernel.org/69976d7d39c60_2f4a1009@dwillia2-mobl4.notmu=
ch
>
> Please keep in mind though that CMA is just the PCIe adaption of SPDM,
> SPDM is not only needed for PCIe but also SCSI, ATA and possibly others
> and so implementing CMA as a TSM driver must not preclude use of SPDM
> in other subsystems.

That should be fine as the current SPDM implementation is
self-contained, but thanks for raising that.

Just to make sure I'm not going in the wrong direction, the idea would
be to build on

https://lore.kernel.org/all/20260303000207.1836586-9-dan.j.williams@intel.c=
om/

and add something like this?

```
static const struct pci_tsm_ops pci_cma_tsm_ops =3D {
    .link_ops =3D {
        .probe        =3D pci_cma_tsm_probe,
        .remove        =3D pci_cma_tsm_remove,
        .connect    =3D pci_cma_tsm_connect,
        .disconnect    =3D pci_cma_tsm_disconnect,
    },
    .refresh_evidence    =3D pci_cma_tsm_refresh,
};
```

The docs for `struct pci_tsm_ops` seem pretty TSM specific, so I just
wanted to double check before going ahead.

That means all of the netlink stuff in this series can be dropped and
we just use the TSM netlink (which might need some adjustments then,
I'll have to double check)

Alistair

>
> Thanks,
>
> Lukas
