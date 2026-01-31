Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E19199230
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867022; cv=none; b=OJrr+aBEJPPflujzs+yzOoDLtdEy1YUCTW6WzZzCsM+rKwR9oOJKdH8w8OElYye9YMb6my+QC9HQcusv470vE/1CR4n7w93dZTa+0eGnHsxFQk1N7fpmtkblcpcB2ZJCK5hT2r07huQhCznQWHsfV138G3WGznt0gylVpZL99wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867022; c=relaxed/simple;
	bh=igD8vBKYpbgAvFgmUpb9MclSxQ3SH2wqVONsbjt7jJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m1BbpFiy0GkGWxEWuB1p2O+D63iKW4IzLTvzxq12nhziLS3/hn9pwdU4SdPJLx9/yzPbMJ6Aqi7ZWzu4M/KNC6xcrDL9j3pNKI3R3ahpVAgU7Fwjc0+MdWqUDdAr3Kn2GcSFk3YPNWqqpdrHOPcf7G2g86m0nz9ClovYbX6AEBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2U3f9WM; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2U3f9WM"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-45f0b597eb4so1920381b6e.2
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769867020; x=1770471820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubrrHigowxsawKW57hd5ZDke4Gq8qZ0fO9YWNXFT+pc=;
        b=A2U3f9WMjNtjWKO8CetvDof/mduBxEqMO7NXqnzY3SHneQ3vSbvONrm+WODBcxk0nG
         WZ+jOVL7FfQzysek/mGWu/RpRFFlwMf1B6QBP6MaLEifPZQkvkS7pwAYHaLn3hj7oCsE
         gG8lVUQ/Eir5CBLb+1yIFCN4sejjy2EbcHQlv8dKY2PgKgNv5ygMQFSVJCzKL4Kx3Wri
         n999ESJd+PsKDE5S7x4zxXuN+cZSjeBX3a9W5mIovTEJIyUYgYSj2tQBFvWC9uqxCC2f
         Ci+h0GkzjZrfjv5UxdMwSHZ8vb8WB8RMkSKgBcUEqlqseKOfHGr4LmS1ZhOFv090M19L
         3CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867020; x=1770471820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubrrHigowxsawKW57hd5ZDke4Gq8qZ0fO9YWNXFT+pc=;
        b=E5jVkI+HbKa89pUeK3GEcGQqEJzvjCfUEHnV7GigdaUqIGw2Od3vjqoW31H0jsE6iZ
         C2DhWVxw0chD1SHB8YbpAiGiwIRTroLQnU7fYlXXUduTd0k+b8X6ObzyVQI1BbO3hhvo
         I9KXdt3rW3pGLGU8ByGWYEW61burPQxoCtwkrATqypwfAtTmL8YMvw/rIGMBbcQ3CnPc
         NVE6OhHY38IEHXpV92/S87g8QLP9YRcooDu7Rv1q98so/lVzVRgqwmrMZKwBX4oqVy5z
         uBl4vC4nzaiUiZOb6eFArnOvHHOJfonxc8XdRHFt/Cb+qg8tJ2efSQaBYJ2yaJcFNkhV
         xRIw==
X-Forwarded-Encrypted: i=1; AJvYcCXGju2sDllGYQGuEe7H5b1s02KRmzWoqIEvoHInWzcvoosmaybxMbMRzBkYCNTEWTiD69Cx5y9Gx4VUt38kJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4hMHc0lW0RmQIDH7jFDA9QSwg48rVDl8p2Jj3SnnXMPmIJ3tP
	V9jNJzgmll3aRpSEXJRICJCMiHi7Elk5CmcEVD6sVlzl3WVuETypgcvllqKX8XTw
X-Gm-Gg: AZuq6aKKIxLUgrcfFj1rCbVY/cWKberw0fn//MOiatmIVzmpkwH8o/VTnGs0vVaJIeN
	JgZtFcDbyXeSSy/pAG9ImDumhIvoAjovzqpRvdTN6iRAmG285y4VwHONaOjO0Y4xmrwIo7bIINT
	6jxANxJsDEDK/b3cTB5UkkYcvfyfDX6TPLWIUAtxWIXmvnC7e5R0I4I6eUSrVX4zwUgUypgkLs/
	eax+jnSAIY2KEnOA0yP8NbpCovbZWxknPS+52ozBDydjlGMGDgEIaYilAkJxWoY1y04x27Cv504
	foADjlV8DtqVEs4RmS5krnxaAZFVqhSqMbfJPfKqT9UTdJXFDFTNelE8yLtTULHXGbh57R0UyfP
	nIt46OLjC2ge1Gy/4trpyGBEVZ9e2NjyV7Q3FfIwPdIU/J1Utev/0ty+8dmkMDChJLaM5+thos6
	FVFahPJOjeC1oAukqTXqz2/7c0odI=
X-Received: by 2002:a17:902:ced2:b0:2a2:d2e7:1601 with SMTP id d9443c01a7336-2a8d818bb1cmr57678965ad.48.1769859721773;
        Sat, 31 Jan 2026 03:42:01 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:7:99c2:2d1f:8664:c99b:8d4e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4ac8sm94867945ad.87.2026.01.31.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 03:42:01 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH v2 3/4] rust: usb: Update AlwaysRefCounted imports to use sync::aref
Date: Sat, 31 Jan 2026 17:11:40 +0530
Message-Id: <20260131114140.7098-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102202714.184223-4-shankari.ak0208@gmail.com>
References: <20260102202714.184223-4-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jan 03, 2026 at 01:57:13AM +0530, Shankari Anand wrote:
> Update call sites in `usb.rs` to import `AlwaysRefCounted`
> from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
> v1 -> v2:
> 
> Re-worded the commit title to rust: usb:
> 
> Link of v1: https://lore.kernel.org/all/20251123092438.182251-9-shankari.ak0208@gmail.com/
> 
> ---
>  rust/kernel/usb.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
> index d10b65e9fb6a..79ff2f881572 100644
> --- a/rust/kernel/usb.rs
> +++ b/rust/kernel/usb.rs
> @@ -12,7 +12,8 @@
>      error::{from_result, to_result, Result},
>      prelude::*,
>      str::CStr,
> -    types::{AlwaysRefCounted, Opaque},
> +    sync::aref::AlwaysRefCounted,
> +    types::Opaque,
>      ThisModule,
>  };
>  use core::{
> -- 
> 2.34.1
> 

Hello,
Can this patch be picked up for review please?

Thanks and regards,
Shankari
