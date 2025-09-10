Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3EC26057F
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757499443; cv=none; b=XZ5aH1Ocduz9dftbz2gIks26YYSRWIV0c5/EzlldkzpD7o6jwefO7MpgloOimawrksFyt/hZ+6LkmpB7ilXQyPnbQcIRG5HmFdq/Cn7QA3SS4R0RsBiiOeOtTxXiRYr9x+UZn8k2/W5Q/CCymzE3+DAtT/aX7Qm5X3O14ditmnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757499443; c=relaxed/simple;
	bh=xS4ckSmMKP8VWQ481D6mfsBHCl8BN3VaiCokSrHJOUQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eXSluOJsk1S9N3//+ZpgeF3L0C9f16PQixiYlCsIwDZX76LR8iMm65GuvZdVoMV1+S5B8fYEqFEHpSjC2C8948vZAGDRnP98/j2qP9r/0uZ9qb9tjJPrZAyfN4B7CJhbaVeVfkm01knwJbd/Oe0peoJ1PGCRwfXiDOzfnwKwT8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O8cpoh+R; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O8cpoh+R"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6215a926e31so5041557a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 03:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757499440; x=1758104240; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WFJsN/r1e5A6uZuKFX1dVizwYbiizrdc8crYvAgSBw=;
        b=O8cpoh+RLSF4w5ndOzuskn2M+b+1lmZ2DHhocvry7suSqK/Tf0+ybhxow6iGidNZwr
         QxxO8WE4p3k1VCa0/LRI227f2KEuO0AnIQS6tyJNAAYGovewxSjmBdpNMx94ZKv/lBRl
         dJybRoS2POvi5ui2kqqMicwOKQSDgI/zj4QlvyZOimAJkaDYppYkr/ymUHwvCl7KimfF
         zZQdwbUEukPz4DMhTT6uti4X3kdr3ny6poEPM24W//3YtDXynuXMiyCXH6habuyXjEgn
         oWu6Te8GQhe4gwv067SDWB4a/EL+C0S43Sc+FMYyttxLPiFB9ID7DA7clDW3ILeiCaUE
         cI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757499440; x=1758104240;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WFJsN/r1e5A6uZuKFX1dVizwYbiizrdc8crYvAgSBw=;
        b=hbGU9q66rsd5l0VSqoFAFoCMvh/VIYpaNl+4H6EwSLaXjwYlFev0EYpzrmo0RWYmi7
         ffdiodsKyq+/rmHwBwF/uZwJKY+yfAs/C6ntCA0BEUKHx1d6SP9MjJiSMEwlSaYR1jSH
         6x3dzlVwXtsf4GUTDjoaIedi0oqPIumfBN7COWn9RwjA/HDMKbMODNEUg8GbkCyHPVuX
         omKG05ZOeX+FisqtAAgDeabXuEJspNViUYJYeDW8N6nAUjyA6BNl/xjpTslgGLMBfkJZ
         hNzMNOcWBRBJ44TQNUm2l3PztHM8p+NyTkW78Axlr7ok2RnxRDAJbOoMMVt4N3aTjfvZ
         XZYg==
X-Forwarded-Encrypted: i=1; AJvYcCVGKUgKlt/k6ndiefc92NYZvTfp/zdY+gtItEe7AKhb2KJEeuuYREI2sSW1WlCttfdxnJ2No/+Y8fqVg1gvsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmox4N8Xq8ZZHEkLCzF7TquT2tsB1/IGx19LHGExIUSqTjtd8L
	HK5AAJpziUPPJutx8GEgl1oCVaiAXYMj3U17AHnjoX7Rl7hly4GAAWNKI3ofEFlyi0Gd8vq5fcN
	YcRGx58SGRBW2vSoY0Q==
X-Google-Smtp-Source: AGHT+IF5YUN3dimb8zptLPLvG6MVM+q31mkTY3j6lyy/ixyop8s5av/QNPhGHBZWNO0slK3VnOSEdgs11cdTy4k=
X-Received: from edbek8.prod.google.com ([2002:a05:6402:3708:b0:61d:1327:cad6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:90c:b0:61c:8efa:9c24 with SMTP id 4fb4d7f45d1cf-623797a9ae9mr11851866a12.37.1757499440511;
 Wed, 10 Sep 2025 03:17:20 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:17:19 +0000
In-Reply-To: <20250910100755.2361281-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250910100755.2361281-1-lossin@kernel.org>
Message-ID: <aMFQL-Hq1KvBG5lh@google.com>
Subject: Re: [PATCH v2] rust: pin-init: add `#[bind]` attribute to access
 previously initialized fields
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Sep 10, 2025 at 12:07:53PM +0200, Benno Lossin wrote:
> Assigning a field a value in an initializer macro can be marked with the
> `#[bind]` attribute. Doing so creates a `let` binding with the same
> name. This `let` binding has the type `Pin<&mut T>` if the field is
> structurally pinned or `&mut T` otherwise (where `T` is the type of the
> field).
> 
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Is there a reason we can't apply this to all fields and avoid the
attribute?

Do we have a place that might be able to use this?

Alice
