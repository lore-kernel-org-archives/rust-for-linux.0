Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89C33D8916;
	Wed,  5 Aug 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927048; cv=none; b=nOBHnKIjLv6K8xK5yeQ8g0Y3KcR3TSKSOxUsTczalUlwkgiU9jrdjbnwnyL9PuOCLCYFtDkoyuJlRtnZi/x6GqbPQrwaNkp+cBH8XEvfJGku/Qqv01/K1Sm+3nPNEZb8HBj8VnbYhneJoeQ3cBhO1IS1E262s+qezFUYjNbKSEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927048; c=relaxed/simple;
	bh=E0YqDKRzwFnaV5j88H4T+uDRHc2zT6TGfwEFi0eQGqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o70/8zL76tOON6ZLkPbicfhLeq/nog9I0YjZ/ygo4AjOn+ce/UPc6fTYlWFf4lp+rGsRKHP1CqNek5lrqGqkI4ZW6Nzc6TocC+V0BcZGHGVaIYnXjmxDSJ08WcwmgCh355WRWuYAwD8Et+/ZT4EnfXR03zOYkxPQ8sqUbcefB+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6m/EXY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6m/EXY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DF41F00A3A;
	Wed,  5 Aug 2026 10:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785927047;
	bh=E0YqDKRzwFnaV5j88H4T+uDRHc2zT6TGfwEFi0eQGqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=V6m/EXY1uF/hpUgXgMjnPgW7pojmLh1IwjYVvC4JNSLbddNZLtku/sFIjN7OaUdNu
	 LAPO++5m33+plu3NM3YwCivbr2LVdgTmubQQY4nTXUe/pQgPHFUvXrCE1Isz92vbnW
	 2ZTmQxpNZh4k6MMSEIiyd1t0qY8jPtfuxkqdWFDqt0tf+gSXrYlJGawXEDdgYkwNiX
	 kUDcMB6kqrfUAf2WPS1FK0gqB6t6vCFwvuOQQc5SQ4/e1xKdOgWi68kE2OOP7KLhou
	 D+ykYzSeIwvjfRih1aGbHE032fuXZ+vOWpIPW4jf3TFMjMZK3UXs8ntCHv7eR8jRyp
	 ADRVDS6osdYpA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Yilin Chen <1479826151@qq.com>, Breno Leitao <leitao@debian.org>,
 rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, Yilin
 Chen <1479826151@qq.com>
Subject: Re: [PATCH v2] rust: configfs: fix release safety documentation
In-Reply-To: <tencent_9FAFC60382D724C608F0F6BFABFC63BB6707@qq.com>
References: <tencent_928148924004787BD355EAB1EA3348E30106@qq.com>
 <tencent_9FAFC60382D724C608F0F6BFABFC63BB6707@qq.com>
Date: Wed, 05 Aug 2026 12:46:39 +0200
Message-ID: <87h5l8975c.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yilin Chen <1479826151@qq.com> writes:

> ItemOperationsVTable<Group<Data>, Data>::release() receives a pointer
> to a config_item, not a config_group.
>
> The old Safety docs described the pointer as a config_group embedded in
> Group<Parent>. Update them to state that the pointer must be the cg_item
> field of a config_group embedded in a valid Group<Data>.
>
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yilin Chen <1479826151@qq.com>

Due to vacation activity, I missed v6.3 for this one. I plan on queuing
it for v6.4.

Best regards,
Andreas Hindborg


