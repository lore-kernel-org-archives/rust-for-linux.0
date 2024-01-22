Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EBB39FC9
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915854; cv=none; b=JK7zzlR1qiR+GdAA+f4ZAQ5n+SJgTvTPS51gykGH0ULnSCWmCt73A2fNOdWKVvRdKeQy1dnZOlwj33ZSpZv0FaXDUV2NV5Hfw83D30oDir7KDr8iKj7ZZZMlStublSqsHoMXPllbRld37NZQwr6qeeGPuRNURJXQZuA5F0HWKFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915854; c=relaxed/simple;
	bh=0AN0JDjDVHMoC2zzsS7borJezHJPl6GsycxqB9ysPvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tiWakN/mfOovYJRw/zShyEP0a5xL8rkbnf/wnuwqMSin/vRf9hU+nzjaougf1VU4/2Z5sLXJjs3zi2lbc5+JuqVrvS8fA7rr2/p+xd1cp5OoqNM5ZCLxC1z+tlbTPUf1sttPgvLVmhvRr5hnULX5Xr4cLHVn+BJ8I10gjCh/F8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j8cVmH3H; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j8cVmH3H"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5ecfd153ccfso42577787b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 01:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705915852; x=1706520652; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a89Jvo+Ur6qyxnNBf92ZOJQ2JdSYqdLiyDhsk93muCw=;
        b=j8cVmH3H1ItqmCEOvzpLV+3/mW16CXMG11Iq7T7XeXn73tnWs2pq6HvaI4GYEyH9sb
         Ud16PtntUulSeCXuvDNlOQAkif0BF/5VbO5Ls0ttR80p/b9gWlSfu1R01/Ba7oBljuNi
         FJWQgDr1dRWM5nURn6C/DEPVvU9rJja8BPVTMdtrdK42Mt2WF+g16/uGB49RpmAdQ0hT
         wdrr6YfZSgF2U6HEoU8Immw7MZydelDsbLNYbxucOZNdNgc+PeW1uouDdJMZBKqI33ED
         JMCenjcWAtiHScA2PT36Qh3QYas57MaIg0Mr7L+axpxlHYG6NU1QuKTswF6KhcuJOCSd
         cN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705915852; x=1706520652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a89Jvo+Ur6qyxnNBf92ZOJQ2JdSYqdLiyDhsk93muCw=;
        b=RPSvcWKqYiokSsixzfnVS+5cn4RekeXjsvLBAek62gN79lw4PBSxMWIC71rstr3zzf
         mRLijjrWkoWuXW4qa6PSKDcszHcVHQkxuPyLBFxQXAkmU+eeyiQz+zeqGiPa/UDCSwYH
         AC1jnYiLqLD42sY8PUzoMRsgyE9sdKcVV9ODWrj1bbbxEFfJfRyp2QvhULPsQQb9d9VU
         LK6Hcwt1Ld+6c+IntWWVKh4pUqR0IkNODlWrMYUzNEVzu54teqKK6KnZ25esKOxzP8Pp
         w3pa8rz7OYahrRFb3i17qmkoC13bRmSVoySsc7fX+PoVS+eEw3E89+RrjqP+g9QxHDZO
         Lq2Q==
X-Gm-Message-State: AOJu0Yxob7yq+fb1x8hOhP0Uomzexud1GgIhjEDAsKH29Ll2ILADNJt7
	JMKkda3BHGS6Md7u5xhHzd6IYD+8E5/a2ka1Qhvh4mrpY3Gt5VC0Bub7D+dnCXGaItCjcNXia2z
	UQUDjNW30r5a1lQ==
X-Google-Smtp-Source: AGHT+IFQey2rcY+kVQveT0H1v/C5pAuYbvIgfXr9YKY0YUXpqYAimz7mtbVxKe6zo/TZ6XEKjf6xnDkmObhKo4g=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:218b:b0:dbe:9f60:c72f with SMTP
 id dl11-20020a056902218b00b00dbe9f60c72fmr2061997ybb.4.1705915852340; Mon, 22
 Jan 2024 01:30:52 -0800 (PST)
Date: Mon, 22 Jan 2024 09:30:48 +0000
In-Reply-To: <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240122093048.1572191-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
From: Alice Ryhl <aliceryhl@google.com>
To: jamie.cunliffe@arm.com
Cc: andrew@lunn.ch, boqun.feng@gmail.com, catalin.marinas@arm.com, 
	lina@asahilina.net, linux-arm-kernel@lists.infradead.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, steve.capper@arm.com, will@kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Jamie Cunliffe <Jamie.Cunliffe@arm.com> writes:
> This commit provides the build flags for Rust for AArch64. The core Rust
> support already in the kernel does the rest. This enables the PAC ret
> and BTI options in the Rust build flags to match the options that are
> used when building C.
> 
> The Rust samples have been tested with this commit.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> Acked-by: Will Deacon <will@kernel.org>

Tested with Rust Binder.

Tested-by: Alice Ryhl <aliceryhl@google.com>
