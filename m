Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8502D7E0E8
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727642437; cv=none; b=J9WOI8+2x4oxxAoPbxT3a9E2mquGw6HH5b3kdPlRJ9Mx4ZyJLF8MT94T67jIdgOmU5SREQbm3ya75ZqOLHj0qAoxgdcWba33dgPiINOmD3CRYkZSAl6v0ojEmdb+4saRmPmEZjyokhfdnyH5jzulqEY+HcIlUNa+l5teCvYiTNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727642437; c=relaxed/simple;
	bh=aLmB8kUQ/0mwee+snvJ2Gt7/D/AU2dDh3YEUEAPAtDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcIbIJP+xCy2B7Y8xcAEDVaA04Pqcv+Aj2NhM6t6I9q7BXsXOQ2ETPaooz3qHUuEmeYuyKuXEwibXNNV+ZsDitp0v+i8yEtVrpRILFOfS+VX/FVRXfKZdRn3DMEjXK9aEnlYrlIEIB5BTWDMWzxwqm3pG/BDlGJqiNJsqRrFaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=BJo2outH; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="BJo2outH"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e26114a1b16so794599276.1
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 13:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727642434; x=1728247234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLmB8kUQ/0mwee+snvJ2Gt7/D/AU2dDh3YEUEAPAtDk=;
        b=BJo2outHLAin0gaMb1p2eluS9Ew7bQhoW4vOLoyYBMCLo6Hu0IvNW8xJPK7jhdyJaX
         LkX5P7KsST7/rhkqRKoFmpQ4IeAixlrMg0wLPlveVvBIb4ytPRaViFFwvdH9wDwkY+Yw
         TWMMQmY6GUU3Wzh+MxNaRFw69GbcZLdx/9IrTPIS4NuHi9HD1fXT7wHHRMKZkpKOMCax
         cjPwVQafkGgli09XPLFoSkSEDVduPASrz6WJd/ZHEAmB2FUNmJoqvq5bT6aXCqn+QMQD
         yC2xm3NbnfeK8rcECFfg2ADrxHveoAfVFXkjvPISFSdW3mumGyGyZeOTYS+pz6P5ht6a
         PqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727642434; x=1728247234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLmB8kUQ/0mwee+snvJ2Gt7/D/AU2dDh3YEUEAPAtDk=;
        b=w5Hnp9DrBdV2cW6oty6Q2l6Z9yvUqVYOwFy6NN+eABCk5owttm1e+by73XMRU0CkuT
         piImi4FPlPZd3UT8z8dcMGyoQFfzpCvPmBG3x36uYfWEXjGcUWJ5/lZEi+6m15b/L+TO
         olVTgZ8Fio6bpatqlg2aLzTd13HCcSSxjt7krf+DgHd9qb0sDqxm9YJi6OyVHOfXCLQM
         oddM1wL3xA/y82YNJCkS0SkiNaqDXHURBrXgfvVPZvd11RC6NbNVvvJL7d22g2DHRMRi
         JjRJ6ezwjjScivuom8zTzIDTU4Zv/ImnJDso1KBv4HDmTj7RB1gui+zE8apiC6P2VLX+
         4F+Q==
X-Gm-Message-State: AOJu0YyjTTPqygyfH38kLRTrGDn3BpZzV5vLXv3zL4jsvoCQNk5TnE77
	Oi8CkTC5xto2XeHLYXtWfmrOdjvs7Myu1RoyGJYxcYlFDQw5efleU8RNdYRpZm+MmP9Ova7eXSM
	2HmZGLNYg0pplN9NKeb8KC/rAhzuAA+WvavBQgw==
X-Google-Smtp-Source: AGHT+IHXgnOJWhWQWPPcXU0pDuV2DzvwB1YJEpBfK4T/FITdvjyiG4ySFAn53tpyU9ETmKPITIcbl2LgTNOK+ohVS2Y=
X-Received: by 2002:a05:6902:100b:b0:e25:ce5f:42cc with SMTP id
 3f1490d57ef6-e2604b51542mr8531712276.32.1727642434508; Sun, 29 Sep 2024
 13:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916213025.477225-1-lyude@redhat.com> <20240916213025.477225-3-lyude@redhat.com>
In-Reply-To: <20240916213025.477225-3-lyude@redhat.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 16:40:23 -0400
Message-ID: <CALNs47sSonJNyK+uJC3Kpqv3o_S+y3WfgYGXqec0Mg27nQ1y5g@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] rust: sync: Introduce lock::Backend::Context
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
> Now that we've introduced an `IrqDisabled` token for marking contexts in
> which IRQs are disabled, we need a way to be able to pass it to locks tha=
t
> require that IRQs are disabled. In order to continue using the
> `lock::Backend` type instead of inventing our own thing, we accomplish th=
is
> by adding the associated Context type, along with a `lock_with()` functio=
n
> that can accept a Context when acquiring a lock. To allow current users o=
f
> context-less locks to keep using the normal `lock()` method, we take an
> example from Wedson Almeida Filho's work and add a `where T<'a>: Default`
> bound to `lock()` so that it can only be called on lock types where the
> context is simply a placeholder value, then re-implement it through the n=
ew
> `lock_with()` function.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
