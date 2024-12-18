Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748C1FBC91
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 20:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734552878; cv=none; b=J3XdG/6TTTrI/gS9/HfgM1q7znr/vNbX7yly5Y45bV3Gmi1ktbhxeF13yDnhJupDIhFXy49FQHW4WWpfgF70EZKZyGKV8WK/GXS5GUBXPjpY20MzdcdTxVc02m4YTiCBbLlUvvphmKU7cCaCOuNVXqQIqyR52jBCpIg/KNkUzIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734552878; c=relaxed/simple;
	bh=7dNr7PVMfvxfqa/GfJ4DeYnssiH1+ilaCxXL0BcKsD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUKcrJ2ffhBu38uW+uXs0xqRnAUp8LtzhwNBZ6DrcvpH2X8b6Ia+MwwMN9jhmFFrlr0UtUq7OWu6vd5WFF+th2Py3rWKbL0MK63Ief8r9kApQJWNYh8N1XvXFHmwWh4TNYwwFLMgheAYXyVRr5a56DoupWD6bQJTdb3GDy4Li7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQ+HtNPX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQ+HtNPX"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa696d3901bso6653166b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 12:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734552874; x=1735157674; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18Z0w1Who/7yAp8ZAxmVZeylugNFrK48gYJcJx6NFFg=;
        b=KQ+HtNPX5ImLA8KZzC5PRfuqBibImxDAUneDfNX9I/nqJ6OX2pbxlEf5D526dse0ID
         hyi82s9cYZxZ9y7nKt++OK65EmmtRgNYRlVr+tc9q0E0YBrcW/FnV3yFhCxhTKnUIPeQ
         jZUDfh+r6BvR0JS5qTwv2hjrVPbSDYdRYYJQb8himSE2nxSf/v/BGbAlT/IKcFfwxX3J
         S+H19FTF2z7UTm+DfprpU/GS8tQAgvPbV/JSmU3Tpofa5/Owr1YeCYZtW8Td5o/xqDtS
         H0zg4L7eoVonbLhOOtmbyanmlEewwcEBze1/QnoPiWSZ9xWFhS+hifiajwgtnencvBSM
         pVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734552874; x=1735157674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18Z0w1Who/7yAp8ZAxmVZeylugNFrK48gYJcJx6NFFg=;
        b=YU//Tc3MQ7Hy0aCGrrG0IeSJtmdp0LKLeC3pGKX9gzPfy/SS8XL9nXE133+wFilF7i
         qftUD1ihflnyaNV9pHbSDspBMhmV2J12ujVfMYiXNP2ecpGWf/6e5wpHYx+3ojV1Ffff
         Ank81CZ++lEFjbPfXIQMCRmBSevtB6FOYBD3ba2BQg77NctDu5Zq9Qpl9hO/Hm6XyjAm
         h5ihr8AEbSei3f/1FeGH6eGqr4sK0gB+BfYpToSDUhLwzwMmlAstzjZ+6TjvRHtm+Gvm
         ONtiAWDNps4wT9f7buIxoKb+6AdM8IhPjxutY6FRbGCDxEtXBgnBsk9I7rGNtT6wgm7m
         iVOg==
X-Forwarded-Encrypted: i=1; AJvYcCUPvLslppNskdiAdaafGkE7dmk0J1Y5T/2mx/Ic+vd2aK26eQJGBNf2mt6Bz0xsMFSxBe/4xru7szWZf3foUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHv60V8T3bvN/rNmQMqHmk+zgAtqgnQf9KLGKmwg3NsAAyxjo5
	K8TnT69jiJxe6APG6tED/ZrmX2dOEPkVCLDcSBbFI2Ij8pkIpm9D+f+b8n1pGqc=
X-Gm-Gg: ASbGncv7wB67RcAa4W6/pfqYDkkZ7oxOPIbKOYjXH+pyvMM0n12oE/vumsOYaBFoX/U
	bf3ltjlrMP42TP3ztsGrLsL77itTmETtCP31xh03vSAFOXJ43BIhrpij9h4q5s7C/li9xAzI/o0
	V/tHXUh0xhaQT/L6GiESBte0N88L5K545QAp21rZWzXXnyenf3bGckCjX9qxgc/7fVE1bn7k0zd
	7lpBq4eGhMptxju/M76g4SX00FNtdlwQUNMT7UPHzvf+j5l+Ph03kM55TB70Q==
