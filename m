Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55E4EE872
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Sep 2026 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633825; cv=pass; b=kPk2Qe1B2q73bMMXeAzWWbQEQuBo+I6sRayZ2n62jy3x8gOcNjeTrRJ/OGycFQEAn21YSpIpE6LDvdAkG/lro8s7skBV3tv90vrO9XUYHX9UOhYFevW+nNpDOIlG8a8N5Ro1UexqjHx7cblTqTN4kfyjh9coDx8FauR6NiES6ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633825; c=relaxed/simple;
	bh=9Ip1MmxeUGWd0g47wSBTjabQGaYtNljWnxUSLDkQK1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lW5VvoraxOZ/WJ2NKiHVWkXaAn3bN/nGr7TOxShsGhgwWo0Qxl3MpDO4S06IDchqthHaKmlbnZc33/WBOuFTjS0u9l9oTMCa4z2ol1WyZiU5J5U2shRzv7LRrSklTWmbuHVs4b3Ht5ZQEVaBtTm/ecVfrWoduaMtFzwmQXN1R9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DG0uZ7te; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DG0uZ7te"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so240234a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Sep 2026 11:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788633821; cv=none;
        d=google.com; s=arc-20260327;
        b=fnTXm0ZTyfZ5MM6EV7pP19vuv7PZiu1F8WDzBa0pOsV0kohuatx50aGVUbSDg5QhQB
         gQ127v+G013LSJ8uXsV3wjy1XsavZSe2Wu2BdGEGTjrHXSc7be4LlQiJ7WyrTnN4WSR4
         S3b0P3MG0HNq1S65Q3Zbu+3YXjBh6MeiJF0rf+fUMFXlDpAXaRQDu1xo2So2CtX3hxDI
         uum5f0lPkR376w9f0bBm3lomNq4fYOEvVkyoCLRz0nc3qUng7VPwbptb3JAw0B5mdx2t
         MdFdi/UYuD+mAdKD7BK58/UgXpWfD4LnCWeVG9dnAtjQpM7JCGu4+TdKIZ3uRiVW1TQb
         Hclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XekwQGEO2G0SV/gVTmMZu7YurR3mOY4ecKYwztJmR8M=;
        fh=bD9qiF8TQkaL26JqJk243uxZqIiKz5y89EwpWGstP2s=;
        b=smZObosjcndiH7D+aXhQXdhpnuSGeoN7k9s1sh6RIl9cwxa/KPA/1kmgl0CQh2W6VU
         B9j9Bht4ptRSG/t00DyoWPSa2efyURptSMRSy7ARt6L3lYFtQQ0LRPFogIa2koDsvDHK
         Q3EmsocPnnpTv6V8dH5zfyzPC4yJdjjnGcVWR/V7tyk1htvUnedNCxUfTo5VeFHmKizV
         jHq+tRj4L11V41YJVgjVak401yyQWSUMxiRi9VkjNNoUHWGtBZujpIA3Hmi3A9kuYPL5
         ndka2Q4qe3EXmlnsqSyxnn2zjj/RU6KDH7BsOtdCpml1hGOD2xyhBNJKX/usGzd/uIYR
         /bHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788633821; x=1789238621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XekwQGEO2G0SV/gVTmMZu7YurR3mOY4ecKYwztJmR8M=;
        b=DG0uZ7tevCNBnZAHnuosaAZzgsHRRF5mmGFjNHK7mUDp+yWev1GRtAWDzYqg7es5AX
         5hy6wpN/bhoB5/ME/AJNtCE5dNy8a3Q7OTGqs9rlaoUEHXZyb0eRkylYhx+VsBfAfb56
         WNWl/pMm7XbiYeWpMNt2g8Z33H2gP1gIzkaW9rFkLImTkVnub4tWyf0mIvm6uVAji2Od
         XymjB4gFAyuCYdKa0++Hn9d4N8Z3rfNDLfm8B3m4eFaX6l55U2co5srn31ACVM7ldnHO
         ldc3gltHTSL48gvLI5Osw3DsFa2p593Q5UANgnYDHr9OpsQHq5WZzoHJfd8OrOA0GlCs
         sKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633821; x=1789238621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XekwQGEO2G0SV/gVTmMZu7YurR3mOY4ecKYwztJmR8M=;
        b=ZqtWJqEPVG8USb9IJSgnPUs8xM9sgXfxn+mOLPgfcHQLiWFjeiQTcGFQ7cqTEDJODL
         cQWd24fj/FuKclZwOGYXlOjC+vgxnTPZ8u0bqMzSgBZEj7vCSpuwm5KED92sSrtVvQs8
         VSjJVA/qsYhP8G+gMd6k6+WI31mZfZqacEhc6NuKGeIjx/LrNksz0E5anuPaUU3aY6PK
         MR6dEzulCAulnVUeYZG6sVEaPVMKk9SchzzeHIrWPdFiibRtQ+omsCSwYWX2UMtBajfI
         f//AQOOctNrtioNlhJCeCxSB5PBQzz/4v0+/1EyJLOSnK/J/cDKlYrYztErzlHWeAsIN
         08PQ==
