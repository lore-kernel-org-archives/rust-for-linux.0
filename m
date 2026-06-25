Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BE3BD22F
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 05:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782366744; cv=pass; b=hhAZ5FG9+9BrwlFSIIR92THfzbcg7UgJBd3gJ5yhQNOgC0ZwNZayVVbGHrb82Wr+86tfbj4jU+98CtZFEDafFHT8wauFvrpRIVb7HUTJjCB6K4b2X3mbfAfNbAcfeZ0I4Phdi3Rk/1KzeoqjuPg9l1vdHNtWZ1e7gRVysfOFGdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782366744; c=relaxed/simple;
	bh=68/RzTybajzs8NkexZv+Sn93J2AryVly53+/GDEDle8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghtfhizeq7DkREkmsGQMzyaWXFIwhVdBfJlUTFJQB7OCsMlKavTkqWEIFhqU1pGQ5Mf3UfxtbWzJVC/3xdCHQA/1v9c27LuzTl2IM3LfSbnukQEQAcFissHwiIa6BucMiPnWvZ42SNZ0+pGDzOIJOTVl8nreQ609KrteCEJKUXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QEN79sa0; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QEN79sa0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46066e640easo1152524f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jun 2026 22:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782366741; cv=none;
        d=google.com; s=arc-20260327;
        b=UvVMpJJLJujtI6EVzjBN8fP5HbY2CaTAWyYNfcbFFDoR3UHfrPktB5HRAxQmSPAlf6
         VjPaPgtvqxT/zQ/xrjHvV6cpg2GmZFHLXHCWiCscsNItX7mgfplRokTnWZ0gT9inULb7
         72WmvffjQHUk3HPOwf1sL932QpV+WIX5DPZct6YWGPjlxQpYjgbQz3gugraVvC60gNLn
         TEFwfMPEGBlaCjS50E4yKQt/YE6wbbiJHi8MDL0PV9qV/WaUAO+VM1+0IihmAEaBKjfE
         zjVO/CgvClZ7/6Vf3WQTB494yQJ4Fl2sjp6LntM+ZhNxrrPk30dTwp44yAI6tseLwe30
         B2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=68/RzTybajzs8NkexZv+Sn93J2AryVly53+/GDEDle8=;
        fh=l52WM9YXgHk0f1BX62UsM9eCaSt9edeuTDxkDmQkNEs=;
        b=W7qSOPIaKTYou6JR7LcSfFiSvc4+Fm7s28iIQC81CVTa9ZtgPNR9pvVgJcOjPOR7is
         28JJlFwqbP1Z2QnWwNh7ywB8PUKl6FzWi7RB7de6r5C15Ci/giAzc+xaqC5cbMebr6t8
         cZ2jWc9pMgPTt2GPXV3b32TXidT2dHfSCj3dJujD5GvAmBvl9T5wBFErk7utw6IsCe4M
         4ZD9XqUS7zX5ShSylVivaLDAHSVD9aEo/yGUcm+CPLhoBRjPLYGhIVXjWSTArmW1Mhqi
         SMdOCgDTIhAaMNNZalDxkJfrE0vOuzITacsnLnz/PY1m3eZawbWN3AAHenQmyPfz80yZ
         wegQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782366741; x=1782971541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68/RzTybajzs8NkexZv+Sn93J2AryVly53+/GDEDle8=;
        b=QEN79sa0ilgdNEqkYo1Bczc0zDg5Gg+Z1vRFVroxnY5VwGzfyIDxE4Uxo/TdPb2+e0
         ZXGMX6SW1xuFL1hB98vxOmleQgW71NvnhANzYdW+yPyJvqXhqH7ERNsvsuXZaRKCE1I3
         bQ/KZBf68UmmXzcnUXIqICdzXWUwIe+4ZrWJY43AkB9tC3rZa0Z3fMeoZze7JlUJEgJx
         yw4PlQXzdlK5PGRAp3tk5aRcnvcmMGm05SJmEDHl/5H2A7MBsk5qfNj+M/cV0V7FC2Lz
         x2CTCUmmYGpTCHDQJFs8cceJt+vpYO5DqL/MiQbA9apZmptEvpprm2ON4kqHYDeuwjL9
         lTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782366741; x=1782971541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68/RzTybajzs8NkexZv+Sn93J2AryVly53+/GDEDle8=;
        b=W6uWpKfLJr1VOYtmukq+vIbJtBjpJ2gV3UwpAv/BEsYkgRdO95m6i7wGxy+BTncyzP
         iGaSd9bXXv+6IfV1q2hUzaM8lpWin8v2HC5dYPwcc5n54eyFG64S4u2sUf6sqZ1GTAWe
         2nG6sd5ziI5/jjiZQSWIiD85mUqE+VhOTsmKk7kcq1/ECSPzv6B1AeuXSXliFPBMwni3
         qYqaOVCZz8ua1LWAQHR5/znEHNWnr6gcX7MwZpWN8Jqw7ILwIGJ5HM1x04K0gIjACWgM
         GGcd7EgOiZDkkNTP4CFX5lcQJfOavm9F/hP+mT83GyxWqjksiOvUN5+R5zIP3TPE311s
         xm9A==
