Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A98F37FF4C
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237439; cv=none; b=IsxBeI+J8mDjsd2xiaWJ8vYu9y/IiJTVhmkROzyY+vD9aEWE4uDQhvE928KVhkKQZ0sFvAjP3qpE+4ZKeSpW6P140be+lxGqcwQih7+B4fCoraVTv23E8Am0gvFAQW1I1A0/QLDJApo8hNs246mNW9eXqUEjMHJ5+fKK2+ONXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237439; c=relaxed/simple;
	bh=8Iy1IcR4WdDZ40F/cbvYBbM6qfiutOQuVhBz64JcOVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELYavdsv8NkXZq5UcUjEjl4IQogeyQXA987uJB5EakmfdwOVNuagAUfhf7oiMKymEcLCFwokA8LLDOJntilxzv2jeKWMpEnWUewignpm4JzDPpOxeL8y2Za3zgRP6gUfR2tn9YUC1a/VqVOiaJ2pg0Y7i5JSYaJh9X5BW9sJCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cqo+LXfQ; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cqo+LXfQ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ae5283dae8so224924eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 09:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768237436; x=1768842236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Iy1IcR4WdDZ40F/cbvYBbM6qfiutOQuVhBz64JcOVc=;
        b=Cqo+LXfQ1Palutq8SbjzY8ad1fv78FgVWzJ1BV7bR8N3NhAulzvGcSl9t5iIMfh5sH
         Ztlr7gh4AIIZLgDG1iGY6RyjEvUFEtvInVOM55ryeyz5+7s6odX6SG2HN8EyiU0Jtybf
         BDKp3LCc1XvGZoxh9srOcpze3doZc/HejjhE9kzI4OeOmAIzy9+IbDAMH5/aafDQXbPU
         H33rXXpJND5kPmlLTPGK5slr/fIW5vVlptmu10qfldRzuNvqZKIntGjjG+Rmx6X5Lysw
         loQqlcNTMEWxE6+EoBc2n+/S5nwGWgtEtjT+M3VdCKpvHv1j53qxGAz896z3KNAo7JJf
         PX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768237436; x=1768842236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Iy1IcR4WdDZ40F/cbvYBbM6qfiutOQuVhBz64JcOVc=;
        b=V8if2liJK4nsX7TmYs+uDrlhFA5m/IKZ0UxgM/+3aFEKVwvahC2fazBdmsnKvwm9Sk
         oI1ME9B9ZVmL9enAXovWoxkhnLCDiB3erAEajUqtr2Oh/mNaGEhTecjQeddD0Cqsg4Up
         fDS7dO/zykDP9dnSt5sOJpxSEDmRHcrwUilZdmaG2Zi9ZysUS1ZQQPeqHobXLutriiJJ
         33/2Yv0RQPLHvd+SuHTpF3p3166OBuM4Z0VtE88VfSQJVaunXdFtr3iAL6OsnIf3NJEx
         7UriW7nWzwd7dc3onJmqyBextFIkSvTrzfHPqiVnu0D1LTRXE4oWcemoKasdy7DdC0aY
         gqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqkKflK1iIfXkUft5xJCbji75cO04TKW29rp7eCkQ5zZU3lGwFflnIf8WoCTCFEB6NWX+Cj0gKuwtSG0AMuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95By9VAh0T9rJZK7ehRF8FW5nb1dotRuh3Pwq5sF5jgWtPGlI
	oUvF35KVSKC2EOWnvem5nHfQ9gC0P9hWnyFvj3TI+7Yz7twmPY3XlZQ4Zwg3yLmfvqPtF3q0uA9
	lr3SlXCQkUxLwnG+Ei4mzqgx1DsfuxiY=
X-Gm-Gg: AY/fxX5kYmq8xq1BB79fAYZaB+q5NfNcARnRMqHNMgmMUupzFcmXckaS/uuuQ2JqJnr
	LYt7GGWapoOgGGRfgc9RbSrtKs5wTCfjErrB8FAUmpVln79SU+Tf23gDi/2dv17XlEf9s0F8i/w
	jhrmMq1Al+cqn7i8M75uirfTH9BOwsZp/Zssawd0LGySO98a67FxefG6VM/8WJ1lwZCcrfU6M7y
	etZpXoavtpevJAtW+1+G3J1auL1YF496OGunoUgJBK46jrPjntv6x/89D2ecpY4YFzpO6T+1Mg5
	KHQw1BQA7csm3mVKGzgMBHd7t8ZuD2SL7qv2rZD26/5BvJLz03wtOY8bMrNE6w1+X1RwGHiAtbr
	IFSHk3JZu9Y4Z
X-Google-Smtp-Source: AGHT+IH3gHl2WRkpzbvqMnsr8nKEV/fav+2+W6EdkH1VggpSF5ZqGvrctMsTlSbwXPg03XsBfcCIM0QUSc9w9t6L2Ac=
X-Received: by 2002:a05:7300:33a4:b0:2b0:4e90:7755 with SMTP id
 5a478bee46e88-2b17d336a74mr6966704eec.8.1768237435657; Mon, 12 Jan 2026
 09:03:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226113938.52145-1-boqun.feng@gmail.com> <DFMR5480EBNW.2TGBZVU4XZ8U7@kernel.org>
In-Reply-To: <DFMR5480EBNW.2TGBZVU4XZ8U7@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Jan 2026 18:03:43 +0100
X-Gm-Features: AZwV_QiykkaHQuMOJgwclKcq2vfuj1usgpuYK6X9o-JqFIdMrA4xHt4Y0Ob7ia0
Message-ID: <CANiq72=sNPJjfR9Oz75qS_oUm3WNVL1Q1vtaBif9_31MhOdDSw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: Provide pci_free_irq_vectors() for CONFIG_PCI=n
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Dirk Behme <dirk.behme@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	kernel test robot <lkp@intel.com>, Liang Jie <liangjie@lixiang.com>, Drew Fustini <fustini@kernel.org>, 
	David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 5:30=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Bjorn, I just received another bug report due to this issue. Can you plea=
se pick
> this up for the next -rc?
>
> If you don't have anything else to send, I can pick it up as well. :)

Ditto!

Cheers,
Miguel
