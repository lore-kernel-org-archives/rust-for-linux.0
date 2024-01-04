Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A066224C1
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jan 2024 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n3mPtseq"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4b6b8262038so124863e0c.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jan 2024 05:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704376478; x=1704981278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xC0j8nNl0IjVq5e5DkTu2zl2RjAuSNRZYGbUYvQn0hk=;
        b=n3mPtseqEBHNdHwHjzDMddya67XPT+jx+YS3Mfj+B9svRdWb4i1DW+pxRAC+LlHLJE
         qu6DpLxAQ+GipxzYf4ahGGXOuOD36v3W6y5podQfjatbRpzhdEk2Wd5zDvIBM2NJGOzE
         DTSEsLbSG1P31uCtp4W0Qk1kr+FMnNgcY7NyWA6rvBtr1MvfdlT1QDCEzRaGzlsxyt6N
         6o7OTVwBK9Vec/kGoPY8kHWs3W+MAZTIsV0MNu4qvHuSA/fiqgtWD5k10tsaen6eqHpG
         OzFOib6HHSS1jWmbF0zjAz5mZrh68ZUD6QcG62K3/sdmVaAuxJM55fx/GQRquMwi7edA
         67Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376478; x=1704981278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xC0j8nNl0IjVq5e5DkTu2zl2RjAuSNRZYGbUYvQn0hk=;
        b=YX/mKTEWqHBm8mq8p7Ur2z1kTZMS5KhAvaREuKw+SQFzjnUNrj1o158/oN36s3hFlS
         SiHEGyD9buZYHYje5jghm7FsvTBrEHYJakdha6oa8aTEe8GIpxJ3T7BWiM7b93iSCqX0
         p1Y6zQ2u/C+l8gpVq9nkahr23XlVNwVXb164ysSrbwDjWourq4xo3Y6qAG3tFkw93f93
         WDj9G0kaB9oFLg2VvLNWKgCcgH9a2740nGUZdy977Inrby2zLtrO2lbz4Yf6WUTW+LRG
         nJmy+Kp/R/DqC5JJvAjAp9S/m0A7r0oqRJc0Vydt4Ghxdp9m6CUFFdHosnFOBSbs3n5V
         b9UQ==
X-Gm-Message-State: AOJu0YwR2EATP6fVimDBpk4lIfANo3CX87BmTdrRzDcx+RmnW2/Jwkpq
	0v7QvcW7Ra9E6QWneyicqOyrUpY5dfIk0kFG64TNqNie/uAi
X-Google-Smtp-Source: AGHT+IFbu7LeqKUR6Vj0pxOYX3eR00qsFCGeHZK2LuF6q/cVXgVxP38lTA89mlG8d6Yq8wLMW+CseqDx1eAtmEzXRwU=
X-Received: by 2002:a05:6122:7cc:b0:4b7:e96b:8b12 with SMTP id
 l12-20020a05612207cc00b004b7e96b8b12mr367724vkr.19.1704376478197; Thu, 04 Jan
 2024 05:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231216-rb-new-condvar-methods-v2-0-b05ab61e6d5b@google.com>
 <20231216-rb-new-condvar-methods-v2-4-b05ab61e6d5b@google.com> <ZYC3GR6LMEmRUQy0@boqun-archlinux>
In-Reply-To: <ZYC3GR6LMEmRUQy0@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jan 2024 14:54:27 +0100
Message-ID: <CAH5fLgikS57SoNz1WrqVYbr8-iYRDRD8RS2F_QN1YOuV3dk8MQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: sync: update integer types in CondVar
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 10:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Sat, Dec 16, 2023 at 03:31:42PM +0000, Alice Ryhl wrote:
> [...]
> >
> > +const TASK_NORMAL: c_uint =3D bindings::TASK_NORMAL as c_uint;
> > +const TASK_INTERRUPTIBLE: c_int =3D bindings::TASK_INTERRUPTIBLE as c_=
int;
> > +const TASK_UNINTERRUPTIBLE: c_int =3D bindings::TASK_UNINTERRUPTIBLE a=
s c_int;
> > +
>
> Similarly, these definitions are better in rust/kernel/task.rs.
>
> The rest looks fine to me.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks! I'll move these and add your tag.

Alice
