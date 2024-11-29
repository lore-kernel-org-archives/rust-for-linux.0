Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF0176FB6
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732886104; cv=none; b=VFhy4Grfx0o+I8oehr49kNJU7b7too9yUqXhVe/f/lMV6F+64vpBScBUVpcLaSa/7foeFwzyH/tsDxNSbklHMOO5UQvn8iETbsr2AMMMbxgUJ5q1C7wcDc5l7mXfQS1X5vQ6xgrby7+LfyiolXETdvn9ob8EPC/pYsefID1lzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732886104; c=relaxed/simple;
	bh=e1RXw+1c4z1o+W6YgpRZ2gIT8vTvGguo4hBBt5J1q3I=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=YUQ5kFIoVNemEWSDvmceJa6fi7kbxswylhigR7ZdOHenifpKRRLqIONrwpD3WiHmhb1NRFYv/Jo5HWMgFxQvivEqqSUvnwNHqYCZGakjBUzpAIa1o010EXMjYH17RbrHXmqxT5ocfaRLhseHVfCfbNDx7Nv2+wxkuvSZ4URZh+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=f4tov5Br; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="f4tov5Br"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d43e034ef9so12837326d6.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 05:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1732886101; x=1733490901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kskYz/FkTeEjBmApiordoTHaSIRBvZ4RURQ/v7JHJjk=;
        b=f4tov5Brd71cNMeuX+Ocy7a6WxDvBwhqlmOoiH3j3Y2bk4kwJVVdhrOa93rl4aMDrl
         P7KC61Rwz0cA1Tt08q7cc/cesnfrea3Qfm9A7XS4VlDy4dbxA9W5dkaNsLzL1ud6MR0l
         2BtIccKF7LLLaEnF73N7kKtrP9A0aMqbYO33pvJh+CTZk1YRxC8qeJQ2CDhATTvWCfHL
         lEgOWIPadSfOppNUvtJVf1ZO9EGwbcZAffpPzVaQFJ41FtuT9XnjIGP70bhCdcTER0W4
         4AhMUh38AStyKvx13mH0fiD3B0aAZ67psPmrjVFOtOlqiRhoYd82uZMOlY0a6UD9aH4b
         kpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732886101; x=1733490901;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kskYz/FkTeEjBmApiordoTHaSIRBvZ4RURQ/v7JHJjk=;
        b=ctRekUJBdBd4aJDiDDCR5sJIaHYm7ZcQN8FhJX9Yyb+CMsGv+Mz4tGR0PZTvyqLIpM
         Q1HVeIj7L4MWEcioqcM5iueXVrREUD2Wl42oDEFcU8hdZxfnmgiHrsOqL8iyum9qlBTc
         lfs0tnr+qY88sMpk3VcukEWxCCfGGTbAifW4FkeaQrOn9AK6+gTS4UAelEzf7wqoXpnm
         kCHISwKFG3ITL/j4k28j5Jh1Xq4V+Fk59Xw2B4vBo7iaC3pwJXlnIy5mQDxAunektsWj
         /3PLXwXYTivJvmrwvbuJJzVBjmrFhvp8Ccwhknlpgta2X+ieBMOre5btFE/HAzYjtCy6
         ELuw==
X-Forwarded-Encrypted: i=1; AJvYcCWkjGFiNuUv0uZAtrPFDedoOo/2Tn3AJgEcr3dftvIXk2VLH3wBRNg2u3A6/GmDzYTFCv6SeRqtdRV6sAD7wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEyBSCU9pMCjduRPTjvyk+im4aCNSErXBj7p/51NI11NNDFW/P
	4vfj4iE8KQ79TkI2oq/0M2yX/MeWsXWAk3mzI6dmF8mc2Bk5NVLTPL3aolEXsw==
X-Gm-Gg: ASbGncuBrmiabXVcbUPnPe26FnlxmY3hgjn1AJLAIbIYc6S3B5pTRnaBysF6shk2VRi
	dwrtZsY4c+FUkD5lgKGgusoUjaa0SeAF/1Rt9R0+Qun6Sgs0ttyFS9mAQW5xdxr9mJsiRtuXs/R
	9f0oZX3bNea6jT9sMZLSVaouWhB7HgzEWOFV6OZv5OkMm6HPokX9aiuUZhcqCcOaPJqSW0hoB0q
	bsspRqhoZxooir+wGkF+2W0KdH549s2Pi8vvW67BReN7Zv+IOpS
X-Google-Smtp-Source: AGHT+IHYcrPgywctZS6yj9OtZCWZa0QBEPq333wZQebC3a2sogcF05dShhHuMVZPV5bNH5YsBhOyOg==
X-Received: by 2002:a05:6214:242c:b0:6d4:2293:1966 with SMTP id 6a1803df08f44-6d864d0711fmr139697796d6.7.1732886099612;
        Fri, 29 Nov 2024 05:14:59 -0800 (PST)
