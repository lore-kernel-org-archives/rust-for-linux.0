Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FB923EA8B
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Oct 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791103685; cv=none; b=Duw84ApuNQvznRcoFId5skCeo4FWtHFDQTmpOJy7jcVFKzX/urH/NPk3ylglk5RZcQZLU0lUkG3peRix9VuG4VWggYauJNKe6v/d7/BcrK7evg6LUts/okOm5D4IPgFSrMwLBZQjwt2s0vLd6MHMD0TihXOuKvHiRvL8GxK0z3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791103685; c=relaxed/simple;
	bh=6T8DZgYYr+1+mhUdP7wNNBrVRLpWRoP/73DbbLweLc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riVvzsgOH2nEWTA/XufgsCXgOEUmMcbX+2FQsN2uXVaonofpkyX2sv0G9b3NtBWKSfXnV/HkLKtvfyEAMVpD35GTefDMenm8HzoKdJTcGDg1HDBxKKnm4k7BqCFnHNUjnV9VA2E0rCigyeq69n46gX0tmOR6fL9DoHJkS1Hvg3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl3wG+nZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl3wG+nZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e576377715so577995ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Oct 2026 01:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791103684; x=1791708484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zELZTu5aToONR3XKy4GsDgiiiK8sRg6RuxNVymYA2Q=;
        b=nl3wG+nZqRN4em+9wX0XMPtUTl3TlqNJ3R48RordX6Kauy4+kiT8fmCODVl58UKUXu
         LquMbqeVpEDc7aQMrb7x3Oh/r1uk2wiqiWn3fqMHPEwpGticAlsWe2lLxxukH4ZJs3DK
         dYO4pIDUDhnp3cMnKaKpnA0liYOXHTP/QJP2gG1EzhY9dRwCwGdWlv4XUlwVz/82+EzE
         d21XzS/hjqJfE5ywYxuIKGooKiyDTkoxowLWzaQLEG66q5c2vDDc0tXUqinosevFniiW
         oSy7Bt5fMSFZb9aBlveDy5ierXgamJC6mWrgceWpsq3GrbHKnvCvUEeeUucAlYSYFiYe
         LUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791103684; x=1791708484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zELZTu5aToONR3XKy4GsDgiiiK8sRg6RuxNVymYA2Q=;
        b=ResDbip3EbDx44BRORnCJBjtTRq8AMag/jTydeuBionlV3nBAvkUMEIawaC+ekX+Um
         RvPhFzlFGyb6okmBsL3CLBilmHrB6iMnvKKnPQuGhkrjz2aGjLKLKeF1UuEYQov2kt1o
         LIN1DkwA9WNiZKa+3OTODhtH2g9C5DpQsJ6SmEq6MpiR5c8uVm+AST/qez+Gw6xQKq6k
         BOpEV48CKsVCNcB3nTTpeEFVa+xdYtH3Lnh2tJ/W0tMR5Q0De3nClnw+34DYdssCj7SU
         Y28G4IPbM4f8Nm1F4XE5bJf79Tp4ubNAK0iJ0CDjAPXeoEeqQ238BGNVUX6nKogKZHJT
         gp/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGvQZ8ImoOtIsxnUHEYRIkmuqIYyjdD68Vv/rZNl91Ea2YdaPXhsK1a+DbMefEYEno6M7QFv58fOnxVAVtKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgd9dRZgtp1hhoL8ICwLTV7O90c2ZgroPU5SI6772OkAYgM5Et
	tZzS6s0/JmQgj19pZYt6K+nQDZQvBMfHLmVr7RS7F28qNtxusO5XREkL
