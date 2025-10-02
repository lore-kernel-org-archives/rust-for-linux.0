Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7F62FDC51
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401599; cv=none; b=T6w6OvE2FW6tM2sVetQrIwlxhHrbX1t9IqvLsqdGtIJwm5cRKEMtHqTFJAncQz+JOcyaVnljzuLOS925mleVQNyhr3B8L6M1qPtNdb6l/4acLA9O56TSiL1U1ld5ETyFNjngc9lssdFrD96fW1/j/JCWaXFezk97Wh8SjUCg9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401599; c=relaxed/simple;
	bh=5zqSShRm39AvEZ2mdKxWsxXrw2ZA/BSSQMCMwPSXcG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7jNLBAAPP36NL4lBcTNOSzVu/xFzK0A4vBR7Obm1v/THxqe6KoOoO3/gUhQlu0S6hnqqQ+4ZTHPPs1o7nAL9BoP/qtxIQKDfwshp93Ql/OtNsQQ/zGTjD51SIqZgEDMiefziW1u/tZFXH0eLoTtk/6N1L9Bcwdq4yFMgS5//F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmPEFMSO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmPEFMSO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-26808b24a00so1352135ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759401597; x=1760006397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zqSShRm39AvEZ2mdKxWsxXrw2ZA/BSSQMCMwPSXcG4=;
        b=CmPEFMSOnGGiEyaf93xOVryqjDnjYQJfZj+A2BDJszUDRQwG1OEKqCLgyWRiOd5PW9
         5XuC70qYAP21pjCQQQxCX12yLMOwmEf9BoCqNwKtZCL21wgSKx3L56ee7vSTWLZ6DNy2
         p0uDGvz9IiQr1YR+6rwfQVWMXTbL1doYWcOjDP/z7B1In4EfPWM8qW8fYey4iKbExKYX
         Ai9fVsXc+6rGeqS+lWEFcKZe5m/PrnmLEiCB/7C7HDd9lAPfieB8xhY829psSPxc/MTB
         ViHq8pjawgoNz98/GsBcl1JNt3QtbwH8Pdu7/4MWEoSx0GQVMwdyFCmJjZq61K68I7Up
         Sdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401597; x=1760006397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zqSShRm39AvEZ2mdKxWsxXrw2ZA/BSSQMCMwPSXcG4=;
        b=R0e80A0ivY/6SNUvahAYFopfg345XVzChl1xwBapEXiwTHFU3SUE0ETGi8f7zJVYAY
         X/FAqd7/05Qeun8usoBhW0w3yIM4+3FOc9jcH/TPZviNaoHT7jEsUMMtIxQAYuk9mu8f
         51y1tvo1HYZyvE/wrqzQQ4FfbCQiclOkKZN24DsbpilSdVxGq4IvX5aUtqlWjEKObcjs
         Kj22fkb6Bv9tvwTTTYC/IJPUBcDAOaA0m14jr0grzigNJl85Sb6aa//kMzDqvH9EN3pr
         i2+E3xfbujVyzTDQ0xq5nY2o/EqSF1ozHkkgV+uvmpzMZIO9PaoPVpK5kHi6BEyRK8qG
         KTTA==
X-Forwarded-Encrypted: i=1; AJvYcCVK7RmFLMcYCfNOjEP3+oH1tlUHAQTS39xDQhCOaNMTvKY8F6/BQSTGbrl1XajnQHD8JYYBs0ocwXt5mz0nig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkvL5GodOePQWa99fF/Lxhnp/hV7A9UJB2z0xYlzwYOQey5OaN
	zhEb9hsWxQqjrdGozDAv5iicUedgaFVv0GOVitquf2N4mMshRG7i84uTdrvJfqLFyWpM7e4OfF2
	QMhuAcDpNYJNcAR+OhorQ7wGI3zq83HM=
X-Gm-Gg: ASbGncvOF9XIztCjyaRNKQZiurrXXJ2Lkp2tlvly2MSITSmV/7Ywpl+XtbTMhy/x/aS
	bqReKu/WocpV5q4cnx+WSAunqJr7izIme5uTP6pIXnCrMt6LvEZJ0q5AF3z+DKXnFwliQCWMdGb
	nd0qHPFXi85m5eyPgBsbEoARezb6TpkaX6g5mC5jXCUzSEGSY2KPzCXGNsAYM2Yvl/6SQegO95D
	64frF4aw5ohbGtUQmdiwjOOqLrzLqfZ8syJpXTb3lOeD7VjV99NLhVxqbPAcnoSB8jqmMCwU1o0
	m1O3mPA84b2jCq3rnpA0TPXr21vigT/s6tRO9R3/nPUBu1WSLQ==
X-Google-Smtp-Source: AGHT+IHFLND1P6O8TdHjmnKikosiXvhXOIfnx1PV0ljjYUmm/N/aJM7ueeeJ1F4XTf3eavFywQQD7J67z/yFzofBPI0=
X-Received: by 2002:a17:903:2f83:b0:24e:af92:70de with SMTP id
 d9443c01a7336-28e7f33482dmr45430085ad.7.1759401597241; Thu, 02 Oct 2025
 03:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002081247.51255-37-byungchul@sk.com> <tencent_13F1EDE0D6B7A44697F31AE274C8E664E908@qq.com>
In-Reply-To: <tencent_13F1EDE0D6B7A44697F31AE274C8E664E908@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Oct 2025 12:39:44 +0200
X-Gm-Features: AS18NWBvN_Cs7ivtqpv2OaNBhg_Klbjg_5caE3pe8g8RPQqJWvaoaACfChLj4F8
Message-ID: <CANiq72ngvZSL72GQ+CwFoaE4ZfakZSPcZk1zrXqyaKEZLWDf-g@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: add `rust_helper_wait_for_completion`
 helper function
To: Guangbo Cui <2407018371@qq.com>
Cc: byungchul@sk.com, Liam.Howlett@oracle.com, amir73il@gmail.com, 
	andi.shyti@kernel.org, andrii@kernel.org, boqun.feng@gmail.com, 
	bsegall@google.com, gregkh@linuxfoundation.org, 
	linaro-mm-sig@lists.linaro.org, link@vivo.com, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, masahiroy@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, max.byungchul.park@gmail.com, mcgrof@kernel.org, 
	melissa.srw@gmail.com, mgorman@suse.de, mhocko@kernel.org, minchan@kernel.org, 
	oleg@redhat.com, paulmck@kernel.org, penberg@kernel.org, peterz@infradead.org, 
	petr.pavlu@suse.com, torvalds@linux-foundation.org, 
	vincent.guittot@linaro.org, will@kernel.org, yeoreum.yun@arm.com, 
	ysk@kzalloc.com, rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, alex.gaynor@gmail.com, 
	bjorn3_gh@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 12:12=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wro=
te:
>
> The DEPT patch series changed `wait_for_completion` into a macro.

Thanks!

In general, it is useful to provide a Link: to Lore to the right patch
(i.e. context is good), and please clarify in which tree you found the
issue if any -- I don't see it in linux-next, so I imagine it is not
applied, but "changed" sounds like it was? If it was actually applied,
please also provide a Fixes: tag.

Cheers,
Miguel
