Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A50B1A99C4
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722524109; cv=none; b=dv/3IOuFkbOTU6M1nDsNc7o1juLKABZyOX7bWuqRpI55P30NZfUu7cVBFjrxv2RAvmFrbGlbVRIlE8djK2ZtJQpbMyNorg8xOJfWNJ3jPa9wFsPcc9cJJxllfhtDp+aS+tHdI0oLN1cDLF9X6znbeSpOdThUV6Mb3WGUhi0c7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722524109; c=relaxed/simple;
	bh=4Mnvnxa0CeGhhg65Ymq4vHWt9mbjklRhMqqOpKMkRW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOXKpvJMYciK8GZAL2fJBMbl9h4syG9JiukHFDq8Cl3lDj1v1EF42jnx0iG3YMEeyu5OiRipBjCS9QvCdYYKSLy11SMqDmwEFbGh7QMgUgoU05n4Us7IqoCuW+6nZ3PGgEBPt4B1B6q0M5PifYChR5IH82dVlaqKuciWUL68VtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DhoZn6+4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DhoZn6+4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso49856825e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722524106; x=1723128906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Mnvnxa0CeGhhg65Ymq4vHWt9mbjklRhMqqOpKMkRW8=;
        b=DhoZn6+4i1qEXg4BHN/WueA3Qv9Jdjv9mc480C+SP0l/AdttSv5YWGLjrP29lJrBt7
         qCM0DXqzm/ryfzOrT069n7XgN5F3cKf5L2hMfXucf/PCDb2TWI2zWpIaSIQ+LREH7buN
         iI0WcJs6FcrsecadPtBiAfX7iKJ1OAzlVMPNRA15zZXBYNln2L9JyOX7HkAG3pco24wz
         fNX42gJLTK/jYlUvORpVDwpV/5R6jWkf3erSg0qMgdcYtfl1OIEImN0a1IeYLZVUOWKa
         qQqW0arPfvZ0l0aLVz17+pM8awVVa0P136Jqen9qVtHTOiq7PdlldHll0xvLHTPuOyOW
         E+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524106; x=1723128906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Mnvnxa0CeGhhg65Ymq4vHWt9mbjklRhMqqOpKMkRW8=;
        b=NXfvCRDkx9wcAaI7TZt4T94/iHTTi1/s/20/m+P/OG9Lmi9mKCV793S3r20gyxn/aq
         slvSdILq3XKdCW2veWtPQi50EAlsVNmmYzOJdfkC5wTPuVSW8uEED9ZU4C5kXWyOVMeU
         2f1o2seJbrDmB0tq/GJXqpas7LsAqz8VbeWGMLGTAGF7Nnsv4ybq/Giafe+ZWnbC9QCk
         HmXDXLdro2H0BGgsef/6/LJR74iLLXosMsNYf8kJXhC3Vd26iSTroTD6+FZXVmsLL6Cv
         LvLTSeHtST/emX7Jkv5Thhvbb44w/FvIgRMDiSrGdOSvHXDxng2XmzbuL/leSJayvyu/
         Ahkg==
X-Forwarded-Encrypted: i=1; AJvYcCXoyXdUFl8KFbrWGeSsELXrSJ4fdVcTL4EnZpyezm55XcehDJN8DXGVGp0dUWClUcC+8ysW+qH3WP+dWj2BmMJbNQ9V+XnF4b4P5xk+YNE=
X-Gm-Message-State: AOJu0YwI971Ca8pYAnaQNby24ZHmEm4hz4/Rs1ZJbp130fFJvwyMxlL7
	RCSe9bpNKnmACZRwkDW+KQ1mcQvrkJpmKhK9ALmyrqI49nYSihRIk95xYrpY+vsqC+Hhqim8q0D
	cw3hC48OboWg5o1dzrelCXITWKIDPy3+caX3S
X-Google-Smtp-Source: AGHT+IHQzAlC/Xcsp8MdisO0A1D6EnmX3JthJeFoOZqtJVIlWlOZhdNRzMnOI88skn2V16j2MZs72tWauHlOfTFJoSw=
X-Received: by 2002:a5d:5f56:0:b0:368:7e54:baaa with SMTP id
 ffacd0b85a97d-36bbc0e0f88mr73209f8f.4.1722524106118; Thu, 01 Aug 2024
 07:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-14-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-14-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 16:54:54 +0200
Message-ID: <CAH5fLggg-P_DNhjVS86Wdj4vqMPzxt7nAH+=38O0g+pG9sD++A@mail.gmail.com>
Subject: Re: [PATCH v3 13/25] rust: alloc: import kernel `Box` type in types.rs
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

On Thu, Aug 1, 2024 at 2:08=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that we removed `BoxExt` and the corresponding includes in
> types.rs, add the new kernel `Box` type instead.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
