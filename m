Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F518EB0
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727643027; cv=none; b=h8z3P1s58RDpLbykjbfnhehVSp0UdtsxgKPUYyp71gg8GzQtSWhcAONlAWHTHQKPj1cRvizTsO01ZziOCcxz9u8NFoPxbVAs5Vb5Xk4DX63MIMdaRlloV+bwEO4jcerxL/U2KkTy5N3wR3gdUGpk2jsv/KX3pkkOe0XPnPlOXE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727643027; c=relaxed/simple;
	bh=mAda5Hpo9svnQtIQRKeoFjozfaSfNFcwhiL8p8Bw1yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRiACoJBLYsKdz4sNM0CoqXpgryof62A9TFjSaabR5zMxjA1IYwXGPcey/Bzb4ZLSb+P2cjO9diGSFm2zUMPDkuJ17/JayMCvEGqOrQBV3POSQtYxmq8+lWqQrpfRV9cBZUMzS508ZrPAYc4n84sXn9yT4H+gweRLO/jYubCHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=a+OO7bKu; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="a+OO7bKu"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6db20e22c85so31897997b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727643023; x=1728247823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAda5Hpo9svnQtIQRKeoFjozfaSfNFcwhiL8p8Bw1yE=;
        b=a+OO7bKuvZ3aufW3KJ8EpZ8igXds5B/PHWcN8hVflUgePWpG91ZPPvSTJv1cpB1Pry
         A5OnjOe78M51ePMkI7L/sqOy+f3Y9eZTDcBObS0NQEV7ZjX/bTUISLtNi3Io6qByDxAk
         vll9bNfnNu+JbJg+ONY6/QX5fohGD7ZyO4pIQXA62nyPCMLG6pbd2kl+Iiit8Qpj5SIY
         auPjozYsANf0L2gLmD5XcPjp/9Gop4qWtdiD0lppkB7x1SGjN/hhGgtezo+o8nNtP2wX
         4xUMCl537OmtCTC2OupEDZyyOPgQcBXgdxvNoGuzxPIKWckcF6h00NVKrVGidbuyHk2T
         wbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727643023; x=1728247823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAda5Hpo9svnQtIQRKeoFjozfaSfNFcwhiL8p8Bw1yE=;
        b=Ctg+ZNYxnQ4+H9c8Qg823RcHK6JEQcu2eYXsegBggwecRezl00mZ3U2pU1CF2Pf8AF
         2YB9GJ239CtemNcs45SeZLZYiPtyUfMsTFPldI7gDApPWjZhv9YIMIzg9AOIBMrRFkWT
         RMu2cY5p8E7/IgIXbQhu7iDFu64jX6ml4L/zYWw1u5WscCpd0cvhBD+SIZKE4vuc/yfI
         77SVoOIlSrhM57x2vzArQndRn6E38sWBlZFZI65V1PFbl0SNPzRaMmrb37zkycYYox5t
         seuwmvFOaA1QZt352IaRu7otE5B2Jup974nWb9adQTcvFJwe1ikMl1t2ClhVqgY1Qu+q
         E+/Q==
X-Gm-Message-State: AOJu0YzHmEh+N4NnNdBNxPqQoFE6RZ+ZxDf3hHqd9ahDpX36CrbMp7st
	jNqXCLH9vDFKdGQlbHAa2ON3WA8jeDXtXsLre2CzJFQaxEqGCeNKQj5b9qvoz3mBMUDSBKUIcAS
	tytJBRVPqr9UObSqlQCa4x/wSVGzPdCr5D3MP0A==
X-Google-Smtp-Source: AGHT+IEaFN8drxJ/Lmsxoyp2reuZr4TaggGmqzYkniIgWdXGamTtr8C/cXk+EHngDU7re7cBpw2mSIfVlnQG9nusT9c=
X-Received: by 2002:a05:690c:12:b0:6d3:f283:8550 with SMTP id
 00721157ae682-6e247600468mr69615207b3.28.1727643023592; Sun, 29 Sep 2024
 13:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916213025.477225-1-lyude@redhat.com> <20240916213025.477225-4-lyude@redhat.com>
In-Reply-To: <20240916213025.477225-4-lyude@redhat.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 16:50:12 -0400
Message-ID: <CALNs47s-7z5QsEzThm6gU-8bmX6bpPeewRuKfc--o8LAbNGZmQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] rust: sync: Add SpinLockIrq
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Benno Lossin <benno.lossin@proton.me>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Valentin Obst <kernel@valentinobst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 5:31=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> A variant of SpinLock that is expected to be used in noirq contexts, and
> thus requires that the user provide an kernel::irq::IrqDisabled to prove
> they are in such a context upon lock acquisition. This is the rust
> equivalent of spin_lock_irqsave()/spin_lock_irqrestore().
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>

> +/// Creates a [`SpinLockIrq`] initialiser with the given name and a newl=
y-created lock class.
> +///
> +/// It uses the name if one is given, otherwise it generates one based o=
n the file name and line
> +/// number.
> +#[macro_export]
> +macro_rules! new_spinlock_irq {

It would be good to mention something like "See [`SpinLockIrq`] for
example usage." since there isn't an example here. Not a blocker of
course.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
