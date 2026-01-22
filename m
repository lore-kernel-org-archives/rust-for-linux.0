Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3FF33F384
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073642; cv=none; b=TJb16osorVtG27/IccN9FKjwaB9KiC2E/HHRuDOcg+eyvxRdM0o2TdNyIEgE0ZE44uBrbOKce3fSj8XaF8rVep8MUEFfZHQfElK4nfaVk3U0zPKKYoAs2fhu7BtGCSJsMJxSBGz3G/alCsqj8RehxV7boYQNDYSxnWUGTCb3yog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073642; c=relaxed/simple;
	bh=HJly0uaV6RnDtJ2hwVPiPHKrWce3lm1hlzzSuqS206o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rWqBPFoYtKZSPMgl/ToJfP8JISgpW2emYH2PBbBsBoNBNU/GzWwztqJxvcmjeSttpTDB9VTUWBLiTg0wopqvXKdIxWHtrECrv75yhyB+mW5in1iB4KiG3cymnP8XlHETwZDylpmHKwO52XkklhgBJzs9iP/GDuGeWJ33/rIjHRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bdX8jtJz; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bdX8jtJz"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-658102e94c6so916542a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 01:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769073639; x=1769678439; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kXwEn043f7BhEeGPAICwZzuuvgiAElure0f13gqOi0=;
        b=bdX8jtJz3o1DHMukYIWKraeWDZMwK/j8AXhRgvIZ29jHqa9J/ehtVIlPaeDBM/9FwK
         315p9K6avNEiOFGJmYqLZiF9Js2GUeXR9IdQ4Ixlshh887uIpPRFBy9JZ1oNCfOiH6IX
         atftqo3LYHa86Vo05Is+DEctrNcryKQaCPJcVH7CBjIBroI+AmzufhqR4u8YdKrYfe4i
         J8kdr1/x/FyWa8pfV9rgEjJy5Y//2cTte6gducjuFpaPrPJZMBBdxzhiW17ut8W6NkyJ
         8mMOYktd1gJsrsLsFkqwuggCYU79HKEH+HTcjeGtWjjizFSkqJ1yegOyFGkYwaaqc3Ll
         CDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073639; x=1769678439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kXwEn043f7BhEeGPAICwZzuuvgiAElure0f13gqOi0=;
        b=bDMeQi9xnXXEGov7//Qs0ZTfx/ZrHstGhzlqKcWuvebo1vo3WcbFPpFrxc2d8F8v9P
         eCpFTVsq/2wbBrf7mV/54Sm3cD4up0tkEGoMmgcc7yWWjfsgfue0PGqXWEDybiyXIywB
         lh1Lvitdd1A+gQppa7YIvkH6+99OCaQqc5c4XgliHud8R3qGIN+Gb9/dZP8LymALA8x3
         6HPORSO+a85yXFWvk6rrASufYhe4Ww7THbF0KQmd0Z4Fwt7uAe702SN1MPBO8Eg8xSh3
         96vnMJvJ++P1osqXOSAbITYxSs2RQZv5qZ4izgIkz71hH2Q9SmE3TyadLjQ7sTrfvFrv
         CKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA4HJGfNr00tiJau+vkHUqbWle969gUmAm7HKXpYn3kdHTT3xnqGViik726JQlFu4H1+lmXLmzd4Uz5QalRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qiCfZBf7ERb5YwQ56UbF/Bwz5mFAtA8oCsHAfZ4hhMd2DvTn
	OsqtYjeI3yU+QlyXyLAsBEnpCPUT0XomlMpinRZD4h3OdZeXRMIw/9FY+ujTjDmmbzEbkJ4nzzk
	vXPyjlnEavYP+sGZe+Q==
X-Received: from edvj12.prod.google.com ([2002:aa7:de8c:0:b0:64b:9b0c:156e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1ec2:b0:64b:4a33:5455 with SMTP id 4fb4d7f45d1cf-654bb32c6f2mr15767878a12.16.1769073639448;
 Thu, 22 Jan 2026 01:20:39 -0800 (PST)
Date: Thu, 22 Jan 2026 09:20:38 +0000
In-Reply-To: <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
Message-ID: <aXHr5kxJgogHHW1o@google.com>
Subject: Re: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Dec 03, 2025 at 11:26:40PM +0100, Andreas Hindborg wrote:
> Replace the `xa_init_flags` helper with direct initialization of XArray
> structures using `__spin_lock_init`. This allows each XArray to have
> its own lock class key for lockdep, preventing false positive warnings
> about lock ordering violations.
> 
> Add a `new_xarray!` macro that automatically generates a unique lock
> class key for each XArray instantiation site. The macro accepts an
> optional name parameter and uses the `optional_name!` and
> `static_lock_class!` macros to generate appropriate names and lock
> classes.
> 
> Update the `XArray::new` method signature to accept explicit name and
> lock class key parameters. This enables proper lockdep tracking while
> maintaining flexibility for advanced use cases.
> 
> Remove `rust_helper_xa_init_flags` as it is now dead code.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

IMO this should have a Fixes: tag and probably land separately from the
rest of this series.

There is a similar situation with workqueue, which was solved by using a
custom helper. See rust/helpers/workqueue.c for details.

Alice
