Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E445749503A
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817490; cv=pass; b=eOCma9FNocHMLC137IV4HXSwrJJmSBAbXrBObr1m8+8tsvMNma1vRj0+EZR2mHZRRfovWHERNwEM6Io3gvhN4pFOIDwdJGkUZrnadROpqvo7w0QUKXspTnXBoaY7K0+U5OF8IOQ6s/J9TVNlILw5oLQeknWwOze1haIKJHm8DbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817490; c=relaxed/simple;
	bh=weLDaF45D5gfbSr+gWQVb1K25MVNkySML0rAhgC7w2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POorDYgKmy5a1VRtXovP51vqLvAd+NkqXyrC2w146H70KRT+8XRiOZJVOIWaY1c8lIAnmIdY/U5BTTgaTIaVBNiIakwsLqGFwvCvprLjvG3ItGCtoisf8Ys+DZz6eQyCsFq2PXN8dyqozBBlBVgTaM3Zl7RCv7wrLB/pCKlOB/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2cJcnjo; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2cJcnjo"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-313bab9cfe7so205415eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 08:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817489; cv=none;
        d=google.com; s=arc-20260327;
        b=Cg3Uzdi7gNHwQYxNBAyHjTG8iPWAJWdxIvQlIUEBdbraAs3PJzsMSQK8DCbFiVh6nt
         MRv5rtsC6mRkONXjM8rCC5pkvctas+1SgCBkq2nGiM6dJhoxq7Ae6VBGJnL1Rz+KwF+Q
         moxGHEYJYCX87hr/4Bu0nV0AtnzIeib4/s0UHb3KgwdH1m5ATXnTkRMfm7QNusVDJ+a8
         YwNsoOA3x+zvq8d0NHIbtHn6QeY1X7vb1FcLQ5juxzdgFZEaDBqcBEPhJdzuS19fF0ka
         N6zq5ss8i1Dumb/mYhKfwg9r4gcEEz1Z2RqqdJIBoUuxFrjLot8cFO6qHbyUqH2//AAD
         8vOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=weLDaF45D5gfbSr+gWQVb1K25MVNkySML0rAhgC7w2M=;
        fh=iLV4rosL1UrqdXD7mQORWqduls3lXSLRpukoOTvkzic=;
        b=fx8h06NsuWvYOtjU5xF/hbD7+t9iFGE+Q/hRKf9zjWCgcCdV2eMIH4Ix1yDsWP/kYM
         nouWtfMkFdIC/9CdXYPjEO8PN/GMJbaSwSxil+fLmCXtel9c/6N2NfnsG0x2p8m0ja7I
         iudZt2aoZ87kjt1JuotRDW9FUZWTpQhZqsn7bP5w+1cfJZe3xGs0dzqwrWyw07EwfMZZ
         T1PQfMMkUaD0Zur0LvTyX1iM8CKcQQAqgJ/J544yXSILjtFGFCdCUTk2FH4evw9pqlav
         xS3u7n115UqVgcaU+56Ispx8xPW4XcG+lEAqyJaSClveJfnoEhzw3TsslnFlZKPnfArh
         E7/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817489; x=1792422289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weLDaF45D5gfbSr+gWQVb1K25MVNkySML0rAhgC7w2M=;
        b=h2cJcnjoK7KPnNOYtTw8p9ogrjKw/aAYzRzXqarHkUxgkShk3UOD1BOvEKTUmvKo/p
         Z0WtF4EJyN//37B69pbySmNmn+xEPLzVLD/kckHT2+pc+iGYmQizTLW6BdGxNOX8+Kp3
         TTOHHTD/zvZq2/fUWqlDy8hUqBA9tDm97Js9V5B1ndQfOfpscPVrUIhPAUas0GD73wbO
         a2CWIsqBVmlsQZiHsgDDB3jvKVx+ehT/gQtj3KrWzlk82mcplXnurc4o6h7cKSiQn7Iu
         lraaZ2cdXktMWNVSUSOTMKipzO/XRnBcDgpGsf28DqW2Af6rkaZCSj/92RLkNF1x9e1r
         5v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817489; x=1792422289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weLDaF45D5gfbSr+gWQVb1K25MVNkySML0rAhgC7w2M=;
        b=EU4lM5gdsMZ2uZXgQX86y6NnvQ2kd2Z7ACPncCA3mhXud/pmUf8pPzPNus6RVMz91P
         HqtBjQn9FL/PKsCuW6RtWmuHTVJ/MuwLxbFfQIq7YncVZHZN7+o3TVsbElkKlftcZTvW
         e7j0XFEjMjMRq0yT0lY7m36vmXZbqtd/qc2eS3GRAa8MiKudll/8tysTYSxaggo3R7Bq
         sM1+M1PxfmhtUjCtwpeTcG653Kp8UdjfhDQdd353CltMZJzQfbVvue23orPgyggaDCQc
         uMnmYE/VIgRuiS+VypWe3jv5k2CIZFpxf11tBBhMroiKJgQHH4F5QkVuL1A5kVBfzrOp
         3jTg==
