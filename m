Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CC82638BC
	for <rust-for-linux@vger.kernel.org>; Sat, 30 Aug 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756542030; cv=none; b=JgEY/nHuGkuloxk6PKWWgXoYZJvoIafJ4w1sqVk4kDskBXBXeIlpeMnChOm5VuMBBqA9AXrq7G8d4FYhhLNS6Q6ZUSnkXWI8wcHraGDoeW8qhpDHmLmLM8FktDbXpdPHaCaktpoqmH3KNHCisuGA2XWb5V/g6YVI2jF0b3z8dg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756542030; c=relaxed/simple;
	bh=jfwic21iXdfv9f+kWJrc4jhW42b7x/qaoBKAdUcheNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8d/RFz3sFop0s5cHIRlrDBpIxuDsGLjjFlvAlotjZ59oenNouncy2TIYwS7p7uniVHEjnkTcj0nKpLKnSGrz64KSUJD/nHoCpQP14aZXeqJBaEV5PRbJeiBA0KLxyQDPT7JtBpsglmFBXTIEe3eI7Oun33vJrdlffN5qtQQA8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4mHU23/v; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4mHU23/v"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b869d35a0so928065e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 30 Aug 2025 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756542026; x=1757146826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVRZX8gfqHXmXgSMNLafTN3D6+RIn7S8fWN/+084Biw=;
        b=4mHU23/vvJuM+7MG8OundS4ssns8ix7FuKVNLNUPJIumqK0krfQ0YuGVMBCr3Bz/vH
         De+wMcbn7zNHKiy3ySh6g8BpqMxVk8mxshL54DJJaeS73jyq/v1FRH+7+iMKEQd1R/Em
         J1vYKK1t+lZSK2hgFN28mNKLhZP5hJ7PJYCehkWZA2UaNB0nyO481xbkONdJM5+8grjd
         u0YpfjWA7FpWni0h6Jw/3fVpg2OrNCU4Oy6Nm+U1D14rjjDDH4D/FrCFFkQPNZSlzaxr
         lgdPh7GgrKQJP3j+JJZznM1VfSV/8o4Kltd/CCrpDmS0cW+zm9bxAARhZIGmKUKXu/7j
         tRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756542026; x=1757146826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVRZX8gfqHXmXgSMNLafTN3D6+RIn7S8fWN/+084Biw=;
        b=HKxJVVoaYJ0CntdL9XPsmu2zrk2DHJTfLMv1ZjgmGgQd55i0/a4s+NqJpIHUPYYjjl
         qtxW+5QkLelbLkY1IHie2aEZhUic9W4T8U93YJ4maotOZ8wuN8pE3fQWSt4KNpqNI5Ud
         RzdpXv1TSlDp9N9nCG0Cdc/eaaJIDoNzXUCDMZsHhx2ijZ2RH205XWBVZkoTVHhtd+Fm
         Sw0e0Q0p427dMH/jw4Tmb+S12rz2EE/4QNgLRC8IZqMbYaiBTh0CB8J1h9aFnFTDICuz
         GwUNKg0bwkn3Nb+4dvhbrj7GcO+Pc2tQrVuT0MoWp8+NWaW29kBZ+WREyc9rPVXLovQM
         hbNg==
X-Forwarded-Encrypted: i=1; AJvYcCXWhu4oGP9Ekiwg4Rzr4juAFBNevNKruXIbr0WuEOPDEdFaF4i7NkNjLhV+6KHQTVRujPU9dAgDS4T17HUkxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRK4e7Ly/4nlNatdZSx719q2Yp1T85tF7MQ7oDQHySaXOPzu8E
	YTf3aQbdwTGGR7XuotqmWw4jzSRY0De4RcBhIl4x4dv4Vtze1q61oKi9X/XKoAdpj9EVqJ+x0TE
	t+TkQBbqfLdPNVjEOrUBaLn6JpdeNN/6qTg1PkxrI
X-Gm-Gg: ASbGncuJ1+C/d65eVR5UApDJYJ5AONAkFi6+hjrhp1UCzPolkp6wnJFRqiQ5VzdHiJV
	8e7UGy45WfvJnh1RhKeHDCE3esM0/7opbWrK8PHTuVOBVjfcD3BlZIEl4XMCDmGUc212WzGgW0g
	SQ8ZrCBCLhHp71oZusdpZi9gb+1KMkDBQLPUqqqLr0DCtpsGgRWzjYiBCXFq9jP28W5U+L/kplF
	P4zTE4+wKoHOya/i8P0uHsVsG3NCud61SxWG4lre7rmMpg=
X-Google-Smtp-Source: AGHT+IFwZmvt15CjtRBMXS3ba4sXrdVLhakTA7ioEZ6mRlIr97gFZDb6PmU3GNINPLWasYRcQklNiQPte0kKQBSw4k8=
X-Received: by 2002:a5d:5f90:0:b0:3b8:d519:3ec7 with SMTP id
 ffacd0b85a97d-3d1dd81d9c5mr874305f8f.13.1756542026104; Sat, 30 Aug 2025
 01:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829195745.31174-1-dakr@kernel.org>
In-Reply-To: <20250829195745.31174-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 30 Aug 2025 10:20:14 +0200
X-Gm-Features: Ac12FXyBpY8t2A18cpyy_OZI4J50wC5f7-Yku2KenAqxmVFbxJgG5M3dy8RDWfY
Message-ID: <CAH5fLgjM9f1k0re72DKht5HXi11acn_fU-bd9WnEEu5eZrpwLw@mail.gmail.com>
Subject: Re: [PATCH] rust: device: fix unresolved link to drm::Device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 9:58=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> drm::Device is only available when CONFIG_DRM=3Dy, which we have to
> consider for intra-doc links, otherwise the rustdoc make target produces
> the following warning.
>
> >> warning: unresolved link to `kernel::drm::Device`
>    --> rust/kernel/device.rs:154:22
>    |
>    154 | /// [`drm::Device`]: kernel::drm::Device
>    |                      ^^^^^^^^^^^^^^^^^^^ no item named `drm` in modu=
le `kernel`
>    |
>    =3D note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
>
> Fix this by making the intra-doc link conditional on CONFIG_DRM being ena=
bled.
>
> Fixes: d6e26c1ae4a6 ("device: rust: expand documentation for Device")
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508261644.9LclwUgt-lkp@i=
ntel.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
