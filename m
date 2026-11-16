Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821305;
	b=E0GljROnQxUqcSu9xKix+lExfz/Ofxa4GBCQeAW5cBs8HHMgpBXeKF6B+eJqh9S2HtVH
	 g4tGMrxqozA5GkYWf+lIBcj9VDtXht8nlUUbFp7/lNNe+O3NdpAK8T/gr+hgtIvxMe5oi
	 fALW2Lm1Vx8SlP65YFny12QjQsIpyWWygiDQaWuRnOh/BKFEO+78DHhgOj1aXR+4ev+rw
	 sdXnjCN8C1jeVkSS/aLjwAUfIuoWYDNTcZFqiLAI5IyhBJyt5j1BqsuWSrXKjTKNHtxwF
	 xP5bxK4zpiDixYDvQLCTqKjt0HLdMPImTocllU2Dkziw3UsoAVi+2uPf/IN818hgpdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ck90Ja76i/8lWIveQHIjZjSAi6Th5hdRNv6kbv7cOjM=;
	b=3+MjuJkqPjcOqx5hXxYOD0sV9Uis+3hx3AKRKNtTq2Jie3SHAm+Cxn/qtWMHz3/N2uSZ
	 Z/wZmTj2BirRxW1faZ/oR9waDlbMs6TmNyH4dSxzwycgmpqAZtTi73rh11sMejD+IL2kv
	 +mCPadiwpVq3OZPWTfZluILEm+QC15j/crGXUa/rfeeyE5S8WL8H3kVXIe89jgD0UTo/i
	 OZHkWsR5KdLtWSXrpdzAetKwDVMIKb4v0+Hnzd8GcDIvIIcE4PeV+GHC7CUmWQq5GtMXB
	 UyXIuDBBmS0Rt/59iTPvUXOnJPDaH8BoxikVfv6x8RVhr2pRdthe7K1dA0k/ewLqMMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIlnNq3s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88919606A32A
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 09:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88919606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIlnNq3s
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c00c727a21so210645e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 01:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794821303; cv=none;
        d=google.com; s=arc-20260327;
        b=R3JlRSofoAPHWQLRJRUk6DT5c5yRGLH+AKT1CtglHngHOiM5QBFYMs9CB5h8OKSQBd
         ihxMdIkku+Cc87SRa4+ETiAfhsjUROc2AHt16LIRqVnTW9QHkUa0WUVPFXMkD7X2k1pu
         yrC1fYkf4CksAU1z6Pj8MWC1dc9n2VMBGaRG8etCeY/GVxZMBHyslOElNcOFtzl+YL0B
         e2mOTgg3yUle+Rx+FkGjMhKKGEiPpdj2CSwqCPAvXLEd2jMGbEgo39iQJWQrj2kMdZb+
         EjOisOfnMHHGmbw582sAHDMSwoNHWz7RPJ7M2fUoXxazWU6Y9HmBFVS82pyND+yPtDmb
         vMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ck90Ja76i/8lWIveQHIjZjSAi6Th5hdRNv6kbv7cOjM=;
        fh=QzCopjGs0B8xRBVIi7d6KcgEMEd9yHFbuJO9yMXy5dY=;
        b=UfVseYG8qULfZk3ZB4msKELvkWSYZ5RXcelvTuGm5dfSdXucYQ/8/YS8Y2bLlyYLFW
         LjZtwWWKosCUS6AGT5IXA+rcZspqlVCf+4DPIrektNGwlzwxJW9G9UpNWAZA8KB3bkbC
         m7M62mTpdbuDz5/jTy+awjxVMxtVAlNdvbwy5qFQMCRIm79D9XirfuGWju4iquM2DLdP
         y52x49lOmapkXCvj9nPJWdm0r8FLRGNLEZmam4DJhuG/+kCgKjVuqKGT7tpuH+NVXYXT
         WKHZkZfAzUGaxQfNptF7+PukSxnVfzz1h5IWyb/6llJ0wRw68mDagJVazo7nwyhG21H/
         UqVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821303; x=1795426103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ck90Ja76i/8lWIveQHIjZjSAi6Th5hdRNv6kbv7cOjM=;
        b=AIlnNq3sWtmeGAfjFpzBQFpa0xHgKF71/0tJ6OC1UiXLm167IjJ1qN1Sv6o3v5l4dl
         Brk38APQ5UkqTOX+jcBHmmN+M11prghglr708nx3aQvU6P69rmWfoc7EvAWe1M+FJ1Yj
         GAMioZ1Xno0vHQFE/deUYiXuRdjcCBhm0kUmIeR5WW9e9Iz1/hpcfu+Y8naAsd05eQLP
         tPLjTGmO8vB+WmzutBP6n4l4GJIJcVnzLzWRl/9cOMLdXE0YtDjQeXkfRHsOAEZLN8if
         rt/+uhNEQAinHeee2B7+daV4dyMX0h97RFhhSall+MGuDKYLGlv+9Ugh6OHLmfBqTQLe
         Gukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821303; x=1795426103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ck90Ja76i/8lWIveQHIjZjSAi6Th5hdRNv6kbv7cOjM=;
        b=PsqxyAR8JJ0ruC2hNuPNmMAgVlO5WMhzl4bi/1C+5KEuZpfZS7pLhzmSrIHSd0LvS0
         SdPZ9jgHh/s+eF80Rtp1W11uNggUB+d1K4xMUWpB0q0N4Wnf7rzjMUvi1xf9CCGnJonp
         JagTF0c6emIR2vhsGsnAZ/+7si6Og2SWXdzFrFrhmvTNQnKEbhA2jz8tpYQRL1Y7u+nY
         xkgOxEQNa+wftpiHaukxyulkWeC6YCl1F3ho0WKoBM2n+P3mya/4uekEtkPvQTKsm8rv
         a6+QG+5RdnYw/vDdznD7e427M7+daLSDjxl277SY7vu/+1EJXcCEsxC1ih8CcYGqYvJ8
         eabQ==
