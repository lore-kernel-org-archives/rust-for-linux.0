Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9A3D7D92
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770202234; cv=none; b=ZDIa9lYMTz//Bjl+iND2OJXCWuhz4yRICuVjjlbU6D5FTHtwj7SJkxRk+TgXO1nnslAf7yW7EDiWWLq/Rs1KkkaloSf9cvhLKUopiO2NwE/KSb97QfBSZlFXAe5QqjHfNrFKslxRQDz1YvFaUOpAh2qDOUukDaODYwlyJERrTgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770202234; c=relaxed/simple;
	bh=eSKreD+kg1Gi9kYgW+68V1WkR2D7x/oV3EWFq17KtQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WIBpZ3NM8iGEo96cW+6fYeG4XiXuRYocgo6oIu3VHQo4qSMxFe9muJdfIJDdbAlh6HiCg/AD5w454GJsAJuRhNsKJ3aLQaT1U5LOtNu9IErZa2cArf4vrh15g06q0bq6/NdD2EtRb4R8j1PL6HuzNmYxHqlvAEGndI7T3oWOSIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s1sTBIaR; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s1sTBIaR"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-432a9ef3d86so4196785f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 02:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770202233; x=1770807033; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWSGDCcyap1xEAxaXDHWnq5wYPUUX2CYlXFwthyIRE=;
        b=s1sTBIaR2O4ptzS9gFTJB2np9dqeh9aP1aajPh7FmJf2aK4ckb79toWR4ZE2tMgPP/
         ZDKea2OE4KpPb8fgOA9RU1DGRF6YeBTsN63jlurhAxKqaqya/H0+AfV0f6NLjKaQbxdo
         YMXotzkcND8bRuYJNRD5/lvnxK/hGqSQRjcKX+yzuUR3m0cGIZLD7thVG4s97gQIKMmJ
         jCiYQGllmU//QIVwYdkErIgBPOlqz2+DIqcxEKq1nDQS/plGyJjpun8ofEaQZv0GJ2QD
         tWzxllyN3eCR99o0ozbAXeqIZiYBONYBRX05zhG97QmND9zMv/ISQRt/ufWktQdynQ0S
         zeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770202233; x=1770807033;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZWSGDCcyap1xEAxaXDHWnq5wYPUUX2CYlXFwthyIRE=;
        b=axTfo45KGtBmn+tTi+gjeVkNVNMr5PMoFIQK8vNv+1joRAz6QsRGIbBoUQ9cHG0Ry5
         XxyXUuaVGG0/Igka/JC+bo5HFDAxFLyljM/S9ydHEUuD7CujmHyg0DanR0ZM0qBfUQHy
         xMJqdPnrYnxJydYq1R4qRnvF/Kfw2svjd2VWf7WhqCr//5drS3BG0zEcwqdtpiNnwsI3
         8hn/Dzi3tFzNH+0SRkX6GF0rLA6PZjelKgCyX3hR6/Ajy1S9MMtigyp/9/H6mizdchul
         vMvXHhSWuQ50Y8YxiegvPKZgBSevDyZF+DbqLVnNIvnd+l1mZR032e6HdPtRfDWHvXJ0
         L4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiHSlRegdll1wFx787bwE1gBJU60YOV6sanmWkpS/mQAqMsasxvZxZ40ZF7MjUg7MfuOnhG8TE4YV2mRJcFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Qax+GiTB94nla8Johja331dV7LebCXaDHyLsUdKoIjim6qHH
	QtfD2re7NNvILPV+efSVI6MTKw0V0nmC89OhzxMhiYdZd4jGkuWqCNU2VDvQVfL5zMucVw4n7JX
	A+7wjYSCK+2llkgoT4w==
