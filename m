Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5BD2BB1D
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767618376; cv=none; b=qgsLGH07tpu1MQ2LpLO49QHy4unU+oKt+fCLNL5Cuswk5rVXSRHPHRgLAe8A8HoKpDFrhljpSuMCPcXJgdXaqCaKrftRMBLyrJ0EGqPYIkraP4Wg4iBDWLtIlHKu/iQ8wxOTwPrEq+kjiMG9SPtHtVJ1QVGuZ6qie2wnYRQylGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767618376; c=relaxed/simple;
	bh=jMdNaG25sR6E1NY5DwqzKs+ox0+FkUEzjVXid0roeQU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gGIW8KHNnDrAT73yHV3nY3GKnHRdc2U5baQRdrH1KZ4sbI/925i4d1998dbcyETuEeAaQjVYXIiDvBZZRSSxSF0GMXdHnz9rAEYamPREdbE79V8+O3c9ukny5YeBF5VQFgGcyEmYa2e2EW0ZdkgO8iJYKoQ78EYrU5vpfW4Szpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FE54FkdB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FE54FkdB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d4029340aso82808355e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 05:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767618373; x=1768223173; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwcNnwvDle5f2aGYKaoJDsTOsqdyBTT+2/78UBDrpWE=;
        b=FE54FkdB0Us1u3WFPBbrWrNBpl3j4hLWKQ6HYyxYmkKViZVnl5Gce7mQeW0ArPLHRy
         su6cO0O+H6LZx+h/LoEntw/9Vikp5mKCCFILkW8hNpjrHi0pa2uB5BYQQpgFBxMnyJ3C
         p7C5YvdLh81Yxalu9733gHhlxYp+uckaGsxyiQu9t2SehqJLJ+fMDl26P8e6RQvS9Xku
         z5Ub7LLXlhDJQSuBu97TWJSyyOUorseZuMWydpf1N8x/2w4PAfEB6r6wYGMfs/86S3OW
         NsgZeYjV7NaEfUwPNybr9ScHeLD1owzEyX7n31oK0FbJz/8K5MPItOWbgF78ZLlsYze7
         3Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618373; x=1768223173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwcNnwvDle5f2aGYKaoJDsTOsqdyBTT+2/78UBDrpWE=;
        b=GYkZtG9SgBgSSS3o6UgzGInzaboUYm3PvGXYyyTbjeuqbm83k2LnqP2TaKaPASiIP2
         ZTpfjAQ0FRpZQh18DK0DOYHxTd2AZ6QEsmbZD0XNND46zYybtmMK+dvP4s8hjYECfTrM
         R4c9pm1P4/Lehu/BMz16ARH4XFMp2gwEaqcqZZhUPmqYYmvkkyExC+DR0+YeGdsD/Sfn
         z8p5UEMFCe8QzH458AocjcQ2+gbfxKMbLnNvSbPEI0M8a0LTwG1ycila3ayNHnqrz+wO
         OvSd4DFXLA7IIZadN37fRGxLMkg/t0jXcuOPdYaRCuYwATarwNe4xRy/P5zHjlrBMJ6u
         7kJw==
X-Forwarded-Encrypted: i=1; AJvYcCVidtwlfx89oaYoTzCGyaDIqGbVmW5zPcOIMZhZLSC50608YpjfNFXbgtd7SprRenYWOwhltj6QIAdhZOmlEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+lA1hY9tZSPtQK10uKRzAS9/hsWcEBiBAfAKPa7xnjGi7vNc
	1Ga1LKfONKcnKOfnykG9Adiq9zZea0qbLuXU/YZUQsNizIfQXHfxsZ9LSNbaD1LuzJzaA1zpBJz
	5b/9wvAtBbu0znAR/jw==
X-Google-Smtp-Source: AGHT+IEt1UUjUDLMcRJe1tPP/nIc4yfSlrJUG/3eq2EGdBd4FKzU1hYUSR/Az8PIMADzqa86/ft1g1QBzutRtw0=
X-Received: from wmbb13.prod.google.com ([2002:a05:600c:588d:b0:475:dfb5:f4be])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4711:b0:475:dd7f:f6cd with SMTP id 5b1f17b1804b1-47d19596ed2mr650259485e9.35.1767618372981;
 Mon, 05 Jan 2026 05:06:12 -0800 (PST)
Date: Mon, 5 Jan 2026 13:06:12 +0000
In-Reply-To: <DFGO7BGCVJF8.3K3G547RK3SVN@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-19-51da5f454a67@google.com> <DFGO7BGCVJF8.3K3G547RK3SVN@kernel.org>
Message-ID: <aVu3RJ7wyuRU1RAc@google.com>
Subject: Re: [PATCH v2 19/27] rust: slab: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Vitaly Wool <vitaly.wool@konsulko.se>
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 05, 2026 at 01:56:05PM +0100, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 1:42 PM CET, Alice Ryhl wrote:
> > This is needed to inline these helpers into Rust code.
> >
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> Since this file contains the helpers for the alloc module, I assume I should
> take it through the alloc tree? Maybe we should also add it to the alloc entry
> in maintainers.
> 
> Anyways, so far I do not have anything staged in the alloc tree for this cycle,
> so it would probably be easier if either Andrew or Miguel picks it up directly.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Sounds good to me. There is also mm and maple_tree for Andrew Morton.

Alice
