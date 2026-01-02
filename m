Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA22C0F7D
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767375581; cv=none; b=JZzsuQbdn4EqIO+Nmwetvg0C8OoDhRLIqBkIR27KtgYOeEKlkEMC02wfS6eOjTfpIqU7DYNMEHJDBAA63ZHJjQsQcvG+YgmRzHrUy+uQoDn7lcjoehxHkb245TbFgq5TZTIGFe/T+IAnGRo/3rhnIDlNeFjudnSyy1g1hGKO3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767375581; c=relaxed/simple;
	bh=dXhEwgBf2JE64Vc2IaiZoaZQSJiMkABxoxiZrRYk5q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEn94wjnqIST15aqee6adyYXtU5TtrvBimft596wPw7F3bj2xeeJ0NQJsWcQTSsn78kSwS7TC5HsqPAQ8HaV41A8S5lh7ECFg0U9UjNH6i0FQ2mQgwnXEq2W3zVjlVXbBlmGLjJ987OaAboT8s1/uuFYUsaBmNytsMf29vK6sRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M9nGuHGt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M9nGuHGt"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so6162191f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767375577; x=1767980377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XFlYNAfD8KZjFdmv4ZkTt//9cnyT8dXrVBdI2xiNuoE=;
        b=M9nGuHGtmuCOB4/4fSPrUtyTQQbEVDO5XaNSkQD6AB+iSzXoYki5Lf9P0zR4F6ckxu
         zHb6fGN+MHJXgVeIWqgjEmZ6d7nhARPQiNmAYZLmq8+mIB1O302rCy00sAEVa9yvw4z7
         EJ7RIYRyrH8iKo+8JrdJCtbJIN7GKj6rBmOdN8WH1YkdD6Q+p4bfZk9/SGtFIs/ouaM7
         5lxbNuqFanYxw2iADmpiNr8u2Ztot9Vj/Qm8m+aKUCvL5bVkspSExA4hscAjj0fN+1Tv
         Tv7H0GvnCCeZVdH0ebXRrR+jkGtR9bYzsCSzphKrJ+7GJwMs3DU2jDR3sLhndJBYBWWS
         UZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767375577; x=1767980377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFlYNAfD8KZjFdmv4ZkTt//9cnyT8dXrVBdI2xiNuoE=;
        b=d0+Y1izfy8xURjiXjLR+kBvI/bvuBvYt+6FYgYkhv8K9oJRIXizV1xLmtNDa1tZmNq
         mkGPwsIpHA9N8hqJXXOn0PTbym/EyiDe7TiFW0HDKYDNfQKft8kwqD/8z+ZGm7rcFNnT
         0NuXBYrDyuQFNmVQpLqJOGif/HXAg5sjzx37Kr+9XB/0VhpveGT24BkE4pZszijc53Jm
         FKDddKWJ94jNK44+9+7yACFUyfl8LaukrIsdnVrLl19kLyplVp5oyhvReQBMrF9EX/FG
         3LmqjMQH8YLp6Vf6NP37V/3/t6UwqRnWVmJWgOriXVw6Y0sx/kpkc3pXqhjYlW7KhrdG
         P9LA==
X-Forwarded-Encrypted: i=1; AJvYcCX0QAcFbAiH+J2zbkJdDATyURL8A5+gs0exQscUHNbhLtB84GwR1ScaYMHl2YDIzhgG/DQdp4ziktoeVZtKCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfbRjcQF/eni8LEniCMuW7+uuiDbKS14GECIOyAnzJxdj4ZI4
	JSnDJDk4C//umfMt6eO1BO7k+Kk3fJVjl17WUH11wsUtbBVxb3w7JjxKvX/5Wqhwwyw=
X-Gm-Gg: AY/fxX6y2CRIrBZnjMzbUOlLBlBdvkoK4Acd4pMvmR/YcB1xXFvH6d1/1wNsN79cTPj
	CMMJUXPpZbP0oQKLo59+5UvdG6ii6NgdgxOLl8+NBDEBIm2llfAxiSrvs069+lFK8yxnC/SNz+2
	AmQ01v4Dy7AH6aibXx4vmwr+zK5mve9PNfHyEmBZ0O6iGKGmeCoy8/WZnu9sAyMSRu/OqSnXsuj
	mfrTdHkwct2figxiHel+gcrFhjXB3X8Yop1xziPNIGquOzXjfpYrgchCRZc5auHiWCvvVScy3Y+
	lH0O3qTxeQQGW9XXfV2aZcB7IrtbAEUtE/xmVZEvurkPKrAtptKdAKG7C8fJQN5qFxk2cPeOGbR
	3yx+xwtrz7CfplUXEBxjwbIVJYCWYOpqxZoHuSNYfyqTolU7/OUqMRzLSnkit72gR7FWX3SG1Tc
	qxj6d1eQ9g/8D5pg==
X-Google-Smtp-Source: AGHT+IGg48EmnUyhowjX8HKhRZMqPwKBjfV7TIc0uopH2RN5QMeVuOe3ojfz3TrrefEOfsEC47o4fQ==
X-Received: by 2002:a05:6000:2dc7:b0:430:f449:5f18 with SMTP id ffacd0b85a97d-4324e50b88emr51890103f8f.46.1767375577368;
        Fri, 02 Jan 2026 09:39:37 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm85623516f8f.7.2026.01.02.09.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 09:39:36 -0800 (PST)
Date: Fri, 2 Jan 2026 18:39:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
Message-ID: <aVgC1qXp1La6E9p0@pathway.suse.cz>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
 <20260101081605.1300953-4-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101081605.1300953-4-sunke@kylinos.cn>

On Thu 2026-01-01 16:16:03, Ke Sun wrote:
> Make raw pointers (*const T, *mut T) automatically use HashedPtr when
> formatted with {:p}, providing safe default behavior for kernel pointers.
>
> This allows users to format raw pointers directly:
>     pr_info!("{:p}\n", ptr);  // Automatically hashed

It should check no_hash_pointers variable, see default_pointer() in
lib/vsprintf.c.  See also "no_hash_pointers" and "hash_pointers=never"
kernel command line options.

Hashed pointers prevent leaking information but are not good for
debugging. The "no_hash_pointers" variable allows to print
raw pointers without changing the code.

I am not sure how this should be implemented in Rust. If you need
to keep HashPtr then it should become an implementation detail
and should not get exported. Nobody wants always hashed pointers.

I hope that we could find a better solution which would allow
to reduce the code duplication.

For example, I wonder what would be needed to allow calling
snprintf() from Rust code. The fn fmt() might call
it with "%p" format...  It would make it easier to get
also other "%p?" formats.

It seems that something similar has been discussed at
https://lore.kernel.org/rust-for-linux/CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com/
And it was said that it would need bigger changes.

Maybe, we could create C wrappers which would allow to call
snprintf() with some specific format, e.g.

int scnprintf_p(char *buf, int size, const void *p)
{
	return scnprintf(buf, size, "%p", p);
}
EXPORT_SYMBOL_NS_GPL(scnprintf_p, "RUST_INTERNAL");

And use the same approach for any other %p? format, e.g. for %pU:

int scnprintf_pU(char *buf, int size, const u8 *addr)
{
	return scnprintf(buf, size, "%pU", addr);
}
EXPORT_SYMBOL_NS_GPL(scnprintf_pU, "RUST_INTERNAL");

Best Regards,
Petr

PS: I suggest to wait longer before sending a new version. It would
    allow to get feedback from more people who might see it from
    different angles.
