Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867B344DBD
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895688; cv=pass; b=UIXQ+xopvnLWOpUJOkDhD4fy1rZlhrfCYLtWaqSV3VgMFeeUwva00wkI8K+Jg5dOilBGMP8ehIhnPKBeOnoc4AjdD6g43oLD7ftzmH2HCy+lsGnZMt4LTYXb5GQZbiFkhxU7jSFwR4si8skJBclu2HCRIdgYHZNfz3bgyTy3eR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895688; c=relaxed/simple;
	bh=tWsHrY3nSaAV8Uk/Fw453PhvLxz3Wx17ky2P0NRI7jE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+z6hwZS+MoN2T28/isD38nKRQ9O0VcH19nE0ln4h90kFpKZzi6PZpCfWhfr6VygUsoH+5wurwI/SADEoWESuZ/fVlPbR7LF/NS2DebnGP1pDKNFby9AvWZVAEmBp6TvSuoNtYR6Co9CKNz176VBUC48fbW9H9G7zqPUJtD1EDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuM8/caR; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuM8/caR"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba4f9df1b4so294659eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 03:28:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770895686; cv=none;
        d=google.com; s=arc-20240605;
        b=ZzUiP0X5RZyPo89k3u07L528u1Fdaiv8dEwIi4as1U5tQZBpXWF4POGPtvD25MeF/c
         TiSd4pb+9TxENA76br92dNzGmJSOgpJ9AvbcEsGhyyK/gSPolxedEp+ExIUOpckIzXnT
         5Kg5WjvCrlfQnQ8GKIfXKernhcEzV86z8STpdM28QDm8XZfzXH2N1FR72ufND2lvn0hk
         RiDU4tIawjIKi9HOwsAdnVjf2U7m2UJssUwthibE5Falj+YzKHdbF05cAM9LN53EOCRQ
         DNfRn9yMf5TBzn/CrLxvJgdTKPSWSwCjNdjEjKlbW3DCaRUnGl5noq0jWeQ+daJ7VVB3
         a7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWsHrY3nSaAV8Uk/Fw453PhvLxz3Wx17ky2P0NRI7jE=;
        fh=T/69eIC9my5+b0uEnETCJkjawkWuXY/3ZvzTLpZRG1U=;
        b=MhEmVZNNkS52/YG6FqaX6I0ruqCyBs47ZFD/zSjEztCIHbcZwWB7cjJJpzXGK2GQbz
         vnQvL1S7lSIL373ImsjonkkvxVE+7cxr2c3ocZ9cuDAVsZMwrUPyyKQb4Ew8w0eQvsNM
         /FAJzgZ3ERHvJZP2BiR30uOoDGQgjRZoZGeEA+zdM2bGaGIDPb+KuG4R7UWTC1Jvbu6/
         wx+3VQiBfhIvqaz1NbKZnQgmsGPWD9Rl9JnrlWGnF/aGJR67MQn+cOZl9yj7PtGc42bM
         aISreSdQlVhpp89DttUeVraeJd8EKiSH1kyOmVulOJCy6Cg7a956UPc+FUXa+uJTylqO
         gLzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770895686; x=1771500486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWsHrY3nSaAV8Uk/Fw453PhvLxz3Wx17ky2P0NRI7jE=;
        b=UuM8/caRxKggUltZs+nAWamc+1jeGc1jSgkCUwi3eyUpz+bQJ16XJEZKAeN6e5Esv+
         RiBdO6+vy9BlpYs63IRj8P74C987M2/ABtP5xuBz5OSHN2RrERPKb+6KC1cFiqWYsxnJ
         Uv1ENJ9txhob01lu4yiNmi4rEyktYp8zIJIJd0nn5d58fprS5LxG3VAQI8Ff0VmvTYP9
         5lfvz6Kv7djrb8HtoIMyH2bl3Vfu/5SQw5hyoiBHZehbVR7SBII32iD+J+7eVgwkiS1R
         vdAiuvm7cweNJnMAa3k19IFl5wwpOCLoXvGiYGyLRGJYlP4G3D+yvdKR7NcoHhbPHIXI
         551w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895686; x=1771500486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tWsHrY3nSaAV8Uk/Fw453PhvLxz3Wx17ky2P0NRI7jE=;
        b=fdaGwSHTPLqZ3oXvKCkGqcvmT8zrl5gZ9Ch/3DoWl5XoEWOehK6D4YfK2gAdQJL7Ml
         GmGv0k2Ien1grgsLTpisBL2dpg5Sp47rbjg+mm/iJpY8FYsEy+FQGyggmNBKuGBCXa48
         IbXtB6BBd1KS3ziDtvsPVMAqX1buVQGxlQyKZZXHMN04MBS5++ydHRKt94RLLJ6Pw9fS
         5G5+0lIZMS0fMy54EJa1h9KtfdlUAsFmAcurtf7eqJL+wej1/+PuajG+djXEoYWLtTk4
         6ETuCnE6zaSRQC6UNE7PJSy+3xQ4i3zdrtvlW56za70vMFkW30OTjl//pvI5MPmv/saF
         mkfA==
