Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD30B3A3E7A
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 09:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368744; cv=none; b=BJeRprNsueez4+twvMZkxuEd2/Vo96XbjG6iZ0aN3oNFd91/iD3ajvXI82HIGwd3Se7rCi42bJyl2NZm6zFF06omFDQIQ8rRxZMCt+fWBh2aKSZyOXCl+bKHaq9JYdHWTRyWc7C9qns5pNZtJdzVwSObbB8fmvcKgP7YPrZM4x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368744; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kN1EajgAUfkwey0IX2Wmkt1p09ZJX9ASua0qSSLK7b94hQnkZrg56KonyK3rHTY2oUKtC46PoDF4D6or5V6u48HdE9H/fhh8Mul80QieH84VweHvvknVNf8Mk/fJUKpSK8hSWSugJW68jmxrRSSqnyL45f/WDIYFjXR8Ne0ATaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b886fc047d5so2003005366b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 02:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368741; x=1777973541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=SO1L88gRoHQSmh9cwoqTW/pQR99nQbkqAzp25SMYWl34JLp3qEJCxXXu6gedusvAvQ
         /PVqOQ65IjZ/xj2AYF8bGy5J0JOX1MpBjFcYetdIlguCM7CnFKFpzatbCz8Who8j0Te7
         WBTIAP0hWjCeOT39f6rIAY7BZMvW0m8MftSi7f8RYb6FXLQuusyhbtLIRuCn12jcnxC7
         uhFdMdys4VIe6kw1ErFZJYaLY9UkSG1e6y2v0RkHd20/eNUOOyC2Jw/wfi5pxoYmwnj4
         tiMS+iXlRStcmRPWsKRnHLisYASHFWTKVOjs6pLw69Pdc16IYeBqGlQisQABt64bw5B3
         i8zg==
X-Forwarded-Encrypted: i=1; AFNElJ9OhVK8XbKO7p8G15NShir+lcK8I+w5GZ0fK7tFRkY41w266KsT2BXVZoFaqN4Ocr4leO9qfa9PSgpLLtPo1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuS1x88cNQ9xsJo8z1GOVMdQ/Af6JhP3HLoKNwTU3ojJ1hd2YG
	Uqjt5dT8ZX3bIGhN6mpEroeRCrt4Owwks7EcAkhX66CTzYc9VQhxW7ypWumricQ+95g=
X-Gm-Gg: AeBDietzeteyPRmZTQv5x+xv06UThbsvv4xqizZY1n2Z8Hwf+9RqGxhkCyktdRh9Hxx
	56PboOd+bP083gbUWAnWKjS246ZMMPBLrryqpCRhfCchl9G8fvenMir6Jiar/2j2EzUseRpWqJl
	+JYgNxakP0zAikgITm/UoAHhcybBHc/0oa+iC1LpaNt5SVPRhUfXiqnwKqLlN2t1C/F7f6+gjof
	LMDmhVl5SJMoWEUSNKtHCWBmV7rg8TUMYtW8U+4LWmO9i7zY5dYrDGmmsq9OwvaFUKUbdlusV5W
	MlN22KmxgaJIvHCe4Ti7+PWPpAL0Hjcm5hkEtHeukkW1iNKcxC+C+4l77v6Tl9yxJurCifvq+tr
	fnJyGRegeR7Xtd18G2eeHTxGlFR19sbBdM2K1tOQIWvsnsZ1PhofzIM8xdSHvdoBPh0vDtxqHft
	7BKXjyF6QUv6NazGCH+KjqN6ZC2OTtTzOSsQmFaOT5huH+yDf8XBjbkfFYAd1rIGKq/Fs1/Ek=
X-Received: by 2002:a17:907:cb06:b0:bae:9dc6:607a with SMTP id a640c23a62f3a-bb8020ca244mr99500366b.4.1777368740965;
        Tue, 28 Apr 2026 02:32:20 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2add0fsm73138666b.34.2026.04.28.02.32.20
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:32:20 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so7379666a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 02:32:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QrTxBRNagYe672iTsIFjf5LFXBNEmCBskzEkIzUKegVu8IJdW530KG9zLbVKEvl2oUVe6l7p3GeE941l2vg==@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
