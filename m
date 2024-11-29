Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C22160783
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732921720; cv=none; b=fxyION9t+fDLqoHryQ/xYruahmLxbAo2gIQ6VSVggHDdBwJwuEMe4xpMvjIVhuZGeWil0rlv1eq3HgUJahZrA3C4TdhLZkXRAufSrJZnM4GSvz+0hZs2HcOyI2B6nP2I+PRuHmBkHL/nQ1DZhbIWti+dHYnMcYdPJQe4010RA/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732921720; c=relaxed/simple;
	bh=hBcS/rWxL8Z16VubTFxz2tOkzDDUlWwC/vRzmnyPkLY=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Gk88B07gLrrCJobIzl++Nl29DymjdkkGnClGypKHEjxwF24EVQ0yop+b42AZJSVFL47sy0XFyrVM3AiPe1oWmLdRQ2t8+ag9Ntg2uR9rsdKWqTk5o/4gaV5wNFpp92PUXFa966uyTR7N5oBNMBBXIAJr5mCHXUWuP3laSHkuXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XgNcYBrS; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XgNcYBrS"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b65db9b69fso135589185a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 15:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1732921716; x=1733526516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HN5bGNA7/bg9Ufs2Fd2xQf/aHKLWC0v8KWxMtmpgDIA=;
        b=XgNcYBrSO6FET0P1jtaHxpjRM3fqXdrdCQG+XY0UAJuk0aEOUcwpskn+lv6TRAraTq
         +wTSQi1LIw1l11T/24aeW/wp75vUlt8pO0+/BCbkFITK2GQB9lKawErWiijgELTb9B4r
         eHdZdF0BH81z18KuHPPHMtypa5QpzYKsG20cSqtDVaMHUVdWEnY8qiVGvrSoQuCXqGxM
         Jg36Zbz7JI0ytN54lBMcssG0qn7/bm8kH64vNHsfxIA3ESDyXV73Jp97BNSLOdSHjX09
         Y6KL9R839Iujq3LmTeVWyLYmlrhnqAJyL++BlC1pP0hnkyTxiMn9K0oZSNAdm10IVfMX
         YReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732921716; x=1733526516;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HN5bGNA7/bg9Ufs2Fd2xQf/aHKLWC0v8KWxMtmpgDIA=;
        b=tWCL8Brijag+hqd3gf7EcOYv34fnUkyGY6P3kRToYqYx3QfPaqvusRvAAIIA6diOat
         X6mbU5YTNbxfKKb8Mcb/G4QSPFVviW8Ds1CRoT5XprIK0UA/BlgrRZaQhuMKYzEwP6i6
         6l7HQsVGNN5y7XyBMj1fFSP19xSxu69upPfOpVfkeHmyyrs0KCiOYfxlpYOtzA0tRymZ
         +fnrpnYY2nrswfuVMSThZ5dUdpKdF0uIGmtOkKbEanV9R2b6hpC/OeV14NfQImRR8Qp1
         BFqxPY4r2lpB/CPGWwow2mqwVkLdImTh4JyZNia50Z7OQLLiCcIrwlKHbVZOsLav0LJf
         OokQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhjDH9eh/EawShUaF8HenwpdOBDevCA4pIlZutixFQrda7a3o45JCo2ZHqXI2pq5tYbp63kFruX4+mOgu31Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YznISeDWS9k7nYMxQE4BRbjSOhIG9f0KJ+7OzPGK+Zxplo+MulX
	lqcLFkMJ2FeO1zXeyVdNIBnf2fJwXz+fnthIrPx08FbTwg7J/D4V52+swO9lXA==
X-Gm-Gg: ASbGnctWf14rfiehg8R5tXHoI0HKb/7KgWjTKXdLH/31cG9tRn7uQSON/Zs4mUf8H8v
	/b4G7W+vDq4g6tJH4HmV56pzLn4S8cNZBc/mMasWQTMH6ABPPmLoUIt1z2javyz273O18+Rjvuk
	7/bx6AcyUZ89SXqLxuftrVUaakiXxXbUkXAeyvXauLsQqbQKB93JdbvfZD1UZ5i69rnM5AN18fA
	Hu2GV5tlXyp0CsJeP+dTRHArEaRdMVB6BKnsuUYFStNNWQwKG+S
X-Google-Smtp-Source: AGHT+IExMxKJhFilcnoFuMS0wRFtUpZtDBMoV3qzKN2iJbHR+5C+uZxGBBCeLuK2DKd2L4g4oNydPQ==
X-Received: by 2002:a05:620a:1a9e:b0:7b6:753b:9b78 with SMTP id af79cd13be357-7b67c2c1736mr1644925785a.29.1732921716368;
        Fri, 29 Nov 2024 15:08:36 -0800 (PST)
Received: from [10.167.35.107] ([166.199.165.81])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6849210a6sm181893885a.22.2024.11.29.15.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 15:08:35 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Yafang Shao <laoar.shao@gmail.com>, Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, <rust-for-linux@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 29 Nov 2024 18:08:33 -0500
Message-ID: <1937a2ee168.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <20241129082646.1341af16@rorschach.local.home>
References: <20241127131941.3444fbd9@gandalf.local.home>
 <CAHk-=wgwQ5gDdHgN54n8hsm566x5bauNPsdZPXm6uOCFvPA1+Q@mail.gmail.com>
 <20241128155120.6e6cd300@rorschach.local.home>
 <20241128182435.57a1ea6f@gandalf.local.home>
 <CALOAHbBB-__eyERw82QnS3Wmgi7_BpPaacY2urVmpWX3ZkVtvQ@mail.gmail.com>
 <193780f6880.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
 <20241129082646.1341af16@rorschach.local.home>
User-Agent: AquaMail/1.53.0 (build: 105300523)
Subject: Re: [GIT PULL] tracing: More updates for 6.13
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On November 29, 2024 8:26:51 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> On Fri, 29 Nov 2024 08:14:56 -0500
> Paul Moore <paul@paul-moore.com> wrote:
>
>>> The issue appears to be a known GCC bug, though the root cause remains
>>> unclear at this time.
>>>
>>> A potential workaround has been proposed, which you can find here:
>>> https://lore.kernel.org/linux-hardening/202410171059.C2C395030@keescook/
>>>
>>> However, it seems that the patch has not yet been accepted into the mainline.
>>
>> I didn't pull that into the audit tree because it isn't a real patch.
>> Looking at it again on my phone before today's holiday stuff kicks off, I
>> don't have a problem with the workaround, but i do need to see it as a
>> proper patch with a commit description, sign off, etc. before I can merge it.
>
> Yeah, from the comment I was expecting to see a proper patch.

So was I :). To be perfectly honest I was really expecting this to get 
sorted with some compiler flag, workaround, etc. If we have to fix it by 
hacking around it in the audit code that's okay (the hack looks pretty 
minor) but it's not still a kludge.

>
>> For anyone who is going to put together a patch, please make it clear that
>> it is a compiler bug and provide the associated bug report links.
>
> If it matters, with that patch applied, all my tests were able to
> complete with success.
>
> Tested-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Thanks.

--
paul-moore.com



