Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CE2E7BD9
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216352; cv=pass; b=Y7qlVl28kBiRptXEhn4pUifvfp6NIDzStnF7W0MGIixydvbWRe6KcKQzCbOtRRviAKlbApi1gXwaG7udaURXUV/ys3Tuc9plJD6v3P2W8L96S4ZgLPILXsa989pTUTfYTXse2q7dYSZxGfAnynMg0LWYKGkrRZwiChzZU9e+CIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216352; c=relaxed/simple;
	bh=nu+Apx7F1ZgnKc/mjU9XFrNl1Fv4nI8R8tj/IjzBQn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BK0B2i0ATPE38F8QlVgsu7Xf0kwhGqZ3rjcv16pK7fDm92Xev9HLRoJQk/YV/flaf03WeShmoDkUVqnUXZY75tP3uhxo5Y41JiQuz7s62DuKBdJZswTALVgpWkwudx5T1nB++wGQpciSxWCO4BOSuyJ/M90SIhSjd3chbWozvzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TezzMrJZ; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TezzMrJZ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso4526a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 15:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781216349; cv=none;
        d=google.com; s=arc-20240605;
        b=c13F5jkE2TBj9OzDSjl8a+h+zoF7DolYmZ3qIb0PcdRloqYNNTLUk1pK9QhL9rkjuu
         e4m9BUQtywsD90HiA1qqG+t1NX5mf2W9JQmaAxFehyYpdrcBJUDBbTpULN55OE5Iqk0+
         Il2diRFLLqVdfliG1phBOTi6xtNOKW71rYmPnGTwGU8Y4ATjEgHfPnLW654/Be/+8I3q
         PczakSkjTGxLWa3LaE6KL7hEKjN6Z+FH7WuvJDgmUfuyFn+sCoMJbGdAiyVsxP/ZeABF
         B+wmPZxeaOLRWwoDLQSkD1dKkPjdL+44IxiE7mcQhM8hP3Kpr/uarbi/MqLo90ngjJBZ
         7vyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aworHy8v54LZi4xSigMxKXwDJ1U1sB+V8Vp2Jwnbihc=;
        fh=UNKH/b4tRwZury1/Qmeg7e6g5moaKLQpZryiSy4VhHo=;
        b=ksYP6mRBFGke/PP6ZJuDq/z+WIB7oFFBAtY35TokV68/a4U2O1eCuN7LtzqGjfJgOL
         dTOv4VYkC5Yi7Wc1Ldh+5nRGS5uIkooVXQOmWtocSwS9SPG0C4BFlNw0KV7ybeeGprca
         rfR1bGu8mR6CNiHDfyobiwKRa0MtgBPnsAAi1rhabnt9kOiCQOJBcS97JhDF4KPLcRYp
         IRxbP7csCarc0nbPyr4XwbWLFOuJTh7KCcRd/tgLHnf8LbyruxWFj6iQpwWKLRFtCCuQ
         u1rRXfZwR/t2FX/k2nQVZ6Q7sSm1wYgG3aCKRnfOtRVE1Y8RGNokmjvSOPoKpXFya14C
         wwSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781216349; x=1781821149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aworHy8v54LZi4xSigMxKXwDJ1U1sB+V8Vp2Jwnbihc=;
        b=TezzMrJZBFL7fMdCpfIw3/cYNAUe9Rizrx63MFcU1D/nnZmNRJZmKyV9Tl1+YhTmuS
         9BOVZa3jPkW2eseswWbTWwvR0mlsmq5rsj5QCkPfsFgCZFyOIzwxlNNvqxYS0/UtkXkT
         p0VEi3Xd/mh5cIwuhSx4H3uNufEtoskyZ9k9szA9+xjxgqeSTIf6jagIXDMhTPFeI/LU
         2IoSHzkc4xP8yANPMxQXsX+BccQvarCGS5TFYm6tnRNL/qpkrv0OYfujx6O5q1jLx5rx
         RlEIf3G8IWwOWH3MINpyi64NgRlokVZljMb6qCd6rV4qK4nZz5MBGXt2X9iIlRH09V8a
         CnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216349; x=1781821149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aworHy8v54LZi4xSigMxKXwDJ1U1sB+V8Vp2Jwnbihc=;
        b=pPVWQb4BPVWRfTuj+/fbYpGDHBAcGfd/0zXIzFA8Q+l/nIu38lnBMsOHEqtsg3Ijkp
         d0+Z2EiRUbg6SQio5TIcSK1fkHFut6Z5PU6hfyQ4HE43lkdo3wAB5x4AVpKnYB4I+5bo
         G0v8yHIVLV1cpKaNpikB1aLMpJ2EQSPvcuBVACFn6hYXpwCkB+bS+fVNgIQMPC1kbuio
         7rfAQ8MDIDy9pkChB4Q6kHEpyG4KYALp7Z+Zw4+zwO2rntMQEh1kT5XTuqbv3KyoJIBP
         WGZstn98FxCEFtsAgSrSUx/o25ONuyz5wqH+tAsZmRc5yGUzlSbGS7pNYW27UjX8v2rh
         7LTw==