X-Forwarded-Encrypted: i=1; AKwUvByVGVzJ23xcdu5IR8RPI2/ZlU9ljWL2RzG3ijvcTs6+6ohZ2n1L3nNP/yhx3b8kaKQEinrNuvuk+43KQjeI8A==@vger.kernel.org
X-Gm-Message-State: AFq9FYISahwZO/K8NgZBr3o7/DosyTLTc6WxlnoDjhAOKJrMnpuGSN3D
	omUYtDM0qIdBERogoDNnuvLyC70+X9dIvfAXuYM74t8dWCSUczuSUiMphIaNeJtxEeijoI/LPEG
	kQdvB5g6/hDGLwGgWCpaKg+zlexcQbz4=
X-Gm-Gg: AYBFou37Jjh04xxbFdRKGU91ldfNVWkp/Y34X8Dziz4NjLM6k5EWevDrJRzx3Oy26ds
	M06m3rbSio/zuf2wA+2vp3xdb5pA6xiU9W5R1FBA9JBu0GajoqO/2TotZs1gPClcUKXIEQrvad5
	cAqbORkLvED2km2gCnwAnji9p8VjXT4Mk5MdP6KyizsFSh1g6j11O8PsbBLz9tZgEAlYOYKSC9r
	C7RylDcHPQF0AlZQOLHOhKr4FCdLUDkQHfVFTKnk0XNRl+3wjpT9UC9+HLtiK8/DMhRXihbLfPO
	0aZzCU3LDExU3IHMGZZ0ObjJp2g39p7EakB8AjDzxGBO1IYV/f2hYgBfpvDo8ZEaD9DreypNCxD
	OioGA0VFLNbJywloVc+k9DzOAXZ+T92OqYIBOwow7X5tmmQ8yw8e8V18e1bu2SxGQ23TqpRR6I+
	nTVBvzByQglH1a3T3fO+4Gw1D1WPn+4iojZKn/QJyJ9nGMrIpZlTM=
X-Received: by 2002:a05:693c:8810:20b0:35b:cb5b:c71e with SMTP id
 5a478bee46e88-35bcb6b1c6cmr1408019eec.1.1791817488630; Mon, 12 Oct 2026
 08:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org> <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
In-Reply-To: <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:04:35 +0200
X-Gm-Features: AclHuK9wzT4BzJuJCArQ1hZV1Y7wL2rurxN8icBv3GPL7rh5gvUSjCGJZPgPXPU
Message-ID: <CANiq72moeX-F-XkOWewwSEJHX6F5j+7NxNis7qhPU4aDOFRRpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] rust: add a wrapper for the `nr_online_nodes` C function
To: Andreas Hindborg <a.hindborg@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:58=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +//! NUMA topology utilities.
> +//!
> +//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemas=
k.h)

Cc'ing Yury and Rasmus since it refers to this file.

`page_alloc.c` also has the definition of the variable in the
`MAX_NUMNODES > 1` case, so I guess the MM page alloc folks should
also be Cc'd -- doing it too here.

In any case, I am happy to pick this one up if they are OK with it.

Thanks!

Cheers,
Miguel