X-Google-Smtp-Source: AGHT+IF8mqA1Kw4thRIwwxyKQ5ozfljMJxh4fclA5Jgz067UuOdi676eLOku+tRgYXvDYGh61avneQ==
X-Received: by 2002:a17:907:3e0f:b0:aab:9257:248d with SMTP id a640c23a62f3a-aabf49080b7mr408462766b.57.1734552874438;
        Wed, 18 Dec 2024 12:14:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96088154sm588292466b.90.2024.12.18.12.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 12:14:33 -0800 (PST)
Date: Wed, 18 Dec 2024 23:14:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	rust-for-linux@vger.kernel.org,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: arch/x86/include/asm/current.h:49:9: error: call to undeclared
 function '__typeof_unqual__'; ISO C99 and later do not support implicit
 function declarations [-Wimplicit-function-declaration]
Message-ID: <9fa81826-8fa6-47e4-a0a2-4916e5d042a7@stanley.mountain>
References: <CA+G9fYuP2bHnDvJwfMm6+8Y8UYk74qCw-2HsFyRzJDFiQ5dbpQ@mail.gmail.com>
 <CAFULd4Yw2RWVmQQ5tMy_DfY+9aPoEYBsGDBMXdP3HDcGH6dgsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4Yw2RWVmQQ5tMy_DfY+9aPoEYBsGDBMXdP3HDcGH6dgsA@mail.gmail.com>

On Wed, Dec 18, 2024 at 05:33:24PM +0100, Uros Bizjak wrote:
> On Wed, Dec 18, 2024 at 5:08 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > The Rust gcc builds failed due to following build warnings / errors on the
> > x86_64 and arm64 architectures with selftests/rust/config on the Linux
> > next-20241216...next-20241218.
> >
> > First seen on the next-20241216 tag.
> > Good: next-20241213
> > Bad: next-20241216
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Anders bisected this regressions and found,
> > # first bad commit:
> >   [20b3c3eccd9361c9976af640be280526bef72248]
> >   percpu: use TYPEOF_UNQUAL() in variable declarations
> >
> > Build log:
> > -------
> > arch/x86/include/asm/current.h:49:9: error: call to undeclared
> > function '__typeof_unqual__'; ISO C99 and later do not support
> > implicit function declarations [-Wimplicit-function-declaration]
> > arch/x86/include/asm/current.h:49:9: error: expected ';' after expression
> > arch/x86/include/asm/current.h:49:9: error: use of undeclared
> > identifier 'pscr_ret__'
> 
> __typeof_unqual__ is a keyword in c23 (and an extension in gcc-14+ and
> clang-19+).
> 
> https://en.cppreference.com/w/c/language/typeof
> https://learn.microsoft.com/en-us/cpp/c-language/typeof-unqual-c?view=msvc-170
> 
> The compiler support is detected in init/Kconfig:
> 
> config CC_HAS_TYPEOF_UNQUAL
>     def_bool $(success,echo 'int foo (int a) { __typeof_unqual__(a) b
> = a; return b; }' | $(CC) -x c - -S -o /dev/null)
> 
> so, if your compiler doesn't support this keyword,
> CC_HAS_TYPEOF_UNQUAL should not be enabled and
> include/linux/compiler.h should disable usage of __typeof_unqual__:
> 
> #if defined(CONFIG_CC_HAS_TYPEOF_UNQUAL) && !defined(__CHECKER__)
> # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
> #else
> # define TYPEOF_UNQUAL(exp) __typeof__(exp)
> #endif
> 
> Can you please investigate what happens here for your build?

This is the bindgen program for generating Rust bindings.  Tuxmake is
using bindgen 0.66.1 and I was able to reproduce the failures with
that version inside a container.  I have bindgen 0.70.1 installed on my
system and that seems to parse __typeof_unqual__ okay.

I don't know how bindgen works.  Maybe the Rust developers can comment?

regards,
dan carpenter
