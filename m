Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3CC1E378D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065897; cv=none; b=MoIOQn5Da/1eAADaLrU8l812v7u6f1WFBwW6vR3tdZPVGB/muz/dQEhptzJxV+c8gwRx5h0IOxqiUeFRZx6U6BlI6YPL8DlFRnQXKd0cQnAbEcvF29NTY7F1sPSgbA0KrmQoaC3kkoXgxa17jDyokjizDfZkOCnsv77zVva8YzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065897; c=relaxed/simple;
	bh=QIF+HTew2F1h5iyHaLMH7muptcMDH7VComrsb70XFBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWcwZ8iKAc9fstwfQFHdVtccl4ALRoIL7rBjhmmXqQTi4feJuSvWJW1L9scdVBtZTR6EwVGs+ImDpg3iTXrNEV3kcxG0xjgOY+ASCUzW9dLftoelMkA4pWOSfQCTH3mG77EtwzXIhllQC+t1gJNcjkLPzoZEa28bv1ChkLL7768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ndcv1RgZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ndcv1RgZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4316cce103dso23710805e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 03:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731065894; x=1731670694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOV/UbPw8i4qzoMzuj/jcn5pBGPRVG1d4fPAYkkaiw0=;
        b=ndcv1RgZfiSZ25ebMhlqjUVBuPe7B4HtffF0fkDkjaoqIkEgMvv2m262EMAoqHMko8
         6vlBeWf3QZZC3TwgU75Bh25LSC9Vmrr2msWjkJErGVp+bbNLOeyhrz55XunePoXX7NYm
         oNXyB5BfgDDdpixLB/N2x+1yrC8OqhLHv2tEG5qy5eHrXWRN2RW8isRNh/J81MzLwduX
         ZcSZa3S4eLgcFO4yQ0DAtjSNmn3vLzCaefM8T2ZehKAJNtkMsps9+WejfgIV1MxXs232
         VtBUd7hofVDCEuAeUpMB2o1heR/CWYYFm4U29CFcbCPeAFRG39xFo7Hiu8BsvnamaIrh
         QbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065894; x=1731670694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOV/UbPw8i4qzoMzuj/jcn5pBGPRVG1d4fPAYkkaiw0=;
        b=CDABLmoKds5/WCJvg3621tBCinAF9JGRpZg93wq4UdltTbPUEZEHAO9m+QvhZTFWYX
         H9vOaX3fcMfyRME8EtjTeYmsea15be/VmYYnt8lHVjuvaAdFl9XlVkAZnx8g2130Llnq
         qNr9gRmhVjT6FCBcMYHr57PE+lIM3UNue0GMB9jZxFCo+fhuentwvmtgYydz4dmEYYTV
         PbD9QwzSYg5PoqZGsoBTsAyOHxTBEA44KhuDUQ5dsEr/0Anu+C1vLSp6WMBXD+WGhP/c
         A5Xp0ZcqUPo/fl9xZZ8At1iZgK2gZNF1HLwn3FtZ+frAyhggyso4jjvtAZL1xSEWDO7i
         obVA==
X-Forwarded-Encrypted: i=1; AJvYcCUSSRkvzf9Pys8VlMHAWFGxKn73/LrNHd9l9oOkqgnvzKLCtAD20E0CCy4CmsXGGq0qVZJrhqpm41gEhCP0oA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/0FyWNOiTg1F8ndiw37RO4crzAtuEdrzY47PtzOm/9mhNCKou
	8xs2mT1nbtPfq6JTsENqOWSbgjIdWexnBnYk/TzRf3cmP8JIU4Bps0pfnqtswDV2gM+rDylIyLe
	hXXRVuGL3Xv0L1lBFwVDIb46GhCKjut7khnAP
X-Google-Smtp-Source: AGHT+IH/97FOm3TqVqenQTtDgpj5FzMj8yNRw/WeXmmAAHkF+uiEGa+y/iCTlvYwM1bcwr2muXlKl+DLB7zzbAC/mcM=
X-Received: by 2002:a05:600c:510c:b0:431:562a:54be with SMTP id
 5b1f17b1804b1-432b7503f4emr24002505e9.9.1731065893760; Fri, 08 Nov 2024
 03:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-borrow-mut-v2-0-de650678648d@gmail.com> <20241104-borrow-mut-v2-3-de650678648d@gmail.com>
In-Reply-To: <20241104-borrow-mut-v2-3-de650678648d@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Nov 2024 12:38:01 +0100
Message-ID: <CAH5fLgiMHE5GXQv8pSR_KYWsa44zr1o_FNrg1mj8QuTvNQmXhQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] rust: arc: split unsafe block, add missing comment
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:20=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> The new SAFETY comment style is taken from existing comments in `deref`
> and `drop.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index af383bcd003e1122ebe1b62a49fe40279458e379..9adea755a5ad1a7b03f7fc30a=
7abc76c1f966c6c 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -377,10 +377,14 @@ fn as_ref(&self) -> &T {
>
>  impl<T: ?Sized> Clone for Arc<T> {
>      fn clone(&self) -> Self {
> +        // SAFETY: By the type invariant, there is necessarily a referen=
ce to the object, so it is
> +        // safe to dereference it.
> +        let refcount =3D unsafe { self.ptr.as_ref() }.refcount.get();

I would normally prefer to avoid creating a reference to the entire
ArcInner, but in this particular case it is okay due to the specifics
of how Arc works.

Alice
