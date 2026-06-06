Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977432EDD7D
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 20:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780776973; cv=pass; b=QcX8KHNlfjwzEm1iiU1wO8FOtdcIbO4i2tm+AYWDrnJczkLi0osKVZWDS93yufDnyFkWolKxi3GgMyC6EwbyIsvZmRD9s90i5j7DiwXkxdfDfRbP7xBFX6IaD8PXzTS2BYZJMEMCqQpO0/r/jgpKo03sy3zBlC2MmA1261ve4t4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780776973; c=relaxed/simple;
	bh=t61VPhe54vxRkzTIv6KDtACiL92CW80uU73EbXW0JRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIysp9cQjAuN6q6RvJnKL1KGKAGLzvRSgrLmlmn0M188iv6HfDQwW0lzguh5+vulG4CSRT+GtUEa3vm0Soi6KBkqb99yfMEgC/NFxk7dJmlu8R5ltq7R2TglPNXwSEYk5RxR/kx9gU217kqmjiIzGfIexwb/6psWwKaCa3PTigw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfOJ6Zqp; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfOJ6Zqp"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304eb0fc233so256264eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 13:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780776972; cv=none;
        d=google.com; s=arc-20240605;
        b=AfJuy90KvP884ZrQEYZOesIvJdAbCFXrTytXJ/1RB8Ixa6+sn8XYyYfIVSI9MrehBH
         2dPQUGlJMGWmr4HErMbl8PVqTcWJK7511WI694+CLKQDDpdtevkVbxUHcLbkKkW2rxAO
         z2Dy+AchhSaPKrgXofVErMa9MRcoL6b2jTi/2TBKyTXgiQU63j8lHnhB12jfZqT8Q0gF
         I09RhppWSvgv6cym82LBVz4cXEWhNbx2W7oeQhQuZY/zDkIjSMRrQG88ib0GEyY94UJs
         qNJk5XY/Y25A6N5AigR7HTl+gNebXmRDkVVA9n83Arf6Kujdi5Nf5PPu07dfWr+1ylNs
         HeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UEOGwrHaiA8XO9EWRCyhroUJgb0I3D3G4N5dDLfn/FE=;
        fh=l0slWi0vAMEpC/LNO0a5GnBF8rAEmW7WEGJNJ3307pU=;
        b=CWm+9FmrkdZ0QKnYmJ8zgJl29YGJjrSA+Pk9i/IxczrcVNzCaMVmDsM12s3jEUW4fF
         YWTQ4sAGRVMYIx9t9Up6OWK5b021vpW2+M4nvRP2pW/vUJZKbWC/WAbC1rlLz638RydJ
         21ESOpzvMpFRpxd7OUouTY0VUbvIaLi/6evslrZeVonXfuCqCjWLBSNEwhlbdoH7I2HJ
         D+bq5LHGylIp6wDH15nkCV0mqLgkRLbr26OPPBKXkCyX+Ap+sXb0SuC/gbTH6DDIFYVD
         OZwr62WG19O1VJfRfPLbC12ZR+dgZ/2ibSpJ9VrPQGFe+r9vg2ulN4+k8dGcCpnKA7Tg
         1hHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780776972; x=1781381772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEOGwrHaiA8XO9EWRCyhroUJgb0I3D3G4N5dDLfn/FE=;
        b=KfOJ6ZqpEQRxAWSqoj2I2TuWlBQeGpJiNbyzv/Xu4SV35Yw0fXCEqHToMtKWTavqy/
         +vAw3QNf4a3/9ms9E2tYiZb9HsaMyN3D8e/ku+oWRvKodT9l1kE6myjzy5PTKXN473lZ
         Kjc+bpyMWPBmVrBMaxXChd+oE01XSPM3q9IHuWi4MEPB50wHXSwpWKhh1cxNaS8J0wka
         oxiDMkJ4oYilfFqZZqFkXJsh7VwsuTHpSXjkEFvLxH1AZtq48BpOVmGzGvWmagZVjF7g
         LWdK0gppWJjhOF+c8gfIYK9AAcrp1/u5ZSpQ1/zU2njN+AFxkE2FRN+OMh3dM9A3WUHj
         2iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780776972; x=1781381772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UEOGwrHaiA8XO9EWRCyhroUJgb0I3D3G4N5dDLfn/FE=;
        b=ho77U+RmnZ0l1iFVG1uTj4Icf97uPeMFn/F4VkkyWHP5OGCuSnnWYA1VoXSOWBWidX
         Ac26xacj+UAs0siwoyU7c3trmjBLNckTn8dN698Cd1Mkl7dQHI8IwI+P4wgEVvtcFGz3
         7kGSN74i3NyLfik8DsgzUXEyk3ceZ/zCoMg1SPCD62QfyDjZLY8q3b4nloNtJcDLJXR2
         7dCSX1u5DUvamgFI0huO8Q0/m8eNrNfjVkxJdTWZFQHP+c0gm2CQZpVM1ZyVeEw/WMQV
         IL+bH9qycHqZVzWdtZTRmSC+kCXrHa4hMA1kQ1NHxWc+i0NmVy/J3FU0EROcCEC24fI2
         hUBg==