X-Gm-Gg: AYBFou2vzGKnpFJ5LoyF5UJUeO0/lI9FHPGw6w92rrW46Dcye/QI1gKwzdRp7lb8q04
	GrGddXowQHaOjJ9pivrnWE8fbjrF8UaaJD/Z1Afdq7ZJXQEurdLfbES8WTpmNZ1HJ9N61xxC7wj
	TX9sovfQniZHzrsCLhVXJa91CeHI1GjBg2Tu2HC9AzL1TtUDknDcr/ZuyI4zXc+AaJijIp7PHth
	Cr40n6VRzTgcK5e7CCOLU8RkbMwnaBcO1wROXEWpIUVcoSxvHvgDLXw2nKc3pHg8yXmZtNhvvGm
	7QEVzorjsOhTYU1cIz4/M3sBPGF0c1ofrV7K9NbEsnPajzJMoGlpqQDd5xgl/xmOJ3qqTm/LZfD
	n/kEcwG1lIj1f9EtDi7U2g8NGEJFYbyrCsiuHlzK0wdyVpz+aUGaWMyDuDZ8QUyAsau22BdyMFH
	oRCY/drOFYtga37U8A1tWRH2JQoq4W0/gkk/bnLZAHtg8mz5tQCjMXdhJ2Qn2qFiuvBoBoscAgJ
	csZ0oXak6J6Pc3BkgtYkz1iJtRIRgBWFtlST8F8o6ggTsUWOXcgmEo5tknNt+N4gGOePq8IQNye
	CHIMla/ACXiRhAbLZPl1iVMGPHNDzUWfGY81zw+hQ3PMUkEjJ8r6Zy0sOk4=
X-Received: by 2002:a17:902:d592:b0:2e2:e57f:77e0 with SMTP id d9443c01a7336-2e51057aee5mr39075065ad.24.1791103683643;
        Sun, 04 Oct 2026 01:48:03 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e4c2a7e76csm15786865ad.31.2026.10.04.01.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 01:48:02 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 5/6] kbuild: rust: warn if the out-of-tree compiler differs from the kernel one
Date: Sun,  4 Oct 2026 16:47:58 +0800
Message-ID: <20261004084758.40138-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20240902165535.1101978-6-ojeda@kernel.org>
References: <20240902165535.1101978-1-ojeda@kernel.org> <20240902165535.1101978-6-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miguel,

When you applied the rest of this series you held this patch back "to
give people more time to look at it".  Nicolas reviewed and Alice
tested the series at the time, but nobody commented on this patch, and
it never went in.  Here is a case from the field where it would have
helped.

Arch Linux users building an out-of-tree Rust module with DKMS (the
bcachefs module, in this case) hit E0514 against the headers package:

  crate `core` compiled by rustc 1.98.1 (48a229cea 2026-09-01) (Arch Linux rust 1:1.98.1-2): /usr/lib/modules/6.18.53-1-lts/build/rust/libcore.rmeta
  = help: please recompile that crate using this compiler (rustc 1.98.1 (48a229cea 2026-09-01) (Arch Linux rust 1:1.98.1-1)) (consider running `cargo clean` first)

Both are 1.98.1 from the same commit, in two package releases: the
linux-lts headers were built with the second while users still had the
first.  (Arch has since rebuilt its kernels.)  The advice to recompile
`core` and run `cargo clean` does not apply to a headers package, and
the forum thread spent several posts on repository settings before the
cause was clear:

  https://bbs.archlinux.org/viewtopic.php?id=314993

The check in this patch compares `rustc --version`, which includes the
distribution's description, so it fires in exactly this case.  I
rebased it onto current mainline (the only conflict is the pahole
check added since; I put the Rust check after the C one) and tried it
the other way round, with the Arch 7.2.8.arch1-1 headers (now in the
Arch Linux Archive) and the newer rustc:

  warning: the Rust compiler differs from the one used to build the kernel
    The kernel was built by: rustc 1.98.1 (48a229cea 2026-09-01) (Arch Linux rust 1:1.98.1-1)
    You are using:           rustc 1.98.1 (48a229cea 2026-09-01) (Arch Linux rust 1:1.98.1-2)
    RUSTC [M] rust_oot.o
  error[E0514]: found crate `core` compiled by an incompatible version of rustc

With a matching rustc it prints nothing.  If you would like to take it
now, I can send the rebased version.

Thanks,
Matthias