X-Forwarded-Encrypted: i=1; AHgh+RqkqQXlqWx3B8p1Lmevw4xyfUa91ntoCViywvRMyeFKZmI7ZJFvjyrAh32XD0EGAf+zho6OUJ04JCk9dFuBKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrqxDsV9m3k6FgPkQRjjAtvJLOEtonKhswxIWmbkfK4f+iPlH
	YjC0Qn/zEwXVa/2KLM7G6W5NJPTQ2OzcNp+Xf4tybCEW23kR2sp7pWP1jfOcaWhfX76SpW/ejam
	Pq7aB24ITp7BzyJAPbtFgno02Don7sp68BFKCzjeA
X-Gm-Gg: AfdE7ck/MTQ7XjWDg/gU/rca1at6ATmhfG/8KGaZIBf+RmSH2Q4yCAaULlMfh5Ki1r9
	fjIArJXYCMikrJGd2nQUdK1jlOj7l8F33VakjV8FMnqEYl5UsQ3fZb2L1kr1wiyuGqihVrkF8H9
	GbbcK7xUFamSG7qpOcgo2MoXPva/DIxqtEIJmR9at1//EcIv8a4X3Zb7m92gGIke8h1VRbhfOjF
	griir1hSWoLWVXYwM+VtWgvmty9pL7/YR5zp8uOXi7vOrvBU6Ji9JO6T+GNmO/5xrhenNxxsoK3
	SbAqLF/ZYXOpM+ZbtDZzRVPGjcg=
X-Received: by 2002:a05:6000:310d:b0:468:6ce0:ef1a with SMTP id
 ffacd0b85a97d-46dbf3034femr1013569f8f.11.1782366740759; Wed, 24 Jun 2026
 22:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621210134.441-1-iganschel@gmail.com> <20260622145801.344-1-iganschel@gmail.com>
 <ajpv5xkakp06ArMj@google.com> <ajx4bYtQRvBZp4M0@google.com>
In-Reply-To: <ajx4bYtQRvBZp4M0@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 25 Jun 2026 07:52:06 +0200
X-Gm-Features: AVVi8CenyfPYj7BbhSmBerQeIKiBDd_bQxvthgBzo4UPV4czAWAyZ2BlBHf6S4w
Message-ID: <CAH5fLggzuL9cno5pi9tjgqpMScFgmqiRihZZAXJi6hk3UiSHJw@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: reject context manager self-transaction
To: Carlos Llamas <cmllamas@google.com>
Cc: Keshav Verma <iganschel@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 2:38=E2=80=AFAM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> On Tue, Jun 23, 2026 at 11:37:11AM +0000, Alice Ryhl wrote:
> > On Mon, Jun 22, 2026 at 08:28:01PM +0530, Keshav Verma wrote:
> > > Rust binder resolved handle 0 to the context manager node, but it doe=
s not
> > > reject the case where the caller owns the same node.
> > >
> > > The C binder driver rejects transactions from the context-manager pro=
cess
> > > to handle 0 after resolving the target node. Match that behavior in R=
ust
> > > Binder by rejecting handle 0 transactions when the resolved context-m=
anager
> > > node is owned by the calling process.
> > >
> > > This applies to both synchronous and oneway transactions because both=
 paths
> > > resolve the target through Process::get_transaction_node().
> > >
> > > Cc: stable@kernel.org
> > > Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> > > Signed-off-by: Keshav Verma <iganschel@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Compare the underlying OS process task instead of Rust Binder `Proc=
ess` object.
> >
> > I would prefer to compare the Binder Process object. Rejecting
> > transactions between different fds owned by the same process doesn't
> > really have any benefit and makes fuzz testing much harder.
> >
> > Alice
>
> Hey Alice,
>
> The restrictions were added in the C version in order to patch
> vulnerabilities associated with this "self-transaction" behavior.
> See: http://git.kernel.org/torvalds/c/4b836a1426cb
>
> I haven't really looked much into this, but do we even need this for the
> Rust version? Is this even fixing anything at all?

Even if there's no vulnerability, self-transactions are still very
weird and may introduce edge cases I can't think of. I would prefer to
reject them.

Alice
