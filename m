Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BF02D9EC2
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902673; cv=none; b=SxfoeeQ2736uvJlatpeHosY6Lgzyir1F6WyyvaRVzilCWSUh28COj1fNwezblwYYglO4WJZY9QY6RJjCPdZjbGKmDiGRQvV5blbX4g1k+eAStq7LZPqrhBRiMWZcb6E/A9RAExfQwpki8dla2zh0mX+Bfvuh225SrSPzSBeAxuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902673; c=relaxed/simple;
	bh=Hajs53XYMpwYWP2zIlZ41wJ/oMUklHmk4/A9g75oirQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ibH3MQ1Nz4wqiE7YjGQ76YdNt9ygZPadPGHKUGtVJ0BvqQGFP94AFiKWbGDRJFkiOg6W+VHHv8U4tRhFO7jd/+Q9tJuMwdlBrP2CPfFFWHZo2Wv4dpV5/Ug9BS48R9v1YETbp07AV8RH5+EPNr7SljbLCJrJa4QsLLMKxiwrH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nUykgaUh; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nUykgaUh"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-459d4b5db81so22899995e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754902670; x=1755507470; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JysEBdd59pghN/d8Nxxa5pekhaQh5OQKuEuP7SjyQv0=;
        b=nUykgaUhANTDMhCMKwkEJZ/10O1JHSvnheHOw/RqT1b2C62QS1ZAuQ6YKOMZhFm8Hm
         Akx5eBr3M3DsK0pXx/iitA7NJ+EEhGHiK2RXnU9RB2DX3SA+Xedkav+IMNCDdhWugWoM
         4priEWFvYDQs53a9QzpU60gehzUiKgQN5h9Et2+R3NI4etyC1/4pFPuxKFjCsib820py
         WriiZNxyb+u3+lTjdgtHLxchTb0W2upRNyqlRj67DpuWelWd+Acr1UhVJGYrmXfZMtQt
         DbDwz3OVSsvH2/uwLR5fI04+QHF7NsQnrNx+rhDjUiPjjhP/WTA1OGibySKK+9RL/pKK
         55yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902670; x=1755507470;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JysEBdd59pghN/d8Nxxa5pekhaQh5OQKuEuP7SjyQv0=;
        b=PhrJGbxcrMWZ7hEEWssGep+iLpV2e//HN6YBwjSP/YC7ZELXZDCPx6NRtzZdWwpjZZ
         aabBphHoLJIzZ6KqAB56WnKvTLHBVs/LZZSyI1NWfqAUsJvvatOSeoEz7+pfFLLSPX7g
         XTGcD3cMSBILuhLoHWa62HSOllUh9Dtqc0/b37CDtPbdL3smdxdHaUVtov+GZvE0NIhg
         P2qQOzA4P6P7R/Bq+mW1YFUKRbudkgqJ4pjxIemy/NVjb5ZA+dGr3Qa/RZvXMrZOD66Y
         c9sYbcFYRuuEkUHkJE2FfMA4G2hADdsjgZbjpw7YsN+1moGlI5WSW4ajqH0i2w0s137C
         /owg==
X-Forwarded-Encrypted: i=1; AJvYcCX4fr6LTQJfueVDNxk7VMQt/RPol36SDqjS2VMszpDknJgYAybsfbDPDbIIsy0FQTXDtWgrWXGCihohhrty+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiYH87wZvm+pWp5DQvGszaau+9uB3aE62Ysk5jNK/sDDFGuprH
	v34exMkup81sP3ItoHsSlPxtj9UoDgJMx2g9wAQhNXNmkeHGAwj1BdSjfzafNTRf6xgM8Yl3OPW
	9LocvjKD7cxZLzJUEMg==
X-Google-Smtp-Source: AGHT+IEqPPe0k6S0lQx9tRfsabdvVoDHbVFhkVANSjVxSbLwMQeRluJK8XTWR/MwX63t5Tj7Wz6QwSOLOM3awe4=
X-Received: from wmbgw5.prod.google.com ([2002:a05:600c:8505:b0:459:e027:2d9b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45c6:b0:459:e06b:afc3 with SMTP id 5b1f17b1804b1-459f4f3d7aemr70746995e9.1.1754902669754;
 Mon, 11 Aug 2025 01:57:49 -0700 (PDT)
Date: Mon, 11 Aug 2025 08:57:48 +0000
In-Reply-To: <20250808181155.223504-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250808181155.223504-1-dakr@kernel.org> <20250808181155.223504-5-dakr@kernel.org>
Message-ID: <aJmwjMCgFPItcURy@google.com>
Subject: Re: [PATCH v3 4/7] rust: page: define trait IntoPageIter
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 08, 2025 at 08:10:18PM +0200, Danilo Krummrich wrote:
> The IntoPageIter trait provides a common interface for types that
> provide a page iterator, such as VmallocPageIter.
> 
> Subsequent patches will leverage this to let VBox and VVec provide a
> VmallocPageIter though this trait.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

If you call this trait Into*Iter, then it should take ownership of the
underlying object. Since you only borrow it, I would suggest calling
this AsPageIter instead (or go back to a name like PageOwner that
doesn't need to follow these naming conventions).

Alice