Received: from [10.167.35.107] ([166.199.165.81])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d875224befsm16225406d6.119.2024.11.29.05.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 05:14:59 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Kees Cook <keescook@chromium.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, <rust-for-linux@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 29 Nov 2024 08:14:56 -0500
Message-ID: <193780f6880.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <CALOAHbBB-__eyERw82QnS3Wmgi7_BpPaacY2urVmpWX3ZkVtvQ@mail.gmail.com>
References: <20241127131941.3444fbd9@gandalf.local.home>
 <CAHk-=wgwQ5gDdHgN54n8hsm566x5bauNPsdZPXm6uOCFvPA1+Q@mail.gmail.com>
 <20241128155120.6e6cd300@rorschach.local.home>
 <20241128182435.57a1ea6f@gandalf.local.home>
 <CALOAHbBB-__eyERw82QnS3Wmgi7_BpPaacY2urVmpWX3ZkVtvQ@mail.gmail.com>
User-Agent: AquaMail/1.53.0 (build: 105300523)
Subject: Re: [GIT PULL] tracing: More updates for 6.13
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On November 28, 2024 9:17:31 PM Yafang Shao <laoar.shao@gmail.com> wrote:
> On Fri, Nov 29, 2024 at 7:23 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>>
>> On Thu, 28 Nov 2024 15:51:20 -0500
>> Steven Rostedt <rostedt@goodmis.org> wrote:
>>
>>>>
>>>> I've pushed out my resolution, and hopefully rust people can actually
>>>> test it. I might just be full of it.
>>>
>>> Looks better than what I had. I'll kick my tests on it just as a sanity
>>> check.
>>
>> And my tests failed. But not for this change. The build failed. Config 
>> attached:
>>
>> CC      kernel/time/tick-broadcast.o
>> In file included from 
>> /work/build/trace/nobackup/linux-test.git/include/linux/string.h:390,
>>         from /work/build/trace/nobackup/linux-test.git/include/linux/bitmap.h:13,
>>         from /work/build/trace/nobackup/linux-test.git/include/linux/cpumask.h:12,
>>         from /work/build/trace/nobackup/linux-test.git/include/linux/smp.h:13,
>>         from /work/build/trace/nobackup/linux-test.git/include/linux/lockdep.h:14,
>>         from /work/build/trace/nobackup/linux-test.git/include/linux/spinlock.h:63,
>>         from /work/build/trace/nobackup/linux-test.git/include/linux/wait.h:9,
>>         from /work/build/trace/nobackup/linux-test.git/include/linux/wait_bit.h:8,
>>         from /work/build/trace/nobackup/linux-test.git/include/linux/fs.h:6,
>>         from /work/build/trace/nobackup/linux-test.git/kernel/auditsc.c:37:
>> In function ‘sized_strscpy’,
>> inlined from ‘__audit_ptrace’ at 
>> /work/build/trace/nobackup/linux-test.git/kernel/auditsc.c:2732:2:
>> /work/build/trace/nobackup/linux-test.git/include/linux/fortify-string.h:293:17: 
>> error: call to ‘__write_overflow’ declared with attribute error: detected 
>> write beyond size of object (1st parameter)
>> 293 |                 __write_overflow();
>> |                 ^~~~~~~~~~~~~~~~~~
>> CC      arch/x86/kernel/tracepoint.o
>> In function ‘sized_strscpy’,
>> inlined from ‘audit_signal_info_syscall’ at 
>> /work/build/trace/nobackup/linux-test.git/kernel/auditsc.c:2759:3:
>> /work/build/trace/nobackup/linux-test.git/include/linux/fortify-string.h:293:17: 
>> error: call to ‘__write_overflow’ declared with attribute error: detected 
>> write beyond size of object (1st parameter)
>> 293 |                 __write_overflow();
>> |                 ^~~~~~~~~~~~~~~~~~
>> AR      drivers/nvmem/built-in.a
>> make[4]: *** 
>> [/work/build/trace/nobackup/linux-test.git/scripts/Makefile.build:229: 
>> kernel/auditsc.o] Error 1
>>
>> I'm currently too busy eating turkey, so I'll let someone else figure this out.
>
> The issue appears to be a known GCC bug, though the root cause remains
> unclear at this time.
>
> A potential workaround has been proposed, which you can find here:
> https://lore.kernel.org/linux-hardening/202410171059.C2C395030@keescook/
>
> However, it seems that the patch has not yet been accepted into the mainline.

I didn't pull that into the audit tree because it isn't a real patch. 
Looking at it again on my phone before today's holiday stuff kicks off, I 
don't have a problem with the workaround, but i do need to see it as a 
proper patch with a commit description, sign off, etc. before I can merge it.

For anyone who is going to put together a patch, please make it clear that 
it is a compiler bug and provide the associated bug report links.

--
paul-moore.com



