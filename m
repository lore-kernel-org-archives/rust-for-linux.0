Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3813B1FDA89
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 20:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758573075; cv=none; b=OWFIbNJ6QSc2AICuMo+fT1kR9u1L6Et4tMx4pLvoFicKSS/YmVHGGWrWT2JlbSb95cZXQZS/EJMnhmZx8JvZ75WDL0wVEWPt4muAefG1u96Xu630y7CXxm8LDPpLt/Y6V5OU32P1B7r4ycIXuHrW/G3MkoEK3gYZFlyLmR8yOt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758573075; c=relaxed/simple;
	bh=MJEFNOBSo3SKM5qiYRxxqoiLN0A/+xJxbSym8TLAOgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/Lz3/rVE2pwowsrcggt4FpZzY5jOfp1lwLb2lOTm22YyeBjeqj85rKD3/IhjfMRmf8HQs4vxKE1rZUFb9kMG3o8OpLg13NCBRAcZbFi5T7htejMQQ0kR0wMUjPcn8BWLMd8jP9EObxyR+nUcnQ1wY/kut0TFcYRaPaen0+Dy70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvWDYbj3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvWDYbj3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24602f6d8b6so7178885ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 13:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758573072; x=1759177872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcwSM1XGta2EiHK7PYQk1Nst2JShxKlF4k281BKxKcw=;
        b=bvWDYbj3iqME7AmlblHpwc+1M5ztBJOGASqHVlb/kZLva/72avzSR19LqgOH2RelOn
         7do6odcBZpcHxaeSOMY9yKKjO8m6vuJGhPQNuGl1MSz6SZm4av5TUNbUvXcDiTok23dq
         TXXZ0tvsHfmZqo1Beaam8sUsNnKpz/4YZOlkdeRD+VcaQNKMfDU8roMZ9yP1PI565mEL
         NFwlUp4qcAVOoJG/+ugesrgxUdPiCAalF38eZcMsr5RlCgok0as1Y+ukUX5igbaBs8w7
         LqMfKTRvpJ1VatoFKgNUD21yT3ee1HGZTtLEDCaojN5ZNBXLoFcgkEl3cL/aA0pMQvpc
         kvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758573072; x=1759177872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcwSM1XGta2EiHK7PYQk1Nst2JShxKlF4k281BKxKcw=;
        b=KzLhmEd8A1OiP8kuGecihmVDucXI8JtzRH4cXCExDEDX3buL7a8DMYOLhht99VEySt
         iUDULuZRPefiBiKTGTveZm6FY+BENyFaSDm/WmZjLj9eaYs3bHtPIcXoZC5giIVxswoC
         fHmwBtZf9WrjQDMQC+T21uTZcKZUgjzF/KFzQqS21x4dq0ojCA0P106HJzdPgn5SnZzY
         0hsHajPOh6XrjAHRtOVNU2J9kKlELbETaMr17PGAb1yJxXAtlCk6XtCxl6tDUgJh4FAc
         W1UCfwMlBKFAbiD9Jo/JkXd27TiwRRJyvfG1HpiZKA5xim9xbRhWlINXdLoLWzgMO4Ym
         1SFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVUpnRVEEE19EcOpQGM9lbp36GaDJWXleh0CoCh5LxhTUtPcU6qshRpBp1hStpUIgUXHZzKpKQ0nOw/ePx/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHVAXMlS61TQz7FlrHxOLYSQJEnFmF4G1PLEUURE4Um0XeBHc
	I6pZhEyC0vg0rk4NXJ3k9Gu/c21tiMa0yVdG861GaHlqNtTBCbJB2l12gywtNDcTcSJ+7m+Vv84
	bT/Dw2UJUsfDZbbX9YYXseRjdFAPHkpY=
X-Gm-Gg: ASbGncv6VBoZFii3WX2yYLe+Tysv0+TKEHveyu+oNs8wpMcg3qGQqW6nfqto6S8Ys5f
	umlkExpFP6gUI22RtSO8mONtyRTlBkQbK/KPHFSWUNpgKMR/VVOwLRNTfc4pE8eNnEMxgp3qAfE
	SWqYh38iIt+LwDmTaOjMS0VAoe1k3yeSfI1WsmhM7RgnO4SQWzjY6pakYxLSfZaWcXAk7ntxXQ4
	MDhAv5z+y6F8BcuHVIOKrdif47qajvfcHEhFykrklQqs70FK2ln/hD+6ujnedCbvSMhYAy39CGs
	GWqqYcq52XyCc5E/PeZU3eOi9g==
X-Google-Smtp-Source: AGHT+IGXlLgoOnlIi0xB27xbNnE/Gt3cViOhpVvylnU7nHRlbjGJ/bgbhPyP5R4jQ61rPO6JCpcQYEV2WsDmAL4iq+E=
X-Received: by 2002:a17:902:d48f:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27cbb8b9fd0mr1155245ad.0.1758573072387; Mon, 22 Sep 2025
 13:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813-cstr-core-v15-0-c732d9223f4e@gmail.com>
In-Reply-To: <20250813-cstr-core-v15-0-c732d9223f4e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Sep 2025 22:31:00 +0200
X-Gm-Features: AS18NWB6PmBlAWRUNDsKcUzY6cTwjDnURYFePpOCqHbTRGNIsxmxdgZIFpfQAjE
Message-ID: <CANiq72nyQiHCvbTw1+njf3ZWYsK-f603iY-oox=9dMyfeCE8rg@mail.gmail.com>
Subject: Re: [PATCH v15 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 5:45=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
>       rust: macros: reduce collections in `quote!` macro

Applied this one for the moment -- thanks everyone!

The others require a bunch of changes in linux-next.

Cheers,
Miguel
