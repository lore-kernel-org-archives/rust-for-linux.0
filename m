Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD3274FEB
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771664362; cv=none; b=EBrLPNYErG+XcdNcwlZj+a35jhcngUp+zi94QAQ1MP9SGTYBnjP+BqQXnf7oXhLVzcs45iQlG7B22C3V1RtylnhRdrFuGjo/ijUXSQBjEkGuG8Q561sym8cMlAQhajF8XjN1oJF5BiIqL9X8bhdP2f/dlc2pv/yz/GQkp4NCAEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771664362; c=relaxed/simple;
	bh=gFh8xuSc1dOKs5gKk6gqPmmHdoqd/hicr6x62pPVBMo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lLWg3WglvLZbEDl9cKTgUzJu9WV2zy3faXFbzN8tXVCtLSbsQ7uYcT3SAFCAD7kvdFixTKO82pFUaDA3Thpi5A1FArXn1zBV2uUY8glAxPlbMk4vjIoYrmIKIAhFSXxtG2FDvFuS2Gronio9rCnjhYEZS9ZNhrwwCPx+CQIyEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UKSPjuKu; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UKSPjuKu"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836c819456so21032445e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 00:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771664357; x=1772269157; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6zMqqgKoh/9hUmXKLa8W/Ktm8MqMG46VT0cs/LJ1MPQ=;
        b=UKSPjuKuSV0XqhQqJCFnWsBQqsdYirpjZqRmWMZaJHkHKhF+PtjgfiRGL56B5P27cc
         bo/zbmNz7UdW5PhkVoKacIogtkNJkcTzYhgULURH/hH8ckmIyXdMXmPTtLL8rXb5VYzI
         S2/GK24RHb1HfI2zQ/Gzz7lbbJyTvACpKUwNPs3J1f5+WARfgbnXZ0WTzIFliwC1tFJf
         riNcOFkNk+W41NHM3cPSaJpHmTkZsKEuwdM7MNdP3NZ4IFWT7zvLqac3uvAaDIgy435s
         Y32aHszKhoNdKaufkY0A1qUByOBt01/S8u2/pnYlxqwztOha4IJGHDeMqwdJHpzrPRU1
         zFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771664357; x=1772269157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zMqqgKoh/9hUmXKLa8W/Ktm8MqMG46VT0cs/LJ1MPQ=;
        b=CH9mJAqDtFnPKrRT4a+A4BQ08vvgRIqa2C3p9gaakxcnBk43QzK70oo9vNG0JnCKl7
         lbN8udqFjqKHeZhMAvolhfG3YNC73NZOTvY2QAM+MgLV5n7zetpelSIQAyQz8i6B8hIW
         wrf+wYlWDJOVAjhg/CSzG6UbQjHDvT6T0ieds91D9HY95laqs6BiSkxIditk9BNn+9NY
         lzZlZKndClbQE7C5MylWt646VtcD9pEwYtVulby3nGCdxPCPYMVkxHzVc9IDwDlBf0AT
         bT/vlnisYagOs0Y6s7IzxTYVJ0tfG1ux12X9dKn174x3ZCdMKJu1M4QzLXfYPqYRutj5
         kJfA==
X-Forwarded-Encrypted: i=1; AJvYcCU61sc7VMKUJUYKeH9xMuloqUlnj0wv0rl8UqbP/yQ+vktWRQaTm3uohf5OQYdpsc87/p/ezcZfked2qPP5cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0DyuWa28DN+XohBYyyXyki35+z+Evi1hVUNKxxy8E5og1Wou
	1I4QJbFujU9GcxCXt1Y9D4FFSiMfwNWwWWqPxyZKUXx+WHzsQ2Eo4UIfUmrrUVjZ/PIKqit9Q4p
	24WakNZy3VyzcZeiHPA==
X-Received: from wmbz1.prod.google.com ([2002:a05:600c:c081:b0:483:6f89:e2c8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e09:b0:480:25ae:9993 with SMTP id 5b1f17b1804b1-483a962e3c9mr39685415e9.20.1771664356547;
 Sat, 21 Feb 2026 00:59:16 -0800 (PST)
Date: Sat, 21 Feb 2026 08:59:15 +0000
In-Reply-To: <20260218205507.689429-6-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com> <20260218205507.689429-6-joelagnelf@nvidia.com>
Message-ID: <aZlz49VtPA0JbEGx@google.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 18, 2026 at 03:55:03PM -0500, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
> 
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
> 
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

In general this looks like a useful tool to write other abstractions, so
that's good. A few nits below.

Also, I think it would make more sense to split this series into two
with titles like this:

* Add clist helper for writing abstractions using C lists
* Move buddy alloctor one level up

That way, you can tell what the series actually does from its title.
Yes, the 'why' of a series is very important, and must be included in
the cover letter or commit messages, but I think the title of a series
should explain the 'what', not the 'why'.

> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
> +    ///   for the lifetime `'a`.

I don't think C vs Rust is useful here. What you want is that the list
is not modified by random other code in ways you didn't expect. It
doesn't matter if it's C or Rust code that carries out the illegal
modification.

> +// SAFETY: [`CListHead`] can be sent to any thread.
> +unsafe impl Send for CListHead {}
> +
> +// SAFETY: [`CListHead`] can be shared among threads as it is not modified
> +// by non-Rust code per safety requirements of [`CListHead::from_raw`].
> +unsafe impl Sync for CListHead {}

Same here. If another piece of Rust code modifies the list in parallel
from another thread, you'll have a bad time too. C vs Rust does not
matter.

Alice
