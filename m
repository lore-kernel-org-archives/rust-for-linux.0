Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D327A93C
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760330299; cv=none; b=oa1XzHbCfncS12hg7aKjcugyfTnLReaSl7lqwKSeSNbpDo2DqcOdPk4m3Vd4FWMBnZk2INauibYnGjJHtEetlibZb2asxLSVqBcKuRDy92S1+rOrKXXOutdfbcf0WlcjLLSQjlKIWvIj6063xy/6V81fQztPtTLm1HVh/Jx0lA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760330299; c=relaxed/simple;
	bh=u8oK9s5aByPzbWDSJU0MuNHc93b7ngPnC+4lAT7yplE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbIaS5jBx7K95mLp0yMYz6h35IL8QpWTCesuaG2oL1pW/yeE/nBLZIHbpw1hrRaPnGSaA+dsVDUojMnfbfszStgWYHY9dalW8H62SCe9kVga3KOSEz12hNVzTY9CgXQh+JmXiUzF+0ohvlbsSXQJU3iEAbk8gnXpzaVokJGLf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6nsm/dH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6nsm/dH"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27eca7297a7so6583055ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Oct 2025 21:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760330297; x=1760935097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jQ7mGdL6AjL3n52++SuIetPTh8rjsnTvNAsGSM8T6g=;
        b=G6nsm/dHRc3RliYiPUISlXZw/eRg+0suGV7k3dLPkSwZ2NjxmjxvWq3fnWHieXY8ah
         ZrQjSraFE8Qw/pLX4ccGEjBD4oYXBMusISYjB3CwAPBpuLcnTj+MHHQUU46DCoy5KGE/
         EGx37dN9FqPoB4/gLoB2+CXjng6gI3Z+AoRMyWdCjHkwVojrH0Y7syea7JHYIWDxxUzX
         yEEW4mGNaj2EYcyH/CsQ9/rMyqReT8JDfuQz6z1w1gs/OMupEFWSm/4cO/GmmDIjqgfo
         Cwbgs04yO2Dv5YBbUajCQIWMFcFb2TbLTp4SwHzwEZyNELFbRH5JStrJZqYSeCHRIQ7X
         KbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760330297; x=1760935097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jQ7mGdL6AjL3n52++SuIetPTh8rjsnTvNAsGSM8T6g=;
        b=dE/DWrZCCxdLJFX4IRSY9rANJreVVl0gZABl33VRu2wbrHhXhkFrMyApuzzOWtPEgl
         AtK721MfxC5FLQg68PMrNyhhkwa6eer3ekUwN7MwkV6+FmKoiELxfRP3E44EWYVY0NqH
         w0U4/7ILI6u0cWNJVq42CHBTReTEyH1ggcMZiDXE/csJFiRFn43myEM7M4kEZE6d3nIz
         pIoia3/eHc9lU7s9QE6ruIJusG2ezCFt0YJgElgGSZubCZDUrQItq3or4lwbVXvM7YFf
         JOC+5cq8DcLWSLPyjv2MteS75DcWig5Zr+l16jGnE510x4gEPvBmSiOd8J8KaGJCLdfg
         XLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz79+rI/vaFGSqp55p6V4ggE3cmJPI2EcKaEXpAbE9wRlXLoBRXP8+Oa1yENRNZE11Itgh4kT+uiAIWWuUrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjX7uSIPnlKlFsQOWuds0vh/xf4vXKQmSlmzTWX//G4iXqTdf6
	w5B4TrxS2gr0LPDYMKX/ooXtJK4ys5gV22R5+GSmZMfrLB97LXBkeGQQ
X-Gm-Gg: ASbGncsCTg0i9kqMBop38zf8FxkbRf5QCvnuTvCSrQoaVwUJHI+nV4x32sp9AZajgQA
	wQesDKrMB1xVd3dvhpVexxGnYNgp0zJ0cObxc/KXv1SaRjlDlmgyKYhw5vEYxZCBGLVZrblS94e
	VHhAFI1fdMqF7U1GvVG4e2lF10eRhvwNCLpsFKITdv/yY3dAD++fUgR6SSj+qvh9nZaPk3S7bBl
	bN322PqGleVB996RH5U+ox9gZG6Bhlw9vDjZyUckputbO1i20L18UwoddEDXm0AENGvs6aTCgT2
	tjqjH8EPoL0IrSrjlyoQWcL2qI1xyjK/lRbg+hij8nBk890Gyvzj1mAnkMaU31MWQ5LCsBRXTIz
	Jd9t+P6r1Kr5LanPTO12TdakVb1tgKdvSfGM3gw==
X-Google-Smtp-Source: AGHT+IECDsp7UtBNbkAMUan55y1XQuX+ULfYaKfSidXHic/wkkfkYOISn2UHW8fXUSR6MSLEloK7xQ==
X-Received: by 2002:a17:903:24f:b0:26b:1871:1f70 with SMTP id d9443c01a7336-2902727f94amr119251795ad.5.1760330297305;
        Sun, 12 Oct 2025 21:38:17 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f070basm120833025ad.77.2025.10.12.21.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 21:38:16 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: si.yanteng@linux.dev
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexs@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dzm91@hust.edu.cn,
	gary@garyguo.net,
	hust-os-kernel-patches@googlegroups.com,
	justinstitt@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2] docs/zh_CN: Add translation of rust/testing.rst
Date: Mon, 13 Oct 2025 04:38:10 +0000
Message-ID: <20251013043812.13186-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003074939.465517-1-benx.guo@gmail.com>
References: <20251003074939.465517-1-benx.guo@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yanteng,

I’d like to confirm the expected use of the In-Reply-To header for versioned patches.

In my case:
  [PATCH]    ->  Message-ID: <20250929163531.376092-1-benx.guo@gmail.com>
  [PATCH v2] ->  Message-ID: <20251003074939.465517-1-benx.guo@gmail.com>
  [PATCH v2] -> In-Reply-To: <20250929163531.376092-1-benx.guo@gmail.com>

That means the v2 patch points back to the v1 message ID.

Could you please confirm whether I should start a new thread for [PATCH v2], or if there’s something wrong with how I used the In-Reply-To header?  
Thanks for helping clarify this.

Thanks,
Ben Guo
