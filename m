Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A033CF4
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915798; cv=none; b=AfRqxM4QpaXsocfqdfaUGIkDrW1yN+aXJ8pPubl7HzuPYQXY2rUAZZowiAPW39RKeNWEnaSb+I6VCLfEcDBv09LCAOSy71dZBWdvJ8WCUeULvCjJ/QiTlD8CLnzj9zcd8v0vrJuijZPKBx5Y5hR8INxkHKG7p+U4Om4Egiz1qv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915798; c=relaxed/simple;
	bh=ZqAsJSg0eqzkEbEetvnGbaJchXsIfT5NCNfzIH0yj4k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o8GAWU/e89dToR9oMbbcq7gRdC3nFFLl6tBUwbzjCDrD6IpWyEiyWDbn0w5gZPTV0ccmPX2wflym0vuFYkzrq7TNJGyOf6zI3qm1mlX4eM11EwSYvb1qn+8XJG+Qwhr1fHkze4q06aYhZ5zcvPPqbdJnCXza5Lpq86WBxptjC+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DvPiQB8z; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DvPiQB8z"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-2cdeb808937so18024151fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 01:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705915795; x=1706520595; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QKRFYI4mzYUCWy9y4OiVImAthzXGQ+LzIhQ+1lzTvnk=;
        b=DvPiQB8z4E3+QMPKQRHhaTWkT8dPj7znlmCm+ien7h/K+BI8NZFZiRqs+FY3/j6suB
         0hTrvmF13zjVkITYXIVM/yAFABhsCmXpXScM0nF/YD+JCCcjtgZLRtBlwIN683HBjboI
         CUKeNrX4ilyVYbyQW7sNo3nvPzUUEuvHjlHaLnT2t9OStuW00tIAxs0MY8PSVH3Kx/+l
         BKR6zfdvu7PvktXaeOBZq2QkWhqSg/XAyIV/aWGN0J7+MVOVs8enNVekY0o3k/iVPx3r
         vytoCCrIe4XLdpi16hX6sfbjkytjyy4UiHhjNEws4Ktqvs8CZvQ3dl/lPjP0eV+90E9I
         aLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705915795; x=1706520595;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKRFYI4mzYUCWy9y4OiVImAthzXGQ+LzIhQ+1lzTvnk=;
        b=Utl/ZcXjAnrXb4V0yaauD+KLBxRVj4whB+mhEKELMJYtZaCQL3G5nxexXD5eWh9/1I
         oKhNG1AGK+ichTABvGU4xulmYm5OmCiLl8V5S+JCYD6wsftcEZGHvTyfvlJcRzUFxkLT
         rlOfarY1UaXWAMIKwKp0a05dgc/MnQqyf+oPyKigOyLZ1mFukLeuqdEpbESzs3gzZKI9
         2hddT5NgWPZnbT2UQol1sgStxyZjzbAoFGQjvx/5Ms53bGyyb/sEuYWdokZgs6GMSEPB
         J8XfEtYjmKeEQ/L6Cf51Hj17EmYv1TkthCDOxTPtmeUkvzjPfg+VUwjjGYf81fFRNVAD
         Um0g==
X-Gm-Message-State: AOJu0YxtRl5dxy2rtxc9Pnto8CNPYu8Mc1UeDWfkgMt0flNjsMnBiRaC
	r90ia37Bs5H4utJujLZZfiuO6XHzTT7z21CnxRMYEx9FVQVDsc2C4sxFJOOOLOf02BwiAkuloSx
	FHC6+rOI9L7+NsQ==
X-Google-Smtp-Source: AGHT+IEsMMKuFe5/jgf+U0BA0xo9fWib/S3e8TEmRSaTvO4jy91rJOeSI94h+d/EUCO79TGYM3SYWq9x7vpOxGc=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:84d7:0:b0:2cd:c20:1dbc with SMTP id
 q23-20020a2e84d7000000b002cd0c201dbcmr6024ljh.10.1705915795233; Mon, 22 Jan
 2024 01:29:55 -0800 (PST)
Date: Mon, 22 Jan 2024 09:29:42 +0000
In-Reply-To: <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240122092942.1571272-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
From: Alice Ryhl <aliceryhl@google.com>
To: jamie.cunliffe@arm.com
Cc: andrew@lunn.ch, boqun.feng@gmail.com, catalin.marinas@arm.com, 
	lina@asahilina.net, linux-arm-kernel@lists.infradead.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, steve.capper@arm.com, will@kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Jamie Cunliffe <Jamie.Cunliffe@arm.com> writes:
> Eventually we want all architectures to be using the target as defined
> by rustc. However currently some architectures can't do that and are
> using the target.json specification. This puts in place the foundation
> to allow the use of the builtin target definition or a target.json
> specification.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>

Tested with Rust Binder.

Tested-by: Alice Ryhl <aliceryhl@google.com>
