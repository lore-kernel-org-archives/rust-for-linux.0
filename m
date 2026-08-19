Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56BB3F329A
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133743; cv=pass; b=T4vA043g3OEJ2VYOBqIrPe6aQpL9ucJCc3EsBgFhbabDX4aVq83+rgu7Cza7zxEarx1fvQapeKKDuDr/rp/bYreyYKROZou0cPjvUgRjs78gKgtFjRRrSKfmpx0p1IEDyZATmzZuxkJFzfFdmlbctWCXAX8H9LO80+HROq5ccvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133743; c=relaxed/simple;
	bh=e/ykeQ5QUSsTkkdxsh/CxYBDe9VSjwD6RqDbgwXYXlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cR3gykcY7+tKKPHY5ENa8jklEhFTRKk7hC32VnnvsbNFjoxqTLdSugGex/0wcxK1UcCgnHM8KJZwxBKvLEqWCeo1p1cVyHlTbqmAmmsye60ARPbidrHjJcOM+itaeyIoJ6oiXQfyyZm+umPplM9VhfqbyVredXstltDFNpfQ3GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlkAlRmf; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlkAlRmf"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2af9beee4so127843e87.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 03:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787133740; cv=none;
        d=google.com; s=arc-20260327;
        b=RNxfP8QRmr4ABsTlmaj2LNXzG7fIiRCqXg1RDMj8ndU6mYqeoxtUW81Igh7y0JrxUO
         GyCcQv7dEFL00QEiKAZCc1NnvhFlpK9ITC6iy1WBCgGq1sL/TFWQ7X+gtmNLQzKakCrt
         eDM5icorwY/Z9t41RtOCcwpWQNu7P1WGMyro0HQJfpmf0hW/V5g4AjCW4BXEp+EbueZo
         jxiloE0XhWZ7BMNXqTzlnptjC9lDiomRiUdAhndEtu+On7c2zQYXmNLBMY/Tv564bNW6
         KyXPm7VUWUI50XYWerruASrSZUvRWk2eh4Gbta99XeBCT6eCeIivU59abjGNSoDNz736
         QPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/ykeQ5QUSsTkkdxsh/CxYBDe9VSjwD6RqDbgwXYXlM=;
        fh=YNOgwN4ES3qs+AeiIpCQ/4ONlG8e1ekflYswyB3BcG8=;
        b=Qd7sMEPdie3Eylpjc0nqhETD4t+8lTpgsVIDQIMqV8+saewe1FacLdh6988ehGZAQC
         xvB4Edir018pvLqSQmLt7BByulJzQ2Jay0dcAuPE3oWI3mLSraeAGA/kyYzPwwDxsUA4
         Gd+hm4j2CJ5NOp2AMnvUc1LfNey8L+rFyufIuLw/pbHLcv7/0TolapgpHkfn/7aaIqMQ
         TWKucRGOmI6MVlrpbBPg8zu6NORl71WdoVVqZX1E3Y4uszuR0E3ZiWsir66Nz5LRoWSI
         QHZyOKXOnnp69d2y0SperU12dSk9KTZYCPTFKuiW7eozJk/iyzlHep+dG4CE2ZmwbHdR
         f/PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787133740; x=1787738540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/ykeQ5QUSsTkkdxsh/CxYBDe9VSjwD6RqDbgwXYXlM=;
        b=GlkAlRmfIxmI9f0aG+0emylS0wIs657AK6xb81YI79pWmKat9VK7icm5yegfmfM3R/
         HxmFwKomCg+qya0gCisZ3LHyIKxUWLHt6iGivuWSISO6ZHeNIkXjRJ6BG60E98z7+T2E
         Ni0qrMbBf6pdHxhMv0acyZpcXTS/fksYQeM6tLl9v5iL2gTE88vE+ePEFoOmS1pT7lNj
         buATUbQeKKTJTh9bT137nx6oNyO5iX7mvo6hfaDsr+LuCYX23rp3GpKHOLXcnWxBqco2
         fmVk4tOKmcAydU31F9NUK7n7O94YKx6wtRclYFlEU8oJLbFi7aLjFzdmwyBjW2ZtJx8r
         ryVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787133740; x=1787738540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ykeQ5QUSsTkkdxsh/CxYBDe9VSjwD6RqDbgwXYXlM=;
        b=Lg8Q7/7LDVlA8l7TiP5yBa3sbCO2WVXrhdbiCZ2PXUygU3Py6E1YoPjB98pxmhrJb4
         5WEl7ofcIUIKAKolbzSPWtT1G+4YjjnZv+O0UqXPme6uSFm4S3rfJ+wCpUdKEtGwIJY6
         Urv2AuITn2PH3IgrWgQBqomgiPaeei+mykqHqJK1TSL1Uw5p3wb96K1yJNT59iKZmkpV
         4JEJb50pmFB4NOZXy0KGHZy7DiN8Ts8UoSEY3pOCEw+BG8iTTlv/TMZ0/kRGbMIXVW6D
         q0Mv46yS1RzAmQx4OyDS307ovTmHjdJbU2llkODm2sNjdCqzuLzmZCQaMsBraTRR0bLA
         Wd1g==