X-Forwarded-Encrypted: i=1; AL+hErH+Z0IoszXzV+9LsZ5BvZOkf8gkh2QkZ1xSIdTD3TI5lGZq0XQeNimE0VFdBXTQgY0yjofDHhk8BF/SgE5+mg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/jadde4MZcai5uoghvGfeZVSj6l6r0AONSO1yxIeb2lJIJGNr
	q75Zql62qxLYJbuwdTB4vkPd3Tlk5A7nKkLeRg6MsGxCRURQeq5H/3OR+TFr7rPPsdf7AJjFi02
	uyQQ7aFA5XBGWfNqhZOHWWkJoFlkrrb0=
X-Gm-Gg: AYBFou3pVpFMmqjqIDtFPqcf8oEJnZNUn4eMPSkTI3HPw7QTQkacgxHdK8u4KrkoMvh
	ngiGvu+HKQIBc1WpxIekbjsvJozlmZmSKE5R6+gXLUK9bF/tSsUopIHBQ2nGfJUeGlHssNslTeV
	b6EujHks+lIAQ0Ett9J0ylCFuzrKlygldYjwrr+CApC57iUwT4fxFeTlo59ktBSD+7/WJBPz9Of
	TPKkiyHu/3jXH4UNTb5dFCSCj7OaWPMAaDyfs6aPDg7si2IFP/fXRUFXIgiBjT5uEeJREPmgkRE
	Z60D69tFmFwLi70vgWMvmYxSXnawMFedVURIZtPKwj1h0EOhe1e+ilXEkVkcb96GBm5iZU6xZvi
	8Oiru1s3Be6sUjHR5yw+z1YuqGSQzqlGtZkWGiN+odS3K/2werIqJvsJqxUxsb1cP2q+PqQKo6b
	2af/iKmgwb/9g6I4cM/O012tDXWB0CCwEFtaFmPyf7EepJLEoH6H3Vzuhx7YH9l0lX3Ujo9qIkp
	uiICCMq6owsUuSSY67mG6LSoKMkk8AwaXv3xjPQL8Hbgcaylt9ijPpmmXHEhUWLkziC7C4gJFs=
X-Received: by 2002:a05:6512:108a:b0:5c0:b5c:4084 with SMTP id
 2adb3069b0e04-5c1705d663fmr4451137e87.1.1794821303323; Mon, 16 Nov 2026
 01:28:23 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avXdJyqNNqopuH2_@ashevche-desk.local> <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
 <avc-fQWSvmtHhtCO@ashevche-desk.local> <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
 <avq_fOVO4dina23a@ashevche-desk.local>
In-Reply-To: <avq_fOVO4dina23a@ashevche-desk.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Nov 2026 10:28:12 +0100
X-Gm-Features: Aa3M54r8jDUBL9-W_6ysQ9RsXI7srtGqUzJ6kqt-NYARrfePXpS4XD1GBsJdusg
Message-ID: <CANiq72mWNJ6qpxUrsGHGiRHeqb=uHMzqEuYLOkK50i40T=yHNw@mail.gmail.com>
Subject: Re: rant on Rust in kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, ". Boqun Feng" <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:32=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> You mean for the in-kernel builds or in general? If you are talking for
> the former, this needs to be fixed as the version  we supply via LLVM mak=
e
> parameter (as you can see in my command line examples). Another story if
> this is broken on the clang level (but then how kernel is built?).

Hmm... I don't understand what you are asking, sorry. Can you please clarif=
y?

Cheers,
Miguel
