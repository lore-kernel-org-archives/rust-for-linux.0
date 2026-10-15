Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2031283E
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 04:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037862; cv=pass; b=YRr+5ZnQIhvGI2oe3dVRu7DwQqpGpscj04M4HC43peCRu3DwYXxEAzXG1ixYyCq3PND2apAJh0o25UMTupvREzyyTJIkXUsOjv6gxIgMlJzawQfORQGWkR+0uhYFtQroWYYAobcnCDQLFtIHemEHK8nfPNNynGy/GEXR22ev41I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037862; c=relaxed/simple;
	bh=l5wBNlemWX0p2srbr2KMc8Dqy6ZbOGjvLXeG4h1En8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KP3AtUCZ7kTeWgcADnvy4hHfaSuWoJ9GbzQ9VCp0qYHGX6fe+S+eG1lDKAsVCmO1n5WlyovxSjOI6e3Cjqb4NIb8wInhK8DfnCVownk743RP0/Mz7tAod5arMKLpUFU9OcSLk9LKEFB5m4aurOhkBFbIkn2zyMbs+SVbCK45dQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuSP2V8L; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuSP2V8L"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so5294037a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 21:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792037859; cv=none;
        d=google.com; s=arc-20260327;
        b=EKsYLewj4uAPhkpXcMBmmRp380VuRosza5ZqbPm5gxdD8TfKxl82LiQg4TOOezxBc4
         QA28jhFR+5sb0epWaKUO/8/2MvnN60SvLJdijinGrKA0AHeU5s6TuybrjM2D8zz9UbRO
         Mw4ldkQX3c2M4Kgh8RbUEPaBzHQUjWW/XghH5NQxwWEB5Q1jMVTemaZMIcx+oMCLWTy4
         8y8LoBPySo+o4+dFEGtWtKsdg97kqjjVxnJscVN1fSx4TJ09htVHIrwQ54ncJfqRt4Mo
         Y6K/h9vi2oA3vPsGt9mzSlrsszJoG/+8Dz7osQYI4Kk0jxke/IplGC+pt1LJ8aRTFs8X
         iI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Mif+7jW3EO1r6NAyd48pdX/YR6ScEx4Ic6vaTYMoxc=;
        fh=jZ8kL6lTm8DkuPk4B5ZFpgDXEqEX50C4a4E+dl6OuRM=;
        b=C0+S1mW/SuXWg8gCqw1RszBRNxzPgC7Zxix2vIcsVQPOD++BL1utNaYRBg8LIeE+R8
         z0A7izdmH4aQXPCVwsp7xhg/GNv+tYWvsWWJ4n5XYKhiq8GgeZE9TE0WAGiNOL5JZ7qO
         JHzFhrEJ0URcYXCpG4oWBicK5lyDIdVvVTICyC3UdZnwN1xQIucEorLBkM//wvY5TMNe
         2XX/eGHXIJzLYz3OhU/mFKr8qC7/2nZ5d3rBJ9Pwqy2zDFUmL1HoePJe1kQwAckF8i/0
         PMKs8fdZ/ttJYIrujaxjpaOy9ejHzYN0opZh+12NbjPId7xfx2tfGO6HL0JZEMkTrj33
         xUGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792037859; x=1792642659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Mif+7jW3EO1r6NAyd48pdX/YR6ScEx4Ic6vaTYMoxc=;
        b=FuSP2V8LUPiltHl9fyH5JNOgbMQ1RghzkgASnrgj5aSLy/AX3ATqblSIaOwzICvhOS
         XH6b0fCgEdrj3yhgCkHvrRNgT2S3T7IkGF6okBE2xgeRdVk4C+OoWdHiBwVbncNQBbdg
         KNrplc1KMHINi9/RCGK+h5QEEMeboFm+nuhndYO3+4pi2koLMZRZqwG+aXUI2wbxyBkX
         k33o5cmKQKQpnRA4DMVOmt+xzlg9WcvmuCaNNisd/pgIrLHltDKYpmRmLPo6vAZ+yPjn
         nEYKbxd5ktnd4VyM4dTQ4OaPArQQau7JLLGqJX5psKMIPzhCGT8POKmJ8r8Q4EQ2bZZq
         6DOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037859; x=1792642659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Mif+7jW3EO1r6NAyd48pdX/YR6ScEx4Ic6vaTYMoxc=;
        b=So7NjgnDEeVmqSwK8vKBBLG4sCfIWm0a6Q9VdoTWRPWahTgyhqmtFdYSwu9b9RFqfs
         5k64mhGPTYD5LD//yhpmmCP0CM3TNl407eGgZJAYCRttbMHb+S2+mBodkd9YJ/BI4NHV
         XJnISZv9iPPJ9Txk9KAsKJKW9XbvsZ/umVJM7fJhJgbh7nAzUN0sSbzrebsyjHfEyAhx
         RRcoFzksChYDW8bJgfMnYzM6ZXVkNbtj/iDGql/cPjPaULE8EU6L8Y6j3nyR5ezZH1fh
         vqsML34+qi4P/3sAPFAfHNXkNSvq7yGqba7joGUjcrjPKHlC59KM8q8571FxcFzuzaTc
         BiYQ==
