Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED3E17332C
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128057; cv=none; b=UogSHWVB3Yb/k8/orzpJh3cqQAwpboNFFbXHIcO4rwZX/dxxNqkLZ5GElzb8sTv1VZetIs3EWvifqVhNHvqZGOekAnnnIr5vxP/BTtl//xndbl9VgCUwYfjjX1lGGEz2zMNWfibow5cwosjp6Qg3gPBPGnL5CdgrD3X6Kf+NEkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128057; c=relaxed/simple;
	bh=H0yQL7Yj3xAfGiqMxWIRkW/8b2njG9FZnAqlG1ULYSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnZDwYkpBcnkFwkpGYZS5/alrroo4prvagQ1XwDlnmd8IeB8btCN0ZK1yMe81TrE3i0yznU44zCGxNHG5O+ITHRxgJejeYdfOxjI82S1iiClWZMNLFWHOFbFGuNV4O7YxUnDTka4deKpNuGV732IHYC6MA0+ZMF/oqG5mtM0hdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=joxKS2I/; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="joxKS2I/"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-653652a4256so283083eaf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761128054; x=1761732854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0yQL7Yj3xAfGiqMxWIRkW/8b2njG9FZnAqlG1ULYSs=;
        b=joxKS2I/+CgMBOQI0vZLyl89GWZa9/BI6zE5Ji2Ul7QjSXh61ZNSiYuYPqqmi6EjKJ
         trCJq1bMhYCQLjzXN/39FS9RBieArrgiEmrB6T/MK4kUn/olO13CYAJKSow/ao9kL05a
         7zbWMY93z4hmMhByPfewchwNnCVdeqh0FYYOw7ckeCJSNJCQwLAq68pIqWR04JBI/1p/
         i69vjZ39YH/5M76f/aChBuhqm0YZLTSOuvy8crfw0KIbO9+sEFcpGtbtXQceWUHvsI9h
         eGUGYTxfr8ntfJPhPLm5nv8r3tX7XYfHz5RNsKYXstWNKdetnyW5njFOYfIolWNAiR7S
         xJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128054; x=1761732854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0yQL7Yj3xAfGiqMxWIRkW/8b2njG9FZnAqlG1ULYSs=;
        b=eeq1sB2WqRq15mZ4wg2SCH2rVAt2p90LfmJck4GY3N3AtaJKIqEdQIGU4m5zTbMKf9
         5aAOyvLrMDmVZWVQjc8IUrausTMy8vQBCH5cluqdaYJb0MErcLeUosYVKO1LgTVGhkdh
         BdtaazYP5Zh8EUbH6icqZtRXIAV9LQCT5pLgVmK27CLCmcszFwiadaHQr/hPTNPm19st
         Z+0bmS2QGA52ZzbJatUm9fgYgWSk7y0kv0Dga8+EDvHxW/tG4ix+iondz5Do68cVZUsA
         NGxjnOzylp0yky9SaGTshYDm0I+NM9qkpgRPvMnZJhyTGtLGvvD9YszGL9bJdpQNKQIF
         oOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC2M1a2ffg3fy76saFyC5ExsHWYVtdfRnAEcik0/U+lm2feNl/9Z2nz7nPHYNkyYp5EfH14urBfoUnuLbkqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFOpf7ERfpXLm+6NmDlL6OlXay90XRyDKqLJZ7yO6IyBbBRFzL
	WcGpcmiBf/CEQPTF42PoKy3LB60CcaD59XbUvHe+LcAICxpSty4LTce7l7StALp3YnZBLVRtNpL
	TougmqKAZAKkJrcciNOXdLERTG6Y6Y6N70MhY1ftL
X-Gm-Gg: ASbGncttIOgXysNlDP1fDn0xPfW1I5nOeRd7MlDe7kCmYAmahHKNgY/QlfMaikPd1Nu
	rXjg7Su8yK1p/5JXCCw310QsihhscG8HCz/OWNbJG72MJ+exv2SnWiLTzAG8pIo/W4ezWIFQ7HD
	mFso20etrm+LO4WBTlKZaCT40p0Xgw+hBQREq1q7DtFwyJ8AGO0YauneH/zyMMGURJiZeKm3FaJ
	plh9VcOH/wYboQbEt0uHPGQMyTBSdXfNpOcjW5nylxQE523lMlUXlO/mvTNZejQKEZd1C/OUnKc
	A/TU+UtAZvjGkF4=
X-Google-Smtp-Source: AGHT+IG601XlVSePErRgku2vXHiQm4srVDoYwTdc69NkfT5xbwE/K6snIHcykqpn0TdBm6kNBfvWxtGffkFM8Xw38bo=
X-Received: by 2002:a05:6870:f70d:b0:335:b4a:8631 with SMTP id
 586e51a60fabf-3c98d0e3b92mr9539118fac.24.1761128054251; Wed, 22 Oct 2025
 03:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com> <20251021-binder-bitmap-v2-5-e652d172c62b@google.com>
In-Reply-To: <20251021-binder-bitmap-v2-5-e652d172c62b@google.com>
From: Burak Emir <bqe@google.com>
Date: Wed, 22 Oct 2025 12:14:02 +0200
X-Gm-Features: AS18NWDBQzTe7S67kufVQReN9fAPakA17zOF1cXXOxHSQAtU4piUaSjZjQNyA2U
Message-ID: <CACQBu=XFP03+9EKhvX_6rEA_aYRxyMmfGOV8hE4_NRwDue96Xw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] rust_binder: use bitmap for allocation of handles
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 3:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> To find an unused Binder handle, Rust Binder currently iterates the
> red/black tree from the beginning until it finds a gap in the keys. This
> is extremely slow.
>
> To improve the performance, add a bitmap that keeps track of which
> indices are actually in use. This allows us to quickly find an unused
> key in the red/black tree.
>
> This logic matches the approach used by C Binder. It was chosen
> partially because it's the most memory efficient solution.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Burak Emir <bqe@google.com>