X-Forwarded-Encrypted: i=1; AHgh+RqOD7caW/+3DMyBI9TKDiPVa4g0lvW+zzlNTqll/W2aUkpEL/KUfKf64icgNHj/vEe7gLMREbVXHjrxSZKZhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZBtt3PUiWwj2XcotftY/OU+P/ORYtEKJQvHUi8/A0enPIqbF
	GDJzT7Svuv5SUUjgM6S/el0iTJxcVbZ+p8z/kdq+ggadDIUmkeK5CBpKQGdk02niS+PqkoAu3ny
	0Obj5JlpFqFnj8OwjP3HayqS8VxAIRJk=
X-Gm-Gg: AR+sD11ZfxyRDEp3WBdjlqLR8mDXahmN4AxI3x44wYo0lkmvi2w+w+3VQMOSxltTl+F
	6VfemnYnPO6WdxpzDr3BFy4RgXZpOugkDOqcJVYVRpT+G0MH2efwKSyP1H/budlA/3zUgZoGTyf
	DMfptrFvbYxk4Wg10ozSfu9B06v0ymicOOv0gR21t+w/eaWRtRqMw3CEL7y2MLcAQ7t1/JQPwAu
	6IeTAZFPWzoHtYk45AtwP5WDX8cv2bnTm5OMYjYx0CBp1Iw1QbEO10OiZ8KxNyMVDqPdwfUrSRb
	kC9BPFzNM/LRh5/EHfqgu9D0Avg11Dz1g9+pH9zCxxZVQ4UE5W40FkIAsb9oeDPuE8Lym6Yjw/N
	9NetMs0Y2PL6u++AKauh5hp5Ediw8rwjjTYawK/WABFFbb23flmobgWZ50+Py2SyIOA==
X-Received: by 2002:ac2:51c6:0:b0:5b1:5e89:30f6 with SMTP id
 2adb3069b0e04-5b478bcb669mr579903e87.3.1787133739473; Wed, 19 Aug 2026
 03:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819084825.969116-1-mkchauras@gmail.com>
In-Reply-To: <20260819084825.969116-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2026 12:02:01 +0200
X-Gm-Features: AcwNN1Vu-RuAbNdoDEw2XNogoKXdWs1AZbTUBC5VtWKX5E0dSCywjtrmuOtTyPU
Message-ID: <CANiq72n=C68iaxuLVR5dbuBpf2FLMGwH8wtB+d5sNgOTv4BQ7A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, thuth@redhat.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 10:48=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> This brings powerpc into line with x86, arm64, s390, and riscv, all of
> which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.
>
> Suggested-by: FUJITA Tomonori <tomo@flapping.org>

Should this be Reported-by?

In addition, probably we want a Link to the original report, and a Fixes ta=
g.

Ideally, please include the error message in the commit message -- it
helps to triaging and also to search it later on etc.

Thanks!

Cheers,
Miguel
