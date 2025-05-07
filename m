Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14E81C5D4E
	for <rust-for-linux@vger.kernel.org>; Wed,  7 May 2025 06:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599530; cv=none; b=GkvzdOnQ79BXWaIAdNVP6K+RkkiV6dIcDQZMikbKpyLmzeVyAtLLPC2i/dx+ZcPNj6clF3nhdaZBhnRtJjjEJCAp3+mrJDqj1Z4onwUdNygtKaUm2Ut05CT5XGWBoT/HGkq2l+Wl8W98hhxQ7SJG27WckonXLIB8Wrs+eyZpS20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599530; c=relaxed/simple;
	bh=exbcRCBcXP75cDIPN2zF7G/kZPfJqnrNFxp1zshUZ+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uHZjTKCWfh2ydditDGKIRHolhYiSE85PUbHySuaTDGT9B0Zb38EWoRfL8INX3a2AxdmP7HZPuLCFa7JdbDeIzFsrMTuz2avifrk9mwRrVmBOtLtdbwroOxddJopT451VmMqVs7R+QZZR9ihiz+oXMBDINM+8SFCy0nfgkddV7ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N/q9UBbW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N/q9UBbW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d01024089so41485265e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 May 2025 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746599527; x=1747204327; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L8GCAFg1aaYXlvR66YXUtPzPYdtJZ6yf/ekYSx+SpVs=;
        b=N/q9UBbWqYRUZ9PU5CLprdk2AnnJln+hsMshsMXsG/QAytTP4mYtZzhCbtHTo9wv/j
         XrUr4ABk2zBk9UTZuZnmMDm0t/akwcqgrU75VnJoV/YFE+oLGHWFM/9LreKO6d/05hrA
         o+fhxnnQmk59Qdx3QTJbxCr164prmf1oCTH6mHVY7DYg+HNG+0DGa3449GI69EtaPx76
         7tdQDeGbm47k2pNgNzCPUeWzj/FiBqLXDdbbYwBm9ZbEPlPVniyJ+FBfbz0btKy4EZd/
         /yCherlFcG/JWYP8Vm0LdzbcCJU+pgoLcqUCHj7K042jlZ8wVYkIEjgnRnxqDR9SV85J
         YCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599527; x=1747204327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8GCAFg1aaYXlvR66YXUtPzPYdtJZ6yf/ekYSx+SpVs=;
        b=eXFKsgop6xtxC7Xx92pCi12tyUI2GCwFfiiVTYqipJ2JkS7vC+3l4LjbMjFUcQkCZc
         bHpBmjY3gItpMBvBG765SBXdjRoAiuKiP7Xc0Fd9/PPpQwZeryBdddydvXDWF/5r6h6y
         AP5vEkc1j8t6ssRJCXd9po/lxgD7s4X2Jw56RJEBnQpMfdeRKJ2uWUJrw6OI22sIdJGM
         bRUC51qWjL9xVA6KK4IpSLTHDUGVmsY2CTzhyvYBGXdRogEJLrr68ChjPc0p27CBsblv
         6dNxrW+tVlKOqu8GkM3g2LnWr46IQMGB4ORR8dF4ZzJzD15O7kNavvmv3IrAxy+SECws
         6RXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM03F3exv3/cnuF5TJyAztlfDTjc8gN/1RisryJGJYLdKW2eNOod5ilUam9x18NjhMuVQ75kFCZkzVE5uT4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcFPzowYavdjT4S4heUURBpsuDimuWaXv2oGPOTiRfMNtW386T
	PmhBh6bYw/02s7Qo3ilJiKlovPIJNDMUcnS/j+kyMLOrXVg3rqgQyJoD/dlc1vvLeixPIOXOSMX
	EDLp76CfHyny1Og==
X-Google-Smtp-Source: AGHT+IErajDqfwcZTf8rFmNjgBY75jdYeqJxRWcm3VL9E4WUwCBuF8N519b5ETfv2d2sPP/taqAt/46bX7Ge2ro=
X-Received: from wmbhj13.prod.google.com ([2002:a05:600c:528d:b0:43d:58c9:bb51])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d08:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-441d44c7d8cmr15872725e9.15.1746599527327;
 Tue, 06 May 2025 23:32:07 -0700 (PDT)
Date: Wed, 7 May 2025 06:32:05 +0000
In-Reply-To: <D9POL1CR89RN.2OOMXJAOR4XAK@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-6-06d20ad9366f@google.com> <D9POJZ60ZCYQ.1XBNZSXOQ9UJS@nvidia.com>
 <D9POL1CR89RN.2OOMXJAOR4XAK@nvidia.com>
Message-ID: <aBr-ZZMBPyy0KfZH@google.com>
Subject: Re: [PATCH v5 6/7] rust: alloc: add Vec::remove'
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 07, 2025 at 02:32:10PM +0900, Alexandre Courbot wrote:
> On Wed May 7, 2025 at 2:30 PM JST, Alexandre Courbot wrote:
> > On Fri May 2, 2025 at 10:19 PM JST, Alice Ryhl wrote:
> >> +    /// Removes the element at the given index.
> >> +    ///
> >> +    /// # Panics
> >> +    ///
> >> +    /// Panics if the index is out of bounds.
> >
> > According to the commit log (and the code of the method) I think this
> > panic section is not valid anymore?
> 
> Oops never mind, I didn't notice Danilo already pointed this out. >_<

Thanks for taking a look!

Alice
