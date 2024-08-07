Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6561E4AF
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038957; cv=none; b=Sz0ouEz9iTkajHKDwIg43JchufW6XD/5Zrzjkss42D+zRdKJhHgxc49fN0a72CIuj06e3GUE8AOtws82tw3i7uyzDxQfd5i9e455eJBSnr3i4VRoBJiBudApsONCdqfbdNhYdIHobkepOXjLc5OkdAbhvvlKSKGSmg4j2w5lWT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038957; c=relaxed/simple;
	bh=MZ44TK7vjwRuyQ9dOgihBCa9p07QgTcgR8nV2B374bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVb9J71uBsa5DizT0H68IxVmvFPj9qP0WXaJ6yuZIc8mq23KFJlITy/sBPLo4aRFh4kz2QLuGA3D9aH4o/po9D/gYKYkaDtXCh9kMciRsQjdb1d+C9c2dRPYHsXC9OXFa7KVSLI2cNUBJVOLvhclyMbnphLxYFNqnGWOj67x8QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=taCjc+yT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="taCjc+yT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428163f7635so13387445e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723038955; x=1723643755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ44TK7vjwRuyQ9dOgihBCa9p07QgTcgR8nV2B374bI=;
        b=taCjc+yTK/tVA2MCIzt958rRMoxuU43JjQANWGwz9Aoya++yYgIA2sQ5dgqfzuCkpw
         MI5TnB7Xp4WY/xBGlpvDT8cWWHU5u6SLXI4so9eNjCFLLeUAdozJ4uL0vdVih0KaNtQq
         4qygSz/ksGT3AtxOgLBFCWOlkEddBYhbvGLDw/OFYcK0+D5V5mLBR15mAdF5xAJQ5pMO
         HhYDDU1omdpTAi3uxZiAF4uHQDjIuprt0Y1/i9bsUiDYUVcrCh23V+xLT/BLV5h0JAnV
         cpbSOpGBesrDSkcZjOe/3XwxfLYobQQsrdnBPoRwnjMhGT8UT2Q4gG6EWIJEHrosxQZb
         aKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038955; x=1723643755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZ44TK7vjwRuyQ9dOgihBCa9p07QgTcgR8nV2B374bI=;
        b=V+yVSrVHYVRUD7vR5ej6va/C/BY9/fXeENDcFVTJYb6uk98db6YmoBUBwrseL3yHoE
         2+5LXYOOeC0wJ7Un8duc9CMrIhX7GfWwFkJ87aEgoLSggk+jXw860IbrLpKWgZLskX2j
         S0DR4BOjaoREhWKJtaHe2/u1rkd64DTvWhkURAuNlmD5tcQhf150AfIpVr8Fc4+6b+KZ
         n00PrXZIOW3pQ9trk0MCcMpJo2EwKkNY9j4Z7GXSWgflinnPzYUoqfiMA8Cx6QEKetxf
         EDD4XKLV1E80ra60tFONZmo66OnrHIjEE0uXwi9zYOJuQAKCiGIbz/3MBCRN+zmzR40i
         05rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpmY4rQ5qXinadwMMgJ5rgJd6oFFGI7bP+hROI/zj0V+/d3sOrAf44sJSc4QekIizeoYwQUFa2v9nkT0iZYok6omB9KhxxHic5SBxMods=
X-Gm-Message-State: AOJu0YxN8zWDTvskielkw42mbaHwiLj37OY5W/O4eFaUNmlCQnbYvEoW
	Y9QPcnh6YKF8xxYLxQF7Y5MwgLPMd4OjlFEbLDNTARxrr2XVekKQpLYTqBekzqTzaBmtHdb3S0X
	j9oE5a5Ay31CxWA0zE7qI441nXdz0cQi6ISn/
X-Google-Smtp-Source: AGHT+IExEsaJLzPgD2P/oGXhuQDQgbdYIxzQYwD+vDeT9oGNd/3KIYbpFaaqnO+fryzi59+HwlZXrERAE+cYU3j/hw0=
X-Received: by 2002:a5d:5d81:0:b0:36b:d3bc:af03 with SMTP id
 ffacd0b85a97d-36bd3bcb085mr7521727f8f.15.1723038954536; Wed, 07 Aug 2024
 06:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-21-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-21-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 15:55:42 +0200
Message-ID: <CAH5fLgjVHrBNgyQSnBU_rg71M4EnOpt8Sz5ad1okwME9uXwOMQ@mail.gmail.com>
Subject: Re: [PATCH v4 20/28] rust: alloc: add `Vec` to prelude
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that we removed `VecExt` and the corresponding includes in
> prelude.rs, add the new kernel `Vec` type instead.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
