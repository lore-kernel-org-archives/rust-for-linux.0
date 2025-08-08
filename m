Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B0C270ED4
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643296; cv=none; b=Pfk6tp/HxZulTM86RY3kxkbTmHiZB8xutoDOMHYS+VS6/GfOFr3gnpqpvcmnqjRtH9gUo61+/5B5+J6Yf6vkHX2SmqEXMvID9y9iW1L+5GUhWUZUhcl4AMeke+hqCkVj6yxale4H/p9VnYFK6cDzunQ1SDfHOi068G96Qmv7NFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643296; c=relaxed/simple;
	bh=Nm8RGG6vEF7rPz50tGhY4843QLfesojZsNTfc0rfN4U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nFU+xgUKKkEd61Etxs/dJiFQQMaJS8A3kuy5Okn2RHREP9i/0At/uCNgSJN5rC736a7Fg59mgfXIixcyxQk4rUFzDp0izbOXvHgvRlAoeDuhu6v+EBaKVC1CV5eBlAFJJW2ud2BrLvS09OXwH31gkJIgjvMNjMZXpn64b9y+4Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o5xXrIKO; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o5xXrIKO"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6155a2c8365so1393483a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 01:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754643293; x=1755248093; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0x4n6wfKgmCfOFcD5pYK3yPLxC4SGB7PVAHJXN4fck=;
        b=o5xXrIKOjirivwp9MQjZ5acGw+Q4aAsAQKyTwwM5MgxbcHWOX1VrcR3sCHdvNPAVa7
         vVSsq5bVKi2DtTmYW5ocNpCMZREFDTOi/YIF3A0EVuzzVomglQ0FFkQIjiVJNBD8Dsnl
         bIPiIFaHVhS4aJQ6XZHArIRajVLo0PRgzPnn/dXPDYk1dqLA1Oj35O3zI3LYWURioEp6
         hkouiWmJkVeUnf6qBg1e7E0OgrnUnkisM6cu7EHSQTGdb2kf9Py3f21u7y1/jeKN63vE
         U/YNvi42cEF0TjvqIznCV5t2D3/T5uuKnhQiUss5rzO6aVMDY6EM0qzVVbbU6yI0n52H
         lu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643293; x=1755248093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0x4n6wfKgmCfOFcD5pYK3yPLxC4SGB7PVAHJXN4fck=;
        b=OYG4erIxcXIyzXOfSfzi5SNR1fyENBwaSinllaeRXu9VhIvEhUa65W+haevOV0YnTa
         OuPH4fmWpW7xK0tihOU6/LnM3Wzc5AtqjPEmH7K5QgQZhkJq3LprVI3g9qFqm/yK126n
         axlfhM3G5vRIE+h9rIBE+3wWKxYPJhiFzuLkJ2DY06X6yOfAFHR7pXkWAciMxbQERwwX
         YoAdvn5rXyU08hoZOzNjNacMemLBdedJDu7IC8FIKVC1BkWhftivMlviPXRqcFiiTLhR
         zL4plEAh8oypLu9E8BGvE5T3A+/gJnknXTgIiPOJz0NVe2krFBCEinatwzny3t8dwdgK
         uG5g==
X-Forwarded-Encrypted: i=1; AJvYcCXYSgWbBQ/rJ19DhbhsUUdR0Y1Oqx1vLmlJZGjQwpsG6n1xa2qbvY3xqOuAQRaUey/8Q7chjHvCMc1K4nNSRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/JvIWWsJVyMKqy6BOdcBnktue2NHRLzQOB3udLiYq9uTBcrV
	cBqFEExGuiybADEAz3qSCkF/GJvF75teA9KRPDpFfke+9oIejxsKxxYYGV4gg412CKMjQk+7tJk
	t8Ar9MGBJ3vOahdHaHA==
X-Google-Smtp-Source: AGHT+IFd4zmufkZHmjVxCGPaQAG8oFzFLm1MCZcKqQDwOoXCdIrGvoHD1yutNBxTlT0+pGYLMr2Qjj4MsQqGpkY=
X-Received: from edtt17.prod.google.com ([2002:a50:8d51:0:b0:612:9323:1cb1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a50:fb08:0:b0:612:b150:75f3 with SMTP id 4fb4d7f45d1cf-617e2c27eddmr1208791a12.8.1754643292758;
 Fri, 08 Aug 2025 01:54:52 -0700 (PDT)
Date: Fri, 8 Aug 2025 08:54:50 +0000
In-Reply-To: <20250806205044.85085-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250806205044.85085-1-dakr@kernel.org> <20250806205044.85085-3-dakr@kernel.org>
Message-ID: <aJW7WnWWfCDbGsWp@google.com>
Subject: Re: [PATCH v2 2/6] rust: page: define PageOwner trait
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 06, 2025 at 10:50:11PM +0200, Danilo Krummrich wrote:
> Introduce the PageOwner trait, which can be implemented by any entity
> that potentially owns one or multiple pages and allow users to borrow
> them.
> 
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/page.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 631718a6ad7d..93ce4956f782 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -103,6 +103,18 @@ fn deref(&self) -> &Self::Target {
>      }
>  }
>  
> +/// Represents a potential owner of one or multiple [`Page`]s.
> +///
> +/// This trait may be implemented by types that potentially hold ownership of memory pages. It
> +/// allows users to iterate over those pages and borrow them as [`BorrowedPage`].
> +pub trait PageOwner {
> +    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pages owned by `self`.
> +    fn page_iter<'a>(&'a mut self) -> impl Iterator<Item = BorrowedPage<'a>>;
> +
> +    /// Returns the number of pages currently owned by `self`.
> +    fn page_count(&self) -> usize;
> +}

Honestly, I don't entirely love this trait on its own merits. But I'd
need to know more about how it will be used to give a clearer opinion.

Either way, I think the implementation of VBox and VVec could be merged
to some shared VmallocPageIter that iterates a region of pages.

Alice
