Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5575C25DD1E
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Jul 2025 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873013; cv=none; b=Xic9FEVR9SgzlEqjh0Tn1Ye4BXNApQwH+YwOXlkUmySIBEYpnDYdHvJp30J4l9OtKjsn80jn1pBaxjuZqOB9SBV+DoyI+vE4Hr2NrZBXvrwaQmvyqaLadmj4OvcQQCWZY3xlwhrQ5hs4F+MleEWxIYldX0UFIp7PtPKicHmwOFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873013; c=relaxed/simple;
	bh=ZQ7FGvyNi674pAYjL4ReUOP3C6SVJoAIRH3247HGKWw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wc415J1JZOs9CERni0zP71iaBwY2IrOnYjI60mH64RzbLr0yXdLNhXutuTviFm7A8Rs3omwRjy6L2eIyVQcddrbVjfL3t8t/f7ZNTf5owG+BcOKfn4MnALtEL+Ycb0E+axrv2Fe7EolsmFcif69jnpSIE21VDhbE9Ro8juEdDnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mbm+HAm7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mbm+HAm7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4539b44e7b1so17042225e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Jul 2025 00:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751873011; x=1752477811; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgKz4iiUGDuolubNPTok/KwMVlCqv/dhLafyDJaDX88=;
        b=Mbm+HAm7Lu14VYc9rBNeDdQIS+CZFfoehGGl+q1nkKn71D1+otkOS/LDuHX0cssKiA
         uVzwD9IKgi6Ny8kxBxr/E6t5d7WoyhAYzBFh4i83FT2zqJete0OEdHuhDyqQdBnExonD
         mK2yDX4X2V481IxXBWgc/kAMxJdYYYMih9YlMu0G+hTR2XbwsIcS8TSq8dcPmiEzOIXQ
         N3ZjpTagLojyH5q/oqZHuiPTWHHA0Uds24FeEopR97bE1J0gYxJGE6uAYo8FbK0ic80G
         zzhahzT0FJlj/YWIHTelQc9CoLBtdkXF56BJ7Q1IuR4H7YROlX2aYiVwi+5bSa9UbSg/
         zEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873011; x=1752477811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgKz4iiUGDuolubNPTok/KwMVlCqv/dhLafyDJaDX88=;
        b=UyRwcaXMZgGe+wNDiMatu88Knwsxfvv4VahLE766Vj3zFrXxrKT0TRoLasJGdZ0Deb
         SFiyMZTIkO8Om/ogw8pLWjUQNG7aL/KC8EHqjul6nI1j6++uNXLeXwsc4COcVMIgNUxe
         txBP0cE3Z6OOnMQdFdtcQXDYrh2cfCNQE0DizsDLrQl/0TXSOV1XdTTaqtZM05bzFotg
         guLUIjgOihHNqjl+geRBX5g89iNGFvqV7QJIGYU3F0Sl/U965K4SaAuTVzDIYmHcixKn
         DZebPHt65r4jdkobJho/tBFmApa/bUpaxc6HKrCsXC8m33RXGpOwYK5JnAYS37JcNN0U
         sWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnS9UQUeYB27GXhZuCyPrchdtHwFAq8qPociL2F4f99XhkyOA9g/O8tR3VQu3UFbP39Md4JjSCQyhFoRMj/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3KumzPxU4Xn7uOVXDmZ8LInotwB0ZUtd3k5NgbNO+ZH6E99h7
	k0O9hspaQO8dh/gaYa/B22Jiv9A4bnt2IdejsVwEgPka9B42QiPYlCgQcQR0YYK1UfW6HQaM5Mv
	2hiQ5Xu8H8OeYRMiVQQ==
X-Google-Smtp-Source: AGHT+IE23hKiWkk2sz/wg+10wBKjGUvS93mpq9trAuCpJUs9QkWeqbOXsATTXcUUvzRYDfGsXneFK0cUD05KQQI=
X-Received: from wmbdv27.prod.google.com ([2002:a05:600c:621b:b0:450:dca1:cf91])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5247:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-454c0fc516bmr37449705e9.27.1751873010725;
 Mon, 07 Jul 2025 00:23:30 -0700 (PDT)
Date: Mon, 7 Jul 2025 07:23:29 +0000
In-Reply-To: <20250704-cstr-include-miscdevice-v1-1-bb9e9b17c892@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-cstr-include-miscdevice-v1-1-bb9e9b17c892@gmail.com>
Message-ID: <aGt18amK4FKhQLp0@google.com>
Subject: Re: [PATCH] rust: miscdevice: remove unnecessary import
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 04, 2025 at 03:50:11PM -0400, Tamir Duberstein wrote:
> `kernel::str::CStr` is included in the prelude.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
