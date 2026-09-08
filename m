Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CED3AAF69
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854408; cv=pass; b=VsNQblqbfFXICbUYVOeqO7Bn1Zr4z4mbZH9RM7wQi9cmFCecP0gJ4GWvd145W8iLuD6YKQWWBiG9qqt4xkvYEK6burDSw7xEi8+IL/PI/2Lw2VBju4AsPs6+4++wZBwIOkJFl8ozeTcXvfmKUzq3Soor++UXkSgGDX6WWdATFg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854408; c=relaxed/simple;
	bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7VTc9X9bPnCd84dq8pwZhfU+XI8WZrQiRf0JiykesZwd070P7GVeIR7MyRxiRxoUE01ec7vUYMSoO2rDGFTG9AU3N0AGu6grucaP7pncIIJkMPrRKw150Lvoz1ZZT0XdMFc16o64a7bpAyHI8iY6Nt8wBapQhGyG8AT9HL25l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPXRQqLO; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPXRQqLO"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-930f618435cso481150785a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 01:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788854406; cv=none;
        d=google.com; s=arc-20260327;
        b=qeMdrvFcg7bZHzcrIWmH3bzjxGw2W5a3a8/M7hbA3LAnWAaUNyaNZeI2zCaOD/1Jdq
         rChTycGnNqYsBax9Wqv0eppGpWyJm7h86IN0ETpOkm1tcHc4cg11FsCfQg3n4KGRNp92
         0as6mBgfI3ba3uCd9KTdp6g7NQreP7NdwKTsmVtLCe+0FrKdvXPCCmq0gFGpSJYVB+/O
         593RAn2rUVgyovhgSWErEvp53y6BDU7eGjHYhhbgcSV48XVPZt5i3oUb9FsFMzXLcJWn
         ONyrZzMteI00v892x7yCmt63N/7k3msdcfmsz98ciJk7ZWEd36qGkc8UbWbfqY3vbrVv
         Zvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        fh=wzXo0RGkw58PsKWHBfmBCilZrVAq/NrGLE497gisP7o=;
        b=UNzjrqbIhN/uqlZ4cn//nXk2GoiWTyDTgzQYu66/mqRy0K5eO+mIdhMgmvcKLGEnfa
         6cDVemqi/kYQMucGxNvJzpUR7FvxhLOxDI4rVl0gmeljqFNWn85TVMymVNuW10OkLBnS
         nLSMmJJaMebcON0tXvbFPen6S4naDLJEnf8h6WH0OZ0hdOTfqtlJQN8JUgehMzQ5a6Mw
         CMp1sJC9rx4NEqL54Lwvt1ypOuwwxFc1hpvEehh40GUuOSwKIqpganPuGD1SALba5LDB
         Hy7PFxo8+09YM2eSJ53O0h64xA+g3pcT4iHXQm7EBgXu9MG7b8XbiIqYOADJ9D57vA6A
         rr9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788854406; x=1789459206; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        b=YPXRQqLOgzjObUYpTDpRCsIqyN6ghIhIdvUvY9/xv+jfKeUqMM5ykpXvRvQJK2Ln35
         DBMbswTAN80uljLXU/XiIj3DCJVdxzTGNSFqOqbgY6+xRUbzwP6r4dJffEX4IdLa0hCY
         duP6KonTb2c9Sh2kgVgs5OA/Qf14uh3oLcGfR4iaQ9nVGp1Y4evGCKiVCcwmeVugYYrV
         uFXiOlZG5L+gnxwwb1RR9iTXtmrgghdUl4AXvwbeKVhemHK+Mw2mSLLT9CPswzVUkHxG
         ClEOlMqmhzwHhE1cjjjjxNP0SxeMPLRA8L6JkffzEat7xdtuFVI46+S6guRtEzxLeCLD
         zbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854406; x=1789459206;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guaq+VGBE5xuZsh8TwFyvRdWEV5RQewzlTdQ0HnyLyg=;
        b=G4sZDQPmraELxAeVAEkFxpq6WW0kd3Tp/kO1s+QlvkCXepWTMaPvGePV3ripUTr6C+
         LGfWdtj+euuPbkA8inmpykEw251HpFOFU8g7pAbnqsTef5rAyK2V0XCrEfgtsGkaoGcG
         GKBnKeyUTMAEu+tW7pMYS9mn+x72Mg1Iin4hiqCzWH6NLpbnWDHvZKF5/H4soTC4VZeK
         Yuu+SL2kbqlJfcOmdu5sea4smG72odd/qHyKRtbAdmX06ejBuQeYXdwTSFEoLUFgF31Y
         uwzGKB/y7kcR81j+LB7DBcUpnf+2OmWw/I0hw6T7q2v12L4RfWQ69xHj6qgXwbbFdHng
         i6ag==
