Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889AC1BE23E
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733689; cv=none; b=j/J7w2nbAQv8L3qXHhE0iEUZVqCLfNbgdJkRuJIAXjiIimeKhdk0vmft9YrN42sk5ICA8Ga2oaEEyFk5fxFyLEhwLXU9hUvA/6p3sN9+ciq9jcEhRPr/nrRsjUd/aUDh7w7NNrKsRJU31GHM7OasPGUD419VwCh+AQz6n25bgVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733689; c=relaxed/simple;
	bh=B8Nw0Zg5POwoCggGay7I0k6JTFuZ0SJhXyxKpcrWTp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCRd78rbgLXESSoB1K1q/UNZoH/quEU9Yb78eWTWtz1zQiyvZcOnqNsdzv9GPYt9H6p+ZKNYzwooZwG6EEvV1mlUH1zCk9yruIfuA4zmm4Lg3LzW+JUNexHU7AHqlSNJ5MLMjEXmFYTaYKZV7vOFsOyJDuSZNoi0g06LNvs+T80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2QEyuBrn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2QEyuBrn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so1116723f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 01:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740733686; x=1741338486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8Nw0Zg5POwoCggGay7I0k6JTFuZ0SJhXyxKpcrWTp4=;
        b=2QEyuBrnSCQAu75DDn2+0WE4quBBci3oPWsUTTG/QtfYsumSE7EuBJeTGNopqoFFxV
         a72JovdUrDVQfzWoMRn08th66tQcRLkQtss0QeJjMus6HGKhSDuNnUiIjNeYhX5pQNZo
         7z1lt+acdkwa+KZaSqEotZpePf6O9uZh2RCuVOVdUB9TNX9ncX30JK01C3JYhG2fFxvt
         eEm12NUbw5xohEocH8l9+DQ+qZyz3r8Xd57W/AX87MgiPUsP8qwoZW/tSh79BGhZmEnz
         nSPurF7xDrpk5qu6ztD239Y0xWxV2ep/pHtyZzTaLrKkPxRY75pL/wF0m/IAVC7cF/Jl
         Y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733686; x=1741338486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8Nw0Zg5POwoCggGay7I0k6JTFuZ0SJhXyxKpcrWTp4=;
        b=riPobmFdPjepFD8YN/hnfQnNFuif/PMfSVfgOx04AgWoq5xra5WGiL6XlEBEItH7y+
         nnOmJQeCcsSAQgepisJO9FCfJ2I4XpaKc292wNB0o+rgDC7IW8rHjgHvZD5CAFOeNDGb
         yh7HhEbJ8q/wYtlOHDcG3uci/TDmQEnw9cid1IhGJtvaQuR6KZ64CY2kYRQhgosv22Cz
         5qJMcV9Z/oB4gUOMG/POUlu9NkQXCvj7DWAETHOLwDfklSj4XHr17MhsjbMtMddiy9m6
         Aqv65nrqLgxR3SxxMpX6DOv/E+HRsLJJPD6KIAv/Y52iuKdT5+Ijb3bIUOzGClRkiZzA
         firw==
X-Gm-Message-State: AOJu0Yz1csFkEx7KVvm4UTur4Qa+3gvcSYdW2JSUrfmeQBnfSPjAI9qu
	pDzrPEPXbb9Dace65b6lA/g52NX9JL/MOH4zongwZ8+cGbEZrOETIqe+iey0utwLntT/uoxKYtB
	w/wA1cBMu3QwVD+80QjL2uYDeR0Trjf8/ZPwF
X-Gm-Gg: ASbGncuuycg4MCxKja8dFa70DRHz4/Mg1Owt62afVS5WG2XfxRwZtCRRguZ4rqsmVBD
	arNqpsmRZr2kDzc6pDS5C7i1NxwPpVuA6rbcyRWZuFjRtul1h1CftX44h5Hh4OhR1Rh4Z82SrwV
	vj9jseOtSo2HCLGgatr6f8W2BU02NUBuSk7e3V
X-Google-Smtp-Source: AGHT+IE80qC3ASXZ1RmhTrY39qoKGqVIZ7x7t8hAZgq1bGKdO/fbDuqOX/rULKVYWxaD9Nc/GWhFTtikbAUeJs9LE3w=
X-Received: by 2002:a5d:64c7:0:b0:38d:e61a:bc7 with SMTP id
 ffacd0b85a97d-390eca204fbmr2206828f8f.40.1740733685688; Fri, 28 Feb 2025
 01:08:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227193522.198344-1-lyude@redhat.com>
In-Reply-To: <20250227193522.198344-1-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 10:07:54 +0100
X-Gm-Features: AQ5f1JqnoJIDiLqVA7PEKKcyNm4ciCBp4S5KCEfAVq2GSvT2nGYfPum-JBNWBUE
Message-ID: <CAH5fLghbJL=WVD0WFeRJMddfMQQUe2+xtLtenb-Ok7hSjCWq0A@mail.gmail.com>
Subject: Re: [PATCH v2] rust/faux: Add missing parent argument to Registration::new()
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 8:35=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> A little late in the review of the faux device interface, we added the
> ability to specify a parent device when creating new faux devices - but
> this never got ported over to the rust bindings. So, let's add the missin=
g
> argument now so we don't have to convert other users later down the line.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
