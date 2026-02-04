Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE937C110
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198244; cv=pass; b=Cphyqe9ixhA0l/2j2J/ZlnJCuuHDTNnLDb0hXG5T5U0Df6UPb5oGHxA+G2t2Sau7U5F8niXPDQy4pSUOEY1eKzSTWs+3+/9pDgy6NYyxRvQe7Nwuq81XuNj14DrJ1KdKOlqc2WOo07twLP1NSHves15Caj5J7MgUA8PwHT4Di5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198244; c=relaxed/simple;
	bh=G+6S9OlWLGrCemMyi/2GVq3KyjbdLBo0AM0xRBEy5hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dp0bwy/MzbSHj4KqdJVNMAcWHIQbgUrGr4i0XMoBZ9gHnw4smNpZ5SHYJ4y0W8EGPrSa0o3qIL20yOBo744cCYTsRtyeJi8cUK4Xt/1hiyygHUdKpH87a/aYgQYPHkZh/jgyvBhLfPyC9yejQK65qN1Qb2YxaE551NyNKKrNspI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f1Yw4gRi; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f1Yw4gRi"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-385e7cafef9so55038291fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 01:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770198242; cv=none;
        d=google.com; s=arc-20240605;
        b=a9WQYAr+80NHkEle/5kUKoPWTRrINSic2FV/vM2n7kZJHUPJxzbdmcbPCLc2Gz33gF
         433q2SMM4Zlzf/ZCU6cdI0mcf1ZQVjmWQnQ7P7TaMOzoTOmgDOVmntqhHxnXcHHzs9Lz
         NR9MyPlX0quuYR0eiscUfybiBGsRhvKK5b6qcMgn/+ss6rH6I6/pCnvct+pVH3Ss83p1
         7Z3SiJb9wN93P7OzipIhHlNHLA1JN/vWb5C0HgRIgGBJXAmXKdMTXq3y14OvWLItWV70
         DgLvOGU9WwLp7Q52mco9vM7KAs0fkG2aypNjFhTGjT/efevGWdTifF0TSVPsLlpvGQ74
         1z7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G+6S9OlWLGrCemMyi/2GVq3KyjbdLBo0AM0xRBEy5hw=;
        fh=CDEocetG4ZyyqiA+E8bSpgcURmw7JG6E6DCKEOzzjik=;
        b=F2rZ5hm0Qi2EhxyXww6LrDXBcOpy1xKbrnhlQgWlRNjtbGHvDz2eN6aEDzyAQeRvoy
         AvYJq7OvXDQ6XFCtbxZA+9u9yVNCHdhVWfDg7dStJZNdqsotUE7FRTfBFy3EmLoVu2ap
         q1WG8JFzQNgSI6znlBKr+VR0ssbkXhwum3ipjShIQE3MSO6Jg8zp7sdbD11mxQnWbT/U
         uJNEfp9fuERHIwRORO5U4N6Qutk4VKE2HsRtDs4QN5JtYY3H4DbhgFDzBt3ewZ+dctz8
         /B8uqIuMphRTrPc1Pu+cHmfo4YBYVTSRcIdhyyhWtAZ/sX9aWCOzQY3Acf2/soTIcBPD
         R2Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770198242; x=1770803042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+6S9OlWLGrCemMyi/2GVq3KyjbdLBo0AM0xRBEy5hw=;
        b=f1Yw4gRiwC2jX9kCZgFRVrBYK6887Dcb5TZ1TfWtwKIgGu/E1eJNEsoHurnFr73e4F
         /1s2nFpKXK1y7D1uzFoN6TIwSToTmBmeY5QjGAVF6Nv/sRkcusE/6k4QGc1n0ct67EPU
         QSs4P3biEnoCHhzo/YkgBRL83IWTJqeAEmDRL3f/jZdjhVhnNGmEOgUL3uPFEw0Nem5l
         gYt1rzid7rkWQPXBSc35MPqcvtLmlgoPc3+J3D5OJSNNq7R68yHPGmsKXWG86WgGr/Ya
         zFnTvLhGGuKDgWNdepDF9eahF2iTDdoniFEvIGn8e/8rgReHj6uqCUlqehxd8SmccAbK
         5GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198242; x=1770803042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+6S9OlWLGrCemMyi/2GVq3KyjbdLBo0AM0xRBEy5hw=;
        b=SiBiz12+p6C8qED0X2JuEbbt2m5HbscmKiId5SlTmVyrWs+3GRzj0K6TnbjqTnBhAd
         WZPd487lkVATbE4eqTwCA85nkOOpotPprQ/3WRrHJ7gl6WknBFq02rS99LVoLM13clmv
         at6CMuOPpB/MgL9HH/Tvw3xKUI6reKStnQpSPoJGRsJ+2EySHG0tapgOAUzqEpNIhtQY
         hfkhn0whtjJ3pvyPv/4lgwrU9f2d3hf02oExLcm+v0yMkyESMJTBlGq3TPRvacgGWL+4
         +eG8NKDCufb4nj9819BjA1Mjs08rGH9utqCN9+A306xbM2MlpcA5WI72LukUdZlxeZSL
         zp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp9CEG+sgLJ/ZCQQbl4QWHylKIGPRD2hFlSQ76lVU8HBCDuh4ca54HOuiP0WYrUdYjU5izhANrV5CiQrSjBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeN1e0J6LZb5dMw654/J68mZgGVWUUFYjV7RcAkDsJALAlzqQj
	nryvIhHBQYTrJ1Z+2dxlDI3u0q/51PBXJZIX+p/5GwjHy9b5pdESXd1D/jcH5l/qfORUX94Chkw
	htLeAhRTgHx0pTc9p+S+W9QesBQAlAIGRUsRe8/r9QA==
