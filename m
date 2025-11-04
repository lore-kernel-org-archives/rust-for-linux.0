Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED814327783
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265242; cv=none; b=dz+HSd6A8aDKim0C8EtKM69QrvmkmHuPSgL5C12O+dUJLGvOsyPBryVdbR2HHD9GcBhpc9rlonHnAGTuTHrGVnnn9mI30N6s4TPn/pvAHRuoOGZ2bbSkXxwEMHltq2XXCMA66ZZLs1IU1n6+UkhB6v9VF2hW1qhSlV/tDFUKnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265242; c=relaxed/simple;
	bh=V/6GRoS3/EkiJu/PAUYjegilbyM/Kg4vWk+H06+F/xs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E0LPqhvCM+SMiSoQ7bmO6HIb+cfzyN1PG0stRu4T2Df/ZdM1YbTOZKmOP/6vi/gR0XWK0S4asj1mRoOmJsxU3vZ8Camvj5+D/v9ToQIyglPbQdi5yZHa1tmH9S7bPKCCCIZsuu/TTzp0+HyMscEeawqjUcXt2Qe0kK5h98HIZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YYCnTfs6; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YYCnTfs6"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4721b4f3afbso22045545e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 06:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762265239; x=1762870039; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0XlFlPd3bHG9no4QyoaPyikiLZTerIShtsBKRlB69U=;
        b=YYCnTfs68Gkh0hCBvgjC2OdJOcbsVth/iTjjq/bEdxKV7ET4UB+fQc0NV6OlX89XB1
         YOPAGZK2F6ML0v7Bn+6AEkk1fXkS9Lk0452v17pqaNcpxq6l1G6HdhkJwn4zr67MXJpA
         TH3QWwcCN4B1wiavNcQagza6myl93BlTXjK9E1lqWnl9fzmL/IUHVlBSE4L1grRbSfow
         hk5C/g8BIrgiaLDsq0DSG5W8eYsBt/oq2k2fCjYxqRKRRsQ5vJht2tDfT077Jw7hGLfA
         9eK7eq8Yk2VJpnuXKG3jAZqjNO9s4DHYcD005favFMUZc0OA5uSBDhN/t/Z8OTIuWXuH
         oxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265239; x=1762870039;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0XlFlPd3bHG9no4QyoaPyikiLZTerIShtsBKRlB69U=;
        b=dGz/EwJN6ojae0fTQZPS9TwpBstSFz9GNZnMIm4ghIkUs+1TdgVBuqFcCnh41ceGfq
         a8sYgZOMJkZpDAr4KyNxHelNCmD9MyCrMjBbHy1KcuiVMU9zLcSfQdhk1dPDTiYzg9t2
         j9zXMwn2jJJLThvmJTzyV5PBoe+sCcK3Su249mPPzCRd/xwbKdL+HiY8BhOnokLJUga7
         mqYT6kknbLhauFTPjqFl1Y1f1uj+m4qGaA2GvynUyQcD416hJnfJU/z2UTAkKwv7bWpK
         rOpbPuXpV2E7jmZr2bYVHeuKcm2Cyvk93ZXAlFvWqJPldltsTq99wqOZjuL2Ofv6M2VE
         DTnA==
X-Forwarded-Encrypted: i=1; AJvYcCWP8hA/sPt7og+h2eJ62HMDp3FPFj7onUcHG8J+MMKE2o1IcAzifZuXouInutXboXbgCxSIOA1/qUAwmhTMog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuOXwQ1o7il8DPbBL6gL5i6OSafO1aW5+acu1HFI/KC9Gu8wJ8
	YMkxrkPOTbXC7cJ/09lZxSa1jRLvRDhn4bppWNKuIf6J2vE6EcC7AAkTPNb4hQIAI2QNReH4a3F
	iRxLWfZI30LMvDf184w==
X-Google-Smtp-Source: AGHT+IF7Z9G2NoQdKa0kcEf+rRGi/koVH8onnac1d5yNHUsIXHgjT/z8ZkDySTLnWzF5coxstmOe5U6bx2HqTeA=
X-Received: from wmkz14.prod.google.com ([2002:a7b:c7ce:0:b0:477:4a46:9980])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e05:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-477308a8f1amr178307165e9.34.1762265239304;
 Tue, 04 Nov 2025 06:07:19 -0800 (PST)
Date: Tue, 4 Nov 2025 14:07:18 +0000
In-Reply-To: <df3a68334760b2b254219a69426982bf858dee39.1762221537.git.chenmiao@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <df3a68334760b2b254219a69426982bf858dee39.1762221537.git.chenmiao@openatom.club>
Message-ID: <aQoIliAbrn0Re7E3@google.com>
Subject: Re: [PATCH] rust: kernel: Support more jump_label api
From: Alice Ryhl <aliceryhl@google.com>
To: chenmiao <chenmiao@openatom.club>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 04, 2025 at 02:04:17AM +0000, chenmiao wrote:
> The initial implementation of arch_static_branch was achieved by accessing
> the offset from the original type. However, this approach extended the
> path and introduced redundant calculations when dealing with types like
> `static_key_true/false`, as shown below:
> 
> ```
> static_brach_unlikely(tp, tracepoint, key)
>   => tracepoint->key->key
>   => &tracepoint->key(static_key_false) == &tracepoint->key.key(static_key)
>   => off: tracepoint->key - tracepoint
> ```
> 
> In practice, the implementation of `arch_static_branch` overlooked many
> detailed descriptions. To improve clarity, additional comments have been
> added to the original logic. The approach has been modified to directly
> locate the corresponding `static_key` instead of using offsets, thereby
> reducing  computational overhead.
> 
> If finding the offset from the primitive type is necessary for this
> implementation, I will abandon this change.
> 
> Additionally, support for the `static_branch_enable/disable` APIs has been
> introduced.
> 
> Signed-off-by: chenmiao <chenmiao@openatom.club>

> +    ($basety:ty, $branch:expr, $key:path, $keytyp:ty, $field:ident) => {{
>          let _key: *const $keytyp = ::core::ptr::addr_of!($key);
> -        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
> +        let _key: *const $basety = ::core::ptr::addr_of!((*_key).$field);
>          let _key: *const $crate::bindings::static_key = _key.cast();
>  
>          #[cfg(not(CONFIG_JUMP_LABEL))]
> @@ -30,7 +71,88 @@ macro_rules! static_branch_unlikely {
>          }
>  
>          #[cfg(CONFIG_JUMP_LABEL)]
> -        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
> +        {
> +            $crate::jump_label::arch_static_branch! { _key, $branch }
> +        }

So ... this is changing from $key to _key. That's replacing the global
variable with a local variable holding a pointer to the global variable.
However, the arch_static_branch! macro uses the `sym` operand which
requires you to pass it the global directly.

Did you try this code? I don't believe it will work.

Alice
