Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D316EB59
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 20:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718741273; cv=none; b=o1y0HCTUSdxWIlcOSuei/y5lHBWjEYr+s9vkPJHko1jmBjFuYcBn4bzYf4PCnGJwTAxAiipxZVGaYRkzbUNeW6K04W/MKk/oba8JgCiOwrx+yS1W5aeB8wM1CelJPLsyPlFei97Qqk9F4tLGs1/TsQoy7DRgB58NP66D17PxiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718741273; c=relaxed/simple;
	bh=GS+MYpzkl/bTjJ1KKsJRovOoqGznlFU6k1AlD8YflpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxcXQNd8Y3+G+2g0Q+DZQt6W+UbYfBcOyNgKrNvAtj0ZuLSmRlJIIm3bEJdMllYmnnS8BEsW2b+GP/PNOMtkRpOjB9vFuQ4TRNzmXYItFnDGLLupKCFgCUcYbaYKoHPik3RtsVRGUvR3u43CmCPETdGu0O9MCaZ34Yet4Yz1TfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0pybXPiM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0pybXPiM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70625e8860cso620928b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718741271; x=1719346071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DW1DlL1DLq+3wP/n1jncS7W2woNiKogvRNYb00e4Mms=;
        b=0pybXPiM3J1MqqjuPScK3RK7ekLiueihWGIpp1gjS6A5wGiwogus8wwh4SI5ZTrjOa
         pk3LaCBp3IQZCr8HsHObErlFY0mF2o5rmOqXhKfQLqV1C3HuHsJhjGbMxdzwdnwVmspH
         dzCGvZm5exO0QjkquuxNTszixpxwYTXV9jIrNNlCYx3RBuCthCwm66Ioi3hIlhi01SD5
         dEzyIaswibyQc11Pk+5pLcYIGFwIjGgUnJAa3d1jueNx8kMgjyRCY4P9JpM1NA7Fuz0K
         d40YdaNDrI2oio9X8AZ3Umb55jawLfsHnAc2uFjd8DUyO0sieg3TZgju3BrveD9TfMAR
         Xu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718741271; x=1719346071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DW1DlL1DLq+3wP/n1jncS7W2woNiKogvRNYb00e4Mms=;
        b=POxGs7t8hf9wJT/NO42ciI8/zfTYdZN8kQ18mI6cYuAs+MF2J7nn6Mr2JXR4BAp4/W
         VOMssh2F6ZSJGxGy3mb6Kxcopu8j9V0C79VMsIdoWUy+AW1kY7JGTc8+7/TyQJ+LIkqg
         /Ewe42zOeHS6L5kq/Cs2mqyV490roYcBjLPcHODPKLKou8OXI7XyDCZ3yKrKL1wxavmE
         hAn6Q+2lqrYkrPB7Xy+JWUSHpiVChu3cZrlkKnyKXBnsBmTuXDiZ/eQ/m0SBGHfwPfEq
         Hj5g2GDjg/aTnvHKxifoWMjqRczPKkgcY4EiNoz0uiUP+4ZwSwluB+W/P7E0MpTIbhPw
         xlSw==
X-Forwarded-Encrypted: i=1; AJvYcCUi4A306SfDqOmdMKUjtvYnyZxWJ0gOhjSgJntGS3dPqrdTwagiJJbo+y0BvLXPu7rZJHRdlHOEQSswd6hqsAhvudBIdVpZeAPBPXUD8cQ=
X-Gm-Message-State: AOJu0YzhFM/LvEK4hVntHd2rnv1Foe39YK6RPtSgM96yxUgjB4AjkSvg
	ijqW4F0fYXEnrbC0wmIkQt7p36JMkXVjWUEMFqmqv5JRXf5upBdrg8LM1PVq3A==
X-Google-Smtp-Source: AGHT+IGBxEmS/OHXtQQIWsc9ie2qVIzWvAZxfV32t6UbMfyp2e8b6CplgcXOur2GKUnes5dpMCsXtA==
X-Received: by 2002:a05:6a20:1aa7:b0:1b5:ac9b:a59e with SMTP id adf61e73a8af0-1bcbb55fdd0mr544609637.32.1718741270996;
        Tue, 18 Jun 2024 13:07:50 -0700 (PDT)
Received: from google.com ([2620:0:1000:2510:5dfa:e7d1:8470:826c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fedcf35688sm6992723a12.13.2024.06.18.13.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 13:07:50 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:07:45 -0700
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 13/15] modpost: Add support for hashing long symbol names
Message-ID: <20240618200745.GB1611012@google.com>
References: <20240617175818.58219-17-samitolvanen@google.com>
 <20240617175818.58219-30-samitolvanen@google.com>
 <CAK7LNARL-Mtva-WuU-uktZsN3y1zyUNnFnZ25vRbQZ6M0wK0-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARL-Mtva-WuU-uktZsN3y1zyUNnFnZ25vRbQZ6M0wK0-g@mail.gmail.com>

On Wed, Jun 19, 2024 at 01:47:13AM +0900, Masahiro Yamada wrote:
> On Tue, Jun 18, 2024 at 2:58 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > +#define barrier_data(ptr) __asm__ __volatile__("": :"r"(ptr) :"memory")
> 
> 
> 
> 
> I know this is a copy-paste of the kernel space code,
> but is barrier_data() also necessary for host programs?

I tested this with Clang and it worked fine without the barrier, but
with gcc, the code no longer produces correct values. Presumably this is
a load bearing data barrier.

Sami
