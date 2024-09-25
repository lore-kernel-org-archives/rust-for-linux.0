Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684923A1BA
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727282393; cv=none; b=jyeekvN7xZ6/QE/WyBcJgCmbXP9CdQpnv5XzareTAPr8tJPjiNgAmaJT+nOHB4gAU92wL0lJkZeNI/5+sUanwGwPiJ58E6N09a6SPO3YVsWPH08b7UIFx7TdK2u4Rzm+jfS+Ri1mULMNM8Huju5wkktm800bkgITa66Sa5biGyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727282393; c=relaxed/simple;
	bh=/t+YSp2gvbsBW9hsAIIEsn2fOHY2XQVupxHXFI22op4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUBbAS/gOqO6SGZg3B1wzT5pfW4hh2XQ0qjfOy8XNhfPKf7NidwKH/x3dRsVGjLxYiRXvfhr8Z3+y83GQQ077o6gVYOI6g6FJLMp4RxJCWswQ+d+8iAUrBK9D8kRvtXgEChFdn6RAPsD6u5e/Tt6C6OcT5RHmPijUDzAnmu/+1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NDoRncHI; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NDoRncHI"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so8501241a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727282389; x=1727887189; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=NDoRncHIAzHAnxt9b7tANZyxC6DdkeJRi4hM13YX8PrwyrOmPUzMkSkfU7cbveOyNq
         zxK5x8ThRFkwUXF0VG7dWKM4i/cUV3alqpBbZtsdEfu8jaUklxCiMlMglATXCK7KC6VH
         R4SYMQti2nRgniu1Z0LQCa/fKT4uTyWJRGIa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727282389; x=1727887189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=DOhyrQhY8BIoJNCF+VkR7pBmUkYJtFlxW7K3HiyvD8U/Q9l/VL4sx4ierxNWykOfME
         dIe9FOonHb5S2GNuEbDdKCG5FclwjNzr5J/k4Mm+KzVhwDKuSBUW9uCJ3f1gaGoijufD
         cZKsY0nFdJhtJYxDNZBvEn3FafLwShNzgidsDaOMsFwnwt4aFEeS1/qfB8NDCTnmxC20
         D+TnjoYAwAAoamUc4GqaKdsF9fCx8HR2HmUdytGHFKxfdtKC/Wf1EPG0jTwue1ItZDnl
         XagPfxZHwbsECTGwDTLWtEW2d2kfAwriHDtkrghOavkcTm/K11Q3phI2eRgzXzkIkQsU
         ojXA==
X-Forwarded-Encrypted: i=1; AJvYcCXBw9jl+xjXV+5Fw25QYWCcRBk5xHf8tNoY+rydCztMHEkOxY6ooXb5Z8la+XO/z5NuiGZ0a1HLXv8Xwb4skQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjQWMCONXpZ7BKCsPqe+q7tm6idZdRUMeguQmOnciqF+nWO8y
	vhHa0E6db6npHv/TM6Lip1bsMr3WXj0E2ZPkWg+ju612KsrQbue0oHfoaTyiiJJLVpUCbEjl5yH
	ZvPU8OA==
X-Google-Smtp-Source: AGHT+IFILj9CK6gbwAYHjoNyTp7XhDL/MEM7W5+5BFSuGm7C3PlZx05qtHvZLcLrlw3t8jkW+T7f8g==
X-Received: by 2002:a05:6402:1e93:b0:5c7:2279:bccf with SMTP id 4fb4d7f45d1cf-5c72279beb2mr1247824a12.13.1727282389341;
        Wed, 25 Sep 2024 09:39:49 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c877715034sm88408a12.81.2024.09.25.09.39.44
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:39:48 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so4139466b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 09:39:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHzyHkiDiEdmzkDzg7NjJkBuL0QIP9GwPcpJMseDyveIpiQqdoVp4QRFaycYU7Z7QwoUEVZsuoP7DpjFc9Fg==@vger.kernel.org
X-Received: by 2002:a17:906:f5a9:b0:a86:9d39:a2a with SMTP id
 a640c23a62f3a-a93a0330c37mr309689066b.8.1727282382886; Wed, 25 Sep 2024
 09:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-44-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-44-ardb+git@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Sep 2024 09:39:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 08:16, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> Instead of pushing an immediate absolute address, which is incompatible
> with PIE codegen or linking, use a LEA instruction to take the address
> into a register.

I don't think you can do this - it corrupts %rdi.

Yes, the code uses  %rdi later, but that's inside the SAVE_REGS_STRING
/ RESTORE_REGS_STRING area.

And we do have special calling conventions that aren't the regular
ones, so %rdi might actually be used elsewhere. For example,
__get_user_X and __put_user_X all have magical calling conventions:
they don't actually use %rdi, but part of the calling convention is
that the unused registers aren't modified.

Of course, I'm not actually sure you can probe those and trigger this
issue, but it all makes me think it's broken.

And it's entirely possible that I'm wrong for some reason, but this
just _looks_ very very wrong to me.

I think you can do this with a "pushq mem" instead, and put the
relocation into the memory location.

                 Linus