X-Forwarded-Encrypted: i=1; AKwUvBwjEPgrRHIj6inLfyMxiELyRrXp5px4Eu0AwRPzwykjTjkz/cY6CAMNaaIrd7JP7JCoFqk0G4gY4M/tt3qNKA==@vger.kernel.org
X-Gm-Message-State: AFuF++nomIUsH4aPASBoDCHomuUrmsPOAiao8XqhbSSVarBeDWtgAzOd
	spLqAUj+4bfqSHMJpxecI3wkBs+uvy/+mk91v5phXG+fmyRfZojtUiVyF84U7HeJbrsRwBpd2FW
	4i9tSpI1utQPqEbjpI7gdL0Eg7g6yeXE=
X-Gm-Gg: AYBFou2oaUD6I9u3WtsqJIWgszfUWnWYgwdCRYVt1PZ7HVadHazuxepQIdLtfm1/Oym
	3WK7t1EVAx3sYsJfl4QIqnkOdceniTqnxnVwUhIIKLFIg38CtXwPUUD+fboYP5F1ugB013U1+hP
	y0KTF3eCFWTcZIe71HQb5QQVl0iMhvdFupjM6SFSzgNAyvCWNfh0J9TmvzimLQVwaDhYhv8kWZI
	+LbaqvoLWnenEt4qtuInrcq6WVDRUhzMGkMuVzIR1+/WbucYFoP3lVCXTVldAGSp22Me3FcF6hf
	XxifmYXmVZYQbtDe9ILLS46ir9rX9TPvuTWFliCJQgJPLDYaa7yNGR/nhsZ/+PiGrbnjxRLo5si
	ItbClQnpNJaTBeNF6rp0UXGl6zSfODCv29tS/3GuW
X-Received: by 2002:a05:620a:8386:b0:939:6d22:6fd with SMTP id
 af79cd13be357-939803712c1mr2713471585a.18.1788854405591; Tue, 08 Sep 2026
 01:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org> <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal> <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal> <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
 <DL6HKYRXHNFK.1D9HYNEPH4GCR@garyguo.net> <DL6IQKQDXY7P.1F6PSERSJ64PN@kernel.org>
 <ap-vnh7KFJGJLW1s@nvdebian.thelocal>
In-Reply-To: <ap-vnh7KFJGJLW1s@nvdebian.thelocal>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 8 Sep 2026 17:59:53 +1000
X-Gm-Features: AcwNN1WfQW84CsExuRlle70Uv_VaeE2kPFpysKqrhKzJ84K5F_EcHs0pQw3o8S4
Message-ID: <CAPM=9ty74336zKWvS0BPVDnsczCPOPg_Lc0VsZnUfe8Yc=F1Yw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	nova-gpu <nova-gpu@lists.linux.dev>, M Henning <mhenning@darkrefraction.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > already provides it to us.
>
> Yes, I did look into this. Unfortunately the SM version GSP currently reports is
> different from the SM userspace code generation tools need (I have no idea why,
> there appear to be way too many SM versions).

Here's an example:

https://gitlab.freedesktop.org/airlied/mesa/-/commit/2f0724ef6b739c26ebd8b0828c93c51b137d7a9e

Dave.