X-Received: from wrbeh8.prod.google.com ([2002:a05:6000:4108:b0:436:251:b57f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:250e:b0:429:b751:7935 with SMTP id ffacd0b85a97d-4361806302cmr3321197f8f.56.1770202232523;
 Wed, 04 Feb 2026 02:50:32 -0800 (PST)
Date: Wed, 4 Feb 2026 10:50:31 +0000
In-Reply-To: <20260204091147.32511-1-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <DG5CFX3ML5YL.2FE913F20LNPT@garyguo.net> <20260204091147.32511-1-jongan.kim@lge.com>
Message-ID: <aYMkdwic6UNwTi5D@google.com>
Subject: Re: [PATCH v3 3/3] rust_binder: handle PID namespace conversion for
 freeze operation
From: Alice Ryhl <aliceryhl@google.com>
To: jongan.kim@lge.com
Cc: gary@garyguo.net, a.hindborg@kernel.org, arve@android.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, brauner@kernel.org, 
	cmllamas@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	gregkh@linuxfoundation.org, heesu0025.kim@lge.com, ht.hong@lge.com, 
	jungsu.hwang@lge.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	sanghun.lee@lge.com, seulgi.lee@lge.com, sunghoon.kim@lge.com, 
	tamird@gmail.com, tkjos@android.com, tmgross@umich.edu, 
	viresh.kumar@linaro.org, vitaly.wool@konsulko.se, yury.norov@gmail.com
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 04, 2026 at 06:11:47PM +0900, jongan.kim@lge.com wrote:
> On Tue Feb 3, 2026 at 12:59:45PM +0000, Gary Guo wrote:
> > On Tue Feb 3, 2026 at 6:59 AM GMT, jongan.kim wrote:
> > I think this function already has `ARef<Task>` for all the process, so it feels
> > to me that the search should be simply based on task, rather than PID.
> > 
> > I.e. instead of pid_t -> struct pid -> struct tasks -> pid_t and then search
> > with it, we first get `Task` from VPID, and then search directly with it. This
> > would also make it no longer necessary to have the init namespace check.
> > 
> > (BTW, the current impl looks quite inefficient, get_procs_with_pid returns a vec
> > which is pushed again to a vec, perhaps using a callback or simply passing in a
> > `&mut Vec` is better?)
> > 
> > Best,
> > Gary
> > 
> > >              procs.push(proc, GFP_KERNEL)?;
> > >          }
> > >      }
> 
> Thank you for the suggestions for more efficient structure.
> 
> Your proposal to use task-based search instead of PID-based search
> could simplify the logic.
> 
> However, I have a few considerations:
> 1. The current implementation maintains consistency with the existing
> C binder implementation. Any structural change here would ideally be
> reflected in the  C code as well to keep both implementations aligned.

Yes, the drivers should match.

> 2. Since the majority of binder usage occurs in the init namespace, the
> current early return (checking task_is_in_init_pid_ns) avoids the overhead
> of find_vpid() and pid_task() calls in the common case. If we always go
> through the task lookup path, this optimization would be lost.

Well, I suggested this approach too on the previous version:
https://lore.kernel.org/lkml/20260130015427.83556-1-jongan.kim@lge.com/
(I mentioned it on C Binder, but they should of course match.)

I'm not necessarily that concerned about the optimization. Freezing is
already a bit expensive to begin with.

> 3. Regarding the search mechanism and vec efficiency improvements you
> mentioned, these seem like valuable optimizations but would represent
> a broader architectural change to the binder driver.

Improving get_procs_with_pid() seems like a separate thing. Perhaps it
could be part of this other series:
https://lore.kernel.org/all/20260201000817.275382-1-shivamklr@cock.li/

Improving it here should only happen if you need to rewrite said
function *anyway*.

> I'd like to get input from the binder driver maintainers on whether:
> - This kind of structural change is desired for the binder driver
> - If so, whether it should be done as part of this PID namespace fix or
> as a separate refactoring effort

See above.

> - Whether both C and Rust implementations should be updated together
> 
> Alice, could you please advise on the preferred approach here?

Both implementations should be updated together.

Alice