X-Forwarded-Encrypted: i=1; AFNElJ+bkUzHFPD2G4MsU98L8gVAuzm0nubNbRhBeOZZ9ip2HPrN3J5D9ms83r01PtHmEJ/hObWe8prqJUsf1BK7/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsRC+d8lXCsIQt+N+esgWqRkhixn+1Uw0y35uZbUxxqQZzJQlx
	88U9ZTJPqGBfrAPQDgNxX6ZVjaOoTk+ZlxxcESE1tNlFYvfCfleRSQhNi/uqjpdjKTOEw2xdJrn
	Vt4Vp+gUPJYevQJn0eBTX1zqAHeKEJz0=
X-Gm-Gg: Acq92OGGkNYRxMRsUAWYNp0TkBR4d49Il+BsL9l3cXnBJEjpoo3ZDdheE2Fw/jGUu8h
	VJQI59KspkcdJyne4llk7t1jKhVtrsrc4Oka9wn2M8v44ntTK2yBRDnBaxY/V7OCgJ7B7whbklQ
	eVXocslEpL3lWde2JtVouhaolzG0x+USm0Cxcp7Ma2fR5Gzm1bUaK6yD42bZ64kCcZcupDk98x3
	y/4RPBxXkEer9RGG5JRXrpovHXnNo0m0wU5M8VrNx0FOr46So7qIth7lQBfEXCZazq8YdJqOR02
	Jrd+MN2CRxFf50XY8TKPOUVPnINrw84GeMkoOCHNrFIqum6w4SowUxykIFEgcPILNkLk1fgKKuL
	dQg97KKRUJ6PvY6lTWn5CFLISwBRauO/V1OpQwT7dIRKT
X-Received: by 2002:a05:7300:80c9:b0:2d8:7302:d3c with SMTP id
 5a478bee46e88-3077b36698fmr2188162eec.4.1780776971518; Sat, 06 Jun 2026
 13:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606-module-param-pr-warn-once-v1-1-96d9a93e8a1b@mailbox.org>
In-Reply-To: <20260606-module-param-pr-warn-once-v1-1-96d9a93e8a1b@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 6 Jun 2026 22:15:58 +0200
X-Gm-Features: AVVi8Cc7xJ_6E2gDHl_P8gKFX_BS_1RlVachhx79hu6aFhyQXTPndztXfotIn84
Message-ID: <CANiq72mHYTPBLHYngZTSbN1HppvGSCp+gpXg4FrM6box=sWjQw@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: use pr_warn_once! for null pointer warning
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 8:24=E2=80=AFPM Maurice Hieronymus <mhi@mailbox.org>=
 wrote:
>
> This resolves the existing TODO that asked for pr_warn_once! once
> it became available.
>
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>

Thanks for the patch!

This was already sent and applied, please see commit:

  ac2f40107cf1 ("rust: module_param: use `pr_warn_once!` for null
pointer warning")

in linux-next.

Cheers,
Miguel