X-Forwarded-Encrypted: i=1; AKwUvByBN6pjAdLxjqp+bFl2Om+5YZpWtucEXxHCyLWZGGeV5HfguiJUupyqEmWjdyCiF3X2wVh8VNRUOpX2voX0tQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9AiSP3jTMAz+dGzN/d9m7Z54RKRFQrp+YhArdBaRKNCwYm9c2
	c1RE/5GFYkV8rOeGkQLAD+J+pEs0bwobWi6V4sIozJMM/VMsv/LlHGmgAyc3PEX4i3oSh55aUiy
	VE/ROiz2XB9RSEgGLuFXV1rFN7IQYZG4=
X-Gm-Gg: AYBFou3UTcSFRKeNW7iQ3lyBZ5iuIsT08K2EE29QB5+rcwqejdwRWue+C3UnAuuSrTr
	qzg+Kbs2Soi3Vx7CqoEKizdlUHPLpZGtUEYGUXXsl+NigCjgUmnMHKM50Z55iL9JK0iA7/bNwNd
	gNwPd45LRt5ugwiRlAPe5ufzgtChN29LQPSszXe45UDA2GH4Ol3KV9r6jzhtPpkFX/zHCJH1ADo
	HkPvnLzAI5jMgnC8TIxAGpY09JEiRKE926vZr0m9jUtqBwcDp/mI/AKChGqV/Ds9cP1au9V9HLz
	S+rJXilv1f2mj187zQuJFE7pTRhqC+3hDYaip1nj8QMB9mYZuuc1IGpzK/eEqBCIp5yusAcEEg3
	NfEo4PcOMPyNqrHvIzeCs
X-Received: by 2002:a05:6402:4028:b0:6b1:c2ff:89f5 with SMTP id
 4fb4d7f45d1cf-6b1c2ffc1aemr8407700a12.42.1792037859176; Wed, 14 Oct 2026
 21:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com> <DM4NSAYZG3EW.27L8GX0Q9CV0P@nvidia.com>
In-Reply-To: <DM4NSAYZG3EW.27L8GX0Q9CV0P@nvidia.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Oct 2026 14:17:11 +1000
X-Gm-Features: AclHuK92TTyKf2sa6xlCV_vbhTCWcDi-jWO21qAlHEyvl88OFTnb9FdoPdKhY64
Message-ID: <CAKmqyKMZw5MJ=NMvNOP4=_FkV8QSKN1+FRz1zgCdfjtdZY+N2w@mail.gmail.com>
Subject: Re: [PATCH v4 00/22] lib: Rust implementation of SPDM
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: lukas@wunner.de, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
	Jonathan.Cameron@huawei.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jic23@kernel.org, bhelgaas@google.com, 
	alistair@alistair23.me, djbw@kernel.org, linux-pci@vger.kernel.org, 
	wilfred.mallawa@wdc.com, a.hindborg@kernel.org, gregkh@linuxfoundation.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	gary@garyguo.net, ojeda@kernel.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:16=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Hi Alistair,
>
> On Mon Sep 28, 2026 at 10:11 AM JST, alistair23 wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Security Protocols and Data Models (SPDM) [1] is used for authenticatio=
n,
> > attestation and key exchange. SPDM is generally used over a range of
> > transports, such as PCIe, MCTP/SMBus/I3C, ATA, SCSI, NVMe or TCP.
> >
> > From the kernels perspective SPDM is used to authenticate and attest de=
vices.
> > In this threat model a device is considered untrusted until it can be v=
erified
> > by the kernel and userspace using SPDM. As such SPDM data is untrusted =
data
> > that can be mallicious.
> >
> > The SPDM specification is also complex, with the 1.2.1 spec being almos=
t 200
> > pages and the 1.3.0 spec being almost 250 pages long.
> >
> > As such we have the kernel parsing untrusted responses from a complex
> > specification, which sounds like a possible exploit vector. This is the=
 type
> > of place where Rust excels!
> >
> > This series implements a SPDM requester in Rust.
>
> A few high-level comments/questions about this series:

Thanks for the review!

>
> - Have you tried building it with `CLIPPY=3D1` as per the checklist [1]? =
I
>   am getting dozen of Clippy warnings about unused imports, unused
>   constants, missing safety comments, and style issues. Series are
>   expected to be Clippy-clean when submitted.

I have been, but apparently running

```
CLIPPY=3D1 LLVM=3D1 make  -j32
```
doesn't trigger clippy while

```
LLVM=3D1 make CLIPPY=3D1 -j32
```

does. I have fixed the clippy issues

> - Most of the C parts have received more attention than the Rust ones so
>   far, if they are meaningful on their own can they be merged separately
>   so this series can focus on the Rust bits and the C FFI?

Not really unfortunately. A few could be pulled out and merged today,
but there isn't much movement there

> - I see many unsafe calls to C crypto functions in e.g. patch 17, these
>   will need to have their own Rust wrapper so they can be called safely.

Yeah, the crypto calls all use unsafe as there aren't bindings written.

This came up at Kangrejos and I thought the takeaway that this was ok
as a starting point. My next step is to work on PQC and crypto
bindings, but I was hoping to split it out of this series, as it's
already long and touching a few subsystems.

>
> I am not familiar with SPDM yet so I cannot comment on the
> protocol-specific parts, but I'll try to perform a review on the Rust
> bits. For this revision it won't be exhaustive as there are a few
> critical things to fix before considering the rest.

Thanks. I have fixed up your comments and have a few fixes I have
found. I'll get a v5 out soon

Alistair

>
> [1] https://rust-for-linux.com/contributing#submit-checklist-addendum
