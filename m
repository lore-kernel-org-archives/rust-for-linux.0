Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16442931ED
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849272; cv=none; b=DU4JUKpEsPbxpstCN6XJNxw+znhEHIc+WiKnB6MUxoMG9wk/DGNbkvXgSS1lTqqUZtKtW/fCA3MfIl1oVrmJZZMl38UbMGF487qEpVkOeblRc71TtGeTCdCGAsDz5iUekxaLKOzhSsgeKe/FXMjj4b4V2lBRbXxoNUFpNHBMKUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849272; c=relaxed/simple;
	bh=Q1VlFBpcOiAshz0fRuWa+nNfNdWX3E9lDal+8yojkwY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=THuqSBntyRIHU5lovRoLQFm2DbUvXhJKqwGcjEXHrDj7bWhzL5sA5qWIm02I5v3qzqw8iobiYgYnlijPJ1cPvuwFeEivtsgyUPnDLHBqipa+JojBTKsmQJwj1rMByjibqMdlzGbnjxibDDfLKDTSxjiDCbgWyrWY5F72hGaozEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p5d3xMlC; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p5d3xMlC"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c167e032f03so373379466b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Aug 2026 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785849269; x=1786454069; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1bTpyDWj+Jcpakz2pBf65L8hhGHUSbdJ7DlrchaIa8=;
        b=p5d3xMlCI+Nm7RV2aQemcyDsuN7CPJMkA1USkbnwDm7kkMkD+ovjHdt8An5j7bvC2K
         P4JSW+y4GCIgXWfemk4obXYL7UfFYm+/90w97sLNf3W4VfqiQGSrhzdyD+kiOig1dyoo
         zEhAq7gQb/q+AEST2lF+E4e0gfHALSS0IlgnCcpnldDHUeWxJxw1ll+20dnUaeC8sT44
         0B+P7nniYX8ltuYJsVqJA7Bgx3A+ecOAsPJYdu6KDyU+SoF3LNVk6R41rZ14L9DsGcfT
         P2EXnk5i6EBsv/9PFIzvxbRI6A+GA7LXah+yTbKDGPEaFfgF4xtqtl7XjVNHtFUvQ28O
         2TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785849269; x=1786454069;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1bTpyDWj+Jcpakz2pBf65L8hhGHUSbdJ7DlrchaIa8=;
        b=ifMANTqPgOXNVCq63t1yGz0iAHunRuPexjvax9JHlysjBfi7OtAefMiSM8Vfe2FQ/n
         WbnNgp/lMjwRPLEzPvgOzouKpmZRTprNTD9MazO3b7MOX7Oe2KNtjWBQ7v8619H6Wt+v
         GvPSzHIdRi7r+Xx76MKkiM1f+AuS7n2QdxTlWFZQtFJSt0Yr4zAkueyq5N4FXPpPXQKm
         JjfLlVm2kMhDBSkKVn3LEkr9OUA4qSjkIArUHNmTNlrzOP3YI36FyEPf9zMoK66F1MrB
         C2aqSP0wS4IdneS3waZ0/lxLcKTw5QJFsaaqFA6drgapthqIdFtTa2wim+uyk7URi7PL
         +chQ==
X-Gm-Message-State: AOJu0YxPI2zQRaP9e1g8FREaq8mAUFoUBbEm1DmywojT7jERWLSTmHqZ
	jcynF/gkroYl0S2jfz3h+9AwUFzido3tm6vyeW7onW25SrPbgXYzvUJaCP6LhGFioRFjxSPDL6U
	SdZ5o24MsiSqHOESkEw==
X-Received: from ejxa24.prod.google.com ([2002:a17:906:80d8:b0:c15:e9ff:a24f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1b0b:b0:c16:9af8:c77e with SMTP id a640c23a62f3a-c20308ac50fmr136701566b.1.1785849268448;
 Tue, 04 Aug 2026 06:14:28 -0700 (PDT)
Date: Tue, 4 Aug 2026 13:14:27 +0000
In-Reply-To: <20260731133253.661634-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260731133253.661634-1-rafael@rcpassos.me>
Message-ID: <anHls4pUymGcjZwo@google.com>
Subject: Re: [PATCH v2] rust_binder: speed up get_node_debug_info using
 lower_bound iter
From: Alice Ryhl <aliceryhl@google.com>
To: Rafael Passos <rafael@rcpassos.me>
Cc: rust-for-linux@vger.kernel.org, gregkh@linuxfoundation.org, 
	arve@android.com, tkjos@android.com, Christian Brauner <brauner@kernel.org>, 
	cmllamas@google.com, Shuah Khan <skhan@linuxfoundation.org>, 
	Brigham Campbell <me@brighamcampbell.com>, Jori Koolstra <jkoolstra@xs4all.nl>
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 31, 2026 at 10:31:03AM -0300, Rafael Passos wrote:
> Finding the next node in the RBTree can be done more efficiently using
> the cursor_lower_bound, as it reduces cost from O(n) to O(log n).
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1249
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>

This looks fine to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> It took me a while to get the AOSP + Cuttlefish setup running, and
> using the rust binder module. I got it working, and ran:
> libhwbinder_benchmark libbinder_benchmark, hwbinderThroughputTest
>             libhwbinder_latency and binderThroughputTest benches.
> But apparently none of them used the function I touched (I added log).
> Also, the "hw" variants like hwbinderThroughputTest kept logging a
>  "worker_fx:217 condition:service->isRemote() failed" message.
> I decided to send the v2 anyway.
> 
> I am thinking about writing a benchmark focused on node scaling
>     (test N iterations with X nodes), and run with small and larger Xs.)
> Would such a benchmark be welcome here in upstream mainline ?
> It would be in either C or Rust (the AOSP ones are in C++).
> Would it live under `tools/perf` ?
> 
> I looked at the kunit tests (`drivers/android/tests`) and they dont
> cover the rust binder either. That's another thing I could try to add.

In Android this is used by libmemunreachable when checking whether a
process has a memory leak. The perf matters because if the number of
nodes is very large, invoking the ioctl repeatedly many times could take
a seriously large amount of time. Seconds or even more.

Alice