X-Forwarded-Encrypted: i=1; AJvYcCVaF6NeVpwbR3mMhWdQ8rhKhxJrZBA5MF3Yez9doWadoR92hXZXXWFsCDaXvzg1XLmeR8eP1y3P8GIOcwsAyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR4OFpYaQpZRS2QPBPTsAb/VipxgR6egx6fPQ92ujtyYB9cqVg
	rphd4WCESVlNkWNexpHgPRGrkNVIw+9MzYgnxH5VJ+rOvk7Hhl+7JQOrwKvOF7rDwbFxDmz3u7+
	f69cC81Y0whdGaiHMSTjCMILpNdkUBAg=
X-Gm-Gg: AZuq6aK5zMf47ai0lQBY3o6JkgfOunCluJf1z2VXfxcH3WePToPS/VmVB6rxBLe4Bjl
	OfGT1rMWeTSCEWom62UG76EKyhJg3EG4JW1XJ5zzR5a5AGH+aVKN3LKlB3oCWmtgmZ+AlKDnuji
	buFUA2n5nexJFs5b401u7GsAMjeU5vMpi5+B3V/sn9q+A92TeJhy5vw4nkhhEPQuaXl9Y+FHuLC
	wsS77B+/h5GGltFCP4q0hR/Gd34mP41eWBcdslnmU8ePcQJASWKd2KeKP3OfdHJeii6SStbLbw2
	YW7DbmgxxqmeMtnEdCi0437U77DeI2kJUS1enoZdA2ZzFs/MCqzCsdOzaSPD80I6oyoxvNXLflF
	IN3h3Ml/b/EX+gdg85b0003mX
X-Received: by 2002:a05:7300:e60e:b0:2b7:3678:2d1a with SMTP id
 5a478bee46e88-2baa808b83dmr526893eec.6.1770895686256; Thu, 12 Feb 2026
 03:28:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org> <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
 <87fr77viat.fsf@t14s.mail-host-address-is-not-set> <fU1FEYt6-SY0KlyJy4VClCr5j6P4d5-wukzc_9TkSDSBuQNlY26xyOIprMbHEVMv-H-nrAJ1iN_9tcfIXEI1iw==@protonmail.internalid>
 <gta2wjt4tkcvyu7g56gqyipiigbmbk2ca3biqzmxc2npch3rk7@ccwzwgnk7mcz>
 <87y0kytggx.fsf@kernel.org> <87v7g2tesf.fsf@kernel.org>
In-Reply-To: <87v7g2tesf.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 12:27:53 +0100
X-Gm-Features: AZwV_QiVAsOQVZ7ynC7mIB3Js3gb3mIw3gC3Oks3wXHa118YtPgoZ9fhYfCQAQw
Message-ID: <CANiq72=n2=96dvcLXF05Ta4+h7CyUTQNn2b64U4j=VB0xO-0GQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 11:52=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Apparently this kind of code used to be OK [1] but the Rust devs decided

I don't think it used to be OK -- I think that issue was talking about
code that required non-lexical lifetimes, which was an unstable
feature back then, and the behavior changed while they worked on it.

When NLLs became stable later on (years later), the feature never
allowed the code.

Cheers,
Miguel