X-Forwarded-Encrypted: i=1; AKwUvByDdKXdIxLOj1mhDdGfeNKSJH3HCC9ksv7rsCelGfa7RzA888oTR8F3a3m7OQ6K7fpbGERabh33GLSvXVu3uw==@vger.kernel.org
X-Gm-Message-State: AFuF++moFWDzOPReeDL4pXXAxW0ErgkIIYMgap/m+/MYEdjJPac2a3Ng
	WX9vu60L4j4ndyTySL3h+Dz+xmRC5wEq6o7V9jU/CzSW8XDRqT5hEiKBKU8NXKmcMzb0HEadd5Z
	N7b5ALRGv7+2p3piBtt/apgKWKiejgws=
X-Gm-Gg: AYBFou38i7JoqGb22TuVBucSh/JnInQwIV+u7SyUyBpoHWaljSqKGmwERL1Re2v/BUx
	wBoTHp6SFyzfq4JqiwXXNdS98o1hxGOVkx2u8dR3ll/mDGPXxP5APbet9nExHMZkPlRjyoQFQ9A
	u9pg0WvyMlGxz5m04dEmW3MP6maaZIH+AYapdbqvR4XbIrxty1ld5vbpiRVLTf1FeBXIkvULf3o
	S4eMbkI/nEVEZA2RBAmMfD+7i1pdgXV5gD56Uxmhnp6rxNfNGIqppDFZ6M3LqSg61oFGhiqQg97
	FnQ9FQZMbsxsMkO76bbCM7bi9h4hGEEHthV/3NghKQF1MAjvqz5pG/jfWpo6s7iMlBTfgZ3/2Nq
	DB5yiJ9MBcdBd/CrQU4E79r2wLCeSlZu6KlG0WBOgRU6CL3qzKgmweNwYSn81
X-Received: by 2002:a17:90b:4b41:b0:398:bad2:c0f with SMTP id
 98e67ed59e1d1-39b3d8310d0mr6299253a91.5.1788633820895; Sat, 05 Sep 2026
 11:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-rust_serdev_fix-v3-1-b86056c3f7a4@posteo.de>
In-Reply-To: <20260905-rust_serdev_fix-v3-1-b86056c3f7a4@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 20:43:28 +0200
X-Gm-Features: AcwNN1VE7R5Qpqg2xVKghrSvMCGolroPW6Kcwa9i6GRHIirw3YVUbccVS64BWkI
Message-ID: <CANiq72kWczjEZY1q9rF=zpMAqQ_yUhdb-n6FgXXuF7==zgOT5Q@mail.gmail.com>
Subject: Re: [PATCH v3] rust: serdev: Mitigate race conditions
To: Markus Probst <markus.probst@posteo.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 8:33=E2=80=AFPM Markus Probst <markus.probst@posteo.=
de> wrote:
>
> +        /* receive_buf: if T::HAS_RECEIVE {
>              Some(Self::receive_buf_callback)
>          } else {
>              None
> +        }, */

> +        // Bound,

> +    /*fn receive<'bound>(
>          sdev: &'bound serdev::Device<Bound>,
>          _this: Pin<&Self>,
>          data: &[u8],
>      ) -> usize {
>          sdev.write(data).unwrap_or_default() as usize
> -    }
> +    }*/

Please don't comment code out -- it is fine to just remove it even if
it is a temporary measure. The code will still be there in Git.

Thanks!

Cheers,
Miguel