X-Gm-Gg: AZuq6aIB31cZgREuwRpavhj1BHqvub+MqV7IZp78D9NWOYCOIS8HyqJx4c71em13VZH
	Tjm3JcNkqP3Dxm4pgSOd4879uzh0+aoX1DsQijrrnIhOmbr7qQYVrhx12vWuTi7r/GxejjGB/Yy
	Ctb8OsKQXVrQcutnUPUzRkxDQJjB/gwIKkniQ6BV72tUFsgjn7nZgZwTpk/EDsCFAZTtO9En/mC
	OZ+g1GJcOLWkIp2OUBu0VF5a6h6AWLWwdkBCrKXLdFhHrZLIhTELWIZL7xlt8NDVNNRZXrft+at
	KKbWzy2oYgN7eALjCImhfhkxCTqt
X-Received: by 2002:a05:6512:39c9:b0:59e:16c8:9be3 with SMTP id
 2adb3069b0e04-59e38c0b564mr960429e87.17.1770198242119; Wed, 04 Feb 2026
 01:44:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203152818.317806-1-marco.crivellari@suse.com>
 <20260203152818.317806-2-marco.crivellari@suse.com> <DG5G52FJ0I1F.1OHNFAXKXOZ1R@garyguo.net>
In-Reply-To: <DG5G52FJ0I1F.1OHNFAXKXOZ1R@garyguo.net>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 10:43:51 +0100
X-Gm-Features: AZwV_Qik0S7BIar-XH2gFvduyoiCvpUlFSOzC1xx1ZhYo4lyunmeZ16fUIGXLTQ
Message-ID: <CAAofZF5pqsGvnCS5HbmQKT8b_ydEnycv2fWF=wbFkSgu+ds2gA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: add system_dfl() around the new system_dfl_wq
To: Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 4:53=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
> Hi Marco,
>
> The Rust change looks good to me.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Hi Gary,

Thanks!

> Is there any reason that we cannot migrate the user early by just returni=
ng
> `system_dfl_wq` inside `system_unbound`? (I guess the question also appli=
es on
> why system_unbound_wq cannot be the same pointer as system_dfl_wq).

The 1st version was like you mentioned, both for system() and system_unboun=
d().
It's one of the request made by Alice:

https://lore.kernel.org/all/aL1lkN5WcWkwiq3S@google.com/

To me it was ok to change with her suggestion. :-)

> Also, I feel that `dfl` is not a very intuitive name. I searched the list=
 and
> the commit history for a while and cannot find the exact explaination on =
what it
> means? Does it mean "default" or something else?

Yes, "dfl" means "default".

There is a huge Workqueue API refactoring. We also noticed many subsystem
used system_wq (the - now - old per-cpu workqueue) but many of them didn't
really benefit from per-cpu work.

So the idea was, at first, to refactor of the workqueue name changing syste=
m_wq
to system_percpu_wq and system_unbound_wq to system_dfl_wq, to make
clear this should be the default choice.

If you want other details check this discussion:

https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

Thank you!

--=20

Marco Crivellari

L3 Support Engineer
