Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9475421B9D2
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754645889; cv=none; b=fqRf2Lb8UFTafqR8BAMsUlfOOJutppDEjvz/Gb3nHiVORDg0K8D5DGcti3OoMAy2e8mVZPD2KjjqIx3HDjEv8YF/LyBgEu7VAv2n0PG2Y3XZU3sI2XWvQ5I+tXlnVQSieDWLnB/L5otCHOpSiP0PyT4O3UFBzLvRKhkNt14/ROA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754645889; c=relaxed/simple;
	bh=ol1295A7oNKv9WqqH9kWtKySyfxk8nqfTgz3GcCaYGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKkJMaPV5Ofu2NdfErIe+7twae3Zubu54MCQGmNRDW+z7x+G5mRMNqhbMQ//Lu9PeT2nCDEYzq0zeX9Y4oIqQW8HL7UE+Py4KWk1tkPyjfbhUA1Gz+VlP+SbIKB15P7gXLc2JSYl01XKPkj8h6yyR8KnfTdtmH1ORvIxscxRiC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=phUZXh8D; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="phUZXh8D"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b790dbb112so1111187f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754645886; x=1755250686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Hyf3MBlDDSQVvuck4FMMqllMbfvK6J+oUejBmEdt+c=;
        b=phUZXh8DpNkT0QbD7jAHCLxubmFX8vie9qUpTWVutpNqgxrxcOYRnAcSnkWwSwqdCb
         wnabD+PPHL26yxul8YQJRKpR2GddJwfXXf0HCj1Lhia9ShRdzeUpf13FlCNRmMzDjZtJ
         iDoqHwI/UT4Xp2/xUE4iFD2SHi08ZS9WyEUHSnAKxPbVwqQdRaNe37H1RP9E1TU9/j5c
         yN4okBKmVIAgHIfFJnKnHS6wySEECR/9HLobM8LOGE/AXESUW6KryEZBm/U8VOL1fmyV
         IdeFtIkWfXDW76wlkws229VgMz/PW7XoeK64crJERwUo4+KAp8b5/tc5JJSAUu2W0V5k
         Vk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754645886; x=1755250686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hyf3MBlDDSQVvuck4FMMqllMbfvK6J+oUejBmEdt+c=;
        b=RqfHaD0Z2QEEe/emHS5tz8AqZ809b7JxE9sE2jKLK8vtPdOXapy0ISe/51AsElP3Gu
         DtLimQjqq9QsDma7i2/igKJoc+NHQjrsDU0dIzbn+08zGb8AdmOWlavx/Qwplp+LavYG
         8pii45zFRKY3IP5fPchunzC+g4qPf8aWIifyuG387+Wsmsoc80PHU1SF0XeYpcdwxOLg
         YAfOWa16hcCl1jZz+d5jvlFaNf29ZAwousiy0X6IZKvOU753QLBCd0QjJY4bNIt8RiFj
         F5pd7NjfKkk1BtkSQxpO03JmOCtb9mvu55dSu63AuU66mZMg5kLGo0Ntw3Ip/fNVX7B8
         kfZw==
X-Forwarded-Encrypted: i=1; AJvYcCU/jCAna4y/738PyAkz6SYYx/nkdkoPU30Y9l8aHLuUGT6RP+Ve4LaBm6W8DqhEXhOzERODh1WEfjgF8OTwGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvHzVv8r7p61nZ5cuPb+dlWp7FblPZaWLfq3XWAj4bvuF2VPic
	YzpAQL/2+yJ2ePSrREDU/k5oO6UKKT5NVCGOfjbTJhXBdFsvflwRQYGsnMlqyNBDTsXAqEFsPgn
	RrlckviHEUeeEwgQntjzkz5d3NZu/u+vsRHnUejap
X-Gm-Gg: ASbGnctF5B1nMHV2iWUq0TK/FxN0oVujaFX6QuUyzdnCTVw81neSd0zeogaV9/zVX0k
	o2CCxZh280w/gKonKCgf9ZfHJO8ino4T4m/91wblSI8a32hACyIerKT4MECEloZCmyz6OXW5B6H
	PYcjlayR/Pn96yo+2DWsBUXgwcYudO24M0GIvjANisgUPmLDv2tnkSqwl59E/pKk6OMnkeI0uLQ
	pG9Olz9/ztomdlv9qHtL4ZBqwOWJiH7YQULhg==
X-Google-Smtp-Source: AGHT+IEHNEfRrf+pOHljnsd7iqhucL+loKIkVhMe0t7D5lihRQpHf4eK9ilr3ChucD+JASdIhowaJ/quV6Hr/WdZAJ8=
X-Received: by 2002:a05:6000:1886:b0:3b8:d15e:ed35 with SMTP id
 ffacd0b85a97d-3b900b32841mr2173820f8f.23.1754645885462; Fri, 08 Aug 2025
 02:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806205044.85085-1-dakr@kernel.org> <20250806205044.85085-5-dakr@kernel.org>
In-Reply-To: <20250806205044.85085-5-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Aug 2025 11:37:53 +0200
X-Gm-Features: Ac12FXxOauFHjgoGqs8iBoC56lOm5fa0p8lfxr6TxyySB6B0Q0W87PbwjnEQ3BI
Message-ID: <CAH5fLgigVJgHn6HKXBRLYf5Tsh2iM1Pn6wdi4c3TfWwsnHHpmA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] rust: alloc: layout: implement ArrayLayout::size()
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 10:51=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Provide a convenience method for ArrayLayout to calculate the size of
> the ArrayLayout in bytes.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> ---
>  rust/kernel/alloc/layout.rs | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
> index 93ed514f7cc7..666accb7859c 100644
> --- a/rust/kernel/alloc/layout.rs
> +++ b/rust/kernel/alloc/layout.rs
> @@ -98,6 +98,11 @@ pub const fn len(&self) -> usize {
>      pub const fn is_empty(&self) -> bool {
>          self.len =3D=3D 0
>      }
> +
> +    /// Returns the size of the [`ArrayLayout`] in bytes.
> +    pub const fn size(&self) -> usize {
> +        self.len() * core::mem::size_of::<T>()
> +    }

I believe Miguel added size_of to the prelude.

Alice