X-Forwarded-Encrypted: i=1; AFNElJ+yD9yYWr5A3u1EcLib4pklL5CmSL0qhRZfD05hML51QLkCzKXamfPzM4CBG4/4JwJVaTyZW3KAnPcZmPaSsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEgNpjObKLPA/VV1erdpeHBlljJrBb5yBZXsq+T2IL9IKTkWu
	d8GO3KM4j9smnGMqmNaK2/VDEu7Q41+uFX4vVZsuVv7EUEb+O3iFZ2qHRSEoC4rBDe8E4PRlRac
	Bu5sNZOkie8W8ZecRNqxJa68Aigf18BEPFTqCP6i9
X-Gm-Gg: Acq92OHfar2wZAgP/jiZVvz+VWb0c4YRzujBQ91J+UB8EoWia6TqkAYT/H18gAg4OSy
	LnwghA8KbWmIz5JcCk69JMaGvw17beBq1WhtcpTQfo7VjqXUnH2Y39hnXCuKtt0CfaqWWUhzBAd
	4qLk7dGzXdIM1XkYWa+LGH8PlwNLSePtnlAHvQWomi88sTGvJ0IxVhBrthF7ScOCxDdJEgZjN/m
	4UPovGqUycKECdop9ILTIiA/B0qsX9jYwTFcnXu0w7zqI6HH0qWben8YLHrvIq2wOc4c1ZvbAkv
	FWBq/58AiRAbSRDFXmM8QG0ZXiGKT1VCUhrtfiaQuTCkzoE=
X-Received: by 2002:aa7:d606:0:b0:67c:f3b6:5fef with SMTP id
 4fb4d7f45d1cf-6935e8e678amr17560a12.6.1781216348910; Thu, 11 Jun 2026
 15:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com> <20260609-binder-noderefs-spin-v2-1-eafde2ff376c@google.com>
In-Reply-To: <20260609-binder-noderefs-spin-v2-1-eafde2ff376c@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 11 Jun 2026 15:18:57 -0700
X-Gm-Features: AVVi8CddtPgrBSTSgy2Um_TDgeFa_cPP20hBuKaCSVlHppxKc43XpvGWxxK-VHo
Message-ID: <CAGSQo010qRhYx3aEwVO4O3b4EtBOAJM914XN2LKdNG3e6cqNPA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] rust_binder: avoid allocating under node_refs for
 freeze listeners
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The node_refs mutex needs to be changed to a spinlock, so in preparation
> for that, update freeze.rs to avoid allocating under the node_refs lock.
> This is done by adding a retry loop so that if add_freeze_listener()
> requires reallocating the KVVec<_> of freeze listeners, the caller will
> allocate a larger vector and retry.
>
> Analogously, the remove_freeze_listener() function is updated to return
> the empty KVVec<_> when it is no longer needed, to avoid calling
> kvfree() under the node_refs lock.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Nit: Consider moving the clone to the success path at the end, since
the cloned node is not used until then? It's probably cheap enough
that it doesn't matter though.

>
> +            node =3D node_ref.node.clone();

This is wrapping a single line, and is only called once. Why add a
separate function for it?

> +    pub(crate) fn resize_for_add_freeze_listener(
> +        vec_alloc: &mut KVVec<Arc<Process>>,
> +        target_size: usize,
> +    ) -> Result {
> +        *vec_alloc =3D KVVec::with_capacity(target_size.next_power_of_tw=
o(), GFP_KERNEL)?;
> +        Ok(())
>      }

Otherwise looks fine.

Reviewed-By: Matthew Maurer <mmaurer@google.com>
